<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_add_product.aspx.cs" Inherits="User_Side.Admin_add_product" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Create Auction</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="mx-auto max-w-md">
            <h2>Create Auction</h2>

            <div>
                <label for="productName">Product Name:</label>
                <asp:TextBox ID="productName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="productNameValidator" runat="server" ControlToValidate="productName" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>

            <div>
                <label for="file_input">Upload File:</label>
                <asp:FileUpload ID="file_input" runat="server" />
            </div>

            <div>
                <label for="productPriceInterval">Price Interval:</label>
                <asp:TextBox ID="productPriceInterval" runat="server" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="productPriceIntervalValidator" runat="server" ControlToValidate="productPriceInterval" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>

            <div>
                <label for="minPrice">Minimum Price:</label>
                <asp:TextBox ID="minPrice" runat="server" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="minPriceValidator" runat="server" ControlToValidate="minPrice" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>

            <div>
                <label for="auctionStartTime">Auction Start Time:</label>
                <asp:TextBox ID="auctionStartTime" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
                <asp:RequiredFieldValidator ID="auctionStartTimeValidator" runat="server" ControlToValidate="auctionStartTime" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>

            <div>
                <label for="auctionEndTime">Auction End Time:</label>
                <asp:TextBox ID="auctionEndTime" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
                <asp:RequiredFieldValidator ID="auctionEndTimeValidator" runat="server" ControlToValidate="auctionEndTime" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>

            <div>
                <label for="productDescription">Product Description:</label>
                <asp:TextBox ID="productDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="productDescriptionValidator" runat="server" ControlToValidate="productDescription" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>

            <asp:Button ID="btnCreateAuction" runat="server" Text="Create Auction" OnClick="btnCreateAuction_Click" />
        </div>
    </form>
</body>
</html>
