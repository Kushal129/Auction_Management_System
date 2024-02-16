using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace AMS_6sem
{
    public partial class logreg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = Request.Form["txtEmail"];
            string password = Request.Form["txtPassword"];

            string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS; Initial Catalog=AMS; Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT * FROM tbl_user WHERE email = @Username AND password = @Password";

                using (SqlCommand command = new SqlCommand(query, connection))
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
                                    Response.Redirect("user.aspx");
                                }
                                else if (role == 0)
                                {                              
                                    Response.Redirect("admin.aspx");
                                }
                                else
                                {
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Invalid role value..');", true);
                                    Response.Write("Invalid role value.");
                                }
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Role information is missing.');", true);
                                Response.Write("Role information is missing.");
                            }
                        }
                        else
                        {
                            Response.Write("Invalid username or password!");
                        }
                    }
                }
            }
        }

        protected void registerButton_Click(object sender, EventArgs e)
        {
            string fullName = Request.Form["txtFullName"];
            string mobileNumber = Request.Form["txtMobileNumber"];
            string email = Request.Form["Email_R"];
            string password = Request.Form["Password_R"];

            string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS;Initial Catalog=AMS;Integrated Security=True";

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

                lblMessage.Text = "Registration successful!";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Registration successful!');", true);
            }
            catch (Exception ex)
            {

                lblMessage.Text = "Error: " + ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Registration failed! Please try again.');", true);
            }
        }

    }
}