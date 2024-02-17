<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="participantsreports.aspx.cs" Inherits="AMS_6sem.adminpage.participantsreports" %>

<h2 class="text-4xl font-semibold mb-4 text-center">Participants Reports</h2>
<div class="overflow-x-auto">
    <table class="min-w-full bg-purple-100 border rounded-md overflow-hidden shadow-md">
        <thead class="bg-purple-700 text-white text-center">
            <tr>
                <th class="py-3 px-6">Image</th>
                <th class="py-3 px-6">Full Name</th>
                <th class="py-3 px-6">Contact</th>
                <th class="py-3 px-6">Email</th>
                <th class="py-3 px-6">Product</th>
                <th class="py-3 px-6">Start Date/Time</th>
                <th class="py-3 px-6">Action</th>
            </tr>
        </thead>
        <tbody class="bg-purple-200 text-center ">
            <tr>
                <td class="py-4 px-6">
                    <img src="participant_image.jpg" alt="Participant Image" class="w-16 h-16 object-cover rounded-md">
                </td>
                <td class="py-4 px-6">John Doe</td>
                <td class="py-4 px-6">1234567890</td>
                <td class="py-4 px-6">john.doe@example.com</td>
                <td class="py-4 px-6">Product A</td>
                <td class="py-4 px-6">2024-02-20 14:30:00</td>
                <td class="py-4 px-6">
                    <button class="ml-2 bg-red-500 text-white py-1 px-3 rounded-md" onclick="deleteParticipant('participantId')">Delete</button>
                </td>
            </tr>
        </tbody>
    </table>
</div>

<script>
    function deleteParticipant(participantId) {
        // Add logic to delete participant with the specified ID
        // You can use AJAX to communicate with the server to perform the deletion
        // For demonstration purposes, you can alert or console.log the participantId
        alert('Deleting participant with ID: ' + participantId);
    }
</script>
