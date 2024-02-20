<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="AMS_6sem.admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="/dist/tailwind.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css" />
    <title>AMS | Admin Page</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <style>
        a {
            text-decoration: none !important;
        }
    </style>
</head>
<body class="font-sans bg-purple-100">
    <span class="absolute text-white text-4xl top-5 left-4 cursor-pointer" onclick="openSidebar()">
        <i class="bi bi-filter-left px-2 bg-[#0E1420] rounded-md"></i>
    </span>
    <form id="form1" runat="server">
        <div class="sidebar fixed top-0 bottom-0 lg:left-0 p-2 w-[300px] overflow-y-auto text-center bg-[#0E1420]">
            <div class="text-gray-100 text-xl">
                <div class="p-2.5 mt-1 flex items-center">
                    <i class="bi bi-award-fill px-2 py-1 rounded-md bg-purple-600 text-white"></i>
                    <h1 class="font-bold text-gray-200 text-center text-4xl ml-3">AMS</h1>
                    <i class="bi bi-x cursor-pointer ml-28 lg:hidden" onclick="openSidebar()"></i>
                </div>
                <div class="my-2 bg-gray-600 h-[1px]"></div>
            </div>

            <%--<a href="adminpage/dashboard.aspx" class="nav-link cursor-pointer flex items-center p-2.5 mt-3 rounded-md px-4 text-white duration-300 hover:bg-purple-700">
                <i class="fas fa-tachometer-alt"></i>
                <span class="text-[15px] ml-4 text-white font-bold">Dashboard </span>
            </a>--%>

            <a href="adminpage/auctioncrate.aspx" class="nav-link cursor-pointer flex items-center p-2.5 mt-3 rounded-md px-4 text-white duration-300 hover:bg-purple-700">
                <i class="fa fa-plus-circle"></i>
                <span class="text-[15px] ml-4 text-gray-200 font-bold">Crate Auction </span>
            </a>

            <a href="adminpage/productsreports.aspx" class="nav-link cursor-pointer flex items-center p-2.5 mt-3 rounded-md px-4 text-white duration-300 hover:bg-purple-700">
                <i class="fas fa-box"></i>
                <span class="text-[15px] ml-4 text-gray-200 font-bold">Products Reports </span>
            </a>
            <a href="adminpage/biddersreports.aspx" class="nav-link cursor-pointer flex items-center p-2.5 mt-3 rounded-md px-4 text-white duration-300 hover:bg-purple-700">
                <i class="fas fa-users"></i>
                <span class="text-[15px] ml-4 text-gray-200 font-bold">Bidders Reports </span>
            </a>
            <a href="adminpage/participantsreports.aspx" class="nav-link cursor-pointer flex items-center p-2.5 mt-3 rounded-md px-4 text-white duration-300 hover:bg-purple-700">
                <i class="fas fa-user-friends"></i>
                <span class="text-[15px] ml-4 text-gray-200 font-bold">Participants Reports </span>
            </a>
            <a href="adminpage/winnerreports.aspx" class="nav-link cursor-pointer flex items-center p-2.5 mt-3 rounded-md px-4 text-white duration-300 hover:bg-purple-700">
                <i class="fas fa-trophy"></i>
                <span class="text-[15px] ml-4 text-gray-200 font-bold">Winner Reports </span>
            </a>

            <div class="my-4 bg-gray-600 h-[1px]"></div>

            <asp:LinkButton ID="lnkLogout" runat="server" Text="Logout" CssClass="nav-link cursor-pointer flex items-center p-2.5 mt-3 rounded-md px-4 text-white duration-300 hover:bg-purple-700" OnClientClick="return confirm('Are you sure you want to logout?');" OnClick="btnLogout_Click">
    <i class="fas fa-sign-out-alt"></i>
    <span class="text-[15px] ml-4 text-gray-200 font-bold">Logout</span>
            </asp:LinkButton>


        </div>
    </form>

    <div id="dynamic-content" class="ml-[300px] p-6 transition-transform transform duration-300">

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
        function dropdown() {
            document.querySelector("#submenu").classList.toggle("hidden");
            document.querySelector("#arrow").classList.toggle("rotate-0");
        }
        dropdown();

        function openSidebar() {
            document.querySelector(".sidebar").classList.toggle("hidden");
        }
    </script>
</body>

</html>
