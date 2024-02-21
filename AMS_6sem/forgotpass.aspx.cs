using System;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Data;

namespace AMS_6sem
{
    public partial class forgotpass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

            protected void btnSubmit_Click(object sender, EventArgs e)
            {
                string password;
                string mycon = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS;Initial Catalog=AMS;Integrated Security=True;";
                string myquery = "SELECT * FROM tbl_user WHERE email = @Email";

            if (string.IsNullOrWhiteSpace(txtEmail.Text))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('Invalid Email...!' , 'red')", true);
                    return;
                }

                using (SqlConnection con = new SqlConnection(mycon))
                {
                    using (SqlCommand cmd = new SqlCommand(myquery, con))
                    {
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);

                        con.Open();
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            if (ds.Tables[0].Rows[0]["password"] != DBNull.Value)
                            {
                                password = ds.Tables[0].Rows[0]["password"].ToString();
                                sendpassword(password, ds.Tables[0].Rows[0]["email"].ToString());
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('Your Password Has Been Sent to Registered Email Address. Check Your Mail Inbox' , 'blue')", true);
                            }
                            else
                            {
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('Your account does not have a password.' , 'red')", true);
                            }
                        }
                        else
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('Your Email is Not Valid.' , 'red')", true);
                        }
                    }
                }
            }

            private void sendpassword(string password, string email)
            {
            using (SmtpClient smtp = new SmtpClient())
            {
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.Credentials = new System.Net.NetworkCredential("21bmiit129@gmail.com", "ashw bahu tqbc dbsf");
                smtp.EnableSsl = true;
                MailMessage msg = new MailMessage();
                msg.Subject = "Forgot Password (Auction Management System)";
                msg.Body = "Dear " + txtEmail.Text + ", Your Password is  " + password + "\n\n\nThanks & Regards\n Auction Management System";

                msg.To.Add(txtEmail.Text);
                string fromaddress = "Auction Management System <onlineauctionkp@gmail.com>";
                msg.From = new MailAddress(fromaddress);
                try
                {
                    smtp.Send(msg);
                }
                catch (Exception ex)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", $"showToaster('Error: {ex.Message}', 'red');", true);
                }
            }
        }

    }
}