<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotpass.aspx.cs" Inherits="AMS_6sem.forgotpass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
    <title>AMS | Forgot Password</title>
    <script src="toasterScript.js"></script>
</head>
<body class="bg-gray-100">
    <div class="toaster-alert" id="toaster"></div>
    <div class="container mx-auto flex justify-center items-center h-screen">
        <form id="mainForm" runat="server" class="max-w-4xl mx-auto flex animate__animated animate__fadeIn animate__faster border rounded-md bg-white shadow-md">
            <div class="w-full md:w-1/2 p-8">
                <div id="resetPasswordForm" runat="server" class="animate__animated animate__fadeIn animate__faster mb-8 p-6">
                    <h2 class="text-3xl font-semibold mb-4 text-center">Reset Password</h2>
                    <div class="mb-4">
                        <label for="txtResetEmail" class="block text-sm font-medium text-gray-600">Email:</label>
                        <asp:TextBox ID="txtResetEmail" runat="server" CssClass="mt-1 p-2 w-full border rounded-md" placeholder="Enter your email address"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnResetPassword" runat="server" Text="Reset Password" CssClass="w-full bg-black text-white py-3 px-6 rounded-md transition duration-300 transform hover:scale-105  hover:bg-[#3e004f] focus:outline-none focus:ring focus:border-blue-300" OnClick="btnResetPassword_Click" />

                    <asp:Label ID="lblForgotMessage" runat="server" CssClass="text-red-500" Visible="false"></asp:Label>

                    <p class="mt-4 text-center">Remembered your password? <span class="text-[#a43ac0]"><a href="#" id="toggle-login-form">Login here</a></span></p>
                </div>
            </div>
            <div class="w-1/2 p-8">
                <h2 class="text-3xl text-center font-semibold mb-4">Welcome to AMS</h2>
                <img id="form-image" src="img/forgot.svg" class="mt-3" alt="img" />
            </div>
        </form>
    </div>
</body>
</html>
