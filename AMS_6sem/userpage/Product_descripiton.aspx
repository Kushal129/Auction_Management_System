<%@ Page Title="" Language="C#" MasterPageFile="~/userpage/User.Master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="~/userpage/Product_descripiton.aspx.cs" Inherits="User_Side.Product_descripiton" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .product-details-container {
            margin: 0 auto;
            width: 60%;
            background-color: #f8f8f8;
            padding: 20px;
            border-radius: 10px;
            display: flex;
            align-items: center;
        }

        .product-details {
            margin-bottom: 20px;
            text-align: center;
            flex: 1;
        }

        .product-details label {
            display: block;
            font-weight: bold;
        }

        .product-details .product-image {
            margin-right: 20px;
        }

        .product-details img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
        }

        .btn-place-bid {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product-details-container">
        <div class="product-image">
            <asp:Image ID="imgProduct" runat="server" AlternateText="Product Image" />
        </div>
        <div class="product-details">
            <asp:Label ID="lblProductName" runat="server" Text=""></asp:Label><br />
            <asp:Label ID="lblProductDescription" runat="server" Text=""></asp:Label><br />
            <asp:Label ID="lblProductPriceInterval" runat="server" Text=""></asp:Label><br />
            <asp:Label ID="lblMinPrice" runat="server" Text=""></asp:Label><br />
            <asp:Label ID="lblAuctionStartTime" runat="server" Text=""></asp:Label><br />
            <asp:Label ID="lblAuctionEndTime" runat="server" Text=""></asp:Label><br />
            <asp:Label ID="lblLatestBidAmount" runat="server" Text=""></asp:Label><br />
            <asp:TextBox ID="txtBidAmount" runat="server" CssClass="bid-amount"></asp:TextBox>
            <asp:Button ID="btnPlaceBid" runat="server" Text="Place Bid" OnClick="btnPlaceBid_Click" CssClass="btn-place-bid" />
        </div>
    </div>
    <div>
        <asp:Label ID="lblMessage" runat="server" CssClass="error-message" Text=""></asp:Label>
    </div>
</asp:Content>
