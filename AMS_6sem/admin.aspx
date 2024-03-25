<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="AMS_6sem.admin1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="transition-transform transform duration-300">

        <div class="flex-1 overflow-x-hidden overflow-y-auto p-4">
            <h2 class="text-4xl font-semibold mb-4 p-6 rounded-md shadow-md text-center bg-purple-200">
                <asp:Label ID="lblUserName" runat="server" Text=""></asp:Label>
            </h2>

            <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
                <div class="bg-purple-200 p-6 rounded-md shadow-md">
                    <h3 class="text-xl font-semibold mb-2">Total Products</h3>
                    <p class="text-3xl font-bold">250</p>
                </div>

                <div class="bg-purple-200 p-6 rounded-md shadow-md">
                    <h3 class="text-xl font-semibold mb-2">Total Users</h3>
                    <p class="text-3xl font-bold">500</p>
                </div>

                <div class="bg-purple-200 p-6 rounded-md shadow-md">
                    <h3 class="text-xl font-semibold mb-2">Total Revenue</h3>
                    <p class="text-3xl font-bold">$50,000</p>
                </div>
            </div>
        </div>
    </div>
  <script type="text/javascript">
      function DisableBackButton() {
          window.history.forward();
          function noBack() {
              window.history.forward();
          }
      }

      window.onload = function () {
          DisableBackButton();
      };
  </script>


</asp:Content>
