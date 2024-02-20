using System;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web;
using System.Globalization;

namespace AMS_6sem.adminpage
{
    public partial class auctioncrate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreateAuction_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(productName.Text) ||
                file_input.PostedFile == null ||
                file_input.PostedFile.ContentLength == 0 || 
                string.IsNullOrWhiteSpace(productPriceInterval.Text) ||
                string.IsNullOrWhiteSpace(minPrice.Text) ||
                string.IsNullOrWhiteSpace(auctionStartTime.Text) ||
                string.IsNullOrWhiteSpace(auctionEndTime.Text) ||
                string.IsNullOrWhiteSpace(productDescription.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "ValidationAlert", "alert('Please fill in all required fields including the image.');", true);
                return;
            }

            string productNameValue = productName.Text;
            string productPriceIntervalValue = productPriceInterval.Text;
            string minPriceValue = minPrice.Text;
            string fileName = Path.GetFileName(file_input.PostedFile.FileName);
            string filePath = Server.MapPath("~/Uploads/product_img/" + fileName);
            file_input.PostedFile.SaveAs(filePath);
            string fileInputValue = fileName;


            DateTime? auctionStartTimeValue = null;
            if (!string.IsNullOrWhiteSpace(auctionStartTime.Text))
            {
                if (!DateTime.TryParseExact(auctionStartTime.Text, "yyyy-MM-ddTHH:mm", CultureInfo.InvariantCulture, DateTimeStyles.None, out var startTime))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "InvalidStartTimeFormatAlert", "alert('Invalid Auction Start Time format.');", true);
                    return;
                }
                auctionStartTimeValue = startTime;
            }

            DateTime? auctionEndTimeValue = null;
            if (!string.IsNullOrWhiteSpace(auctionEndTime.Text))
            {
                if (!DateTime.TryParseExact(auctionEndTime.Text, "yyyy-MM-ddTHH:mm", CultureInfo.InvariantCulture, DateTimeStyles.None, out var endTime))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "InvalidEndTimeFormatAlert", "alert('Invalid Auction End Time format.');", true);
                    return;
                }
                auctionEndTimeValue = endTime;
            }

            string productDescriptionValue = productDescription.Text;

            string insertQuery = "INSERT INTO [AMS].[dbo].[AuctionItems] " +
                       "([ProductName], [ProductDescription], [FileName], [ProductPriceInterval], [MinPrice], [AuctionStartTime], [AuctionEndTime]) " +
                       "VALUES " +
                       "(@ProductName, @ProductDescription, @FileName, @ProductPriceInterval, @MinPrice, @AuctionStartTime, @AuctionEndTime)";


            using (SqlConnection connection = new SqlConnection("Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS;Initial Catalog=AMS;Integrated Security=True"))
            {
                using (SqlCommand command = new SqlCommand(insertQuery, connection))
                {
                    command.Parameters.AddWithValue("@ProductName", productNameValue);
                    command.Parameters.AddWithValue("@ProductDescription", productDescriptionValue);
                    command.Parameters.AddWithValue("@FileName", fileInputValue);
                    command.Parameters.AddWithValue("@ProductPriceInterval", productPriceIntervalValue);
                    command.Parameters.AddWithValue("@MinPrice", minPriceValue);
                    command.Parameters.AddWithValue("@AuctionStartTime", (object)auctionStartTimeValue ?? DBNull.Value);
                    command.Parameters.AddWithValue("@AuctionEndTime", (object)auctionEndTimeValue ?? DBNull.Value);
                    
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }

            ScriptManager.RegisterStartupScript(this, GetType(), "SuccessAlert", "alert('Auction created successfully!');", true);

            Response.Redirect("~/admin.aspx");
        }

    }
}
