<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="productsreports.aspx.cs" Inherits="AMS_6sem.adminpage.productsreports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   

    <h1 class="text-4xl text-center font-semibold mb-6">Auction Items</h1>
    <div class="bg-purple-200 border border-gray-200 rounded shadow p-6">
        <div class="overflow-x-auto">
            <table id="AuctionItemsDataTableR" class="min-w-full">
                <thead class="bg-purple-700 text-white">
                    <tr>
                        <th class="py-2 px-4 border-b">No</th>
                        <th class="py-2 px-4 border-b">Product Name</th>
                        <th class="py-2 px-4 border-b">Product Description</th>
                        <th class="py-2 px-4 border-b">File Name</th>
                        <th class="py-2 px-4 border-b">Product Price Interval</th>
                        <th class="py-2 px-4 border-b">Min Price</th>
                        <th class="py-2 px-4 border-b">Auction Start Time</th>
                        <th class="py-2 px-4 border-b">Auction End Time</th>
                        <th class="py-2 px-4 border-b">Actions</th>
                    </tr>
                </thead>
                <tbody class="text-center">
                    <asp:Repeater ID="AuctionItemsDataTable" runat="server">
                        <ItemTemplate>
                            <tr class="hover:bg-purple-100 transition-all">
                                <%--<td class="py-2 px-4 border-b"><%# Container.ItemIndex + 1 %></td>--%>
                                <td class="py-2 px-4 border-b"><%# Eval("AuctionItemId") %></td>
                                <td class="py-2 px-4 border-b"><%# Eval("ProductName") %></td>
                                <td class="py-2 px-4 border-b"><%# Eval("ProductDescription") %></td>
                                <td class="py-2 px-4 border-b">
                                    <img src='<%# ResolveUrl("~/Uploads/product_img/") + Eval("FileName") %>' alt="Product Image" class="w-16 h-16 object-cover rounded-full" />
                                </td>
                                <td class="py-2 px-4 border-b"><%# Eval("ProductPriceInterval") %></td>
                                <td class="py-2 px-4 border-b"><%# Eval("MinPrice") %></td>
                                <td class="py-2 px-4 border-b"><%# Eval("AuctionStartTime") %></td>
                                <td class="py-2 px-4 border-b"><%# Eval("AuctionEndTime") %></td>
                                <td class="py-2 px-4 border-b">
                                    <button class="bg-red-500 hover:bg-red-700 text-white py-2 px-4 rounded-full" onclick="DeleteRecord('<%# Eval("AuctionItemId") %>')">
                                        Delete
                                    </button>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $('#AuctionItemsDataTableR').DataTable();
        });
    </script>

</asp:Content>
