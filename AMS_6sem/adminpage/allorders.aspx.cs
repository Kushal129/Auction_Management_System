using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AMS_6sem.adminpage
{
    public partial class allorders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindOrderData();
            }
        }
        private void BindOrderData()
        {

            using (SqlConnection connection = new SqlConnection("Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS;Initial Catalog=AMS;Integrated Security=True"))
            {
                string query = "SELECT * FROM tbl_orders";
                SqlCommand command = new SqlCommand(query, connection);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.HasRows)
                    {
                        AllorderTableRecord.DataSource = reader;
                        AllorderTableRecord.DataBind();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "NoRowsAlert", "alert('No orders found.');", true);

                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "ErrorAlert", "alert('Error fetching orders. '); "+ ex, true);
                }
            }


        }

        protected void confirmDeliveryButton_Click(object sender, EventArgs e)
        {
            Button confirmDeliveryButton = (Button)sender;
            string orderno = confirmDeliveryButton.CommandArgument;

            bool updateSuccess = UpdateStatus(orderno);

            if (updateSuccess)
            {
                Response.Redirect(Request.Url.ToString(), true);
            }
            else
            {
                // Update failed, handle the error or show an error message
            }
        }

        private bool UpdateStatus(string orderno)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection("Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS;Initial Catalog=AMS;Integrated Security=True"))
                {
                    connection.Open();

                    string updateQuery = "UPDATE tbl_orders SET Status = 2 WHERE orderno = @orderno";

                    using (SqlCommand command = new SqlCommand(updateQuery, connection))
                    {
                        command.Parameters.AddWithValue("@orderno", orderno);
                        int rowsAffected = command.ExecuteNonQuery();
                        return rowsAffected > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                string errorMessage = "Error Message: " + ex.Message;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", $"alert('{errorMessage}')", true);
                return false;
            }
        }
    }
}