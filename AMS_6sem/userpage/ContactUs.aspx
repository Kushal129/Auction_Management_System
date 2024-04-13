<%@ Page Title="" Language="C#" MasterPageFile="~/userpage/User.Master" AutoEventWireup="true" CodeBehind="~/userpage/ContactUs.aspx.cs" Inherits="User_Side.ContactUs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .contact-container {
            width: 60%;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .contact-details {
            text-align: center;
        }

        .contact-details p {
            transition: transform 0.3s;
        }

        .contact-details p:hover {
            transform: scale(1.05);
            font-weight: bold;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contact-container">
        <h2>Contact Us</h2>
        <div class="contact-details">
            <p>If you have any questions or concerns, feel free to contact us:</p>
            <p>Contact Number: 9054265057</p>
            <p>Email: info@example.com</p>
            <p>Address: 123 Main Street, City, Country</p>
            <p>Business Hours: Monday - Friday, 9:00 AM - 5:00 PM</p>
        </div>
    </div>
</asp:Content>

