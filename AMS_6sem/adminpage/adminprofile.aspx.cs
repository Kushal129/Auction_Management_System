using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AMS_6sem.adminpage
{
    public partial class adminprofile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] != null && Session["UserID"] != null)
                {
                    LoadUserData();
                }
                else
                {
                    Response.Redirect("~/logreg.aspx");
                }
                
            }
        }

      
        protected void LoadUserData()
        {
            int uid = Convert.ToInt32(Session["UserID"]);
            string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS; Initial Catalog=AMS; Integrated Security=True";

            string query = "SELECT fullname, email, mobile FROM tbl_user WHERE uid = @uid";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@uid", uid);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        txtFullName.Text = reader["fullname"].ToString();
                        txtMobileNumber.Text = reader["mobile"].ToString();
                        userEmail.InnerText = reader["email"].ToString();
                    }
                    reader.Close();
                }
            }
        }


        protected void updateButton_Click(object sender, EventArgs e)
        {
            int uid = Convert.ToInt32(Session["UserID"]);
            string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS; Initial Catalog=AMS; Integrated Security=True";
            string query = "UPDATE tbl_user SET fullname = @fullname, mobile = @mobile WHERE uid = @uid";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@fullname", txtFullName.Text);
                    command.Parameters.AddWithValue("@mobile", txtMobileNumber.Text);
                    command.Parameters.AddWithValue("@uid", uid);
                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('Profile updated successfully.' , 'green')", true);
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('Failed to update profile.' , 'red')", true);

                    }
                }
            }
        }
    }
}