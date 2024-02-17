<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="productsreports.aspx.cs" Inherits="AMS_6sem.adminpage.productsreports" %>


<div id="productTable" class="overflow-x-auto">
<h2 class="text-4xl font-semibold mb-4 text-center">Products Reports</h2>
    <table class="min-w-full bg-purple-200 border rounded-md overflow-hidden shadow-md">
        <thead class="bg-purple-700 text-white text-center">
            <tr>
                <th class="py-3 px-6">Product Name</th>
                <th class="py-3 px-6">Image</th>
                <th class="py-3 px-6">Category</th>
                <th class="py-3 px-6">Price</th>
                <th class="py-3 px-6">Start Date/Time</th>
                <th class="py-3 px-6">Action</th>
            </tr>
        </thead>
        <tbody class="text-center bg-purple-200">
            <tr>
                <td class="py-4 px-6">Product A</td>
                <td class="py-4 px-6">
                    <img src="product_image.jpg" alt="Product Image" class="w-16 h-16 object-cover rounded-md">
                </td>
                <td class="py-4 px-6">Category A</td>
                <td class="py-4 px-6">₨ 100</td>
                <td class="py-4 px-6">2024-02-20 14:30:00</td>
                <td class="py-4 px-6">
                    <span class="bg-green-500 text-white py-1 px-3 rounded-md inline-block">Upcoming</span>
                    <button class="ml-2 bg-red-500 text-white py-1 px-3 rounded-md">Delete</button>
                    <button onclick="loadProductDetails('adminpage/productdetails.aspx');" class="ml-2 bg-blue-500 text-white py-1 px-3 rounded-md">Details</button>
                </td>
            </tr>
        </tbody>
    </table>
</div>

<div id="productDetailsContainer" class="mt-4"></div>

<script>
    function loadProductDetails(url) {
        $('#productTable').hide();

        $.ajax({
            url: url,
            type: 'GET',
            success: function (data) {
                $('#productDetailsContainer').html(data);
            }
        });
    }

</script>