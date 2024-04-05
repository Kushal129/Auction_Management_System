using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace AMS_6sem
{
    public partial class Login : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        

        private bool VerifyPassword(string password, string hashedPasswordFromDb)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                string hashedPasswordInput = HashPassword(password);

                return hashedPasswordInput == hashedPasswordFromDb;
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

        protected void btnLogin_Click(object sender, EventArgs e)
        {
           

            string conn = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS; Initial Catalog=AMS; Integrated Security=True";
            string username = txtEmail.Text.ToString();
            string password = txtPassword.Text.ToString();

            try
            {
                using (SqlConnection connection = new SqlConnection(conn))
                {
                    connection.Open();

                    string qry = "SELECT uid, password, role FROM tbl_user WHERE email = @username";

                    using (SqlCommand emailCheckCommand = new SqlCommand(qry, connection))
                    {
                        emailCheckCommand.Parameters.AddWithValue("@username", username);

                        using (SqlDataReader emailCheckReader = emailCheckCommand.ExecuteReader())
                        {
                            if (emailCheckReader.HasRows && emailCheckReader.Read())
                            {
                                int userId = Convert.ToInt32(emailCheckReader["uid"]);
                                string hashedPasswordFromDb = emailCheckReader["password"].ToString();
                                string role = emailCheckReader["role"].ToString();

                                if (VerifyPassword(password, hashedPasswordFromDb))
                                {
                                    if (role == "1")
                                    {
                                        Session["UserName"] = username;
                                        Session["UserID"] = userId;
                                        Response.Redirect("~/userpage/UserIndex.aspx");
                                    }
                                    else if (role == "0")
                                    {
                                        Session["UserName"] = username;
                                        Session["UserID"] = userId;
                                        Response.Redirect("admin.aspx");
                                    }
                                    else
                                    {
                                        Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('Invalid role value..!!' , 'red')", true);
                                    }
                                }
                                else
                                {
                                    Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('Email does not exist.' , 'red')", true);
                                }
                            }
                            else
                            {
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('Email does not exist.' , 'red')", true);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alertScript", $"alert('{ex.Message}');", true);
            }
        }
    }
}