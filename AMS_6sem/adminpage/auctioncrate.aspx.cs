using System;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web;

namespace AMS_6sem.adminpage
{
    public partial class auctioncrate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreateAuction_Click(object sender, EventArgs e)
        {
            try
            {
                string productName = ((TextBox)FindControl("productName")).Text;
                string productDescription = ((TextBox)FindControl("productDescription")).Text;
                int productPriceInterval = Convert.ToInt32(((TextBox)FindControl("productPriceInterval")).Text);
                int minPrice = Convert.ToInt32(((TextBox)FindControl("minPrice")).Text);
                DateTime auctionStartTime = Convert.ToDateTime(((TextBox)FindControl("auctionStartTime")).Text);

                if (file_input.HasFile)
                {
                    HttpPostedFile file = file_input.PostedFile;
                    string fileName = Path.GetFileName(file.FileName);
                    string folderPath = Server.MapPath("~/Uploads/product_img/");
                    string filePath = Path.Combine(folderPath, fileName);

                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }

                    file.SaveAs(filePath);

                    string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS;Initial Catalog=AMS;Integrated Security=True";

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();
                        string query = @"INSERT INTO AuctionItems (ProductName, ProductDescription, FileName, ProductPriceInterval, MinPrice, AuctionStartTime) VALUES (@ProductName, @ProductDescription, @FileName, @ProductPriceInterval, @MinPrice, @AuctionStartTime)";

                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            command.Parameters.AddWithValue("@ProductName", productName);
                            command.Parameters.AddWithValue("@ProductDescription", productDescription);
                            command.Parameters.AddWithValue("@FileName", fileName);
                            command.Parameters.AddWithValue("@ProductPriceInterval", productPriceInterval);
                            command.Parameters.AddWithValue("@MinPrice", minPrice);
                            command.Parameters.AddWithValue("@AuctionStartTime", auctionStartTime);

                            command.ExecuteNonQuery();
                        }
                    }

                    Response.Redirect("~/admin.aspx");
                }
                else
                {
                    string script = "alert('Please select a file to upload.');";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                }
            }
            catch (Exception ex)
            {
                string script = $"alert('Error: {ex.Message}');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
            }
        }
    }
}
