using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Net;
using System.Net.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace AMS_6sem
{
    public partial class logreg : System.Web.UI.Page
    {
        string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS; Initial Catalog=AMS; Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated && User.IsInRole("0"))
            {
                Response.Redirect("~/admin.aspx");
            }else if(User.Identity.IsAuthenticated && User.IsInRole("0"))
            {
                Response.Redirect("~/userpage/user.aspx");
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
        protected void ValidateMobileNumber(object source, ServerValidateEventArgs args)
        {
            string mobileNumber = args.Value;

            if (System.Text.RegularExpressions.Regex.IsMatch(mobileNumber, "^[6-9]\\d{9}$"))
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = Request.Form["txtEmail"];
            string password = Request.Form["txtPassword"];

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string emailCheckQuery = "SELECT uid , password, role FROM tbl_user WHERE email = @Username";

                using (SqlCommand emailCheckCommand = new SqlCommand(emailCheckQuery, connection))
                {
                    emailCheckCommand.Parameters.AddWithValue("@Username", username);

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
                                    Response.Redirect("~/user/user.aspx");
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
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('Incorrect password' , 'red')", true);
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

        private bool VerifyPassword(string password, string hashedPasswordFromDb)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                string hashedPasswordInput = HashPassword(password);

                return hashedPasswordInput == hashedPasswordFromDb;
            }
        }
        protected void registerButton_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text;
            string mobileNumber = txtMobileNumber.Text;
            string email = Email_R.Text;
            string password = Password_R.Text;
            string hashedPassword = HashPassword(password);

            if (string.IsNullOrWhiteSpace(fullName) || string.IsNullOrWhiteSpace(mobileNumber) ||
                string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(password))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('All fields are required.' , 'red')", true);
            }

            if (!IsValidIndianMobileNumber(mobileNumber))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('Enter a valid Indian mobile number.' , 'red')", true);
            }


            if (IsEmailExists(email, connectionString))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('Email already exists! Please use a different email address.' , 'red')", true);
            }
            else
            {
                string insertQuery = "INSERT INTO tbl_user (fullname, email, mobile, password) " +
                    "VALUES (@FullName, @Email, @MobileNumber, @Password)";
                try
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        using (SqlCommand cmd = new SqlCommand(insertQuery, connection))
                        {
                            cmd.Parameters.AddWithValue("@FullName", fullName);
                            cmd.Parameters.AddWithValue("@MobileNumber", mobileNumber);
                            cmd.Parameters.AddWithValue("@Email", email);
                            cmd.Parameters.AddWithValue("@Password", hashedPassword);

                            cmd.ExecuteNonQuery();
                        }
                    }
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('Registration successful..!' , 'green')", true);

                }
                catch (Exception)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('Registration failed! Please try again.' , 'red')", true);
                }
            }
        }

        private bool IsValidIndianMobileNumber(string mobileNumber)
        {
            return System.Text.RegularExpressions.Regex.IsMatch(mobileNumber, "^[6-9]\\d{9}$");
        }

        private bool IsEmailExists(string email, string connectionString)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT COUNT(*) FROM tbl_user WHERE email = @Email";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);

                    int count = (int)command.ExecuteScalar();
                    return count > 0;
                }
            }
        }
    }
}