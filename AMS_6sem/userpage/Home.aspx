<%@ Page Title="" Language="C#" MasterPageFile="~/userpage/User.Master" AutoEventWireup="true" CodeBehind="~/userpage/Home.aspx.cs" Inherits="User_Side.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .product-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center; /* Center align the products */
        }

        .product-item {
            background-color: #f2f2f2;
            border: 1px solid #dddddd;
            margin: 16px;
            padding: 16px;
            width: 30%;
            text-align: center; /* Center align the content inside each product item */
            transition: transform 0.3s;
        }

        .product-item:hover {
            transform: scale(1.1); /* Scale up the item on hover */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Add shadow on hover */
            z-index: 1; /* Ensure it's above other items */
        }

        .product-image {
            height: 150px;
            margin-bottom: 8px;
            width: 100%;
        }

        .product-details {
            display: none; 
            position: absolute; /* Position details over the product item */
            top: 100%; /* Position details below the product item */
            left: 50%; /* Position details at the center horizontally */
            transform: translateX(-50%); /* Center details horizontally */
            background-color: #ffffff;
            padding: 10px;
            border: 1px solid #dddddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            z-index: 1; /* Ensure details appear above other items */
            width: 70%; /* Adjust width as needed */
            opacity: 0; /* Initially hidden */
            transition: opacity 0.3s; /* Smooth transition for opacity */
        }

        .product-item:hover .product-details {
            display: block; 
            opacity: 1; 
        }

        .product-details h3 {
            margin-top: 0;
        }

        .product-details p {
            margin-bottom: 8px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product-container">
        <asp:ListView ID="ListView1" runat="server" OnItemCommand="ListView1_ItemCommand">
            <ItemTemplate>
                <div class="product-item">
                    <asp:Image ID="Image1" runat="server" CssClass="product-image" ImageUrl='<%# ResolveImageUrl(Eval("FileName")) %>' />
                    <div class="product-details">
                        <h3><%# Eval("ProductName") %></h3>
                        <p>Price: <%# Eval("MinPrice") %></p>
                        <asp:Button ID="ButtonBid" runat="server" Text="View Details" CommandName="ViewDetails" CommandArgument='<%# Eval("AuctionItemId") %>' CssClass="btn-place-bid" />
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>
