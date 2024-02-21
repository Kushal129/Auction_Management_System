using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace AMS_6sem
{
    public partial class forgotpass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            string resetEmail = txtResetEmail.Text;

            if (!string.IsNullOrEmpty(resetEmail))
            {
                string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS;Initial Catalog=AMS;Integrated Security=True";

                if (IsEmailExists(resetEmail, connectionString))
                {
                    //lblForgotMessage.Text = "Email exists. Sending OTP...";
                    //lblForgotMessage.Visible = true;
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Email exists. Sending OTP...!');", true);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('Email exists. Sending OTP...!' , 'green')", true);

                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('Email does not exist. Please enter a valid email address.!' , 'red')", true);

                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Email does not exist. Please enter a valid email address.!');", true);

                }
            }
        }

    }
}