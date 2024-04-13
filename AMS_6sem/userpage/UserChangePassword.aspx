<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="~/userpage/UserChangePassword.aspx.cs" Inherits="User_Side.ChangePassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
            background-color: #4caf50;
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
    </style>
    
</head>
<body class='mm'>
    <div class="container">
    <form id="form1" runat="server">
    
   <div>
    
        Enter Old Password :
        <asp:TextBox ID="txtOpassword" runat="server"></asp:TextBox>
    
    </div>
    <p>
        Enter New Password:<asp:TextBox ID="txtNpassword" runat="server"></asp:TextBox>
    </p>
     <p>
        Enter Confrim Password:<asp:TextBox ID="txtCpassword" runat="server"></asp:TextBox>
    </p>
    <asp:Button ID="btnPassword" runat="server" Text="Change Password" 
        onclick="btnPassword_Click1" />
        <p>
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    </p>
    </form>
</body>
</html>
