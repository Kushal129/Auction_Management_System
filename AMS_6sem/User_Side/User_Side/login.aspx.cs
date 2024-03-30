using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace User_Side
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-T1A2DI7;Initial Catalog=AMS;Integrated Security=True");
        //protected void Page_Load(object sender, EventArgs e)
        //{

        //}

        //protected void btnLogin_Click(object sender, EventArgs e)
        //{
        //    String email = txtUsername.Text;
        //    String password = txtPassword.Text;
        //    SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM tbl_user WHERE email = @Email AND password = @Password", con);
        //    cmd.Parameters.AddWithValue("@Email", email);
        //    cmd.Parameters.AddWithValue("@Password", password);

        //    con.Open();
        //    int count = (int)cmd.ExecuteScalar();

        //    if (count > 0)
        //    {
        //        Session["email"] = email;
        //        Response.Redirect("ChangePassword.aspx");
        //    }
        //    else
        //    {
        //        lblMessage.Text = "Invalid email or password.";
        //    }

        //}
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtUsername.Text;
            string password = txtPassword.Text;

            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM tbl_user WHERE email = @Email", con);
            cmd.Parameters.AddWithValue("@Email", email);

            con.Open();
            int count = (int)cmd.ExecuteScalar();

            if (count > 0)
            {
                // Email is registered, proceed with password validation
                cmd = new SqlCommand("SELECT COUNT(*) FROM tbl_user WHERE email = @Email AND password = @Password", con);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);

                int passwordCount = (int)cmd.ExecuteScalar();

                if (passwordCount > 0)
                {
                    // Password is correct, redirect to ChangePassword.aspx
                    Session["email"] = email;
                    Response.Redirect("UpdateProfile.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid password.";
                }
            }
            else
            {
                // Email is not registered
                lblMessage.Text = "Email not registered.";
            }

            con.Close();
        }

    }
}