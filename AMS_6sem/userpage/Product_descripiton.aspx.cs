using System;
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
                    int auctionItemId;
                    if (int.TryParse(Request.QueryString["AuctionItemId"], out auctionItemId))
                    {
                        LoadProductDetails(auctionItemId);
                    }
                    else
                    {
                        Response.Redirect("./UserIndex.aspx");
                    }
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
                        lblProductName.Text = "Product Name: " + productReader["ProductName"];
                        lblProductDescription.Text = "Description: " + productReader["ProductDescription"];
                        lblProductPriceInterval.Text = "Price Interval: " + productReader["ProductPriceInterval"];
                        lblMinPrice.Text = "Minimum Price: " + productReader["MinPrice"];
                        lblAuctionStartTime.Text = "Auction Start Time: " + productReader["AuctionStartTime"];
                        lblAuctionEndTime.Text = "Auction End Time: " + productReader["AuctionEndTime"];

                        string imageUrl = "~/Uploads/product_img/" + productReader["FileName"];
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
                        lblLatestBidAmount.Text = "Latest Bid Amount: Rs " + latestBidAmount;
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
            try
            {
                if (Request.QueryString["AuctionItemId"] != null)
                {
                    int auctionItemId;
                    if (int.TryParse(Request.QueryString["AuctionItemId"], out auctionItemId))
                    {
                        decimal bidAmount;
                        if (decimal.TryParse(txtBidAmount.Text, out bidAmount))
                        {
                            decimal latestBidAmount = GetLatestBidAmount(auctionItemId);
                            decimal minPrice = GetMinPrice(auctionItemId);
                            decimal priceInterval = GetProductPriceInterval(auctionItemId);

                            string errorMessage = null;

                            if (bidAmount < minPrice)
                            {
                                errorMessage = "Bid amount must be equal to or higher than the minimum price.";
                            }
                            else if (bidAmount < minPrice + priceInterval)
                            {
                                errorMessage = "Bid amount must be higher than the minimum price + the price interval.";
                            }
                            else if (bidAmount < latestBidAmount + priceInterval)
                            {
                                errorMessage = "Bid amount must be higher than the latest bid amount plus the price interval.";
                            }
                            else
                            {
                                int userId = Convert.ToInt32(Session["UserID"]);
                                PlaceBid(userId, auctionItemId, bidAmount);

                                lblLatestBidAmount.Text = "Latest Bid Amount: Rs " + bidAmount;
                                lblSusc.Text = "Bid placed successfully.";
                            }

                            if (!string.IsNullOrEmpty(errorMessage))
                            {
                                lblMessage.Text = errorMessage;
                            }
                            else
                            {
                                lblMessage.Text = "";
                            }
                        }
                        else
                        {
                            lblMessage.Text = "Invalid bid amount.";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred: " + ex.Message;
            }
        }



        private decimal GetMinPrice(int auctionItemId)
        {
            decimal minPrice = 0;
            string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS; Initial Catalog=AMS; Integrated Security=True";
            string query = "SELECT MinPrice FROM AuctionItems WHERE AuctionItemId = @AuctionItemId";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@AuctionItemId", auctionItemId);
                    con.Open();
                    object result = cmd.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        minPrice = Convert.ToDecimal(result);
                    }
                }
            }

            return minPrice;
        }

        private decimal GetProductPriceInterval(int auctionItemId)
        {
            decimal priceInterval = 0;
            string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS; Initial Catalog=AMS; Integrated Security=True";
            string query = "SELECT ProductPriceInterval FROM AuctionItems WHERE AuctionItemId = @AuctionItemId";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@AuctionItemId", auctionItemId);
                    con.Open();
                    object result = cmd.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        priceInterval = Convert.ToDecimal(result);
                    }
                }
            }

            return priceInterval;
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
            string selectQuery = "SELECT COUNT(*) FROM bider WHERE uid = @uid AND AuctionItemId = @auctionItemId";
            string updateQuery = "UPDATE bider SET amount = @bidAmount WHERE uid = @uid AND AuctionItemId = @auctionItemId";
            string insertQuery = "INSERT INTO bider (uid, AuctionItemId, amount) VALUES (@uid, @auctionItemId, @bidAmount)";
            string winnerUpdateQuery = "UPDATE WinnerReports SET WinningBidAmount = @bidAmount, WinningBidder = @userId WHERE AuctionItemId = @auctionItemId";
            string winnerInsertQuery = "INSERT INTO WinnerReports (AuctionItemId, WinningBidder, WinningBidAmount) VALUES (@auctionItemId, @userId, @bidAmount)";
            string highestBidQuery = "SELECT TOP 1 amount FROM bider WHERE AuctionItemId = @auctionItemId ORDER BY amount DESC";


            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand selectCmd = new SqlCommand(selectQuery, con))
                {
                    selectCmd.Parameters.AddWithValue("@uid", userId);
                    selectCmd.Parameters.AddWithValue("@auctionItemId", auctionItemId);
                    con.Open();
                    int existingBidsCount = (int)selectCmd.ExecuteScalar();

                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = con;

                        if (existingBidsCount > 0)
                        {
                            cmd.CommandText = updateQuery;
                        }
                        else
                        {
                            cmd.CommandText = insertQuery;
                        }

                        cmd.Parameters.AddWithValue("@uid", userId);
                        cmd.Parameters.AddWithValue("@auctionItemId", auctionItemId);
                        cmd.Parameters.AddWithValue("@bidAmount", bidAmount);

                        if (con.State != ConnectionState.Open)
                        {
                            con.Open();
                        }

                        cmd.ExecuteNonQuery();

                        decimal highestBidAmount;
                        using (SqlCommand highestBidCmd = new SqlCommand(highestBidQuery, con))
                        {
                            highestBidCmd.Parameters.AddWithValue("@auctionItemId", auctionItemId);
                            highestBidAmount = Convert.ToDecimal(highestBidCmd.ExecuteScalar());
                        }

                        if (bidAmount >= highestBidAmount)
                        {
                            using (SqlCommand winnerUpdateCmd = new SqlCommand(winnerUpdateQuery, con))
                            {
                                winnerUpdateCmd.Parameters.AddWithValue("@auctionItemId", auctionItemId);
                                winnerUpdateCmd.Parameters.AddWithValue("@userId", userId);
                                winnerUpdateCmd.Parameters.AddWithValue("@bidAmount", bidAmount);
                                winnerUpdateCmd.ExecuteNonQuery();
                            }
                        }
                        else if (existingBidsCount == 0)
                        {
                            using (SqlCommand winnerInsertCmd = new SqlCommand(winnerInsertQuery, con))
                            {
                                winnerInsertCmd.Parameters.AddWithValue("@auctionItemId", auctionItemId);
                                winnerInsertCmd.Parameters.AddWithValue("@userId", userId);
                                winnerInsertCmd.Parameters.AddWithValue("@bidAmount", bidAmount);
                                winnerInsertCmd.ExecuteNonQuery();
                            }
                        }
                    }
                }
            }
        }
    }
}
