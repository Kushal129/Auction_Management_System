using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace User_Side
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-T1A2DI7;Initial Catalog=AMS;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the email is stored in the session
            if (Session["email"] == null)
            {
                // Redirect to the login page if the email is not stored in the session
                Response.Redirect("UpdateProfile.aspx");
            }
          
        }

        protected void btnPassword_Click1(object sender, EventArgs e)
        {
            string email = Session["email"].ToString();
            string oldPassword = txtOpassword.Text;
            string newPassword = txtNpassword.Text;
            string confirmPassword = txtCpassword.Text;

            if (newPassword != confirmPassword)
            {
                // Passwords do not match
                lblMessage.Text = "New password and confirm password do not match.";
                return;
            }

            con.Open();
            // Check if old password matches the password stored in the database for the given email
            SqlCommand cmdCheckPassword = new SqlCommand("SELECT COUNT(*) FROM tbl_user WHERE email = @Email AND password = @Password", con);
            cmdCheckPassword.Parameters.AddWithValue("@Email", email);
            cmdCheckPassword.Parameters.AddWithValue("@Password", oldPassword);
            int count = (int)cmdCheckPassword.ExecuteScalar();

            if (count > 0)
            {
                // Old password is correct, update the password
                SqlCommand cmdUpdatePassword = new SqlCommand("UPDATE tbl_user SET password = @NewPassword WHERE email = @Email", con);
                cmdUpdatePassword.Parameters.AddWithValue("@NewPassword", newPassword);
                cmdUpdatePassword.Parameters.AddWithValue("@Email", email);
                cmdUpdatePassword.ExecuteNonQuery();
                lblMessage.Text = "Password changed successfully.";
            }
            else
            {
                // Old password is incorrect or email not found
                lblMessage.Text = "Old password is incorrect or email not found.";
            }

            con.Close();
        }

        
    }
}