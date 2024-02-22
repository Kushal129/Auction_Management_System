using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace AMS_6sem.adminpage
{
    public partial class productsreports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAuctionItemsData();
            }
        }

        private void BindAuctionItemsData()
        {
            DataTable auctionItemsTable = GetAuctionItemsData();
            AuctionItemsDataTable.DataSource = auctionItemsTable;
            AuctionItemsDataTable.DataBind();
        }

        private DataTable GetAuctionItemsData()
        {
            DataTable dataTable = new DataTable();

            string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS; Initial Catalog=AMS; Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT * FROM AuctionItems";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataAdapter dataAdapter = new SqlDataAdapter(command))
                    {
                        dataAdapter.Fill(dataTable);
                    }
                }
            }

            return dataTable;
        }

        protected void DeleteRecord(object sender, EventArgs e)
        {
            LinkButton btnDelete = (LinkButton)sender;
            int auctionItemId = Convert.ToInt32(btnDelete.CommandArgument);

            string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS; Initial Catalog=AMS; Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "DELETE FROM AuctionItems WHERE AuctionItemId = @ItemId";

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@ItemId", auctionItemId);
                    cmd.ExecuteNonQuery();
                }
            }

            BindAuctionItemsData();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "deleteAlert", "alert('Record deleted successfully.');", true);
        }
    }
}
