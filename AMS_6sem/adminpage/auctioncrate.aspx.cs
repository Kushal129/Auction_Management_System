using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AMS_6sem.adminpage
{
    public partial class auctioncrate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnCreateAuction_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                string productNameValue = productName.Text;
                string productPriceIntervalValue = productPriceInterval.Text;
                string minPriceValue = minPrice.Text;

                string fileInputValue = SaveFile();

                DateTime? auctionEndTimeValue = null;
                if (!string.IsNullOrWhiteSpace(auctionEndTime.Text))
                {
                    if (!DateTime.TryParseExact(auctionEndTime.Text, "yyyy-MM-ddTHH:mm", CultureInfo.InvariantCulture, DateTimeStyles.None, out var endTime))
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('Invalid Auction End Time format.' , 'red')", true);
                        return;
                    }
                    auctionEndTimeValue = endTime;
                }

                DateTime? auctionStartTimeValue = null;
                if (!string.IsNullOrWhiteSpace(auctionStartTime.Text))
                {
                    if (!DateTime.TryParseExact(auctionStartTime.Text, "yyyy-MM-ddTHH:mm", CultureInfo.InvariantCulture, DateTimeStyles.None, out var startTime))
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('Invalid Auction Start Time format.' , 'red')", true);
                        return;
                    }
                    auctionStartTimeValue = startTime;
                }

                string productDescriptionValue = productDescription.Text;

                InsertAuctionItem(productNameValue, productDescriptionValue, fileInputValue, productPriceIntervalValue, minPriceValue, auctionStartTimeValue, auctionEndTimeValue);

                ClearFormFields();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('Auction created successfully!' , 'green')", true);
            }
           
        }
    protected void ValidateFileType_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (file_input.HasFile)
            {
                string extension = Path.GetExtension(file_input.FileName).ToLower();
                if (extension == ".jpg" || extension == ".jpeg" || extension == ".png")
                {
                    args.IsValid = true;
                    return;
                }
            }
            args.IsValid = false;
        }

        protected void ValidateFileSize_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (file_input.HasFile && file_input.PostedFile.ContentLength > 0)
            {
                int minFileSizeKB = 50;
                int maxFileSizeKB = 1024;
                int fileSizeKB = file_input.PostedFile.ContentLength / 1024;
                if (fileSizeKB >= minFileSizeKB && fileSizeKB <= maxFileSizeKB)
                {
                    args.IsValid = true;
                    return;
                }
            }
            args.IsValid = false;
        }

        private void InsertAuctionItem(string productName, string productDescription, string fileName, string productPriceInterval, string minPrice, DateTime? auctionStartTime, DateTime? auctionEndTime)
        {
            string insertQuery = "INSERT INTO [AMS].[dbo].[AuctionItems] " +
                      "([ProductName], [ProductDescription], [FileName], [ProductPriceInterval], [MinPrice], [AuctionStartTime], [AuctionEndTime]) " +
                      "VALUES " +
                      "(@ProductName, @ProductDescription, @FileName, @ProductPriceInterval, @MinPrice, @AuctionStartTime, @AuctionEndTime)";


            using (SqlConnection connection = new SqlConnection("Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS;Initial Catalog=AMS;Integrated Security=True"))
            {
                using (SqlCommand command = new SqlCommand(insertQuery, connection))
                {
                    command.Parameters.AddWithValue("@ProductName", productName);
                    command.Parameters.AddWithValue("@ProductDescription", productDescription);
                    command.Parameters.AddWithValue("@FileName", fileName);
                    command.Parameters.AddWithValue("@ProductPriceInterval", productPriceInterval);
                    command.Parameters.AddWithValue("@MinPrice", minPrice);
                    command.Parameters.AddWithValue("@AuctionStartTime", (object)auctionStartTime ?? DBNull.Value);
                    command.Parameters.AddWithValue("@AuctionEndTime", (object)auctionEndTime ?? DBNull.Value);

                    connection.Open();
                    command.ExecuteNonQuery();

                    bool emailSent = SendAuctionNotificationEmail(productName, productDescription, auctionStartTime, auctionEndTime);
                    if (emailSent)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('Auction Create and Email Notification Send Successfully.' , 'green')", true);
                        return;
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('Email Notification Send Error .' , 'red')", true);
                        return;
                    }
                }
            }
        }


        private bool SendAuctionNotificationEmail(string productName, string productDescription, DateTime? auctionStartTime, DateTime? auctionEndTime)
        {
            try
            {
                string emailBodyTemplate = @"
        We are thrilled to announce a new auction!
        Dear {0},
        Item Details:
        Title: {1}
        Description: {2}
        Start Date: {3}
        End Date: {4}

        Hurry up and place your bids now to secure your chance to own this remarkable item!

        Thank you for your attention and participation.

        Best regards,
        Auction Management System
    ";

                List<(string fullName, string email)> allUserDetails = GetAllUserDetails();

                foreach (var userDetails in allUserDetails)
                {
                    string emailBody = string.Format(emailBodyTemplate, userDetails.fullName, productName, productDescription, auctionStartTime?.ToString("yyyy-MM-dd HH:mm") ?? "N/A", auctionEndTime?.ToString("yyyy-MM-dd HH:mm") ?? "N/A");
                    MailMessage mailMessage = new MailMessage("21bmiit129@gmail.com", userDetails.email);
                    mailMessage.Subject = "New Auction Notification!";
                    mailMessage.Body = emailBody;

                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.Credentials = new System.Net.NetworkCredential("21bmiit129@gmail.com", "rfkhielzatntivym");
                    smtp.EnableSsl = true;
                    smtp.Send(mailMessage);
                }

                return true;
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toasterScript", "showToaster('Email Notification Send Error ."+ ex +"' , 'red')", true);
                return false;
            }
        }

        private List<(string fullName, string email)> GetAllUserDetails()
        {
            List<(string fullName, string email)> userDetails = new List<(string fullName, string email)>();

            string query = "SELECT fullname, email FROM tbl_user";

            using (SqlConnection connection = new SqlConnection("Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS;Initial Catalog=AMS;Integrated Security=True"))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        string fullName = reader["fullname"].ToString();
                        string email = reader["email"].ToString();
                        userDetails.Add((fullName, email));
                    }
                }
            }

            return userDetails;
        }

        private string SaveFile()
        {
            string fileName = "";
            if (file_input.HasFile)
            {
                fileName = Path.GetFileName(file_input.PostedFile.FileName);
                string filePath = Server.MapPath("~/Uploads/product_img/" + fileName);
                file_input.PostedFile.SaveAs(filePath);
            }
            return fileName;
        }

        private DateTime? ParseDateTime(string dateTimeString, string format)
        {
            DateTime? result = null;
            if (!string.IsNullOrWhiteSpace(dateTimeString))
            {
                if (DateTime.TryParseExact(dateTimeString, format, CultureInfo.InvariantCulture, DateTimeStyles.None, out var parsedDateTime))
                {
                    result = parsedDateTime;
                }
            }
            return result;
        }

        private void ClearFormFields()
        {
            productName.Text = "";
            productPriceInterval.Text = "";
            minPrice.Text = "";
            auctionStartTime.Text = "";
            auctionEndTime.Text = "";
            productDescription.Text = "";
        }

    }
}