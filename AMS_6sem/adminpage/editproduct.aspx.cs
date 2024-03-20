using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AMS_6sem.adminpage
{
    public partial class editproduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int productId;
                    if (int.TryParse(Request.QueryString["id"], out productId))
                    {
                        LoadProductDetails(productId);
                    }
                    else
                    {
                        DisplayErrorMessage("Invalid product ID format.");
                    }
                }
                else
                {
                    DisplayErrorMessage("Product ID is missing.");
                }
            }
        }


        private void LoadProductDetails(int productId)
        {
            string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS;Initial Catalog=AMS;Integrated Security=True";
            string query = "SELECT * FROM AuctionItems WHERE AuctionItemId = @ProductId";

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        connection.Open();
                        command.Parameters.AddWithValue("@ProductId", productId);

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                if (reader["ProductName"] != DBNull.Value)
                                    txtProductName.Text = reader["ProductName"].ToString();
                                else
                                    txtProductName.Text = string.Empty;

                                if (reader["ProductDescription"] != DBNull.Value)
                                    txtProductDescription.Text = reader["ProductDescription"].ToString();
                                else
                                    txtProductDescription.Text = string.Empty;


                            }
                            else
                            {
                                DisplayErrorMessage("Product details not found for the provided ID.");
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                DisplayErrorMessage("An error occurred while loading product details: " + ex.Message);
            }
        }

        protected void formViewEditProduct_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            if (e.Exception == null)
            {
                DisplaySuccessMessage("Product updated successfully.");
                Response.Redirect("~/adminpage/productlist.aspx");
            }
            else
            {
                DisplayErrorMessage("An error occurred while updating the product: " + e.Exception.Message);
            }
        }

        protected void formViewEditProduct_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName == "Cancel")
            {
                Response.Redirect("~/adminpage/productlist.aspx");
            }
        }

        private void DisplayErrorMessage(string errorMessage)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "ErrorMessage", $"alert('{errorMessage}');", true);
        }

        private void DisplaySuccessMessage(string successMessage)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "SuccessMessage", $"alert('{successMessage}');", true);
        }
    }
}