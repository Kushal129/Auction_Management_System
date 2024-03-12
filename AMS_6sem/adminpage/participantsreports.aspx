<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="participantsreports.aspx.cs" Inherits="AMS_6sem.adminpage.participantsreports" %>

<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>AMS | Participants Reports</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container mx-auto mt-5" id="user-section">
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 text-black lg:grid-cols-4 gap-4">
            <% using (SqlConnection connection = new SqlConnection("Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS;Initial Catalog=AMS;Integrated Security=True"))
                { %>
            <% connection.Open(); %>
            <% string query = "SELECT * FROM tbl_user WHERE uid <> '1'"; %>
            <% using (SqlCommand command = new SqlCommand(query, connection))
                { %>
            <% using (SqlDataReader reader = command.ExecuteReader())
                { %>
            <% while (reader.Read())
                { %>
            <div class="bg-white p-4 rounded-lg shadow-md transition duration-300 transform hover:shadow-lg hover:bg-purple-100 hover:scale-105">
                <img src='<%= ResolveUrl("~/Uploads/product_img/1.jpg") %>' class="w-full h-40 object-cover mb-4 rounded-md" />
                <h1 class="font-semibold mb-2 text-3xl text-center text-indigo-900"><%= reader["fullname"] %></h1>
                <p class="text-black"><span class="text-black font-bold">User ID:</span> <%= reader["uid"] %></p>
                <div class="card-action d-flex mt-2 justify-content-sm-between">
                    <div class="d-flex flex-row justify-content-md-center justify-content-end align-items-center gap-2">
                        <a href="#" class="block text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-2 py-1.5 text-center dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-800 ">
                            <i class="bi bi-trash"></i
                        </a>
                        
                        <input name="_method" type="hidden" value="DELETE">
                        <a href="#" data-modal-target="default-modal" data-modal-toggle="default-modal" class="block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-2 py-1.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800 showprofile" onclick="showUserProfile('<%= reader["uid"] %>')">
                            <i class="far fa-user"></i>
                        </a>
                    </div>
                    <div class="form-check form-switch">
                        <input class="form-check-input customerstatus" type="checkbox" data-activations-status="1" data-customer-id="<%= reader["uid"] %>" id="<%= reader["uid"] %>" checked="">
                    </div>
                </div>
            </div>
            <% } %>
            <% } %>
            <% } %>
            <% } %>
        </div>
    </section>

   <div id="default-modal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full bg-black bg-opacity-50">
    <div class="relative p-4 w-full max-w-2xl max-h-full">
        <div class="relative bg-white rounded-lg shadow-md dark:bg-gray-700">
            <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                <h3 class="text-xl font-semibold text-gray-900 dark:text-white">User Profile</h3>
                <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-hide="default-modal">
                    <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
                    </svg>
                    <span class="sr-only">Close modal</span>
                </button>
            </div>
            <div class="p-4 space-y-4">
                <%-- <p>User ID: <span id="modalUserId"></span></p>
                <p>Fullname: <span id="modalFullname"><%= reader["fullname"] %></span></p>
                <a href="mailto:<%= reader["email"] %>" class="text-blue-500">Email: <span id="modalEmail"></span></a>
                <a href="tel:<%= reader["mobile"] %>" class="text-blue-500">Mobile: <span id="modalMobile"></span></a>--%>
            </div>
            <div class="flex items-center p-4 md:p-5 border-t border-gray-200 rounded-b dark:border-gray-600">
                <button data-modal-hide="default-modal" type="button" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">I accept</button>
                <button data-modal-hide="default-modal" type="button" class="py-2.5 px-5 ms-3 text-sm font-medium text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-200 hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-4 focus:ring-gray-100 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700">Decline</button>
            </div>
        </div>
    </div>
</div>

</asp:Content>
