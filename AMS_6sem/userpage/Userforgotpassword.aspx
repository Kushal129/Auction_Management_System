<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="~/userpage/Userforgotpassword.aspx.cs" Inherits="User_Side.Userforgotpassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Forgot Password</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Forgot Password</h2>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter your email"></asp:TextBox>
            <asp:Button ID="btnSendOTP" runat="server" Text="Send OTP" OnClick="btnSendOTP_Click" />
            <br />
            <asp:TextBox ID="txtOTP" runat="server" placeholder="Enter OTP"></asp:TextBox>
            <asp:Button ID="btnVerifyOTP" runat="server" Text="Verify OTP" OnClick="btnVerifyOTP_Click" />
        </div>
    </form>
</body>
</html>