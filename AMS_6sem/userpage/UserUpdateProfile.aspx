<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserUpdateProfile.aspx.cs" Inherits="User_Side.UpdateProfile" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Profile</title>
    <script src="../toasterScript.js"></script>
    <link href="../Style.css" />
<style>
    .mm
    {
        background-color : #f3e8ff;
    }
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 400px;
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
    label {
        font-weight: bold;
        display: block;
        margin-bottom: 5px;
    }
    input[type="text"], input[type="password"] {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    input[type="submit"] {
        background-color: Purple;
        color: #fff;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
        border-radius: 4px;
        font-size: 16px;
    }
    input[type="submit"]:hover {
        background-color: #45a049;
    }
    .profile-image {
        display: block;
        margin: 0 auto; 
        max-width: 50%; 
        height: auto; 
    }
</style>
</head>
<body class='mm'>
    <div class="container">
        <h2>Update Profile</h2>
        <form id="form1" runat="server" enctype="multipart/form-data">
            <asp:Image ID="imgProfile" runat="server" CssClass="profile-image" />
            <asp:FileUpload ID="FileUploadControl" runat="server" />

            <label for="txtName">Enter Name:</label>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        
            <label for="txtEmail">Enter Email:</label>
            <asp:TextBox ID="txtEmail" runat="server" ReadOnly="True"></asp:TextBox>
        
            <label for="txtCno">Enter Contact No:</label>
            <asp:TextBox ID="txtCno" runat="server"></asp:TextBox>
        
            <asp:Button ID="btnUpdate" runat="server" Text="Update Profile" 
                onclick="btnUpdate_Click" />

            <p class="mt-2 text-center"><span class="text-[#a43ac0]"><a href="UserIndex.aspx" id="toggle-reset-password-form">back to home ?</a></span></p>
        </form>
    </div>
</body>
</html>
<script type="text/javascript">
    function preventBack() {
        window.history.forward();
    }
    setTimeout("preventBack()", 0);
    window.onunload = function () { null };
</script>
