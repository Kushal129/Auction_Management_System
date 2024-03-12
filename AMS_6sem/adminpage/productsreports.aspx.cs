﻿using System;
using System.Collections.Generic;
using System.Configuration;
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
        string connectionString = "Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS;Initial Catalog=AMS;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FetchAuctionItems();
            }
        }

        protected void FetchAuctionItems()
        {
            try
            {

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "SELECT * FROM AuctionItems";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        connection.Open();
                        DataTable dt = new DataTable();
                        using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                        {
                            adapter.Fill(dt);
                        }

                        Console.WriteLine($"Number of rows fetched: {dt.Rows.Count}");

                        AuctionItemsDataTable.DataSource = dt;
                        AuctionItemsDataTable.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                string errorMessage = "An error occurred while fetching auction items. Error Message: " + ex.Message;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", $"alert('{errorMessage}')", true);
            }
        }

        protected void DeleteRecord(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    int Aid = Convert.ToInt32((sender as LinkButton).CommandArgument);

                    string query = "DELETE FROM AuctionItems WHERE AuctionItemId = @AuctionItemId";

                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        cmd.Parameters.AddWithValue("@AuctionItemId", Aid);

                        connection.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            FetchAuctionItems();
                            string successMessage = "Record deleted successfully.";
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", $"alert('{successMessage}')", true);
                        }
                        else
                        {
                            FetchAuctionItems();
                            string errorMessage = "Record not found or already deleted.";
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", $"alert('{errorMessage}')", true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                string errorMessage = "An error occurred while deleting the record. Error Message: " + ex.Message;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", $"alert('{errorMessage}')", true);
            }
        }

    }

}