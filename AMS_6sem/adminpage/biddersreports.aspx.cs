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
    public partial class biddersreports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    BindUserData();
                }
                catch (Exception ex)
                {
                    ErrorMessageLabel.Text = "An error occurred while loading data: " + ex.Message;
                }
            }

        }
        private void BindUserData()
        {
            string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS; Initial Catalog=AMS; Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT bider.bider_id,bider.amount, tbl_user.fullname, AuctionItems.ProductName " +
                                                        "FROM bider " +
                                                        "INNER JOIN tbl_user ON bider.uid = tbl_user.uid " +
                                                        "INNER JOIN AuctionItems ON bider.AuctionItemId = AuctionItems.AuctionItemId", con))
                {
                    con.Open();

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            BidderRecordTable.DataSource = dt;
                            BidderRecordTable.DataBind();
                        }
                        else
                        {
                            ErrorMessageLabel.Text = "No data available.";
                        }
                    }
                }
            }
        }

        protected void BidderRecordTable_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeleteRecord")
            {
                int biderId = Convert.ToInt32(e.CommandArgument);

                DeleteRecord(biderId);

                BindUserData();
            }
        }

        private void DeleteRecord(int biderId)
        {
            string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS; Initial Catalog=AMS; Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM bider WHERE bider_id = @biderId", con))
                {
                    cmd.Parameters.AddWithValue("@biderId", biderId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }


    }
}