<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="biddersreports.aspx.cs" Inherits="AMS_6sem.adminpage.biddersreports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>AMS | Bidder's Reports</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-4xl text-center font-semibold mb-6">Bidders Reports</h1>
    <div class="bg-purple-200 border border-gray-200 rounded shadow p-6">
        <table id="Bidderstable" class="display responsive" width="100%">
            <thead>
                <tr>
                    <th class="py-2 px-4 border-b">No</th>
                    <th class="py-2 px-4 border-b">Bidder Name</th>
                    <th class="py-2 px-4 border-b">Email</th>
                    <th class="py-2 px-4 border-b">Contact No</th>
                    <th class="py-2 px-4 border-b">Action</th>
                </tr>
            </thead>
            <tbody class="text-center">
                <asp:Repeater ID="BidderRecordTable" runat="server">
                    <ItemTemplate>
                        <tr class="hover:bg-purple-100 text-center transition-all">
                            <td class="py-2 px-4 border-b"><%# Container.ItemIndex + 1 %></td>
                            <td class="py-2 px-4 border-b"><%# Eval("fullname") %></td>
                            <td class="py-2 px-4 border-b"><%# Eval("email") %></td>
                            <td class="py-2 px-4 border-b"><%# Eval("mobile") %></td>
                            <td class="py-2 px-4 border-b">
                                <button id="deleteButton">
                                    <i class="bi bi-trash"></i>
                                </button>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>

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
