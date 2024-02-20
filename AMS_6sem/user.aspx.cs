using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace AMS_6sem
{
    public partial class user : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated || !User.IsInRole("1") || !IsPostBack)
            {
                if (Session["UserName"] != null)
                {
                    string userEmail = Session["UserName"].ToString();
                    string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS; Initial Catalog=AMS; Integrated Security=True";

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        string query = "SELECT fullname FROM tbl_user WHERE email = @Email";

                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            command.Parameters.AddWithValue("@Email", userEmail);

                            object result = command.ExecuteScalar();

                            if (result != null)
                            {
                                lblUserName.Text = "Welcome, " + result.ToString();
                            }
                            else
                            {
                                //Response.Redirect("~/logreg.aspx");
                                lblUserName.Text = "User not found";
                            }
                        }
                    }
                }
                else
                {
                    //lblUserName.Text = "User not logged in";
                    Response.Redirect("~/logreg.aspx");
                }
            }
        }
    }
}