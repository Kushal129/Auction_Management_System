<%@ Page Title="AMS | Registration Page" Language="C#" MasterPageFile="~/navfooter.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="AMS_6sem.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <a href="index.aspx" class="nav-link">Home<span class="active-underline"></span></a>
    <a href="Login.aspx" class="nav-link">Login<span class="active-underline"></span></a>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="toaster-alert" id="toaster"></div>
    <div class="container mx-auto flex justify-center items-center h-screen mt-5 mb-5">
        <form id="mainForm" runat="server" class="max-w-4xl mx-auto flex animate__animated animate__fadeIn animate__faster border rounded-md bg-white shadow-md">
            <div class="w-full md:w-1/2 p-8 bg-purple-100">
                <div id="RegistrationForm" runat="server" class="mb-8 p-6">
                    <h2 class="text-4xl font-semibold mb-4 text-[#68127f] text-center">Register</h2>
                    <div class="mb-4">
                        <label for="txtFullName" class="block text-[#68127f] font-medium text-gray-600">Full Name:</label>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="mt-1 p-2 w-full border rounded-md" placeholder="Enter your full name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName" ErrorMessage="Full Name is required." CssClass="text-red-500" Display="Dynamic" ValidationGroup="LoginGroup"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revFullName" runat="server" ControlToValidate="txtFullName" ErrorMessage="Only charecters allow in Full Name." ValidationExpression="^[a-zA-Z\s]*$" CssClass="text-red-500" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>

                    <div class="mb-4">
                        <label for="txtMobileNumber" class="block text-sm font-medium text-gray-600">Mobile Number:</label>
                        <asp:TextBox ID="txtMobileNumber" runat="server" CssClass="mt-1 p-2 w-full border rounded-md" MaxLength="10" placeholder="Enter your mobile number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvMobileNumber" runat="server" ControlToValidate="txtMobileNumber" ErrorMessage="Mobile Number is required." CssClass="text-red-500" Display="Dynamic" ValidationGroup="LoginGroup"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revMobileNumber" runat="server" ControlToValidate="txtMobileNumber" ErrorMessage="Enter a valid Indian mobile number." ValidationExpression="^[6-9]\d{9}$" CssClass="text-red-500" Display="Dynamic" ValidationGroup="LoginGroup"></asp:RegularExpressionValidator>
                        <asp:CustomValidator ID="cvMobileNumber" runat="server" ControlToValidate="txtMobileNumber" ErrorMessage="Enter a valid 10-digit mobile number." OnServerValidate="ValidateMobileNumber" CssClass="text-red-500" Display="Dynamic" ValidationGroup="LoginGroup"></asp:CustomValidator>
                    </div>

                    <div class="mb-4">
                        <label for="txtEmail1" class="block text-sm font-medium text-gray-600">Email:</label>
                        <asp:TextBox ID="Email_R" runat="server" CssClass="mt-1 p-2 w-full border rounded-md" placeholder="Enter your email address"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail_R" runat="server" ControlToValidate="Email_R" ErrorMessage="Email is required." CssClass="text-red-500" Display="Dynamic" ValidationGroup="LoginGroup"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revEmail_R" runat="server" ControlToValidate="Email_R" ErrorMessage="Enter a valid email address." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="text-red-500" Display="Dynamic" ValidationGroup="LoginGroup"></asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email_R" ErrorMessage="least one alphabetical character (a-z)" ValidationExpression="[a-zA-Z0-9]+[a-zA-Z]+[a-zA-Z0-9._%+-]*@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" CssClass="text-red-500" Display="Dynamic" ValidationGroup="LoginGroup"></asp:RegularExpressionValidator>
                    </div>

                    <div class="mb-4">
                        <label for="fileUserImage" class="block text-sm font-medium text-gray-600">User Image:</label>
                        <asp:FileUpload ID="fileUserImage" runat="server" CssClass="block m-1 w-full text-sm text-gray-500 file:mr-4 file:py-2 file:px-4 file:rounded-full file:border-0 file:text-sm file:font-semibold file:bg-purple-50 file:text-purple-700 hover:file:bg-purple-200" accept="image/jpeg, image/jpg, image/png" />
                        <p class="text-sm text-gray-400">Upload an image (JPEG, JPG, PNG) with a maximum size of 200 KB.</p>
                        <asp:RequiredFieldValidator ID="rfvFileUserImage" runat="server" ControlToValidate="fileUserImage" ErrorMessage="Please select an image file." CssClass="text-red-500" Display="Dynamic" ValidationGroup="LoginGroup"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="cvFileUserImageSize" runat="server" ControlToValidate="fileUserImage" ErrorMessage="Please upload an image with a maximum size of 200 KB." OnServerValidate="ValidateUserImageSize" ClientValidationFunction="validateFileSize_ClientValidate" CssClass="text-red-500" Display="Dynamic" ValidationGroup="LoginGroup"></asp:CustomValidator>
                        <asp:CustomValidator ID="cvFileUserImageType" runat="server" ControlToValidate="fileUserImage" ErrorMessage="Only JPG, JPEG, and PNG files are allowed." OnServerValidate="ValidateUserImageType" ClientValidationFunction="validateFileType_ClientValidate" CssClass="text-red-500" Display="Dynamic" ValidationGroup="LoginGroup"></asp:CustomValidator>
                    </div>

                    <div class="mb-4">
                        <label for="txtPassword1" class="block text-sm font-medium text-gray-600">Password:</label>
                        <div class="relative">
                            <asp:TextBox ID="Password_R" runat="server" TextMode="Password" CssClass="Password_R mt-1 p-2 w-full border rounded-md pr-10" placeholder="Enter your password" oninput="checkPasswordStrength(this.value)"></asp:TextBox>
                            <span class="absolute inset-y-0 right-0 pr-3 flex items-center">
                                <img class="eyeOpen h-5 w-5 text-gray-400 cursor-pointer" src="img/showp.png" alt="Show Password" />
                                <img style="display: none;" class="eyeClose h-5 w-5 text-gray-400 cursor-pointer" src="img/hidep.png" alt="Hide Password" />
                            </span>
                        </div>

                        <asp:RequiredFieldValidator ID="rfvPassword_R" runat="server" ControlToValidate="Password_R" ErrorMessage="Password is required." CssClass="text-red-500" Display="Dynamic" ValidationGroup="LoginGroup"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPassword_R" runat="server" ControlToValidate="Password_R"
                            ErrorMessage="Password must be between 6 to 15 characters and contain at least one uppercase letter, one special character, and one number."
                            ValidationExpression="^(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{6,15}$"
                            CssClass="text-red-500" Display="Dynamic" ValidationGroup="LoginGroup">
                        </asp:RegularExpressionValidator>
                        <br />
                        <span id="passwordStrength" class="text-sm"></span>
                    </div>


                    <asp:Button ID="registerButton" runat="server" Text="Register" CssClass="w-full bg-black text-white py-2 px-4 rounded-md transition duration-300 transform hover:scale-105 hover:bg-[#3e004f] focus:outline-none focus:ring focus:border-purple-300" OnClick="registerButton_Click" ValidationGroup="LoginGroup" />
                    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>

                </div>
            </div>
            <div class="w-full md:w-1/2 p-8">
                <h2 class="text-3xl text-center font-semibold text-center mb-4">Welcome to AMS</h2>
                <img id="form-image" src="img/regi.svg" class="mt-3 items-center" alt="img" />
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
            } else if (result.score === 2 || result.score === 3) {
                strengthSpan.style.color = "#f5c000";
            } else if (result.score === 4) {
                strengthSpan.style.color = "#28a745";
            }
        }
    </script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            function togglePasswordVisibility() {
                var passwordInput = document.getElementById("<%= Password_R.ClientID %>");
            var eyeOpenIcon = document.querySelector(".eyeOpen");
            var eyeCloseIcon = document.querySelector(".eyeClose");

            if (passwordInput.type === "password") {
                passwordInput.type = "text";
                eyeOpenIcon.style.display = "none";
                eyeCloseIcon.style.display = "block";
            } else {
                passwordInput.type = "password";
                eyeOpenIcon.style.display = "block";
                eyeCloseIcon.style.display = "none";
            }
        }

        document.querySelector(".eyeOpen").addEventListener("click", togglePasswordVisibility);
        document.querySelector(".eyeClose").addEventListener("click", togglePasswordVisibility);
    });
    </script>


    <script>
        function validateFileSize_ClientValidate(sender, args) {
            var fileInput = document.getElementById('<%= fileUserImage.ClientID %>');
            if (fileInput.files.length > 0) {
                var fileSize = fileInput.files[0].size;
                var maxSize = 200 * 1024;

                if (fileSize > maxSize) {
                    args.IsValid = false;
                    return;
                }
            }
            args.IsValid = true;
        }

        function validateFileType_ClientValidate(sender, args) {
            var fileInput = document.getElementById('<%= fileUserImage.ClientID %>');
            if (fileInput.files.length > 0) {
                var acceptedTypes = ['image/jpeg', 'image/jpg', 'image/png'];
                var fileType = fileInput.files[0].type;

                if (!acceptedTypes.includes(fileType)) {
                    args.IsValid = false;
                    return;
                }
            }
            args.IsValid = true;
        }
    </script>


</asp:Content>
