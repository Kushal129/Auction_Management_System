<%@ Page Title="" Language="C#" MasterPageFile="~/navfooter.Master" AutoEventWireup="true" CodeBehind="Forgotpass.aspx.cs" Inherits="AMS_6sem.Forgotpass1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <a href="index.aspx" class="nav-link">Home<span class="active-underline"></span></a>

    <a href="Login.aspx" class="nav-link">Login<span class="active-underline"></span></a>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="toaster-alert" id="toaster"></div>
    <div class="container mx-auto flex justify-center items-center h-screen">
        <form id="mainForm" runat="server" class="max-w-4xl mx-auto flex flex-col md:flex-row animate__animated animate__fadeIn animate__faster border rounded-md bg-white shadow-md p-4">
            <div class="md:w-1/2 p-4">
                <h2 class="text-3xl text-center text-[#68127f] font-semibold mb-2">Reset Password</h2>
                <p class="text-gray-600 text-center mb-6">Enter your email address to reset your password.</p>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="txtEmail">Email Address</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" placeholder="Enter your email" />
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email is required." CssClass="text-red-500" />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Invalid email format." ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b" CssClass="text-red-500" />
                </div>
                <asp:Button ID="btnSubmit" runat="server" CssClass="w-full bg-black text-white py-3 px-6 rounded-md transition duration-300 transform hover:scale-105 hover:bg-[#3e004f] focus:outline-none focus:ring focus:border-blue-300" Text="Submit" OnClick="btnSubmit_Click" />
            </div>
            <div class="md:w-1/2 p-4 flex justify-center items-center">
                <img id="form-image" src="img/forgot.svg" class="mt-3" alt="img" />
            </div>
        </form>
    </div>
</asp:Content>
