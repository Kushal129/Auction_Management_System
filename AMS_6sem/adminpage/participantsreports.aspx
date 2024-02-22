<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="participantsreports.aspx.cs" Inherits="AMS_6sem.adminpage.participantsreports" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>AMS | Participants Reports</title>
     <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.0/css/dataTables.dataTables.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.dataTables.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.7.0/dist/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/2.0.0/js/dataTables.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.7.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .dt-input {
            width: 200px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 10px;
        }


            .dt-input:focus {
                background-color: #f0f0f0;
                outline: none;
            }

        .transition-all {
            transition: all 0.3s ease-in-out;
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
        }

        .close {
            cursor: pointer;
            position: absolute;
            top: 10px;
            right: 10px;
        }
    </style>
</head>
    <body class="bg-purple-100">
    <div class="flex items-center justify-center h-screen">
        <div class="bg-purple-200 border border-gray-200 rounded shadow p-6">
            <h1 class="text-4xl text-center font-semibold mb-6">Participants Reports</h1>
            <div class="bg-purple-200 border border-gray-200 rounded shadow p-6">
                <div class="overflow-x-auto">
                    <form runat="server">
                        <table id="ParticipantsTable" class="min-w-full">
                            <thead class="bg-purple-700 text-white">
                                <tr>
                                    <th class="py-2 px-4 border-b">No</th>
                                    <th class="py-2 px-4 border-b">Full Name</th>
                                    <th class="py-2 px-4 border-b">Contact</th>
                                    <th class="py-2 px-4 border-b">Email</th>
                                    <th class="py-2 px-4 border-b">Product</th>
                                    <th class="py-2 px-4 border-b">Start Date/Time</th>
                                    <%--<th class="py-2 px-4 border-b">Action</th>--%>
                                </tr>
                            </thead>
                            <tbody class="text-center">
                                <asp:Repeater ID="ParticipantsRepeater" runat="server">
                                    <ItemTemplate>
                                        <tr class="hover:bg-purple-100 transition-all">
                                            <td class="py-2 px-4 border-b"><%# Container.ItemIndex + 1 %></td>
                                            <td class="py-2 px-4 border-b"><%# Eval("FullName") %></td>
                                            <td class="py-2 px-4 border-b"><%# Eval("Contact") %></td>
                                            <td class="py-2 px-4 border-b"><%# Eval("Email") %></td>
                                            <td class="py-2 px-4 border-b"><%# Eval("Product") %></td>
                                            <td class="py-2 px-4 border-b"><%# Eval("StartDateTime") %></td>
                                            <%--<td class="py-2 px-4 border-b">
                                                <asp:LinkButton ID="btnDelete" runat="server" CommandArgument='<%# Eval("ParticipantId") %>' OnClientClick="return confirm('Are you sure you want to delete this record?');" OnClick="DeleteRecord" CssClass="text-red-500 hover:text-red-600">Delete</asp:LinkButton>
                                            </td>--%>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                        <div class="container mx-auto my-8 px-4">
                            <div class="container mx-auto my-8 px-4">
                                <a href="../admin.aspx" class="inline-flex items-center justify-center px-6 py-3 bg-purple-700 text-white font-semibold rounded" onclick="btnGoToAdminPage_Click()">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left mr-2" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8" />
                                    </svg>
                                    Go to Admin Page
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/2.0.0/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/2.0.0/js/dataTables.bootstrap4.min.js"></script>

    <script>
        $(document).ready(function () {
            $('#ParticipantsTable').DataTable({
                "paging": true,
                "ordering": true,
                "info": true,
                "responsive": true,
                "order": [], // Default sorting order (remove this line if you want to enable default sorting)
            });
        });
    </script>
</body>
</html>