using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace User_Side
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserID"] == null && Session["UserName"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }

            if (!IsPostBack)
            {
                BindAuctionItems();
            }
        }

        private void BindAuctionItems()
        {
            try
            {
                string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS; Initial Catalog=AMS; Integrated Security=True";
                DateTime currentTime = DateTime.Now;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT * FROM AuctionItems WHERE AuctionStartTime <= @currentTime AND AuctionEndTime > @currentTime";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@currentTime", currentTime);

                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            if (dt.Rows.Count > 0)
                            {
                                ListView1.DataSource = dt;
                                ListView1.DataBind();
                            }
                            else
                            {
                                errorPlaceholder.InnerHtml = "No live auctions available.";
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                errorPlaceholder.InnerHtml = "An error occurred: " + ex.Message;
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