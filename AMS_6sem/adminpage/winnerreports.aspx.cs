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
    public partial class winnerreports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PopulateWinnerReportsTable();
        }

        protected void PopulateWinnerReportsTable()
        {
            string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS; Initial Catalog=AMS; Integrated Security=True";
            string query = @"
        SELECT 
            wr.AuctionItemId, 
            u.fullname AS WinnerName, 
            u.mobile AS Contact, 
            ai.ProductName AS Product, 
            ai.MinPrice AS MinPrice, 
            wr.WinningBidAmount AS WinningPrice,
            ai.FileName 
        FROM 
             WinnerReports wr
            INNER JOIN tbl_user u ON wr.WinningBidder = u.uid
            INNER JOIN AuctionItems ai ON wr.AuctionItemId = ai.AuctionItemId";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    WinnerreportDataTable.DataSource = dataTable;
                    WinnerreportDataTable.DataBind();
                }
            }
        }
    }
}