<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="productdetails.aspx.cs" Inherits="AMS_6sem.adminpage.productdetails" %>

    <div class="container mx-auto p-8 font-sans">
    <h2 class="text-4xl font-semibold mb-4 text-center">Product Details</h2>
        <div class="flex">
            <div class="w-1/2">
                <img src="https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-math-90946.jpg&fm=jpg" alt="Product Image" class="w-full h-auto">
            </div>

            <div class="w-1/2 p-4">
                <h3 class="text-xl font-semibold mb-2">Product Information</h3>
                <p><strong>Auction ID:</strong> 123456</p>
                <p><strong>Name:</strong> Product A</p>
                <p><strong>Category:</strong> Category A</p>
                <p><strong>Start Price:</strong>₨ 100</p>
                <p><strong>Final Price:</strong>₨ 150</p>
                <p><strong>Bid Price:</strong>₨ 120</p>
                <button onclick="loadProductDetails('adminpage/productsreports.aspx');" class="mt-4 bg-blue-500 text-white py-2 px-4 rounded-md">Back to Admin</button>
            </div>
        </div>

        <div class="mt-8">
            <h3 class="text-xl font-semibold mb-4">Product Specifications</h3>
            <p><strong>Status:</strong> Live</p>
        </div>
    </div>

    <script>
        function loadProductDetails(url) {
            $.ajax({
                url: url,
                type: 'GET',
                success: function (data) {
                    $('#productDetailsContainer').html(data);
                }
            });
        }
    </script>