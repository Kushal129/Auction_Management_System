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
    public partial class participantsreports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUserCards();
            }
        }

        private void LoadUserCards()
        {
            string connectionString = "Your_DB_Connection_String"; 
            string query = "SELECT * FROM tbl_user";

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                Console.WriteLine(ex.Message);
            }
        }
    }
}