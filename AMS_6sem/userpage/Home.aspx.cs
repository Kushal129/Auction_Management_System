using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace User_Side
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAuctionItems();
            }
        }

        private void BindAuctionItems()
        {
            string connectionString = "Data Source=DESKTOP-T1A2DI7;Initial Catalog=AMS;Integrated Security=True";
            string query = "SELECT [AuctionItemId], [ProductName], [ProductDescription], [FileName], [ProductPriceInterval], [MinPrice], [AuctionStartTime], [AuctionEndTime] FROM [AMS].[dbo].[AuctionItems]";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        ListView1.DataSource = dt;
                        ListView1.DataBind();
                    }
                }
            }
        }

        protected string ResolveImageUrl(object fileName)
        {
            return string.Format("~/Uploads/product_img/{0}", fileName);
        }

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                int auctionItemId;
                if (int.TryParse(e.CommandArgument.ToString(), out auctionItemId))
                {
                    Response.Redirect("Product_descripiton.aspx?AuctionItemId=" + auctionItemId);
                }
            }
        }
    }
}
