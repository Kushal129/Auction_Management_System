<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="AMS_6sem.admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
    <title>AMS | Admin Page</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        function loadContent(url) {
            $.ajax({
                url: url,
                type: 'GET',
                success: function (data) {
                    $('#dynamic-content').html(data);
                }
            });
        }
    </script>
    <style>
        a {
            text-decoration: none !important;
        }
    </style>
</head>
<body class="font-sans">

    <div class="flex flex-col md:flex-row h-screen bg-white">
        <div class="flex-shrink-0 w-full md:w-64 text-white bg-purple-800">
            <div class="p-4 bg-purple-950">
                <h1 class="text-center text-4xl font-semibold transform hover:scale-110 transition-transform duration-300">
                    <a href="admin.aspx">
                        <span class="hover:text-purple-200">AMS</span>
                    </a>
                </h1>
            </div>

            <nav class="flex-grow md:block md:flex md:flex-col md:justify-between p-4 bg-purple-800 text-white">
                <a onclick="loadContent('adminpage/dashboard.aspx');" class="flex items-center p-4 transition-transform transform hover:scale-105 hover:text-purple-100">
                    <span class="mr-2">
                        <i class="fas fa-tachometer-alt"></i>
                    </span>
                    Dashboard
                </a>
                <a onclick="loadContent('adminpage/productsreports.aspx');" class="flex items-center p-4 transition-transform transform hover:scale-105 hover:text-purple-200">
                    <span class="mr-2">
                        <i class="fas fa-box"></i>
                    </span>
                    Products Reports
                </a>
                <a onclick="loadContent('adminpage/biddersreports.aspx');" class="flex items-center p-4 transition-transform transform hover:scale-105 hover:text-purple-200">
                    <span class="mr-2">
                        <i class="fas fa-users"></i>
                    </span>
                    Bidders Reports
                </a>
                <a onclick="loadContent('adminpage/participantsreports.aspx');" class="flex items-center p-4 transition-transform transform hover:scale-105 hover:text-purple-200">
                    <span class="mr-2">
                        <i class="fas fa-user-friends"></i>
                    </span>
                    Participants Reports
                </a>
                <a onclick="loadContent('adminpage/winnerreports.aspx');" class="flex items-center p-4 transition-transform transform hover:scale-105 hover:text-purple-200">
                    <span class="mr-2">
                        <i class="fas fa-trophy"></i>
                    </span>
                    Winner Reports
                </a>

                <a onclick="logout();" class="flex items-center p-4 transition-transform transform hover:scale-105 hover:text-purple-200">
                    <span class="mr-2">
                        <i class="fas fa-sign-out-alt"></i>
                    </span>
                    Logout
                </a>
            </nav>

        </div>

        <div id="dynamic-content" class="flex-1 overflow-x-hidden overflow-y-auto p-4 bg-purple-100">
            <div class="bg-purple-200 p-6 rounded-md shadow-md">
                <p class="text-4xl text-center">Welcome to the Dashboard Admin !</p>
            </div>
        </div>
    </div>

    <script>
        function logout() {
            // Add your logout logic here
            alert('Logout clicked. Add your logout logic!');
        }
    </script>

</body>
</html>
