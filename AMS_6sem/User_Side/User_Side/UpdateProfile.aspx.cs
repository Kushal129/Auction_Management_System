using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace User_Side
{
    public partial class UpdateProfile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-T1A2DI7;Initial Catalog=AMS;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the email is stored in the session
            if (Session["email"] != null)
            {
                string email = Session["email"].ToString();
                txtEmail.Text = email; // Set email in the textbox if needed
                // You can also use it wherever you want, for example:
                // lblEmail.Text = email; // Assuming you have a label named lblEmail
            }
           
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("update tbl_user set fullname='" + txtName.Text + "' , mobile = '" + txtCno.Text + "'  where email = '" + txtEmail.Text + "';", con);
            cmd.ExecuteNonQuery();
            con.Close();

        }
    }
}