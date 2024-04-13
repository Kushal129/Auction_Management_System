<%@ Page Title="AMS | Update Profile Admin" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="adminprofile.aspx.cs" Inherits="AMS_6sem.adminpage.adminprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>AMS | Update Profile Admin</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="toaster-alert" id="toaster"></div>
    <div class="flex justify-center">
        <div class="w-full max-w-md">
            <h1 class="text-4xl text-center font-semibold mb-6">Profile Update</h1>
            <form runat="server" class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
                <div class="mb-4">
                    <label for="txtFullName" class="block text-[#68127f] font-medium text-gray-600">Full Name:</label>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="mt-1 p-2 w-full border rounded-md" placeholder="Enter your full name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName" ErrorMessage="Full Name is required." CssClass="text-red-500" Display="Dynamic" ValidationGroup="UpdateGroup"></asp:RequiredFieldValidator>
                </div>
                <div class="mb-4">
                    <label for="txtMobileNumber" class="block text-sm font-medium text-gray-600">Mobile Number:</label>
                    <asp:TextBox ID="txtMobileNumber" runat="server" CssClass="mt-1 p-2 w-full border rounded-md" MaxLength="10" placeholder="Enter your mobile number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvMobileNumber" runat="server" ControlToValidate="txtMobileNumber" ErrorMessage="Mobile Number is required." CssClass="text-red-500" Display="Dynamic" ValidationGroup="UpdateGroup"></asp:RequiredFieldValidator>
                </div>
                <div class="mb-4">
                    <label class="block text-sm font-medium text-gray-600">Email:</label>
                    <span id="userEmail" runat="server" class="text-gray-800"></span>
                </div>
                <asp:Button ID="updateButton" runat="server" Text="Update" CssClass="w-full bg-black text-white py-2 px-4 rounded-md transition duration-300 transform hover:scale-105 hover:bg-[#3e004f] focus:outline-none focus:ring focus:border-purple-300" OnClick="updateButton_Click" ValidationGroup="UpdateGroup" />
            </form>
        </div>
    </div>
</asp:Content>
