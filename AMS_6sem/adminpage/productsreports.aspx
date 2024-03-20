<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="productsreports.aspx.cs" Inherits="AMS_6sem.adminpage.productsreports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>AMS | Auction Product's Report</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="toaster-alert" id="toaster"></div>
    <h1 class="text-4xl text-center font-semibold mb-6">Auction Items</h1>
    <form runat="server" id="tblform">
        <div class="bg-purple-200 border border-gray-200 rounded shadow p-6">
            <table id="AuctionItems" class="display responsive" width="100%">
                <thead>
                    <tr>
                        <th class="py-2 px-4 border-b">No</th>
                        <th class="py-2 px-4 border-b">Product Name</th>
                        <th class="py-2 px-4 border-b">Product Description</th>
                        <th class="py-2 px-4 border-b">File Name</th>
                        <th class="py-2 px-4 border-b">Product Price Interval</th>
                        <th class="py-2 px-4 border-b">Min Price</th>
                        <th class="py-2 px-4 border-b">Auction Start Time</th>
                        <th class="py-2 px-4 border-b">Auction End Time</th>
                        <th class="py-2 px-4 border-b">Status</th>
                        <th class="py-2 px-4 border-b">Actions</th>
                    </tr>
                </thead>

                <tbody class="text-center">
                    <asp:Repeater ID="AuctionItemsDataTable" runat="server">
                        <ItemTemplate>
                            <tr class="hover:bg-purple-100 text-center transition-all">
                                <td class="py-2 px-4 border-b"><%# Container.ItemIndex + 1 %></td>
                                <td class="py-2 px-4 border-b"><%# Eval("ProductName") %></td>
                                <td class="py-2 px-4 border-b"><%# Eval("ProductDescription") %></td>
                                <td class="py-2 px-4 border-b">
                                    <img src='<%# ResolveUrl("~/Uploads/product_img/") + Eval("FileName") %>' alt="Product Image" class="w-16 h-16 object-cover rounded-full" /></td>
                                <td class="py-2 px-4 border-b"><%# Eval("ProductPriceInterval") %></td>
                                <td class="py-2 px-4 border-b"><%# Eval("MinPrice") %></td>
                                <td class="py-2 px-4 border-b"><%# Eval("AuctionStartTime") %></td>
                                <td class="py-2 px-4 border-b"><%# Eval("AuctionEndTime") %></td>
                                <td class="py-2 px-4 border-b">
                                    <%# GetAuctionStatus((DateTime)Eval("AuctionStartTime"), (DateTime)Eval("AuctionEndTime")) %>
                                </td>

                                <td class="py-2 px-4 border-b">
                                    <a href="editproduct.aspx?id=<%# Eval("AuctionItemId") %>" class="btn btn-primary rounded-md text-white-300 hover:text-white-300 p-1">
                                        <i class="bi bi-pencil text-white-300 hover:text-white-300"></i>
                                    </a>
                                    <asp:LinkButton ID="btn_delete" runat="server" CssClass="btn btn-danger rounded-md text-white-300 hover:text-white-300 p-1" CommandArgument='<%# Eval("AuctionItemId") %>' OnClick="DeleteRecord">
                                            <i class="bi bi-trash text-white-300 hover:text-white-300"></i>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </form>

   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap4.min.js"></script>

<script>
    $(document).ready(function () {
        var table = $('#AuctionItems').DataTable({
            responsive: true,
            paging: true,
            lengthChange: true,
            searching: true,
            ordering: true,
            info: true,
            autoWidth: true,
            columnDefs: [
                { orderable: false, targets: [0, 9] } 
            ],
            language: {
                search: "Filter: ",
                info: "Showing _START_ to _END_ of _TOTAL_ items",
                lengthMenu: "Show _MENU_ items",
                paginate: {
                    first: 'First',
                    last: 'Last',
                    next: 'Next',
                    previous: 'Previous'
                }
            }
        });
    });
</script>

</asp:Content>
