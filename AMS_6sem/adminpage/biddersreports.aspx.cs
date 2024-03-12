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
                BindUserData();
            }

        }
        private void BindUserData()
        {
            string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS; Initial Catalog=AMS; Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_user", con))
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
                    }
                }
            }
        }
    }
}