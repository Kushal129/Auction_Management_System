<%@ Page Title="AMS | Winner Reports" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="winnerreports.aspx.cs" Inherits="AMS_6sem.adminpage.winnerreports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="toaster-alert" id="toaster"></div>
    <h1 class="text-4xl text-center font-semibold mb-6">Auction Items</h1>
    <form runat="server" id="tblform">
        <div class="bg-purple-200 border border-gray-200 rounded shadow p-6">
            <table id="Winnerreport" class="display responsive" width="100%">
                <thead>
                    <tr class="bg-purple-100 text-center">
                        <th class="py-2 px-4 border-b">No</th>
                        <th class="py-2 px-4 border-b">Product Image</th>
                        <th class="py-2 px-4 border-b">Winner Name</th>
                        <th class="py-2 px-4 border-b">Contact</th>
                        <th class="py-2 px-4 border-b">Product</th>
                        <th class="py-2 px-4 border-b">Min Price</th>
                        <th class="py-2 px-4 border-b">Winning Price</th>
                    </tr>
                </thead>

                <tbody class="text-center">
                    <%--<asp:Repeater ID="WinnerreportDataTable" runat="server">
                        <ItemTemplate>
                            <tr class="bg-purple-300 hover:bg-purple-100 text-center transition-all">
                                <td class="py-2 px-4 border-b "><%# Container.ItemIndex + 1 %></td>
                                <td class="py-2 px-4 border-b">
                                    <div class="relative">
                                        <img src='<%# ResolveUrl("~/Uploads/product_img/") + Eval("FileName") %>' alt="Product Image" class="w-16 h-16 object-cover rounded-full hover:scale-150 transition-transform duration-300" />
                                        <div class="hidden absolute top-0 left-0 w-full h-full bg-black bg-opacity-75 flex justify-center items-center">
                                            <img src='<%# ResolveUrl("~/Uploads/product_img/") + Eval("FileName") %>' alt="Product Image" class="max-w-full max-h-full object-contain" />
                                        </div>
                                    </div>
                                </td>
                                <td class="py-2 px-4 border-b"><%# Eval("winnerusername") %></td>
                                <td class="py-2 px-4 border-b"><a href="tel:<%# Eval("mobile") %>"><%# Eval("mobile") %></a></td>
                                 <td class="py-2 px-4 border-b"><%# Eval("Product") %></td>
                                <td class="py-2 px-4 border-b"><%# Eval("ProductPriceInterval") %></td>
                                <td class="py-2 px-4 border-b"><%# Eval("WinnungPrice") %></td>
                                
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>--%>
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
            var table = $('#Winnerreport').DataTable({
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
