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
        SqlConnection con = new SqlConnection("Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS; Initial Catalog=AMS; Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                    if (Session["UserID"] != null)
                    {
                        string userId = Session["UserID"].ToString();
                        string query = "SELECT * FROM tbl_user WHERE uid = @userId";

                        using (SqlCommand command = new SqlCommand(query, con))
                        {
                            command.Parameters.AddWithValue("@userId", userId);

                            con.Open();
                            SqlDataReader reader = command.ExecuteReader();

                            if (reader.Read())
                            {
                                txtName.Text = reader["fullname"].ToString();
                                txtEmail.Text = reader["email"].ToString();
                                txtCno.Text = reader["mobile"].ToString();
                            }
                            else
                            {
                                txtName.Text = "User not found";
                            }

                            reader.Close();
                        }
                    }
                    else
                    {
                        Response.Redirect("~/logreg.aspx");
                    }
                
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