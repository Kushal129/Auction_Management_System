<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="allorders.aspx.cs" Inherits="AMS_6sem.adminpage.allorders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>AMS | Order Reports</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <div class="flex items-center justify-center h-screen">
        <div class="bg-purple-200 border border-gray-200 rounded shadow p-6">
            <h1 class="text-4xl text-center font-semibold mb-6">Auction Items</h1>
            <div class="bg-purple-200 border border-gray-200 rounded shadow p-6">
                <div class="overflow-x-auto">
                    <form runat="server">
                        <table id="AuctionItemsDataTableR" class="min-w-full">
                            <thead class="bg-purple-700 text-white">
                                <tr>
                                    <th class="py-2 px-4 border-b">Order Number</th>
                                    <th class="py-2 px-4 border-b">Date	</th>
                                    <th class="py-2 px-4 border-b">Customer Name</th>
                                    <th class="py-2 px-4 border-b">Email / Phone</th>
                                    <th class="py-2 px-4 border-b">Product</th>
                                    <th class="py-2 px-4 border-b">Amount</th>
                                    <th class="py-2 px-4 border-b">Status</th>
                                    <th class="py-2 px-4 border-b">Option</th>
                                </tr>
                            </thead>
                            <tbody class="text-center">
                                <asp:Repeater ID="AllorderTableRecord" runat="server">
                                    <ItemTemplate>
                                        <tr class="hover:bg-purple-100 transition-all">
                                            <td class="py-2 px-4 border-b"><%# Eval("orderno")%></td>
                                            <td class="py-2 px-4 border-b"><%# Eval("date") %></td>
                                            <td class="py-2 px-4 border-b"><%# Eval("customername") %></td>
                                            <td data-label="Email / Phone">
                                                <a href="mailto:<%# Eval("EmailAddress") %>"><%# Eval("EmailAddress") %></a>
                                                <br />
                                                <a href="tel:<%# Eval("PhoneNumber") %>" class="phone"><%# Eval("PhoneNumber") %></a>
                                            </td>
                                            <td class="py-2 px-4 border-b"><%# Eval("Product") %></td>
                                            <td class="py-2 px-4 border-b"><%# Eval("Amount") %></td>
                                            <td class="py-2 px-4 border-b">
                                                <asp:Button runat="server" ID="StatusButton" CssClass='<%# Eval("Status").ToString() == "1" ? "btn bg-purple-800 text-white p-1 rounded hover:bg-purple-600" : "btn bg-green-800 text-white p-1 rounded hover:bg-green-600" %>'
                                                    Text='<%# Eval("Status").ToString() == "1" ? "Processing" : "Delivered" %>' OnClientClick='<%# Eval("Status").ToString() == "1" ? "return showConfirmationModal(" + Eval("orderno") + ");" : "" %>' />
                                            </td>


                                            <td class="py-2 px-4 border-b">
                                                <button class="btn bg-indigo-500 text-white hover:bg-indigo-600" data-bs-toggle="modal" data-bs-target="#orderDetailsModal_<%# Eval("orderno") %>">
                                                    View
                                                </button>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>

     <script>
        var AllorderTableRecord = false;

        $(document).ready(function () {
            $('#AllorderTable').DataTable({
                "pagingType": "full_numbers",
                "lengthMenu": [10, 25, 50, 75, 100],
                "pageLength": 10,
                "ordering": true,
                "searching": true,
                "info": true,
                "responsive": true,
                "columnDefs": [
                    { "orderable": false, "targets": [6, 7] }
                ],
                "language": {
                    "emptyTable": "No data available",
                    "infoEmpty": "No records found",
                    "search": "_INPUT_",
                    "searchPlaceholder": "Search...",
                    "lengthMenu": "Show _MENU_ entries",
                    "info": "Showing _START_ to _END_ of _TOTAL_ entries",
                    "paginate": {
                        "first": "First",
                        "last": "Last",
                        "next": "Next",
                        "previous": "Previous"
                    }
                }
            });
            AllorderTableRecord = true;
        });
     </script>
</asp:Content>
