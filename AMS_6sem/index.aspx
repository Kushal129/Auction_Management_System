﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="AMS_6sem.index" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon"
        href="https://static.vecteezy.com/system/resources/previews/007/258/573/original/ams-letter-logo-design-on-white-background-ams-creative-initials-letter-logo-concept-ams-letter-design-vector.jpg"
        type="image/x-icon" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" />
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
    <script src="https://unpkg.com/typed.js@2.1.0/dist/typed.umd.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link href="Style.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <title>AMS | Index </title>

</head>
<body class="font-sans bg-gray-100">
    <nav class="nav bg-white w-full navbar p-3" id="navbar">
        <div class="container mx-auto flex items-center justify-between">
            <a href="#" class="font-bold text-3xl text-purple-900 hover:text-purple-800">AMS</a>
            <div class="md:hidden">
                <button id="mobile-menu-toggle" class="text-purple-900 focus:outline-none">
                    <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                        xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M4 6h16M4 12h16m-7 6h7">
                        </path>
                    </svg>
                </button>
            </div>
            <div class="hidden md:flex flex-col md:flex-row md:items-center md:justify-end md:space-x-4" id="nav-links">
                <a href="#live-section" class="nav-link">Live Auction<span class="active-underline"></span></a>
                <a href="#product-section" class="nav-link">Product's<span class="active-underline"></span></a>
                <a href="#contact-section" class="nav-link">Contact us<span class="active-underline"></span></a>
                <a href="logreg.aspx" class="nav-link">Login</a>
            </div>
        </div>
    </nav>

    <section class="container mx-auto p-8 section" id="home-section">
        <div class="flex flex-wrap items-center justify-center">
            <div class="w-full md:w-1/2 lg:w-1/2 p-4">
                <div class="flex flex-col items-start justify-center h-full ftco-animate fadeInUp ftco-animated">
                    <span class="text-black text-3xl mt-3">Welcome !</span>
                    <h1 class="text-4xl md:text-5xl lg:text-6xl font-bold text-purple-800 my-4">Auction <span
                        class="text-black">Managment System </span></h1>
                    <p class="text-lg mb-4 text-gray-500">Elevate your auctions with our Auction Management System. where efficiency meets innovation for seamless bidding experiences. Join us in redefining the auction realm!</p>
                    <div class="flex flex-col sm:flex-row text-center space-y-4 sm:space-y-0 sm:space-x-4">
                        <a href="#live-section"
                            class="block md:inline-block bg-purple-800 hover:bg-purple-900 text-white font-bold py-3 px-8 rounded-full transition duration-300 ease-in-out">View Live Auction
                        </a>
                        <a href="#contact-section"
                            class="block md:inline-block bg-transparent text-purple-900 border border-green-600 py-3 px-6 rounded-full transition duration-300 ease-in-out hover:text-purple-800">Contect
                        </a>
                    </div>
                </div>
            </div>
            <div class="w-full md:w-1/2 lg:w-1/2 p-4">
                <img src="img/home.png" alt="Your Image" class="w-full h-auto rounded-md mb-4" />
            </div>
        </div>
        <hr class="fade-in text-purple-800" />
    </section>
    <!-- live Section -->
    <section class="container mx-auto mt-5" id="live-section">
        <h2 class="flex-col text-center text-3xl font-bold mb-5 text-purple-800">Live Auction Item's </h2>

        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
            <%-- Add server-side code to fetch data from the database and display live auction items dynamically --%>
            <% using (SqlConnection connection = new SqlConnection("Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS;Initial Catalog=AMS;Integrated Security=True"))
                { %>
            <% connection.Open(); %>
            <% string query = "SELECT * FROM AuctionItems WHERE AuctionStartTime > GETDATE()"; %>
            <% using (SqlCommand command = new SqlCommand(query, connection))
                { %>
            <% using (SqlDataReader reader = command.ExecuteReader())
                { %>
            <% while (reader.Read())
                { %>
            <div class="bg-white p-4 rounded-lg shadow-md">
                <%-- Adjust the image path based on your folder structure --%>
                <img src='<%= ResolveUrl("~/Uploads/product_img/" + reader["FileName"]) %>' alt='<%= reader["ProductName"] %>' class="w-full h-40 object-cover mb-4 rounded-md" />
                <h3 class="text-lg font-semibold mb-2"><%= reader["ProductName"] %></h3>
                <p class="text-gray-600"><%= reader["ProductDescription"] %></p>
                <p class="text-purple-800">Price Interval: <%= reader["ProductPriceInterval"] %></p>
                <p class="text-purple-800">Min Price: <%= reader["MinPrice"] %></p>
                <p class="text-purple-800">Auction Start Time: <%= ((DateTime)reader["AuctionStartTime"]).ToString("yyyy-MM-dd HH:mm:ss") %></p>
                <p class="text-green-500 font-bold">Auction is Live!</p>
                <button class="bg-purple-800 text-white w-full p-2 mt-4 hover:bg-purple-900">Bid</button>
            </div>
            <% } %>
            <% } %>
            <% } %>
            <% } %>
        </div>
    </section>

    <!-- Ended Section -->




    <%--upcomming auctions--%>

    <!-- Gallary Section -->
    <section class="container mx-auto mt-5" id="product-section">
        <h2 class="flex-col text-center text-3xl font-bold mb-5 text-purple-800">Ended Auction Item's </h2>

        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
            <%-- Add server-side code to fetch data from the database and display ended auction items dynamically --%>
            <% using (SqlConnection connection = new SqlConnection("Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS;Initial Catalog=AMS;Integrated Security=True"))
                { %>
            <% connection.Open(); %>
            <% string query = "SELECT * FROM AuctionItems WHERE AuctionStartTime <= GETDATE()"; %>
            <% using (SqlCommand command = new SqlCommand(query, connection))
                { %>
            <% using (SqlDataReader reader = command.ExecuteReader())
                { %>
            <% while (reader.Read())
                { %>
            <div class="bg-white p-4 rounded-lg shadow-md">
                <%-- Adjust the image path based on your folder structure --%>
                <img src='<%= ResolveUrl("~/Uploads/product_img/" + reader["FileName"]) %>' alt='<%= reader["ProductName"] %>' class="w-full h-40 object-cover mb-4 rounded-md" />
                <h3 class="text-lg font-semibold mb-2"><%= reader["ProductName"] %></h3>
                <p class="text-gray-600"><%= reader["ProductDescription"] %></p>
                <p class="text-purple-800">Price Interval: <span class="text-yellow-500"><%= reader["ProductPriceInterval"] %></span></p>
                <p class="text-purple-800">Min Price: <span class="text-green-500"><%= reader["MinPrice"] %></span></p>
                <p class="text-purple-800">Auction Start Time: <%= ((DateTime)reader["AuctionStartTime"]).ToString("yyyy-MM-dd HH:mm:ss") %></p>
                <p class="text-red-500 font-bold">Auction Ended</p>
                <%--<button class="bg-purple-800 text-white w-full p-2 mt-4 hover:bg-purple-900" disabled>Bid</button>--%>
            </div>

            <% } %>
            <% } %>
            <% } %>
            <% } %>
        </div>
    </section>
    </div>
    </section>

    <footer class="bg-purple-900 text-white p-8 mt-5" id="contact-section">
        <div class="container mx-auto flex justify-between items-center">
            <div>
                Auction Management System
            </div>
            <div class="space-x-4">
                <a href="#" class="text-white"><i class="fab fa-twitter"></i></a>
                <a href="#" class="text-white"><i class="fab fa-facebook"></i></a>
                <a href="#" class="text-white"><i class="fab fa-instagram"></i></a>
            </div>
        </div>
    </footer>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var myCarousel = new bootstrap.Carousel(document.getElementById('controls-carousel'), {
                interval: 2000,
            });
        });


        document.addEventListener('DOMContentLoaded', function () {
            const mobileMenuToggle = document.getElementById('mobile-menu-toggle');
            const navLinks = document.getElementById('nav-links');

            mobileMenuToggle.addEventListener('click', function () {
                navLinks.classList.toggle('hidden');
            });
        });
    </script>
</body>

</html>
