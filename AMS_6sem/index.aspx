<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="AMS_6sem.index" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon"
        href="https://static.vecteezy.com/system/resources/previews/007/258/573/original/ams-letter-logo-design-on-white-background-ams-creative-initials-letter-logo-concept-ams-letter-design-vector.jpg"
        type="image/x-icon" />
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
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
            <a href="index.aspx" class="font-bold text-4xl text-purple-900 hover:text-purple-800">AMS</a>
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
                <a href="#upcoming-section" class="nav-link">Upcomming Item's<span class="active-underline"></span></a>
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
    </section>
    <hr class="w-4/5 mx-auto text-purple-800 fade-in mb-5" />
    <form runat="server">
        <!-- live Section -->
        <section class="container mx-auto mt-5" id="live-section">
    <div class="row d-flex justify-content-center">
        <div class="col-sm-12 col-md-10 col-lg-8 col-xl-6">
            <h2 class="flex-col text-center text-4xl font-bold mb-5 text-purple-800">Live Auction Item's </h2>
            <p class="mb-0 text-center">Discover unique treasures - bid and win! Uncover the exclusive world at your fingertips Auction extravaganza</p>
        </div>
    </div>

    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 text-black lg:grid-cols-4 gap-4">
        <% bool liveAuctionsFound = false; %>
        <% using (SqlConnection connection = new SqlConnection("Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS;Initial Catalog=AMS;Integrated Security=True"))
            { %>
        <% connection.Open(); %>
        <% string query = "SELECT * FROM AuctionItems WHERE AuctionStartTime <= GETDATE() AND AuctionEndTime > GETDATE()"; %>
        <% using (SqlCommand command = new SqlCommand(query, connection))
            { %>
        <% using (SqlDataReader reader = command.ExecuteReader())
            { %>
        <% while (reader.Read())
            { %>
        <div class="bg-white p-4 rounded-lg shadow-md transition duration-300 transform hover:shadow-lg hover:bg-purple-100 hover:scale-105">
            <img src='<%= ResolveUrl("~/Uploads/product_img/" + reader["FileName"]) %>' alt='<%= reader["ProductName"] %>' class="w-full h-40 object-cover mb-4 rounded-md" />
            <h1 class="font-semibold mb-2 text-3xl text-indigo-900"><%= reader["ProductName"] %></h1>
            <p class="text-gray-600"><span class="text-black font-bold">Details:</span> <%= reader["ProductDescription"] %></p>
            <p class="text-black"><span class="text-black font-bold">Price Interval:</span> <%= reader["ProductPriceInterval"] %></p>
            <p class="text-black"><span class="text-black font-bold">Min Price:</span> <%= reader["MinPrice"] %></p>
            <p class="text-black"><span class="text-black font-bold">Auction Start Time:</span> <%= ((DateTime)reader["AuctionStartTime"]).ToString("dd-MM-yyyy HH:mm") %></p>
            <p class="text-black"><span class="text-black font-bold">Auction End Time:</span><span class="text-lg text-red-500"> <%= ((DateTime)reader["AuctionEndTime"]).ToString("dd-MM-yyyy HH:mm") %> </span></p>

            <% DateTime auctionEndTime = (DateTime)reader["AuctionEndTime"]; %>
            <% DateTime currentTime = DateTime.Now; %>
            <% if (currentTime >= auctionEndTime)
                { %>
            <p class="text-red-500 font-bold">Auction has Ended</p>
            <% }
                else
                { %>
            <div class="text-center mt-3 bg-green-700 text-white p-1 rounded-md shadow-md animate-pulse">
                <p class="font-bold">Auction is Live!</p>
            </div>

            <asp:Button ID="btnBid" runat="server" CssClass="bg-purple-800 text-white w-full p-2 mt-4 hover:bg-[#1f2230] transition duration-300" Text="Place A Bid" OnClick="btnBid_Click" />

            <% liveAuctionsFound = true; %>
            <% } %>
        </div>
        <% } %>
        <% } %>
        <% } %>
    </div>

    <% if (!liveAuctionsFound)
        { %>
    <div class="max-w-md mx-auto bg-purple-200 rounded-md cursor-not-allowed overflow-hidden shadow-md mt-4 p-4">
        <p class="text-red-600 text-center text-lg">No live auctions currently.</p>
    </div>
    <% } %>
    <% } %>

