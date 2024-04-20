<%@ Page Title="" Language="C#" MasterPageFile="~/userpage/User.Master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="~/userpage/Product_descripiton.aspx.cs" Inherits="User_Side.Product_descripiton" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Main container for product details */
        .product-details-container {
            margin: 0 auto;
            width: 80%;
            background-color: #f8f8f8;
            padding: 20px;
            border-radius: 10px;
            display: flex;
            align-items: center;
        }

        /* Container for product image */
        .product-image {
            flex: 1;
            text-align: center;
        }

        /* Product image */
        .product-image img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
        }

        /* Container for product information */
        .product-details {
            flex: 3;
            text-align: left;
            padding: 0 20px;
        }

        /* Product information labels */
        .product-details label {
            display: block;
            font-weight: bold;
            margin-bottom: 10px;
        }

        /* Bid amount input and place bid button */
        .bid-section {
            margin-top: 20px;
            text-align: center;
        }

        .bid-amount {
            width: 200px;
            padding: 8px;
            margin-right: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn-place-bid {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .error-message {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product-details-container">
        <div class="product-image">
            <asp:Image ID="imgProduct" runat="server" AlternateText="Product Image" />
        </div>
        <div class="product-details">
            <asp:Label ID="lblProductName" runat="server" Text=""></asp:Label>
            <br />
            <asp:Label ID="lblProductDescription" runat="server" Text=""></asp:Label>
            <br />
            <asp:Label ID="lblProductPriceInterval" runat="server" Text=""></asp:Label>
            <br />
            <asp:Label ID="lblMinPrice" runat="server" Text=""></asp:Label>
            <br />
            <asp:Label ID="lblAuctionStartTime" runat="server" Text=""></asp:Label>
            <br />
            <asp:Label ID="lblAuctionEndTime" runat="server" Text=""></asp:Label>
            <br />
            <asp:Label ID="lblLatestBidAmount" runat="server" Text=""></asp:Label>
            <br />
            <div class="bid-section">
                <asp:TextBox ID="txtBidAmount" runat="server" CssClass="bid-amount"></asp:TextBox>
                <asp:Button ID="btnPlaceBid" runat="server" Text="Place Bid" OnClick="btnPlaceBid_Click" CssClass="btn-place-bid" />
            </div>
        </div>
    </div>
    <div class="error-message">
        <asp:Label ID="lblMessage" ForeColor="Red" runat="server" Text=""></asp:Label>
        <asp:Label ID="lblSusc" ForeColor="Green" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
