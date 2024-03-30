<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="User_Side.Registration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Enter Name :
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>

    
    </div>
    <p>
        Enter&nbsp; Email :
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
    </p>
    <p>
        Enter Contact No :
        <asp:TextBox ID="txtCno" runat="server"></asp:TextBox>
    </p>
    <p>
        Enter Password :
        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="btnRegistration" runat="server" Text="Register" 
            onclick="btnRegistration_Click" />
    </p>
    </form>
</body>
</html>
