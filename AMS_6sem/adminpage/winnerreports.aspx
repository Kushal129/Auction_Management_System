<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="winnerreports.aspx.cs" Inherits="AMS_6sem.adminpage.winnerreports" %>

<div class="overflow-x-auto">
    <h2 class="text-4xl font-semibold mb-4 text-center">Winner Reports</h2>
    <table class="min-w-full bg-white border rounded-md overflow-hidden shadow-md">
        <thead class="bg-purple-700 text-white">
            <tr>
                <th class="py-3 px-6">Image</th>
                <th class="py-3 px-6">Winner Name</th>
                <th class="py-3 px-6">Contact</th>
                <th class="py-3 px-6">Product</th>
                <th class="py-3 px-6">Winning Price</th>
                <th class="py-3 px-6">Tracking ID</th>
            </tr>
        </thead>
        <tbody class="bg-purple-200 text-center">
            <tr>
                <td class="py-4 px-6">
                    <img src="winner_image.jpg" alt="Winner Image" class="w-16 h-16 object-cover rounded-md">
                </td>
                <td class="py-4 px-6">Jane Doe</td>
                <td class="py-4 px-6">9876543210</td>
                <td class="py-4 px-6">Product B</td>
                <td class="py-4 px-6">₨ 200</td>
                <td class="py-4 px-6">TRK123456</td>
            </tr>

        </tbody>
    </table>
</div>
