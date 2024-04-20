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
            <div id="error" runat="server" class="text-red-500">
                <div id="errorPlaceholder" runat="server" class="text-red-500"></div>
            </div>
        </div>
       
    </div>
</asp:Content>
