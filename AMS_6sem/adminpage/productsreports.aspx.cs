using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AMS_6sem.adminpage
{
    public partial class productsreports : System.Web.UI.Page
    {
        string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS; Initial Catalog=AMS; Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
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
         
        protected void DeleteRecord(string auctionItemId)
        {  
           
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "DELETE FROM AuctionItems WHERE AuctionItemId = @AuctionItemId";

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.ExecuteNonQuery();
                }
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "deleteAlert", "alert('Record deleted successfully.');", true);
            GetAuctionItemsData();
        }

       
    }
}