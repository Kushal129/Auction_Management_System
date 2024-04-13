<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="~/userpage/UserRegistration.aspx.cs" Inherits="User_Side.Registration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .mm {
            background-color: #f3e8ff;
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

        input[type="text"],
        input[type="password"] {
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

        .error-message {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }
    </style>
</head>
<body class='mm'>
    <div class="container">
        <form id="form1" runat="server">
            <div>
                <asp:Label ID="lblName" runat="server" Text="Enter Name:"></asp:Label>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                    ErrorMessage="Name is required." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revName" runat="server" ControlToValidate="txtName"
                    ValidationExpression="^[a-zA-Z ]+$" ErrorMessage="Only letters and spaces are allowed." 
                    Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
          <p>
                <asp:Label ID="lblEmail" runat="server" Text="Enter Email:"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="Email is required." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                    ValidationExpression="^(?!^[0-9]+@)[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" 
                    ErrorMessage="Invalid email format." Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
            </p>
            <p>
                <asp:Label ID="lblCno" runat="server" Text="Enter Contact No:"></asp:Label>
                <asp:TextBox ID="txtCno" runat="server" MaxLength="10"></asp:TextBox>
                
            </p>
            <p>
                <asp:Label ID="lblPassword" runat="server" Text="Enter Password:"></asp:Label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                    ErrorMessage="Password is required." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Label ID="lblGender" runat="server" Text="Gender:"></asp:Label>
                <asp:RadioButtonList ID="rblGender" runat="server">
                    <asp:ListItem Value="Male">Male</asp:ListItem>
                    <asp:ListItem Value="Female">Female</asp:ListItem>
                </asp:RadioButtonList>
            </p>
            <p>
                <asp:Label ID="lblAddress" runat="server" Text="Enter Address:"></asp:Label>
                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress"
                    ErrorMessage="Address is required." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Label ID="lblCity" runat="server" Text="City:"></asp:Label>
                <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                <asp:CustomValidator ID="cvCity" runat="server" ControlToValidate="txtCity"
                    ErrorMessage="City must be in Gujarat." Display="Dynamic" ForeColor="Red"
                    OnServerValidate="cvCity_ServerValidate"></asp:CustomValidator>
            </p>
                        <p>
                <asp:Button ID="btnRegistration" runat="server" Text="Register" 
                    onclick="btnRegistration_Click" />
            </p>
        </form>
    </div>
</body>
</html>
