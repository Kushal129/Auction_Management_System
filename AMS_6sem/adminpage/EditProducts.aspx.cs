using System;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AMS_6sem.adminpage
{
    public partial class EditProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProductDetails();
            }
        }

        private void LoadProductDetails()
        {
            if (Request.QueryString["id"] != null && int.TryParse(Request.QueryString["id"], out int productId))
            {
                string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS;Initial Catalog=AMS;Integrated Security=True";
                string query = "SELECT * FROM AuctionItems WHERE AuctionItemId = @ProductId";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@ProductId", productId);
                        connection.Open();

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                txtProductNameEdit.Text = reader["ProductName"].ToString();
                                txtProductDescription.Text = reader["ProductDescription"].ToString();
                                imgProductImage.ImageUrl = ResolveUrl("~/Uploads/product_img/") + reader["FileName"].ToString();
                                txtProductPriceInterval.Text = reader["ProductPriceInterval"].ToString();
                                txtMinPrice.Text = reader["MinPrice"].ToString();
                                txtAuctionStart.Text = reader["AuctionStartTime"].ToString();
                                txtAuctionEnd.Text = reader["AuctionEndTime"].ToString();
                            }
                            else
                            {
                                DisplayErrorMessage("Product not found.");
                            }
                        }
                    }
                }
            }
            else
            {
                DisplayErrorMessage("Invalid product ID.");
                //Response.Redirect("~/adminpage/productsreports.aspx");
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null && int.TryParse(Request.QueryString["id"], out int productId))
            {
                string uploadedFileName = string.Empty;
                if (fileUploadProductImage.HasFile)
                {
                    uploadedFileName = fileUploadProductImage.FileName;

                    string uploadFolderPath = Server.MapPath("~/Uploads/product_img/");
                    string uploadedFilePath = Path.Combine(uploadFolderPath, uploadedFileName);
                    fileUploadProductImage.SaveAs(uploadedFilePath);
                }
                string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS;Initial Catalog=AMS;Integrated Security=True";
                string querySelect = "SELECT * FROM AuctionItems WHERE AuctionItemId = @ProductId";
                string queryUpdate = "UPDATE AuctionItems SET ProductName = @ProductName, ProductDescription = @ProductDescription, ProductPriceInterval = @ProductPriceInterval, MinPrice = @MinPrice, AuctionStartTime = @AuctionStartTime, AuctionEndTime = @AuctionEndTime";

                if (fileUploadProductImage.HasFile)
                {
                    queryUpdate += ", FileName = @FileName";
                }

                queryUpdate += " WHERE AuctionItemId = @ProductId";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand selectCommand = new SqlCommand(querySelect, connection))
                    {
                        selectCommand.Parameters.AddWithValue("@ProductId", productId);
                        connection.Open();
                        using (SqlDataReader reader = selectCommand.ExecuteReader())
                        {
                            if (reader.Read())
                            { 
                                string existingProductName = reader["ProductName"].ToString();
                                string existingProductDescription = reader["ProductDescription"].ToString();
                                string existingProductPriceInterval = reader["ProductPriceInterval"].ToString();
                                string existingMinPrice = reader["MinPrice"].ToString();
                                string existingAuctionStart = reader["AuctionStartTime"].ToString();
                                string existingAuctionEnd = reader["AuctionEndTime"].ToString();
                                string existingFileName = reader["FileName"].ToString();

                                bool dataChanged = txtProductNameEdit.Text != existingProductName ||
                                                   txtProductDescription.Text != existingProductDescription ||
                                                   txtProductPriceInterval.Text != existingProductPriceInterval ||
                                                   txtMinPrice.Text != existingMinPrice ||
                                                   txtAuctionStart.Text != existingAuctionStart ||
                                                   txtAuctionEnd.Text != existingAuctionEnd ||
                                                   uploadedFileName != existingFileName; 


                                if (dataChanged)
                                {
                                    // Check if Auction Start and End Time are valid DateTime
                                    DateTime auctionStartTime;
                                    DateTime auctionEndTime;
                                    if (!DateTime.TryParse(txtAuctionStart.Text, out auctionStartTime) ||
                                        !DateTime.TryParse(txtAuctionEnd.Text, out auctionEndTime))
                                    {
                                        DisplayErrorMessage("Invalid Auction Start or End Time format.");
                                        return;
                                    }

                                    reader.Close();

                                    using (SqlCommand updateCommand = new SqlCommand(queryUpdate, connection))
                                    {
                                        updateCommand.Parameters.AddWithValue("@ProductName", txtProductNameEdit.Text);
                                        updateCommand.Parameters.AddWithValue("@ProductDescription", txtProductDescription.Text);
                                        updateCommand.Parameters.AddWithValue("@ProductPriceInterval", txtProductPriceInterval.Text);
                                        updateCommand.Parameters.AddWithValue("@MinPrice", txtMinPrice.Text);
                                        updateCommand.Parameters.AddWithValue("@AuctionStartTime", auctionStartTime);
                                        updateCommand.Parameters.AddWithValue("@AuctionEndTime", auctionEndTime);
                                        updateCommand.Parameters.AddWithValue("@FileName", uploadedFileName);
                                        updateCommand.Parameters.AddWithValue("@ProductId", productId);

                                        int rowsAffected = updateCommand.ExecuteNonQuery();
                                        if (rowsAffected > 0)
                                        {
                                            DisplaySuccessMessage("Product updated successfully.");
                                            Response.Redirect("~/adminpage/productsreports.aspx");
                                        }
                                        else
                                        {
                                            DisplayErrorMessage("Failed to update product.");
                                        }
                                    }
                                }
                                else
                                {
                                    DisplayErrorMessage("No changes made to the product.");
                                }
                            }
                            else
                            {
                                DisplayErrorMessage("Product not found.");
                            }
                        }
                    }
                }
            }
            else
            {
                //Response.Redirect("~/adminpage/productsreports.aspx");
                DisplayErrorMessage("Invalid product ID.");
            }
        }


        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/adminpage/productsreports.aspx");
        }

        private void DisplayErrorMessage(string errorMessage)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "ErrorMessage", $"alert('{errorMessage}');", true);
        }

        private void DisplaySuccessMessage(string successMessage)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "SuccessMessage", $"alert('{successMessage}');", true);
        }

        protected void CustomValidatorAuctionStartTime_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime startTime;
            if (DateTime.TryParseExact(txtAuctionStart.Text, "yyyy-MM-ddTHH:mm", CultureInfo.InvariantCulture, DateTimeStyles.None, out startTime))
            {
                args.IsValid = startTime > DateTime.Now;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void CustomValidatorAuctionTime_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime startTime, endTime;
            if (DateTime.TryParseExact(txtAuctionStart.Text, "yyyy-MM-ddTHH:mm", CultureInfo.InvariantCulture, DateTimeStyles.None, out startTime) &&
                DateTime.TryParseExact(txtAuctionEnd.Text, "yyyy-MM-ddTHH:mm", CultureInfo.InvariantCulture, DateTimeStyles.None, out endTime))
            {
                args.IsValid = endTime > startTime;
            }
            else
            {
                args.IsValid = false; 
            }
        }
    }
}
