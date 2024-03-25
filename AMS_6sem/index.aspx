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
                    <p class="text-black"><span class="text-black font-bold">Auction Start Time:</span><span class="text-lg text-green-500"> <%= ((DateTime)reader["AuctionStartTime"]).ToString("dd-MM-yyyy HH:mm") %> </span></p>
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
                <p class="text-purple-800">Auction Start Time: <span class="text-lg text-green-500"><%= ((DateTime)reader["AuctionStartTime"]).ToString("dd-MM-yyyy HH:mm:ss") %> </span></p>
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

    <section class="working-section mt-10 section-bg-two" id="howitswork-section">
        <div class="container">
            <div class="section-header text-center section-center mb-10">
                <h2 class="text-5xl font-bold text-purple-800">How it works?</h2>
                <p class="text-xl text-black">Follow these simple steps and make profits!</p>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8 p-5">
                <div class="work-item flex flex-col items-center">
                    <div class="relative">
                        <img class="w-16 h-16 object-cover rounded-full border-2 border-purple-800 p-1" src="https://pixner.net/techbid/techbid/assets/img/work/w1.png" alt="work-img" />
                        <span class="absolute top-0 left-0 transform -translate-x-2/3 -translate-y-2/3 inline-block w-8 h-8 text-center leading-8 bg-purple-800 text-white font-semibold rounded-full">01</span>
                    </div>
                    <div class="content mt-4 text-center">
                        <h5 class="text-lg font-semibold text-purple-900">Register for free</h5>
                        <p class="text-[#553c6c]">To start using our auction, you’ll need to register. It’s completely free and requires just a few clicks!</p>
                    </div>
                </div>
                <div class="work-item flex flex-col items-center">
                    <div class="relative">
                        <img class="w-16 h-16 object-cover rounded-full border-2 border-purple-800 p-1" src="https://pixner.net/techbid/techbid/assets/img/work/w2.png" alt="work-img" />
                        <span class="absolute top-0 left-0 transform -translate-x-2/3 -translate-y-2/3 inline-block w-8 h-8 text-center leading-8 bg-purple-800 text-white font-semibold rounded-full">02</span>
                    </div>
                    <div class="content mt-4 text-center">
                        <h5 class="text-lg font-semibold text-purple-900">Buy or Bid</h5>
                        <p class="text-[#553c6c]">To start using our auction, you’ll need to register. It’s completely free and requires just a few clicks!</p>
                    </div>
                </div>
                <div class="work-item flex flex-col items-center">
                    <div class="relative">
                        <img class="w-16 h-16 object-cover rounded-full border-2 border-purple-800 p-1" src="https://pixner.net/techbid/techbid/assets/img/work/w3.png" alt="work-img" />
                        <span class="absolute top-0 left-0 transform -translate-x-2/3 -translate-y-2/3 inline-block w-8 h-8 text-center leading-8 bg-purple-800 text-white font-semibold rounded-full">03</span>
                    </div>
                    <div class="content mt-4 text-center">
                        <h5 class="text-lg font-semibold text-purple-900">Submit a Bid</h5>
                        <p class="text-[#553c6c]">To start using our auction, you’ll need to register. It’s completely free and requires just a few clicks!</p>
                    </div>
                </div>
                <div class="work-item flex flex-col items-center">
                    <div class="relative">
                        <img class="w-16 h-16 object-cover rounded-full border-2 border-purple-800 p-1" src="https://pixner.net/techbid/techbid/assets/img/work/w4.png" alt="work-img" />
                        <span class="absolute top-0 left-0 transform -translate-x-2/3 -translate-y-2/3 inline-block w-8 h-8 text-center leading-8 bg-purple-800 text-white font-semibold rounded-full">04</span>
                    </div>
                    <div class="content mt-4 text-center">
                        <h5 class="text-lg font-semibold text-purple-900">Win</h5>
                        <p class="text-[#553c6c]">To start using our auction, you’ll need to register. It’s completely free and requires just a few clicks!</p>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <section class="about-us-counter mt-10">
        <div class="flex justify-center items-center p-8">
            <div class="container">
                <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
                    <div class="mx-auto">
                        <div class="col-span-1 sm:col-span-2 md:col-span-3 lg:col-span-4 mx-auto">
                            <div class="card bg-purple-300 p-4 border border-gray-300 rounded-md shadow-md transform hover:scale-105 transition-transform duration-300">
                                <div class="counter-single bg-purple-200 p-4 text-center flex flex-row items-center">
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
                            <div class="card bg-purple-300 p-4 border border-gray-300 rounded-md shadow-md transform hover:scale-105 transition-transform duration-300">
                                <div class="counter-single bg-purple-200 p-4 text-center flex flex-row items-center">
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
                            <div class="card bg-purple-300 p-4 border border-gray-300 rounded-md shadow-md transform hover:scale-105 transition-transform duration-300">
                                <div class="counter-single bg-purple-200 p-4 text-center flex flex-row items-center">
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
                            <div class="card bg-purple-300 p-4 border border-gray-300 rounded-md shadow-md transform hover:scale-105 transition-transform duration-300">
                                <div class="counter-single bg-purple-200 p-4 text-center flex flex-row items-center">
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

    <%--<footer class="bg-purple-800 text-white py-12">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex flex-wrap justify-between">
            <!-- Left Section -->
            <div class="w-full md:w-1/2 lg:w-1/4 mb-6">
                <h3 class="text-lg font-semibold mb-4">About Auction Management System</h3>
                <p class="text-sm">The Auction Management System is a comprehensive platform designed to streamline the process of conducting auctions. From managing item listings to facilitating bidding and payment processes, our system offers a seamless solution for auctioneers and participants alike.</p>
            </div>

            <!-- Middle Section -->
            <div class="w-full md:w-1/2 lg:w-1/4 mb-6">
                <h3 class="text-lg font-semibold mb-4">Quick Links</h3>
                <ul class="text-sm">
                    <li><a href="#home-section" class="hover:text-gray-200">Home</a></li>
                    <li><a href="#live-section" class="hover:text-gray-200">Live Auctions</a></li>
                    <li><a href="#howitswork-section" class="hover:text-gray-200">How It Works</a></li>
                    <li><a href="#contact-section" class="hover:text-gray-200">Contact</a></li>
                </ul>
            </div>

            <!-- Right Section -->
            <div class="w-full md:w-1/2 lg:w-1/4 mb-6">
                <h3 class="text-lg font-semibold mb-4">Contact Us</h3>
                <p class="text-sm">For any inquiries or assistance regarding our Auction Management System, feel free to reach out to our team.</p>
                <p class="text-sm mt-4">Email: auctionmanagement@example.com<br />
                    Phone: +91 9995556668</p>
            </div>

            <!-- Social Media Links -->
            <div class="w-full md:w-1/2 lg:w-1/4 mb-6">
                <h3 class="text-lg font-semibold mb-4">Follow Us</h3>
                <ul class="text-sm flex flex-wrap">
                    <li class="mr-4 mb-2"><a href="https://www.github.com/Kushal129" class="hover:text-gray-200">GitHub</a></li>
                    <li class="mr-4 mb-2"><a href="https://www.linkedin.com/in/kushal-pipaliya" class="hover:text-gray-200">LinkedIn</a></li>
                    <li class="mr-4 mb-2"><a href="https://twitter.com/PipaliyaKu78237" class="hover:text-gray-200">Twitter</a></li>
                    <li class="mr-4 mb-2"><a href="https://www.facebook.com/kushal.pipaliya.12?mibextid=JRoKGi" class="hover:text-gray-200">Facebook</a></li>
                    <li class="mr-4 mb-2"><a href="https://www.instagram.com/_kushal_pipaliya/" class="hover:text-gray-200">Instagram</a></li>
                </ul>
            </div>
        </div>

        <!-- Bottom Section -->
        <div class="mt-8 border-t border-purple-700 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex flex-col md:flex-row justify-between items-center">
            <p class="text-sm mb-2">&copy; 2024 Auction Management System. All rights reserved.</p>
            <p class="text-sm">Designed with <span class="text-red-500">&hearts;</span> by HK-Management</p>
        </div>
    </footer>--%>


    <footer class="bg-[#6b21a8] rounded-t-[180px]">
        <div class="mx-auto max-w-screen-xl px-4 pb-8 pt-16 sm:px-6 lg:px-8">
            <div class="mx-auto max-w-md">
                <strong class="block text-center text-xl font-bold text-white sm:text-3xl">Want to stay updated on upcoming
                auctions and exclusive deals?
                </strong>

                <form class="mt-6">
                    <div class="relative max-w-lg">
                        <label class="sr-only" for="email">Email </label>

                        <input class="w-full rounded-full border-gray-200 bg-gray-100 p-4 pe-32 text-sm font-medium"
                            id="email" type="email" placeholder="abcd@gmail.com" />
                        <button
                            class="absolute end-1 top-1/2 -translate-y-1/2 rounded-full bg-purple-600 px-5 py-3 text-sm font-medium text-white transition hover:bg-[#511289]">
                            Subscribe
                        </button>
                    </div>
                </form>
            </div>

            <div class="mt-16 grid grid-cols-1 gap-8 lg:grid-cols-2 lg:gap-32">
                <div class="mx-auto max-w-sm lg:max-w-none">
                    <p class="mt-4 text-center text-white lg:text-left lg:text-lg">
                        Welcome to our Auction Management System! Whether you're a seasoned bidder or new to the world of
                    auctions, our platform offers you a seamless experience to discover, bid, and win exciting items.
                    </p>

                    <div class="mt-6 flex justify-center gap-4 lg:justify-start">
                        <a class="text-white transition hover:text-purple-500" href="#" target="_blank" rel="noreferrer">
                            <span class="sr-only">Facebook </span>

                            <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                                <path fill-rule="evenodd"
                                    d="M22 12c0-5.523-4.477-10-10-10S2 6.477 2 12c0 4.991 3.657 9.128 8.438 9.878v-6.987h-2.54V12h2.54V9.797c0-2.506 1.492-3.89 3.777-3.89 1.094 0 2.238.195 2.238.195v2.46h-1.26c-1.243 0-1.63.771-1.63 1.562V12h2.773l-.443 2.89h-2.33v6.988C18.343 21.128 22 16.991 22 12z"
                                    clip-rule="evenodd" />
                            </svg>
                        </a>

                        <a class="text-white transition hover:text-purple-500" href="#" target="_blank" rel="noreferrer">
                            <span class="sr-only">Instagram </span>

                            <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                                <path fill-rule="evenodd"
                                    d="M12.315 2c2.43 0 2.784.013 3.808.06 1.064.049 1.791.218 2.427.465a4.902 4.902 0 011.772 1.153 4.902 4.902 0 011.153 1.772c.247.636.416 1.363.465 2.427.048 1.067.06 1.407.06 4.123v.08c0 2.643-.012 2.987-.06 4.043-.049 1.064-.218 1.791-.465 2.427a4.902 4.902 0 01-1.153 1.772 4.902 4.902 0 01-1.772 1.153c-.636.247-1.363.416-2.427.465-1.067.048-1.407.06-4.123.06h-.08c-2.643 0-2.987-.012-4.043-.06-1.064-.049-1.791-.218-2.427-.465a4.902 4.902 0 01-1.772-1.153 4.902 4.902 0 01-1.153-1.772c-.247-.636-.416-1.363-.465-2.427-.047-1.024-.06-1.379-.06-3.808v-.63c0-2.43.013-2.784.06-3.808.049-1.064.218-1.791.465-2.427a4.902 4.902 0 011.153-1.772A4.902 4.902 0 015.45 2.525c.636-.247 1.363-.416 2.427-.465C8.901 2.013 9.256 2 11.685 2h.63zm-.081 1.802h-.468c-2.456 0-2.784.011-3.807.058-.975.045-1.504.207-1.857.344-.467.182-.8.398-1.15.748-.35.35-.566.683-.748 1.15-.137.353-.3.882-.344 1.857-.047 1.023-.058 1.351-.058 3.807v.468c0 2.456.011 2.784.058 3.807.045.975.207 1.504.344 1.857.182.466.399.8.748 1.15.35.35.683.566 1.15.748.353.137.882.3 1.857.344 1.054.048 1.37.058 4.041.058h.08c2.597 0 2.917-.01 3.96-.058.976-.045 1.505-.207 1.858-.344.466-.182.8-.398 1.15-.748.35-.35.566-.683.748-1.15.137-.353.3-.882.344-1.857.048-1.055.058-1.37.058-4.041v-.08c0-2.597-.01-2.917-.058-3.96-.045-.976-.207-1.505-.344-1.858a3.097 3.097 0 00-.748-1.15 3.098 3.098 0 00-1.15-.748c-.353-.137-.882-.3-1.857-.344-1.023-.047-1.351-.058-3.807-.058zM12 6.865a5.135 5.135 0 110 10.27 5.135 5.135 0 010-10.27zm0 1.802a3.333 3.333 0 100 6.666 3.333 3.333 0 000-6.666zm5.338-3.205a1.2 1.2 0 110 2.4 1.2 1.2 0 010-2.4z"
                                    clip-rule="evenodd" />
                            </svg>
                        </a>

                        <a class="text-white transition hover:text-purple-500" href="#" target="_blank" rel="noreferrer">
                            <span class="sr-only">GitHub </span>

                            <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                                <path fill-rule="evenodd"
                                    d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"
                                    clip-rule="evenodd" />
                            </svg>
                        </a>

                        <a class="text-white transition hover:text-purple-500" href="#" target="_blank" rel="noreferrer">
                            <span class="sr-only">LinkedIn</span>
                            <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="25" height="25" viewBox="0,0,256,256">
                                <g fill="#ffffff" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" style="mix-blend-mode: normal">
                                    <g transform="scale(5.12,5.12)">
                                        <path d="M41,4h-32c-2.76,0 -5,2.24 -5,5v32c0,2.76 2.24,5 5,5h32c2.76,0 5,-2.24 5,-5v-32c0,-2.76 -2.24,-5 -5,-5zM17,20v19h-6v-19zM11,14.47c0,-1.4 1.2,-2.47 3,-2.47c1.8,0 2.93,1.07 3,2.47c0,1.4 -1.12,2.53 -3,2.53c-1.8,0 -3,-1.13 -3,-2.53zM39,39h-6c0,0 0,-9.26 0,-10c0,-2 -1,-4 -3.5,-4.04h-0.08c-2.42,0 -3.42,2.06 -3.42,4.04c0,0.91 0,10 0,10h-6v-19h6v2.56c0,0 1.93,-2.56 5.81,-2.56c3.97,0 7.19,2.73 7.19,8.26z"></path>
                                    </g>
                                </g>
                            </svg>
                        </a>


                    </div>
                </div>

                <div class="grid grid-cols-1 gap-8 text-center lg:grid-cols-3 lg:text-left">
                    <div>
                        <strong class="font-medium text-lg text-white">Services</strong>
                        <ul class="mt-6 space-y-1">
                            <li>
                                <a class="text-purple-50 transition hover:text-purple-500" href="#">Browse Auction Listings</a>
                            </li>
                            <li>
                                <a class="text-purple-50 transition hover:text-purple-500" href="#">Place Bids on Items</a>
                            </li>
                            <li>
                                <a class="text-purple-50 transition hover:text-purple-500" href="#">Track Auctions and Bids</a>
                            </li>
                            <li>
                                <a class="text-purple-50 transition hover:text-purple-500" href="#">Manage Account and Payment</a>
                            </li>
                        </ul>
                    </div>

                    <div>
                        <strong class="font-medium text-lg text-white">About Us</strong>
                        <ul class="mt-6 space-y-1">
                            <li>
                                <a class="text-purple-50 transition hover:text-purple-500" href="#">How it's Work</a>
                            </li>
                            <li>
                                <a class="text-purple-50 transition hover:text-purple-500" href="#">Company Overview</a>
                            </li>
                            <li>
                                <a class="text-purple-50 transition hover:text-purple-500" href="#">Our Mission</a>
                            </li>
                            <li>
                                <a class="text-purple-50 transition hover:text-purple-500" href="#">Our Team</a>
                            </li>
                        </ul>

                    </div>

                    <div>
                        <strong class="font-medium text-lg text-white">Support </strong>

                        <ul class="mt-6 space-y-1">
                            <li>
                                <a class="text-purple-50 transition hover:text-purple-500" href="#">FAQs </a>
                            </li>

                            <li>
                                <a class="text-purple-50 transition hover:text-purple-500" href="#">Contact </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="mt-16 border-t border-gray-100 pt-8">
                <p class="text-center text-xs/relaxed text-white">
                    © 2024 Auction Management System. All rights reserved.<br />
                    Powered by
                <a href="#" class="text-white underline transition hover:text-purple-500">KH-Security & Devlopment.</a>
                </p>
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
