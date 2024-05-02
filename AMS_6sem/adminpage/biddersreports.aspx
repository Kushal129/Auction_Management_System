<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="biddersreports.aspx.cs" Inherits="AMS_6sem.adminpage.biddersreports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>AMS | Bidder's Reports</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-4xl text-center font-semibold mb-6">Bidders Reports</h1>
    <form runat="server" id="biderfrom">
        <div class="bg-purple-200 border border-gray-200 rounded shadow p-6">
            <table id="Bidderstable" class="display responsive" width="100%">
                <thead>
                    <tr class="text-center bg-purple-100">
                        <th class="py-2 px-4 border-b">No</th>
                        <th class="py-2 px-4 border-b">Bidder Name</th>
                        <th class="py-2 px-4 border-b">Item Name</th>
                        <th class="py-2 px-4 border-b">Bid Amount</th>
                        <th class="py-2 px-4 border-b">Action</th>
                    </tr>
                </thead>
                <tbody class="text-center">
                    <asp:Repeater ID="BidderRecordTable" runat="server" OnItemCommand="BidderRecordTable_ItemCommand">
                        <ItemTemplate>
                            <tr class="bg-purple-300 hover:bg-purple-100 text-center transition-all">
                                <td class="py-2 px-4 border-b"><%# Container.ItemIndex + 1 %></td>
                                <td class="py-2 px-4 border-b"><%# Eval("fullname") %></td>
                                <td class="py-2 px-4 border-b"><%# Eval("ProductName") %></td>
                                <td class="py-2 px-4 border-b"><%# Eval("amount") %></td>
                                <td class="py-2 px-4 border-b">
                                    <asp:Button ID="btnDelete" Text="Delete" runat="server" CssClass="btn-delete flex items-center" CommandName="DeleteRecord" CommandArgument='<%# Eval("bider_id") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </form>
    <asp:Label ID="ErrorMessageLabel" runat="server" Text=""></asp:Label>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap4.min.js"></script>
    <script>
        $(document).ready(function () {
            var table = $('#Bidderstable').DataTable({
                responsive: true,
                paging: true,
                searching: true,
                ordering: true,
                info: true,
                autoWidth: true,
                columnDefs: [
                    { orderable: false, targets: [4] }
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
                },
            });
        });
    </script>
</asp:Content>
