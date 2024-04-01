<%@ Page Title="" Language="C#" MasterPageFile="~/userpage/User.Master" AutoEventWireup="true" CodeBehind="UserIndex.aspx.cs" Inherits="User_Side.Index" %>
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

    <asp:Label ID="lblUserName" runat="server" Text=""></asp:Label>
  
</asp:Content>
