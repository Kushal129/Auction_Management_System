using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
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
                    // rbChangePassword_SelectedIndexChanged(sender, e); // method ofr to handle initial visibility
                }
                else
                {
                    Response.Redirect("~/Login.aspx");
                }
                
            }
        }

        protected void rbChangePassword_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbChangePassword.SelectedValue == "Yes")
            {
                passwordFields.Style["display"] = "block";
            }
            else
            {
                passwordFields.Style["display"] = "none";
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
                        txtFullName.Text = reader["fullname"].ToString().Trim();
                        txtMobileNumber.Text = reader["mobile"].ToString().Trim();
                        userEmail.InnerText = reader["email"].ToString();
                    }
                    reader.Close();
                }
            }
        }

        private string HashPassword(string password)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(password));

                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }

        protected void updateButton_Click(object sender, EventArgs e)
        {
            int uid = Convert.ToInt32(Session["UserID"]);
            string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS; Initial Catalog=AMS; Integrated Security=True";
            string query = "UPDATE tbl_user SET fullname = @fullname, mobile = @mobile";

            // Declare hashedPassword variable outside of the if block
            string hashedPassword = null;

            if (rbChangePassword.SelectedValue == "Yes")
            {
                if (txtPassword.Text != txtConfirmPassword.Text)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('Passwords do not match.' , 'red')", true);
                    return;
                }

                hashedPassword = HashPassword(txtPassword.Text);

                query += ", password = @password";
            }

            query += " WHERE uid = @uid";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@fullname", txtFullName.Text);
                    command.Parameters.AddWithValue("@mobile", txtMobileNumber.Text);

                    if (rbChangePassword.SelectedValue == "Yes")
                    {
                        command.Parameters.AddWithValue("@password", hashedPassword);
                    }

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