using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Security.Cryptography;
using System.Text;

namespace AMS_6sem
{
    public partial class UpdatePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string email = Request.QueryString["email"];
                string token = Request.QueryString["token"];

                if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(token))
                {
                    Response.Redirect("~/forgotpass.aspx");
                }
                else
                {
                    ViewState["email"] = email;
                    ViewState["token"] = token;
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string email = ViewState["email"].ToString();
            string token = ViewState["token"].ToString();
            string newPassword = txtNewPassword.Text.Trim();

            if (string.IsNullOrWhiteSpace(newPassword))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('Please enter a new password.' , 'red')", true);
                return;
            }


            string hashedPassword = HashPassword(newPassword);

            string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS;Initial Catalog=AMS;Integrated Security=True;";
            string query = "UPDATE tbl_user SET password = @NewPasswordHash, password_reset_token = NULL WHERE email = @Email AND password_reset_token = @Token";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@NewPasswordHash", hashedPassword);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Token", token);

                    try
                    {
                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('Password updated successfully.' , 'green')", true);
                            txtNewPassword.Text = "";
                        }
                        else
                        {
                            //Response.Redirect("~/forgotpass.aspx");
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('Invalid password reset link Please Generate new link. ' , 'red')", true);
                            return;
                        }
                    }
                    catch (Exception ex)
                    {

                        ShowMessage($"Error: {ex.Message}", "red");
                    }
                }
            }
        }
        private string HashPassword(string newPassword)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(newPassword));

                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }
        private void ShowMessage(string message, string color)
        {
            string script = $"<script>alert('{message}');</script>";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", script);
        }
        
    }
}
