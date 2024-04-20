<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePassword.aspx.cs" Inherits="AMS_6sem.UpdatePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Password</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/zxcvbn/4.4.2/zxcvbn.js"></script>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>

    <link href="Style.css" rel="stylesheet" />
    <script src="/toasterScript.js"></script>
</head>
<body class="bg-purple-100">
    <div class="toaster-alert" id="toaster"></div>
    <div class="container mx-auto flex justify-center items-center h-screen">
        <form id="mainForm" runat="server" class="max-w-4xl mx-auto flex flex-col md:flex-row animate__animated animate__fadeIn animate__faster border rounded-md bg-white shadow-md p-4">
            <div class="md:w-1/2 p-4">
                <h2 class="text-3xl text-center text-[#68127f] font-semibold mb-2">Update Password</h2>
                <p class="text-gray-600 text-center mb-6">Enter Your New Password.</p>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="txtNewPassword">New Password</label>
                    <div class="relative">
                        <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" placeholder="Enter your New Password" oninput="checkPasswordStrength(this.value)" />
                        <span class="absolute inset-y-0 right-0 pr-3 flex items-center">
                            <img onclick="togglePassword('txtNewPassword', 'eyeIcon', 'eyeSlashIcon')" class="eyeIcon h-5 w-5 text-gray-400 cursor-pointer" src="img/showp.png" alt="Toggle Password" />
                            <img style="display: none;" class="eyeSlashIcon h-5 w-5 text-gray-400 cursor-pointer" src="img/hidep.png" alt="Toggle Password" />
                        </span>
                    </div>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtNewPassword" ErrorMessage="Password must be at least 6 characters long." ValidationExpression="^.{6,}$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewPassword" ErrorMessage="Please enter a new password." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtNewPassword"
                        ErrorMessage="Password must be between 6 to 15 characters and contain at least one uppercase letter, one special character, and one number."
                        ValidationExpression="^(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{6,15}$"
                        CssClass="text-red-500" Display="Dynamic">
                    </asp:RegularExpressionValidator>
                </div>
                <span id="passwordStrength" class="text-sm"></span>
                <asp:Button ID="btnSubmit" runat="server" CssClass="w-full bg-black text-white py-2 px-4 rounded-md transition duration-300 transform hover:scale-105 hover:bg-[#3e004f] focus:outline-none focus:ring focus:border-purple-300" Text="Update Password" OnClick="btnUpdate_Click" />
                 <p class="mt-2 text-center"><span class="text-[#a43ac0]"><a href="index.aspx" id="toggle-reset-password-form">back to home page?</a></span></p>
            </div>
            <div class="md:w-1/2 p-4 flex justify-center items-center">
                <img id="form-image" src="img/updatepass.svg" class="mt-3 animate__animated animate__fadeInRight" alt="img" />
            </div>
        </form>
    </div>

    <script>
        function checkPasswordStrength(password) {
            var result = zxcvbn(password);

            var strengthText = "Password Strength: " + result.score + " out of 4 (Score 0-4)";
            document.getElementById("passwordStrength").innerText = strengthText;

            var strengthSpan = document.getElementById("passwordStrength");

            strengthSpan.style.color = "";
            strengthSpan.style.fontWeight = "";

            if (result.score === 0 || result.score === 1) {
                strengthSpan.style.color = "#ff4d4d";
                strengthSpan.style.fontWeight = "bold";
            } else if (result.score === 2 || result.score === 3) {
                strengthSpan.style.color = "#f5c000";
                strengthSpan.style.fontWeight = "bold";
            } else if (result.score === 4) {
                strengthSpan.style.color = "#28a745";
                strengthSpan.style.fontWeight = "bold";
            }
        }
    </script>

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
</body>
</html>
