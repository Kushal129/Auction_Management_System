<%@ Page Title="AMS | Update Profile Admin" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="adminprofile.aspx.cs" Inherits="AMS_6sem.adminpage.adminprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>AMS | Update Profile Admin</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="toaster-alert" id="toaster"></div>
    <div class="flex justify-center">
        <div class="w-full max-w-md">
            <h1 class="text-4xl text-center font-semibold mb-6">Profile Update</h1>
            <form runat="server" class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4" onsubmit="return validateForm()">
                <div class="mb-4">
                    <label for="txtFullName" class="block text-[#68127f] font-medium text-gray-600">Full Name:</label>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="mt-1 p-2 w-full border rounded-md" placeholder="Enter your full name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName" ErrorMessage="Full Name is required." CssClass="text-red-500" Display="Dynamic" ValidationGroup="UpdateGroup"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revFullName" runat="server" ControlToValidate="txtFullName" ErrorMessage="Full Name must only contain letters." ValidationExpression="^[a-zA-Z\s]+$" CssClass="text-red-500" Display="Dynamic" ValidationGroup="UpdateGroup"></asp:RegularExpressionValidator>
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

                <div class="mb-4">
                    <label class="block text-sm font-medium text-gray-600">Change Password:</label>
                    <asp:RadioButtonList ID="rbChangePassword" runat="server" AutoPostBack="true" OnSelectedIndexChanged="rbChangePassword_SelectedIndexChanged">
                        <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                        <asp:ListItem Text="No" Value="No" Selected="True"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>

                <div id="passwordFields" runat="server" style="display: none">
                    <div class="mb-4">
                        <label for="txtPassword" class="block text-[#68127f] font-medium text-gray-600">New Password:</label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="mt-1 p-2 w-full border rounded-md" placeholder="Enter new password"></asp:TextBox>
                        <div id="passwordLengthError" style="color: red; display: none;">Password must be at least 8 characters long.</div>
                    </div>
                    <div class="mb-4">
                        <label for="txtConfirmPassword" class="block text-[#68127f] font-medium text-gray-600">Confirm Password:</label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="mt-1 p-2 w-full border rounded-md" placeholder="Confirm new password"></asp:TextBox>
                        <div id="passwordMatchError" style="color: red; display: none;">Passwords do not match.</div>
                    </div>
                </div>

                <asp:Button ID="updateButton" runat="server" Text="Update" CssClass="w-full bg-black text-white py-2 px-4 rounded-md transition duration-300 transform hover:scale-105 hover:bg-[#3e004f] focus:outline-none focus:ring focus:border-purple-300" OnClick="updateButton_Click" ValidationGroup="UpdateGroup" />
            </form>

        </div>
    </div>

    <script type="text/javascript">
        var initialFullName = "<%= txtFullName.Text %>";
        var initialMobileNumber = "<%= txtMobileNumber.Text %>";
        var initialPassword = "";
        var initialConfirmPassword = "";

        window.onload = function () {
            var passwordFields = document.getElementById('passwordFields');
            if (passwordFields.style.display !== 'none') {
                initialPassword = document.getElementById('<%= txtPassword.ClientID %>').value;
                initialConfirmPassword = document.getElementById('<%= txtConfirmPassword.ClientID %>').value;
            }
        };

        function validateForm() {
            var rbChangePassword = document.getElementById('<%= rbChangePassword.ClientID %>');
            var txtFullName = document.getElementById('<%= txtFullName.ClientID %>').value;
            var txtMobileNumber = document.getElementById('<%= txtMobileNumber.ClientID %>').value;
            var txtPassword = document.getElementById('<%= txtPassword.ClientID %>').value;
            var txtConfirmPassword = document.getElementById('<%= txtConfirmPassword.ClientID %>').value;

            if (txtFullName === initialFullName && txtMobileNumber === initialMobileNumber && txtPassword === initialPassword && txtConfirmPassword === initialConfirmPassword) {
                document.getElementById('toaster').innerText = "No changes detected.";
                return false; 
            }

            return true; 
        }
    </script>
</asp:Content>
