<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="participantsreports.aspx.cs" Inherits="AMS_6sem.adminpage.participantsreports" %>

<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>AMS | Participants Reports</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="toaster-alert" id="toaster"></div>
    <%--<p>Aama all users hase je Client side thi bid marvana hase ne avaya hase ee data hase </p>--%>
    <form runat="server">
        <section class="container mx-auto mt-5" id="user-section">
            <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 text-black lg:grid-cols-4 gap-4">
                <%--<div class="mb-4">
                    <label for="txtSearch" class="block text-sm font-medium text-gray-700">Search by User ID:</label>
                    <div class="mt-1 relative rounded-md shadow-sm">
                        <input type="text" id="txtSearch" runat="server" class="focus:ring-indigo-500 focus:border-indigo-500 block w-full pr-12 sm:text-sm border-gray-300 rounded-md" placeholder="Enter User ID">
                        <button type="button" class="absolute inset-y-0 right-0 px-4 py-1 text-sm text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:bg-indigo-700" onclick="searchUser()">Search</button>
                    </div>
                </div>--%>
                <asp:Repeater ID="UserRepeater" runat="server">
                    <ItemTemplate>
                        <div class="bg-white p-4 rounded-lg shadow-md transition duration-300 transform hover:shadow-lg hover:bg-purple-100 hover:scale-105">
                            <img src='<%# Eval("user_img") %>' class="w-full h-32 mb-4 rounded-md hover:scale-105 transition-transform duration-300" />
                            <p class="font-semibold mb-2 text-2xl text-center text-indigo-900"><%# Eval("fullname") %></p>
                            <p class="text-black text-sm"><span class="text-black font-bold">ID:</span> <%# Eval("uid") %></p>
                            <p class="text-black text-sm">
                                <span class="text-black font-bold">Email:</span>
                                <a href='<%# "mailto:" + Eval("email") %>' data-toggle="tooltip" data-placement="top" title="Send Email"><%# Eval("email") %></a>
                            </p>
                            <p class="text-black text-sm">
                                <span class="text-black font-bold">Mobile:</span>
                                <a href="tel:<%# Eval("mobile") %>" data-toggle="tooltip" data-placement="top" title="Direct Call"><%# Eval("mobile") %></a>
                            </p>

                            <div class="card-action d-flex mt-2 justify-content-sm-between">
                                <div class="d-flex flex-row justify-content-md-center justify-content-end align-items-center gap-2">
                                    <asp:LinkButton ID="btn_delete" runat="server"
                                        CssClass="block text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-2 py-1.5 text-center dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-800"
                                        CommandArgument='<%# Eval("uid") %>'
                                        OnClientClick="return confirm('Are you sure you want to delete this User ?');" OnClick="DeleteRecord">
                                        <i class="bi bi-trash"></i>
                                    </asp:LinkButton>
                                </div>
                                <%-- <div class="form-check form-switch">
                                    <input class="form-check-input customerstatus" type="checkbox" data-activations-status="1" data-customer-id="<%# Eval("uid") %>" id="<%# Eval("uid") %>" checked="<%# Convert.ToBoolean(Eval("role") == "3") %>">
                                </div>--%>
                                <%--<div class="form-check">
                                    <asp:CheckBox ID="customerStatusCheckbox" runat="server" CssClass="form-check-input" Checked='<%# Convert.ToBoolean(Eval("role") == "3") %>' AutoPostBack="true" OnCheckedChanged="CustomerStatusCheckbox_CheckedChanged" data-activations-status="1" data-customer-id='<%# Eval("uid") %>' />
                                </div>--%>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </section>
        <%--<script>
            function searchUser() {
                var userID = document.getElementById('<%= txtSearch.ClientID %>').value;
                window.location.href = 'participantsreports.aspx?userID=' + userID;
            }
        </script>--%>

        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>

    </form>
</asp:Content>
