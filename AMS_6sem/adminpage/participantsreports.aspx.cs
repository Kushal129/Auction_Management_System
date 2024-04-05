using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AMS_6sem.adminpage
{
    public partial class participantsreports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUserData();
            }
        }


        protected void BindUserData()
        {
            using (SqlConnection connection = new SqlConnection("Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS;Initial Catalog=AMS;Integrated Security=True"))
            {
                string query = "SELECT * FROM tbl_user WHERE role <> '0'";
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                UserRepeater.DataSource = reader;
                UserRepeater.DataBind();
                reader.Close();
            }
        }
        protected void CustomerStatusCheckbox_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox checkBox = (CheckBox)sender;
            int customerId = Convert.ToInt32(checkBox.Attributes["data-customer-id"]);
            bool isChecked = checkBox.Checked;

            UpdateUserRole(customerId, isChecked);
        }

        private void UpdateUserRole(int customerId, bool isChecked)
        {
            string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS; Initial Catalog=AMS; Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE tbl_user SET role = @role WHERE uid = @uid", con))
                {
                    cmd.Parameters.AddWithValue("@role", isChecked ? 3 : 0); 
                    cmd.Parameters.AddWithValue("@uid", customerId);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }
        protected void DeleteRecord(object sender, EventArgs e)
        {
            try
            {
                string uid = (sender as LinkButton).CommandArgument;
                using (SqlConnection connection = new SqlConnection("Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS;Initial Catalog=AMS;Integrated Security=True"))
                {
                    string query = "DELETE FROM tbl_user WHERE uid = @uid";
                    SqlCommand cmd = new SqlCommand(query, connection);
                    cmd.Parameters.AddWithValue("@uid", uid);
                    connection.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        BindUserData();
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('User deleted successfully.' , 'green')", true);
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('User not found or already deleted.' , 'red')", true);
                    }
                }
            }
            catch (Exception ex)
            {
                string errorMessage = "An error occurred while deleting the record. Error Message: " + ex.Message;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", $"alert('{errorMessage}')", true);
            }
        }

    }
}