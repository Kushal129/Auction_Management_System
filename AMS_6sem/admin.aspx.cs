using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace AMS_6sem
{
    public partial class admin1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] != null)
                {
                    string userEmail = Session["UserName"].ToString();
                    string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS; Initial Catalog=AMS; Integrated Security=True";

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        string productQuery = "SELECT COUNT(*) FROM AuctionItems";
                        SqlCommand productCommand = new SqlCommand(productQuery, connection);
                        int totalProducts = (int)productCommand.ExecuteScalar();

                        string userQuery = "SELECT COUNT(*) FROM tbl_user";
                        SqlCommand userCommand = new SqlCommand(userQuery, connection);
                        int totalUsers = (int)userCommand.ExecuteScalar();

                        string userNameQuery = "SELECT fullname FROM tbl_user WHERE email = @Email";

                        using (SqlCommand command = new SqlCommand(userNameQuery, connection))
                        {
                            command.Parameters.AddWithValue("@Email", userEmail);

                            object result = command.ExecuteScalar();

                            if (result != null)
                            {
                                lblUserName.Text = "Welcome, " + result.ToString();
                                lblTotalProducts.Text = totalProducts.ToString();
                                lblTotalUsers.Text = totalUsers.ToString();
                                ScriptManager.RegisterStartupScript(this, GetType(), "DisableBackButton", "DisableBackButton();", true);
                            }
                            else
                            {
                                lblUserName.Text = "User not found";
                            }
                        }
                    }
                }
                else
                {
                    Response.Redirect("~/Login.aspx");
                }
            }
        }
    }
}
