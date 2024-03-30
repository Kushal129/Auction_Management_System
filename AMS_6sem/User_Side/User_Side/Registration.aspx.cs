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
    public partial class Registration : System.Web.UI.Page
      
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-T1A2DI7;Initial Catalog=AMS;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistration_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into tbl_user values('"+txtName.Text+"' , '"+txtEmail.Text+"' , '"+txtCno.Text+"','"+txtPassword.Text+"' , 1);" ,con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}