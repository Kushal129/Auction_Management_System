<%@ Page Title="" Language="C#" MasterPageFile="~/userpage/User.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="~/userpage/Product_descripiton.aspx.cs" Inherits="User_Side.Product_descripiton" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bg-white flex flex-wrap items-center justify-center m-5">
        <div class="w-full md:w-1/2 lg:w-1/2 p-4 flex items-center justify-center">
            <div class="flex flex-col items-start justify-center h-full">
                <div class="product-details ">
                    <asp:Label ID="lblHighlightedItem" runat="server" Text="Auction Item Detail" CssClass="text-xl text-purple-800 font-bold mb-2"></asp:Label>
                </div>
                <asp:Label ID="lblProductName" runat="server" Text="" CssClass="text-gray-900 mb-2"></asp:Label>
                <asp:Label ID="lblProductDescription" runat="server" Text="" CssClass="text-gray-800 mb-2"></asp:Label>
                <asp:Label ID="lblProductPriceInterval" runat="server" Text="" CssClass="text-gray-800 mb-2"></asp:Label>
                <asp:Label ID="lblMinPrice" runat="server" Text="" CssClass="text-gray-800 mb-2"></asp:Label>
                <asp:Label ID="lblAuctionStartTime" runat="server" Text="" CssClass="text-gray-800 mb-2"></asp:Label>
                <asp:Label ID="lblAuctionEndTime" runat="server" Text="" CssClass="text-gray-800 mb-2"></asp:Label>
                <asp:Label ID="lblLatestBidAmount" runat="server" Text="" CssClass="text-gray-800 mb-2"></asp:Label>

            </div>
        </div>
        <div class="w-full md:w-1/2 lg:w-1/2 p-4 flex items-center justify-center">
            <asp:Image ID="imgProduct" runat="server" AlternateText="Product Image" CssClass="w-64 h-64 rounded-lg" />
        </div>
    </div>


    <div class="max-w-7xl mx-auto mt-4 grid grid-cols-1 gap-4 sm:grid-cols-2">
        <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg">
            <div class="px-4 py-5 sm:px-6">
                <h3 class="text-lg font-bold leading-6 text-gray-900">Place Bid</h3>
            </div>
            <div class="border-t border-gray-200">
                <div class="p-4">
                    <asp:TextBox ID="txtBidAmount" runat="server" CssClass="bid-amount mb-2 p-2 border border-gray-300 rounded-md" placeholder="Enter bid amount"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="regexBidAmount" runat="server"
                        ControlToValidate="txtBidAmount"
                        ValidationExpression="^\d+$"
                        ErrorMessage="Please enter only numbers."
                        CssClass="text-red-500"
                        Display="Dynamic" />

                    <asp:Button ID="Button1" runat="server" Text="Place Bid" OnClick="btnPlaceBid_Click" CssClass="btn-place-bid bg-purple-500 hover:bg-purple-700 text-white font-bold py-2 px-4 rounded" />
                </div>
            </div>
        </div>
        <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg">
            <div class="px-4 py-5 sm:px-6">
                <h3 class="text-lg font-bold leading-6 text-gray-900">Calculator</h3>
            </div>
            <div class="border-t border-gray-200">
                <div class="p-4 justify-center">
                    <asp:TextBox ID="txtNum1" runat="server" CssClass="bid-amount mb-2 p-2 border border-gray-300 rounded-md" placeholder="Enter number 1" oninput="calculate()"></asp:TextBox>
                    <asp:TextBox ID="txtNum2" runat="server" CssClass="bid-amount mb-2 p-2 border border-gray-300 rounded-md" placeholder="Enter number 2" oninput="calculate()"></asp:TextBox>
                    <div class="mt-2 justify-center items-center">
                        <asp:Label ID="lblResult" Text="Reslut :" runat="server" CssClass="result-label"></asp:Label>
                        <button class="ml-2 px-3 py-1 bg-blue-500 text-white rounded-md" onclick="copyResult()">Copy</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="max-w-7xl mx-auto mt-4 p-4">
        <div class="error-message bg-white overflow-hidden shadow-xl sm:rounded-lg  text-center">
            <asp:Label ID="lblMessage" ForeColor="Red" runat="server" CssClass="" Text=""></asp:Label>
            <asp:Label ID="lblSusc" ForeColor="Green" runat="server" Text=""></asp:Label>
        </div>
    </div>

    <script>
        function calculate() {
            var num1 = document.getElementById('<%= txtNum1.ClientID %>').value;
            var num2 = document.getElementById('<%= txtNum2.ClientID %>').value;

            var result = parseFloat(num1) + parseFloat(num2);

            document.getElementById('<%= lblResult.ClientID %>').innerText =  result;
        }

        function copyResult() {
            var resultLabel = document.getElementById("<%= lblResult.ClientID %>");
            if (resultLabel) {
                var range = document.createRange();
                range.selectNode(resultLabel);
                window.getSelection().removeAllRanges();
                window.getSelection().addRange(range);
                document.execCommand("copy");
                window.getSelection().removeAllRanges();
            } else {
                console.error("lblResult not found.");
            }
        }


    </script>
</asp:Content>
