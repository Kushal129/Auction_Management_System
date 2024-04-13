using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace User_Side
{
    public partial class Product_descripiton : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["AuctionItemId"] != null)
                {
                    int auctionItemId = Convert.ToInt32(Request.QueryString["AuctionItemId"]);
                    LoadProductDetails(auctionItemId);
                }
                else
                {
                    Response.Redirect("./UserIndex.aspx");
                }
            }
        }

        private void LoadProductDetails(int auctionItemId)
        {
            string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS; Initial Catalog=AMS; Integrated Security=True";
            string productQuery = "SELECT [ProductName], [ProductDescription], [FileName], [ProductPriceInterval], [MinPrice], [AuctionStartTime], [AuctionEndTime] FROM [AMS].[dbo].[AuctionItems] WHERE [AuctionItemId] = @AuctionItemId";
            string highestBidQuery = "SELECT TOP 1 amount FROM bider WHERE AuctionItemId = @AuctionItemId ORDER BY bider_id DESC";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                using (SqlCommand productCmd = new SqlCommand(productQuery, con))
                {
                    productCmd.Parameters.AddWithValue("@AuctionItemId", auctionItemId);
                    SqlDataReader productReader = productCmd.ExecuteReader();

                    if (productReader.Read())
                    {
                        lblProductName.Text = "Product Name: " + productReader["ProductName"].ToString();
                        lblProductDescription.Text = "Description: " + productReader["ProductDescription"].ToString();
                        lblProductPriceInterval.Text = "Price Interval: " + productReader["ProductPriceInterval"].ToString();
                        lblMinPrice.Text = "Minimum Price: " + productReader["MinPrice"].ToString();
                        lblAuctionStartTime.Text = "Auction Start Time: " + productReader["AuctionStartTime"].ToString();
                        lblAuctionEndTime.Text = "Auction End Time: " + productReader["AuctionEndTime"].ToString();

                        string imageUrl = "~/Uploads/product_img/" + productReader["FileName"].ToString();
                        imgProduct.ImageUrl = imageUrl;
                    }

                    productReader.Close();
                }

                using (SqlCommand highestBidCmd = new SqlCommand(highestBidQuery, con))
                {
                    highestBidCmd.Parameters.AddWithValue("@AuctionItemId", auctionItemId);
                    object highestBidObj = highestBidCmd.ExecuteScalar();

                    if (highestBidObj != null && highestBidObj != DBNull.Value)
                    {
                        decimal latestBidAmount = Convert.ToDecimal(highestBidObj);
                        lblLatestBidAmount.Text = "Latest Bid Amount: $" + latestBidAmount.ToString();
                    }
                    else
                    {
                        lblLatestBidAmount.Text = "No bids placed yet.";
                    }
                }
            }
        }


        protected void btnPlaceBid_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["AuctionItemId"] != null)
            {
                int auctionItemId = Convert.ToInt32(Request.QueryString["AuctionItemId"]);
                decimal bidAmount;
                if (decimal.TryParse(txtBidAmount.Text, out bidAmount))
                {
                    // Get the latest bid amount
                    decimal latestBidAmount = GetLatestBidAmount(auctionItemId);

                    // Validate bid amount
                    if (bidAmount <= latestBidAmount)
                    {
                        // Show error message
                        lblMessage.Text = "Bid amount must be higher than the latest bid amount.";
                    }
                    else
                    {
                        // Place the bid
                        int userId = 1; // Example user ID, replace with actual user ID retrieval logic
                        PlaceBid(userId, auctionItemId, bidAmount);

                        // Refresh latest bid amount
                        lblLatestBidAmount.Text = "Latest Bid Amount: $" + bidAmount.ToString();
                        lblMessage.Text = "Bid placed successfully.";
                    }
                }
                else
                {
                    // Show error message
                    lblMessage.Text = "Invalid bid amount.";
                }
            }
        }

        private decimal GetLatestBidAmount(int auctionItemId)
        {
            string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS; Initial Catalog=AMS; Integrated Security=True";
            string query = "SELECT TOP 1 amount FROM bider WHERE AuctionItemId = @AuctionItemId ORDER BY bider_id DESC";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@AuctionItemId", auctionItemId);
                    con.Open();
                    object result = cmd.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        return Convert.ToDecimal(result);
                    }
                }
            }

            return 0;
        }


        private void PlaceBid(int userId, int auctionItemId, decimal bidAmount)
        {
          
            string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS; Initial Catalog=AMS; Integrated Security=True";
            string query = "INSERT INTO bider (uid, AuctionItemId, amount) VALUES (@uid, @auctionItemId, @bidAmount)";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@uid", userId);
                    cmd.Parameters.AddWithValue("@auctionItemId", auctionItemId);
                    cmd.Parameters.AddWithValue("@bidAmount", bidAmount);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}
