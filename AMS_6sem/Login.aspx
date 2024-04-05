<%@ Page Title="AMS | Login Page" Language="C#" MasterPageFile="~/navfooter.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AMS_6sem.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="Style.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="shortcut icon"
        href="https://static.vecteezy.com/system/resources/previews/007/258/573/original/ams-letter-logo-design-on-white-background-ams-creative-initials-letter-logo-concept-ams-letter-design-vector.jpg"
        type="image/x-icon" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/zxcvbn/4.4.2/zxcvbn.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
    <script src="toasterScript.js"></script>
    <a href="index.aspx" class="nav-link">Home<span class="active-underline"></span></a>
    <a href="Registration.aspx" class="nav-link">Registration<span class="active-underline"></span></a>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
<div class="toaster-alert" id="toaster"></div>
    <div class="container mx-auto flex justify-center items-center h-screen">
        <form id="LoginFormUser" runat="server" class="max-w-4xl mx-auto flex animate__animated animate__fadeIn animate__faster border rounded-md bg-white shadow-md">
            <div class="w-full md:w-1/2 p-8 bg-purple-100">
                <div id="loginForm" runat="server" class="mb-8 p-6">
                    <h2 class="text-4xl font-semibold text-[#68127f] mb-4 text-center">Login</h2>

                    <div class="mb-4">
                        <label for="txtEmail" class="block text-sm font-medium text-gray-600">Email:</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="mt-1 p-2 w-full border rounded-md" placeholder="Enter your email address"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required." CssClass="text-red-500" Display="Dynamic" ValidationGroup="RegisterGroup"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter a valid email address." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="text-red-500" Display="Dynamic" ValidationGroup="RegisterGroup"></asp:RegularExpressionValidator>
                    </div>

                    <div class="mb-4">
                        <label for="txtPassword" class="block text-sm font-medium text-gray-600">Password:</label>
                        <div class="relative">
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="mt-1 p-2 w-full border rounded-md" placeholder="Enter your password"></asp:TextBox>
                            <span class="absolute inset-y-0 right-0 pr-3 flex items-center">
                                <img onclick="togglePassword('txtPassword', 'eyeIcon', 'eyeSlashIcon')" class="eyeIcon h-5 w-5 text-gray-400 cursor-pointer" src="img/showp.png" alt="Toggle Password" />
                                <img style="display: none;" class="eyeSlashIcon h-5 w-5 text-gray-400 cursor-pointer" src="img/hidep.png" alt="Toggle Password" />
                            </span>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required." CssClass="text-red-500" Display="Dynamic" ValidationGroup="RegisterGroup"></asp:RequiredFieldValidator>
                    </div>

                    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="w-full bg-black text-white py-3 px-6 rounded-md transition duration-300 transform hover:scale-105  hover:bg-[#3e004f] focus:outline-none focus:ring focus:border-purple-300" ValidationGroup="RegisterGroup"  OnClick="btnLogin_Click"  />
                    
                    <p class="mt-2 text-center"><span class="text-[#a43ac0]"><a href="Forgotpass.aspx" id="toggle-reset-password-form">forgot Password?</a></span></p>
                </div>
            </div>
            <div class="w-full md:w-1/2 p-8">
                <h2 class="text-3xl text-center font-semibold text-center mb-4">Welcome to AMS</h2>
                <img id="form-image" src="img/login.svg" class="mt-3 items-center" alt="img" />
            </div>
        </form>
    </div>

    <script>
        function togglePassword(inputId, eyeIconClass, eyeSlashIconClass) {
            var passwordInput = document.getElementById(inputId);
            var eyeIcon = document.querySelector("." + eyeIconClass);
            var eyeSlashIcon = document.querySelector("." + eyeSlashIconClass);

            if (passwordInput.type === "password") {
                passwordInput.type = "text";
                eyeIcon.style.display = "none";
                eyeSlashIcon.style.display = "inline";
                setTimeout(function () {
                    passwordInput.type = "password";
                    eyeIcon.style.display = "inline";
                    eyeSlashIcon.style.display = "none";
                }, 2000);
            } else {
                passwordInput.type = "password";
                eyeIcon.style.display = "inline";
                eyeSlashIcon.style.display = "none";
            }
        }
    </script>
</asp:Content>
