<%@ Page Title="Index" Language="C#" MasterPageFile="~/userpage/User.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="~/userpage/UserIndex.aspx.cs" Inherits="User_Side.Index" %>

<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Styles for ListView items */
        .product-card {
            max-width: 300px;
            margin: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            background-color: #fff;
        }

        .product-image {
            width: 100%;
            height: auto;
        }

        .product-details {
            padding: 20px;
        }

        .product-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .product-price {
            font-size: 16px;
            color: #888;
            margin-bottom: 10px;
        }

        .btn-view-details {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

            .btn-view-details:hover {
                background-color: #45a049;
            }

        .error-container {
            text-align: center;
            margin-top: 20px;
        }

        .text-red-500 {
            color: red;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <asp:ListView ID="ListView1" runat="server" OnItemCommand="ListView1_ItemCommand">
                <LayoutTemplate>
                    <div class="grid grid-cols-4 gap-4">
                        <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="product-card">
                        <asp:Image ID="Image1" runat="server" CssClass="product-image" ImageUrl='<%# ResolveImageUrl(Eval("FileName")) %>' />
                        <div class="product-details">
                            <div class="product-title"><%# Eval("ProductName") %></div>
                            <div class="product-price">Price: <%# Eval("MinPrice") %></div>
                            <asp:Button ID="ButtonBid" runat="server" Text="View Details" CommandName="ViewDetails" CommandArgument='<%# Eval("AuctionItemId") %>' CssClass="btn-view-details" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <div class="error-container">
            <div id="error" runat="server" class="max-w-md mx-auto bg-purple-200 rounded-md cursor-not-allowed overflow-hidden shadow-md mt-4 p-4">
                <p id="errorPlaceholder" runat="server" class="text-red-600 text-center text-lg"></p>
            </div>
        </div>
        <hr class="w-4/5 mx-auto mt-5 text-purple-800 fade-in mb-5" />

        <section class="container mx-auto mt-5" id="upcoming-section">

            <% using (SqlConnection connection = new SqlConnection("Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS;Initial Catalog=AMS;Integrated Security=True"))
                { %>
            <% connection.Open(); %>
            <% string query = "SELECT * FROM AuctionItems WHERE AuctionStartTime > GETDATE()"; %>
            <% using (SqlCommand command = new SqlCommand(query, connection))
                { %>
            <% using (SqlDataReader reader = command.ExecuteReader())
                { %>
            <% if (reader.HasRows)
                { %>
            <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 text-black lg:grid-cols-4 gap-4">
                <% while (reader.Read())
                    { %>
                <div class="bg-white p-4 rounded-lg shadow-md">
                    <img src='<%= ResolveUrl("~/Uploads/product_img/" + reader["FileName"]) %>' alt='<%= reader["ProductName"] %>' class="w-full h-40 object-cover mb-4 rounded-md" />
                    <h1 class="font-semibold mb-2 text-3xl text-center text-indigo-900"><%= reader["ProductName"] %></h1>
                    <p class="text-gray-600">Details: <%= reader["ProductDescription"] %></p>
                    <p class="text-purple-800">Price Interval: <%= reader["ProductPriceInterval"] %></p>
                    <p class="text-purple-800">Min Price: <%= reader["MinPrice"] %></p>
                    <p class="text-purple-800">Auction Start Time: <span class="text-lg text-green-500"><%= ((DateTime)reader["AuctionStartTime"]).ToString("dd-MM-yyyy HH:mm:ss") %> </span></p>
                    <p class="text-purple-800">Auction End Time: <span class="text-lg text-red-500"><%= ((DateTime)reader["AuctionEndTime"]).ToString("dd-MM-yyyy HH:mm:ss") %> </span></p>
                    <p class="text-blue-500 font-bold">Upcoming Auction</p>
                </div>
                <% } %>
                <% }
                    else
                    { %>
                <div class="max-w-md mx-auto bg-purple-200 rounded-md cursor-not-allowed overflow-hidden shadow-md mt-4 p-4">
                    <p class="text-red-600 text-center text-lg">No upcoming auctions currently.</p>
                </div>
                <% } %>
            </div>
            <% } %>
            <% } %>
            <% } %>
        </section>

        <hr class="w-4/5 mx-auto mt-5 text-purple-800 fade-in mb-5" />

        <script type="text/javascript">
            function preventBack() {
                window.history.forward();
            }
            setTimeout("preventBack()", 0);
            window.onunload = function () { null };
        </script>
</asp:Content>
