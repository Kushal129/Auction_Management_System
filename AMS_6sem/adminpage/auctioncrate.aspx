<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="auctioncrate.aspx.cs" Inherits="AMS_6sem.adminpage.auctioncrate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>AMS | Create Auction</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="toaster-alert" id="toaster"></div>
    <form runat="server" id="form1" enctype="multipart/form-data">
        <div class="mx-auto max-w-md">
            <asp:HiddenField ID="currentDateTime" runat="server" />
            <h2 class="text-4xl font-semibold mb-4 text-center">Create Auction</h2>

            <div class="bg-purple-200 shadow-md rounded p-8 mb-4">
                <div class="mb-4">
                    <label for="productName" class="block text-gray-600 text-sm font-bold mb-2">Product Name</label>
                    <asp:TextBox ID="productName" runat="server" CssClass="w-full border rounded-md p-2" Required="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Product name is required" ControlToValidate="productName" Display="Dynamic" CssClass="text-red-500"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Product name can only contain numbers and characters" ControlToValidate="productName" Display="Dynamic" CssClass="text-red-500" ValidationExpression="^[a-zA-Z0-9\s]+$"></asp:RegularExpressionValidator>
                </div>

                <div class="mb-4">
                    <label for="file_input" class="block text-gray-600 text-sm font-bold mb-2">Upload file</label>
                    <asp:FileUpload ID="file_input" runat="server" CssClass="block w-full text-sm text-gray-500 file:mr-4 file:py-2 file:px-4 file:rounded-full file:border-0 file:text-sm file:font-semibold file:bg-purple-50 file:text-purple-700 hover:file:bg-purple-100" onchange="displayFileName()" />
                    <p id="file-name-display" class="mt-2 text-xs text-gray-500 dark:text-gray-300"></p>
                </div>

                <div class="grid grid-cols-2 gap-4">
                    <div class="mb-4">
                        <label for="productPriceInterval" class="block text-gray-600 text-sm font-bold mb-2">Price Interval</label>
                        <asp:TextBox ID="productPriceInterval" runat="server" CssClass="w-full border rounded-md p-2" Required="true" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Price interval is required" ControlToValidate="productPriceInterval" Display="Dynamic" CssClass="text-red-500"></asp:RequiredFieldValidator>

                    </div>

                    <div class="mb-4">
                        <label for="minPrice" class="block text-gray-600 text-sm font-bold mb-2">Minimum Price</label>
                        <asp:TextBox ID="minPrice" runat="server" CssClass="w-full border rounded-md p-2" Required="true" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Minimum price is required" ControlToValidate="minPrice" Display="Dynamic" CssClass="text-red-500"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="mb-4">
                    <label for="auctionStartTime" class="block text-gray-600 text-sm font-bold mb-2">Auction Start Time</label>
                    <asp:TextBox ID="auctionStartTime" runat="server" CssClass="w-full border rounded-md p-2" Required="true" TextMode="DateTimeLocal"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Auction start time is required" ControlToValidate="auctionStartTime" Display="Dynamic" CssClass="text-red-500"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Auction start time must be greater than current date and time" ControlToValidate="auctionStartTime" Display="Dynamic" CssClass="text-red-500" ClientValidationFunction="compareDates"></asp:CustomValidator>
                </div>

                <div class="mb-4">
                    <label for="auctionEndTime" class="block text-gray-600 text-sm font-bold mb-2">Auction End Time</label>
                    <asp:TextBox ID="auctionEndTime" runat="server" CssClass="w-full border rounded-md p-2" Required="true" TextMode="DateTimeLocal"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Auction end time is required" ControlToValidate="auctionEndTime" Display="Dynamic" CssClass="text-red-500"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="Auction end time must be greater than current date and time" ControlToValidate="auctionEndTime" Display="Dynamic" CssClass="text-red-500" ClientValidationFunction="validateAuctionEndTime"></asp:CustomValidator>
                </div>

                <div class="mb-4">
                    <label for="productDescription" class="block text-gray-600 text-sm font-bold mb-2">Product Description</label>
                    <asp:TextBox ID="productDescription" runat="server" CssClass="w-full border rounded-md p-2" Required="true" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Product description is required" ControlToValidate="productDescription" Display="Dynamic" CssClass="text-red-500"></asp:RequiredFieldValidator>
                </div>

                <asp:Button ID="btnCreateAuction" runat="server" Text="Create Auction" CssClass="w-full bg-black text-white p-2 rounded-md transition duration-300 transform hover:scale-105 hover:bg-[#3e004f] focus:outline-none focus:ring" OnClick="btnCreateAuction_Click" />
            </div>
        </div>
    </form>
    <script>
        var now = new Date();
        var offset = now.getTimezoneOffset();
        var adjustedTime = new Date(now.getTime() - (offset * 60 * 1000));
        document.getElementById('<%= auctionStartTime.ClientID %>').value = adjustedTime.toISOString().slice(0, 16);

        function compareDates(source, arguments) {
            var inputDate = new Date(arguments.Value);
            var currentDate = new Date();
            arguments.IsValid = inputDate > currentDate;
        }

        function validateAuctionEndTime(source, arguments) {
            var inputDate = new Date(arguments.Value);
            var currentDate = new Date();
            arguments.IsValid = inputDate > currentDate;
        }
    </script>

</asp:Content>
