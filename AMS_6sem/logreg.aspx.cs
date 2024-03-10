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

namespace AMS_6sem
{
    public partial class logreg : System.Web.UI.Page
    {
        string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS; Initial Catalog=AMS; Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {

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

                string emailCheckQuery = "SELECT * FROM tbl_user WHERE email = @Username";

                using (SqlCommand emailCheckCommand = new SqlCommand(emailCheckQuery, connection))
                {
                    emailCheckCommand.Parameters.AddWithValue("@Username", username);

                    using (SqlDataReader emailCheckReader = emailCheckCommand.ExecuteReader())
                    {
                        if (emailCheckReader.HasRows && emailCheckReader.Read())
                        {
                            emailCheckReader.Close();

                            string roleCheckQuery = "SELECT * FROM tbl_user WHERE email = @Username AND password = @Password";

                            using (SqlCommand command = new SqlCommand(roleCheckQuery, connection))
                            {
                                command.Parameters.AddWithValue("@Username", username);
                                command.Parameters.AddWithValue("@Password", password);

                                using (SqlDataReader reader = command.ExecuteReader())
                                {
                                    if (reader.HasRows && reader.Read())
                                    {
                                        if (reader["role"] != DBNull.Value)
                                        {
                                            int role = Convert.ToInt32(reader["role"]);

                                            if (role == 1)
                                            {
                                                Session["UserName"] = username;
                                                Response.Redirect("user.aspx");
                                            }
                                            else if (role == 0)
                                            {
                                                Session["UserName"] = username;
                                                Response.Redirect("admin.aspx");
                                            }
                                            else
                                            {
                                                Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('Invalid role value..!!' , 'red')", true);
                                            }
                                        }
                                        else
                                        {
                                            Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('Role information is missing.' , 'red')", true);
                                        }
                                    }
                                    else
                                    {
                                        Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('Incorrect password' , 'red')", true);
                                    }
                                }
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


        protected void registerButton_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text;
            string mobileNumber = txtMobileNumber.Text;
            string email = Email_R.Text;
            string password = Password_R.Text;

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
                string insertQuery = "INSERT INTO tbl_user (fullname, email, mobile, password, role) " +
                    "VALUES (@FullName, @Email, @MobileNumber, @Password, 1)";
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
                            cmd.Parameters.AddWithValue("@Password", password);

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