</section>

    </form>

    <hr class="w-4/5 mx-auto mt-5 text-purple-800 fade-in mb-5" />

    <%--upcomming auctions--%>
    <section class="container mx-auto mt-5" id="upcoming-section">
        <div class="row d-flex justify-content-center">
            <div class="col-sm-12 col-md-10 col-lg-8 col-xl-6">
                <h2 class="flex-col text-center text-3xl font-bold mb-5 text-purple-800">Upcoming Auction Items</h2>

                <p class="mb-0 text-center">Your Gateway to Rare Finds Place your bid, seize the moment and own the extraordinary Enhance your collection with our exclusive auctions.</p>

            </div>
        </div>
        <% using (SqlConnection connection = new SqlConnection("Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS;Initial Catalog=AMS;Integrated Security=True"))
            { %>
        <% connection.Open(); %>
        <% string query = "SELECT * FROM AuctionItems WHERE AuctionStartTime > GETDATE()"; %>
        <% using (SqlCommand command = new SqlCommand(query, connection))
            { %>
        <% using (SqlDataReader reader = command.ExecuteReader())
            { %>
        <% if (reader.HasRows)
            { %>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 text-black lg:grid-cols-4 gap-4">
            <% while (reader.Read())
                { %>
            <div class="bg-white p-4 rounded-lg shadow-md">
                <img src='<%= ResolveUrl("~/Uploads/product_img/" + reader["FileName"]) %>' alt='<%= reader["ProductName"] %>' class="w-full h-40 object-cover mb-4 rounded-md" />
                <h1 class="font-semibold mb-2 text-3xl text-center text-indigo-900"><%= reader["ProductName"] %></h1>
                <p class="text-gray-600">Details: <%= reader["ProductDescription"] %></p>
                <p class="text-purple-800">Price Interval: <%= reader["ProductPriceInterval"] %></p>
                <p class="text-purple-800">Min Price: <%= reader["MinPrice"] %></p>
                <p class="text-purple-800">Auction Start Time: <%= ((DateTime)reader["AuctionStartTime"]).ToString("dd-MM-yyyy HH:mm:ss") %></p>
                <p class="text-purple-800">Auction End Time: <span class="text-lg text-red-500"><%= ((DateTime)reader["AuctionEndTime"]).ToString("dd-MM-yyyy HH:mm:ss") %> </span></p>
                <p class="text-blue-500 font-bold">Upcoming Auction</p>
            </div>
            <% } %>
            <% }
                else
                { %>
            <div class="max-w-md mx-auto bg-purple-200 rounded-md cursor-not-allowed overflow-hidden shadow-md mt-4 p-4">
                <p class="text-red-600 text-center text-lg">No upcoming auctions currently.</p>
            </div>
            <% } %>
        </div>
        <% } %>
        <% } %>
        <% } %>
    </section>


    <hr class="w-4/5 mx-auto mt-5 text-purple-800 fade-in mb-5" />

    <!-- Ended Section -->

    <section class="container mx-auto mt-5" id="end-section">
        <h2 class="flex-col text-center text-3xl font-bold mb-5 text-purple-800">Ended Auction Item's </h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 text-black lg:grid-cols-4 gap-4">
            <% using (SqlConnection connection = new SqlConnection("Data Source=LAPTOP-PQJ1JGEE\\SQLEXPRESS;Initial Catalog=AMS;Integrated Security=True"))
                { %>
            <% connection.Open(); %>
            <% string query = "SELECT TOP 4 * FROM AuctionItems WHERE AuctionEndTime <= GETDATE()"; %>
            <% using (SqlCommand command = new SqlCommand(query, connection))
                { %>
            <% using (SqlDataReader reader = command.ExecuteReader())
                { %>
            <% while (reader.Read())
                { %>
            <div class="bg-gray-200 cursor-not-allowed p-4 rounded-lg shadow-md">
                <img src='<%= ResolveUrl("~/Uploads/product_img/" + reader["FileName"]) %>' alt='<%= reader["ProductName"] %>' class="w-full h-40 object-cover mb-4 rounded-md" />
                <h1 class="font-semibold mb-2 text-3xl text-center text-indigo-900"><%= reader["ProductName"] %></h1>
                <p class="text-gray-600">Details: <%= reader["ProductDescription"] %></p>
                <p class="text-purple-800">Price Interval: <%= reader["ProductPriceInterval"] %></p>
                <p class="text-purple-800">Min Price: <%= reader["MinPrice"] %></p>
                <p class="text-purple-800">Auction Start Time: <%= ((DateTime)reader["AuctionStartTime"]).ToString("dd-MM-yyyy HH:mm:ss") %></p>
                <% DateTime auctionEndTime = (DateTime)reader["AuctionEndTime"]; %>
                <% if (DateTime.Now >= auctionEndTime)
                    { %>
                <p class="text-red-500 font-bold">Auction has Ended</p>
                <% } %>
            </div>
            <% } %>
            <% } %>
            <% } %>
            <% } %>
        </div>
    </section>

    <section class="about-us-counter pt-16">
        <div class="flex justify-center items-center p-8">
            <div class="container">
                <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
                    <div class="mx-auto">
                        <div class="col-span-1 sm:col-span-2 md:col-span-3 lg:col-span-4 mx-auto">
                            <div class="card bg-white p-4 border border-gray-300 rounded-md shadow-md transform hover:scale-105 transition-transform duration-300">
                                <div class="counter-single p-4 text-center flex flex-row items-center">
                                    <div class="counter-icon">
                                        <img src="https://www.bidout-app.egenslab.com/uploads/fun_facts/employee-1694260644.svg" />
                                    </div>
                                    <div class="countdown flex flex-col ml-4">
                                        <h1 class="text-2xl font-bold inline-block animate-bounce">10,400+</h1>
                                        <p class="text-gray-600">Happy Customer</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="mx-auto">
                        <div class="col-span-1 sm:col-span-2 md:col-span-3 lg:col-span-4 mx-auto">
                            <div class="card bg-white p-4 border border-gray-300 rounded-md shadow-md transform hover:scale-105 transition-transform duration-300">
                                <div class="counter-single p-4 text-center flex flex-row items-center">
                                    <div class="counter-icon">
                                        <img src="https://www.bidout-app.egenslab.com/uploads/fun_facts/review-1694260644.svg" />
                                    </div>
                                    <div class="countdown flex flex-col ml-4">
                                        <h1 class="text-2xl font-bold inline-block animate-bounce">1,250+</h1>
                                        <p class="text-gray-600">Good Reviews</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mx-auto">
                        <div class="col-span-1 sm:col-span-2 md:col-span-3 lg:col-span-4 mx-auto">
                            <div class="card bg-white p-4 border border-gray-300 rounded-md shadow-md transform hover:scale-105 transition-transform duration-300">
                                <div class="counter-single p-4 text-center flex flex-row items-center">
                                    <div class="counter-icon">
                                        <img src="https://www.bidout-app.egenslab.com/uploads/fun_facts/smily-1694260644.svg" />
                                    </div>
                                    <div class="countdown flex flex-col ml-4">
                                        <h1 class="text-2xl font-bold inline-block animate-bounce">4,500+</h1>
                                        <p class="text-gray-600">Winner Customer</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mx-auto">
                        <div class="col-span-1 sm:col-span-2 md:col-span-3 lg:col-span-4 mx-auto">
                            <div class="card bg-white p-4 border border-gray-300 rounded-md shadow-md transform hover:scale-105 transition-transform duration-300">
                                <div class="counter-single p-4 text-center flex flex-row items-center">
                                    <div class="counter-icon">
                                        <img src="https://www.bidout-app.egenslab.com/uploads/fun_facts/comment-1694260644.svg" />
                                    </div>
                                    <div class="countdown flex flex-col ml-4">
                                        <h1 class="text-2xl font-bold inline-block animate-bounce">560+</h1>
                                        <p class="text-gray-600">New Comments</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
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
