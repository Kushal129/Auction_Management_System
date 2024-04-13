using System;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;

namespace User_Side
{
    public partial class Admin_add_product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreateAuction_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                string productNameValue = productName.Text;
                string productDescriptionValue = productDescription.Text;
                string productPriceIntervalValue = productPriceInterval.Text;
                string minPriceValue = minPrice.Text;

                string fileName = Path.GetFileName(file_input.PostedFile.FileName);
                string filePath = Server.MapPath("~/Uploads/product_img/" + fileName);
                file_input.PostedFile.SaveAs(filePath);
                string fileInputValue = fileName;

                DateTime auctionStartTimeValue = DateTime.Parse(auctionStartTime.Text);
                DateTime auctionEndTimeValue = DateTime.Parse(auctionEndTime.Text);

                string connectionString = "Data Source=DESKTOP-T1A2DI7;Initial Catalog=AMS;Integrated Security=True";

                string insertQuery = "INSERT INTO [AMS].[dbo].[AuctionItems] " +
                                     "([ProductName], [ProductDescription], [FileName], [ProductPriceInterval], [MinPrice], [AuctionStartTime], [AuctionEndTime]) " +
                                     "VALUES " +
                                     "(@ProductName, @ProductDescription, @FileName, @ProductPriceInterval, @MinPrice, @AuctionStartTime, @AuctionEndTime)";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(insertQuery, connection))
                    {
                        command.Parameters.AddWithValue("@ProductName", productNameValue);
                        command.Parameters.AddWithValue("@ProductDescription", productDescriptionValue);
                        command.Parameters.AddWithValue("@FileName", fileInputValue);
                        command.Parameters.AddWithValue("@ProductPriceInterval", productPriceIntervalValue);
                        command.Parameters.AddWithValue("@MinPrice", minPriceValue);
                        command.Parameters.AddWithValue("@AuctionStartTime", auctionStartTimeValue);
                        command.Parameters.AddWithValue("@AuctionEndTime", auctionEndTimeValue);

                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }

                Response.Write("<script>alert('Auction created successfully!');</script>");
            }
        }
    }
}
