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
            if (Page.IsValid)
            {
              
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into tbl_user values('" + txtName.Text + "' , '" + txtEmail.Text + "' , '" + txtCno.Text + "','" + txtPassword.Text + "', '"+rblGender.SelectedValue+"', '"+txtAddress.Text+"', '"+txtCity.Text+"' , 1);", con);
                if(cmd.ExecuteNonQuery() > 0){

                    Response.Redirect("Userlogin.aspx");
                }
                else{
                }
                con.Close();

            }
        }
        protected void cvCity_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string city = txtCity.Text;

            // List of cities in Gujarat
            List<string> citiesInGujarat = new List<string> { "Ahmedabad", "Surat", "Vadodara", "Rajkot", "Bhavnagar", "Jamnagar", "Junagadh", "Gandhinagar", "Morbi", "Surendranagar" };

            // Check if the entered city is in Gujarat
            if (!citiesInGujarat.Contains(city))
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }
        //protected void cvCno_ServerValidate(object source, ServerValidateEventArgs args)
        //{
        //    // Custom validation to ensure the contact number is from India
        //    // You may implement more sophisticated validation based on your requirements
        //    string contactNo = txtCno.Text.Trim();
        //    if (contactNo.StartsWith("0") || !contactNo.StartsWith("+91"))
        //    {
        //        args.IsValid = false;
        //    }
        //    else
        //    {
        //        args.IsValid = true;
        //    }
        //}
    }
}