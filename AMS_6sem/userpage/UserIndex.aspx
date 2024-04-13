<%@ Page Title="Index" Language="C#" MasterPageFile="~/userpage/User.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="~/userpage/UserIndex.aspx.cs" Inherits="User_Side.Index" %>

<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .button-logout {
            background-color: #f44336;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
      
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


   
<asp:ListView ID="ListView1" runat="server" OnItemCommand="ListView1_ItemCommand">
    <LayoutTemplate>
        <div class="grid grid-cols-4 gap-4">
            <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
        </div>
    </LayoutTemplate>
    <ItemTemplate>
        <div class="max-w-xs rounded overflow-hidden shadow-lg">
            <asp:Image ID="Image1" runat="server" CssClass="product-image" ImageUrl='<%# ResolveImageUrl(Eval("FileName")) %>' />
            <div class="px-6 py-4">

                <div class="font-bold text-xl mb-2"><%# Eval("ProductName") %></div>
                <p class="text-gray-700 text-base">
                    Price: <%# Eval("MinPrice") %>
                </p>
            </div>
            <div class="px-6 py-4">
                <asp:Button ID="ButtonBid" runat="server" Text="View Details" CommandName="ViewDetails" CommandArgument='<%# Eval("AuctionItemId") %>' CssClass="btn-place-bid" />
            </div>
        </div>
    </ItemTemplate>
</asp:ListView>
    <div id="errorPlaceholder" runat="server" class="text-red-500"></div>

</asp:Content>
