using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace User_Side
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null && Session["UserName"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }

            if (!IsPostBack)
            {
                string username = GetUserNameFromUserID(Convert.ToInt32(Session["UserID"]));
                if (!string.IsNullOrEmpty(username))
                {
                    lblUserName.Text = "Welcome, " + username;
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }

        private string GetUserNameFromUserID(int userID)
        {
            string username = "";
            string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS; Initial Catalog=AMS; Integrated Security=True"; 

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT fullname FROM tbl_user WHERE uid = @UserID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@UserID", userID);

                    connection.Open();
                    object result = command.ExecuteScalar();
                    if (result != null)
                    {
                        username = result.ToString();
                    }
                    connection.Close();
                }
            }

            return username;
        }
    }
}
