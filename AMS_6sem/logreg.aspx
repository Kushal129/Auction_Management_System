<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logreg.aspx.cs" Inherits="AMS_6sem.logreg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Style.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
    <script src="toasterScript.js"></script>
    <style>
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideInRight {
            from {
                opacity: 0;
                transform: translateX(10px);
            }

            to {
                opacity: 1;
                transform: translateX(0);
            }
        }
    </style>
    <title>AMS | Authentication Page</title>
</head>
<body class="bg-gray-100">
    <div class="toaster-alert" id="toaster"></div>
    <div class="container mx-auto flex justify-center items-center h-screen">
        <form id="mainForm" runat="server" class="max-w-4xl mx-auto flex animate__animated animate__fadeIn animate__faster border rounded-md bg-white shadow-md">
            <div class="w-full md:w-1/2 p-8">
                <!-- Login Form -->
                <div id="loginForm" class="mb-8 p-6">
                    <h2 class="text-3xl font-semibold mb-4 text-center">Login</h2>
                    <div class="mb-4">
                        <label for="txtEmail" class="block text-sm font-medium text-gray-600">Email:</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="mt-1 p-2 w-full border rounded-md" placeholder="Enter your email address"></asp:TextBox>
                    </div>
                    <div class="mb-4">
                        <label for="txtPassword" class="block text-sm font-medium text-gray-600">Password:</label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="mt-1 p-2 w-full border rounded-md" placeholder="Enter your password"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="w-full bg-black text-white py-3 px-6 rounded-md transition duration-300 transform hover:scale-105  hover:bg-[#3e004f] focus:outline-none focus:ring focus:border-blue-300" OnClick="btnLogin_Click" />
                    <p class="mt-4 text-center">Don't have an account? <span class="text-[#a43ac0]"><a href="#" id="toggle-register-form">Register here</a></span> </p>
                </div>
                <!-- Register From -->
                <div id="userForm" class="animate__animated animate__fadeIn animate__faster hidden mb-8 p-6">
                    <h2 class="text-3xl font-semibold mb-4 text-center">Register</h2>
                    <div class="mb-4">
                        <label for="txtFullName" class="block text-sm font-medium text-gray-600">Full Name:</label>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="mt-1 p-2 w-full border rounded-md" placeholder="Enter your full name"></asp:TextBox>
                    </div>
                    <div class="mb-4">
                        <label for="txtMobileNumber" class="block text-sm font-medium text-gray-600">Mobile Number:</label>
                        <asp:TextBox ID="txtMobileNumber" runat="server" CssClass="mt-1 p-2 w-full border rounded-md" placeholder="Enter your mobile number"></asp:TextBox>
                    </div>
                    <div class="mb-4">
                        <label for="txtEmail1" class="block text-sm font-medium text-gray-600">Email:</label>
                        <asp:TextBox ID="Email_R" runat="server" CssClass="mt-1 p-2 w-full border rounded-md" placeholder="Enter your email address"></asp:TextBox>
                    </div>
                    <div class="mb-4">
                        <label for="txtPassword1" class="block text-sm font-medium text-gray-600">Password:</label>
                        <asp:TextBox ID="Password_R" runat="server" TextMode="Password" CssClass="mt-1 p-2 w-full border rounded-md" placeholder="Enter your password"></asp:TextBox>
                    </div>
                    <asp:Button ID="registerButton" runat="server" Text="Register" CssClass="w-full bg-black text-white py-2 px-4 rounded-md transition duration-300 transform hover:scale-105 hover:bg-[#3e004f] focus:outline-none focus:ring focus:border-purple-300" OnClick="registerButton_Click" />
                    <p class="mt-4 text-center">Already have an account? <span class="text-[#a43ac0]"><a href="#" id="toggle-login-form">Login here</a></span></p>
                    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                </div>
            </div>


            <div class="w-1/2 p-8">
                <h2 class="text-3xl text-center font-semibold mb-4">Welcome to AMS</h2>
                <img id="form-image" src="img/login.svg" class="mt-3" alt="img" />
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
    <script>
        window.onload = function () {
            const toggleLoginButton = document.getElementById('toggle-login-form');
            const toggleRegisterButton = document.getElementById('toggle-register-form');
            const loginForm = document.getElementById('loginForm');
            const registerForm = document.getElementById('userForm');
            const formImage = document.getElementById('form-image');

            toggleLoginButton.addEventListener('click', function () {
                loginForm.classList.remove('hidden');
                registerForm.classList.add('hidden');
                formImage.src = 'img/login.svg';
            });

            toggleRegisterButton.addEventListener('click', function () {
                registerForm.classList.remove('hidden');
                loginForm.classList.add('hidden');
                formImage.src = 'img/regi.svg';
            });
        };
    </script>
</body>
</html>
