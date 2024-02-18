<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="auctioncrate.aspx.cs" Inherits="AMS_6sem.adminpage.auctioncrate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <title>AMS | Crate Auction</title>
    <style>
        a {
            text-decoration: none !important;
        }
    </style>
</head>
<body class="font-sans bg-purple-100">
    <div class="flex items-center justify-center h-screen">
        <div class="w-full max-w-md">
            <h2 class="text-4xl font-semibold mb-4 text-center">Crate Auction</h2>
            <form id="form1" runat="server" enctype="multipart/form-data" class="bg-purple-200 shadow-md rounded px-8 pt-6 pb-8 mb-4">

                <div class="mb-4">
                    <label for="productName" class="block text-gray-600 text-sm font-bold mb-2">Product Name</label>
                    <asp:TextBox ID="productName" runat="server" CssClass="w-full border rounded-md p-2" Required="true"></asp:TextBox>
                </div>

                <div class="mb-4">
                    <label for="file_input" class="block text-gray-600 text-sm font-bold mb-2">Upload file</label>
                    <asp:FileUpload ID="file_input" runat="server" CssClass="w-full border rounded-md p-2" onchange="displayFileName()" />
                    <p id="file-name-display" class="mt-2 text-xs text-gray-500 dark:text-gray-300"></p>
                </div>

                <div class="grid grid-cols-2 gap-4">
                    <div class="mb-4">
                        <label for="productPriceInterval" class="block text-gray-600 text-sm font-bold mb-2">Price Interval</label>
                        <asp:TextBox ID="productPriceInterval" runat="server" CssClass="w-full border rounded-md p-2" Required="true" TextMode="Number"></asp:TextBox>
                    </div>

                    <div class="mb-4">
                        <label for="minPrice" class="block text-gray-600 text-sm font-bold mb-2">Minimum Price</label>
                        <asp:TextBox ID="minPrice" runat="server" CssClass="w-full border rounded-md p-2" Required="true" TextMode="Number"></asp:TextBox>
                    </div>
                </div>

                <div class="mb-4">
                    <label for="auctionStartTime" class="block text-gray-600 text-sm font-bold mb-2">Auction Start Time</label>
                    <asp:TextBox ID="auctionStartTime" runat="server" CssClass="w-full border rounded-md p-2" Required="true" TextMode="DateTimeLocal"></asp:TextBox>
                </div>

                <div class="mb-4">
                    <label for="productDescription" class="block text-gray-600 text-sm font-bold mb-2">Product Description</label>
                    <asp:TextBox ID="productDescription" runat="server" CssClass="w-full border rounded-md p-2" Required="true" TextMode="MultiLine"></asp:TextBox>
                </div>

                <asp:Button ID="btnCreateAuction" runat="server" Text="Create Auction" CssClass="w-full bg-black text-white p-2 rounded-md transition duration-300 transform hover:scale-105 hover:bg-[#3e004f] focus:outline-none focus:ring focus:border-green-300" OnClick="btnCreateAuction_Click" />

                <div class="mt-4">
                </div>
            </form>
            <%--<asp:Button ID="btnRedirectAdmin" runat="server" Text="Back to Admin Page" CssClass="w-full bg-gray-500 text-white p-2 rounded-md transition duration-300 transform hover:scale-105 hover:bg-gray-700 focus:outline-none focus:ring focus:border-green-300" PostBackUrl="~/admin.aspx" />--%>
        </div>
    </div>

    <script type="text/javascript">
        function displayFileName() {
            var input = document.getElementById('<%= file_input.ClientID %>');
            var display = document.getElementById('file-name-display');
            display.innerText = input.files[0].name;
        }
    </script>
</body>
</html>
