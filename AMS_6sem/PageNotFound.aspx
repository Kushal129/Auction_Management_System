<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageNotFound.aspx.cs" Inherits="AMS_6sem.PageNotFound" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AMS | Page Not Found</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
  <style>
        @keyframes fadein {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }

        .animate-fadein {
            animation: fadein 1s ease-in-out;
        }
    </style>
</head>
<body class="bg-purple-200 flex items-center justify-center h-screen">
    <div class="error-container text-center animate-fadein">
        <img src="img/pagenotfound.svg" class="error-icon w-2/4 h-auto mx-auto text-purple-800" alt="Error Icon" />
        <h1 class="error-title text-3xl font-bold text-purple-800 mb-4 mt-2">Oops! Page Not Found</h1>
        <p class="error-message text-lg text-purple-800 mb-8">The page you are looking its not be found.</p>
        <a href="index.aspx" class="btn-back inline-block bg-purple-800 hover:bg-purple-900 text-white font-semibold px-6 py-3 rounded transition duration-300">Go to Home Page</a>
    </div>
</body>
</html>
