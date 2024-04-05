<%@ Page Title="AMS | Index Page" Language="C#" MasterPageFile="~/navfooter.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="AMS_6sem.index" %>

<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <a href="#live-section" class="nav-link">Live Auction<span class="active-underline"></span></a>
    <a href="#upcoming-section" class="nav-link">Upcomming Item's<span class="active-underline"></span></a>
    <%--<a href="#contact-section" class="nav-link">Contact us<span class="active-underline"></span></a>--%>
    <a href="Login.aspx" class="nav-link">Login</a>
    <a href="Registration.aspx" class="nav-link">Registration</a>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <%--<body class="font-sans bg-gray-100">--%>
    <section class="container mx-auto p-8 section" id="home-section">
        <div class="flex flex-wrap items-center justify-center">
            <div class="w-full md:w-1/2 lg:w-1/2 p-4">
                <div class="flex flex-col items-start justify-center h-full ftco-animate fadeInUp ftco-animated">
                    <span class="text-black text-3xl mt-3">Welcome !</span>
                    <h1 class="text-4xl md:text-5xl lg:text-6xl font-bold text-purple-800 my-4">Auction <span class="text-black">Managment System </span></h1>
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
                <img src="img/index_img/home.png" alt="Your Image" class="w-full h-auto rounded-md mb-4" />
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
                <p class="text-gray-900"><span class="font-medium">Details:</span> <%= reader["ProductDescription"] %></p>
                <p class="text-gray-800"><span class="font-medium">Price Interval:</span> <%= reader["ProductPriceInterval"] %></p>
                <p class="text-gray-800"><span class="font-medium">Min Price:</span> <%= reader["MinPrice"] %></p>
                <p class="text-gray-800"><span class="font-medium">Auction Start Time:</span> <%= ((DateTime)reader["AuctionStartTime"]).ToString("dd-MM-yyyy HH:mm:ss") %></p>
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
                        <img class="w-16 h-16 object-cover rounded-full border-2 border-purple-800 p-1" src="img/index_img/w1.png" alt="work-img" />
                        <span class="absolute top-0 left-0 transform -translate-x-2/3 -translate-y-2/3 inline-block w-8 h-8 text-center leading-8 bg-purple-800 text-white font-semibold rounded-full">01</span>
                    </div>
                    <div class="content mt-4 text-center">
                        <h5 class="text-lg font-semibold text-purple-900">Register for free</h5>
                        <p class="text-[#553c6c]">To start using our auction, you’ll need to register. It’s completely free and requires just a few clicks!</p>
                    </div>
                </div>
                <div class="work-item flex flex-col items-center">
                    <div class="relative">
                        <img class="w-16 h-16 object-cover rounded-full border-2 border-purple-800 p-1" src="img/index_img/w2.png" alt="work-img" />
                        <span class="absolute top-0 left-0 transform -translate-x-2/3 -translate-y-2/3 inline-block w-8 h-8 text-center leading-8 bg-purple-800 text-white font-semibold rounded-full">02</span>
                    </div>
                    <div class="content mt-4 text-center">
                        <h5 class="text-lg font-semibold text-purple-900">Buy or Bid</h5>
                        <p class="text-[#553c6c]">To start using our auction, you’ll need to register. It’s completely free and requires just a few clicks!</p>
                    </div>
                </div>
                <div class="work-item flex flex-col items-center">
                    <div class="relative">
                        <img class="w-16 h-16 object-cover rounded-full border-2 border-purple-800 p-1" src="img/index_img/w3.png" alt="work-img" />
                        <span class="absolute top-0 left-0 transform -translate-x-2/3 -translate-y-2/3 inline-block w-8 h-8 text-center leading-8 bg-purple-800 text-white font-semibold rounded-full">03</span>
                    </div>
                    <div class="content mt-4 text-center">
                        <h5 class="text-lg font-semibold text-purple-900">Submit a Bid</h5>
                        <p class="text-[#553c6c]">To start using our auction, you’ll need to register. It’s completely free and requires just a few clicks!</p>
                    </div>
                </div>
                <div class="work-item flex flex-col items-center">
                    <div class="relative">
                        <img class="w-16 h-16 object-cover rounded-full border-2 border-purple-800 p-1" src="img/index_img/w4.png" alt="work-img" />
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
</asp:Content>
