using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Net;
using System.Net.Mail;
using System.Web.UI.WebControls;

namespace User_Side
{
    public partial class Userforgotpassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
protected void btnSendOTP_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string otp = GenerateOTP();

            if (SendOTP(email, otp))
            {
                // Store the OTP somewhere securely (e.g., session, database)
                Session["OTP"] = otp;
                Response.Write("OTP sent successfully!");
            }
            else
            {
                Response.Write("Failed to send OTP. Please try again later.");
            }
        }

        protected void btnVerifyOTP_Click(object sender, EventArgs e)
        {
            string enteredOTP = txtOTP.Text;
            string storedOTP = Session["OTP"] as string; // Retrieve the OTP from where it was stored

            if (enteredOTP == storedOTP)
            {
                Response.Write("OTP verified successfully!");
                // Redirect user to password reset page or allow them to reset password
            }
            else
            {
                Response.Write("Invalid OTP. Please try again.");
            }
        }

        private string GenerateOTP()
        {
            Random rand = new Random();
            return rand.Next(100000, 999999).ToString(); // Generate a random 6-digit OTP
        }

        private bool SendOTP(string email, string otp)
        {
            try
            {
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com"); // Replace with your SMTP server
                smtpClient.UseDefaultCredentials = false;
                smtpClient.Credentials = new NetworkCredential("21bmiit093gmail.com", "your_email_password"); // Replace with your email credentials
                smtpClient.EnableSsl = true;

                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress("21bmiit093@gmail.com"); // Replace with your email address
                mailMessage.To.Add(email);
                mailMessage.Subject = "Password Reset OTP";
               // mailMessage.Body = $"Your OTP for password reset is: {otp}";

                smtpClient.Send(mailMessage);
                return true;
            }
            catch (Exception ex)
            {
                // Log error or handle it as per your application's requirements
                return false;
            }
        }
    }
}