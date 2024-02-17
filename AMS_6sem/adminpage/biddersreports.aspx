<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="biddersreports.aspx.cs" Inherits="AMS_6sem.adminpage.biddersreports" %>

<div class="container mx-auto p-8 font-sans">
    <h2 class="text-4xl font-semibold mb-4 text-center">Bidders Reports</h2>
    <div class="overflow-x-auto">
        <table class="min-w-full bg-white border rounded-md overflow-hidden shadow-md">
            <thead class="bg-purple-700 text-white text-center">
                <tr>
                    <th class="py-3 px-6">Image</th>
                    <th class="py-3 px-6">Full Name</th>
                    <th class="py-3 px-6">Contact No</th>
                    <th class="py-3 px-6">Email</th>
                    <th class="py-3 px-6">Status</th>
                    <th class="py-3 px-6">Action</th>
                </tr>
            </thead>
            <tbody class="bg-purple-200"> 

                <tr class="text-center">
                    <td class="py-4 px-6">
                        <img src="https://cdn.pixabay.com/photo/2018/08/28/13/29/avatar-3637561_1280.png" alt="User Image" class="w-10 h-10 object-cover rounded-full">
                    </td>
                    <td class="py-4 px-6">John Doe</td>
                    <td class="py-4 px-6">1234567890</td>
                    <td class="py-4 px-6">john.doe@example.com</td>
                    <td class="py-4 px-6">
                        <span class="bg-green-500 text-white py-1 px-3 rounded-md inline-block">Approved</span>
                    </td>
                    <td class="py-4 px-6">
                        <button onclick="showUserDetails('John Doe', '1234567890', 'john.doe@example.com', 'Approved');" class="ml-2 bg-blue-500 text-white py-1 px-3 rounded-md">Details</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div id="userDetailsModal" class="fixed inset-0 z-50 bg-black bg-opacity-50 hidden flex items-center justify-center">
        <div class="bg-white w-full max-w-md p-6 rounded-md shadow-md">
            <div class="flex items-center justify-between mb-4">
                <h2 class="text-2xl font-semibold">User Details</h2>
                <button onclick="closeUserDetailsModal()" class="text-gray-600 hover:text-gray-800 focus:outline-none">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                    </svg>
                </button>
            </div>

            <img src="https://cdn.pixabay.com/photo/2018/08/28/13/29/avatar-3637561_1280.png" alt="User Image" class="mx-auto w-32 h-32 rounded-full mb-4">

            <p class="mb-2"><strong>Full Name:</strong> <span id="fullName"></span></p>
            <p class="mb-2"><strong>Contact No:</strong> <span id="contactNo"></span></p>
            <p class="mb-2"><strong>Email:</strong> <span id="email"></span></p>
            <p class="mb-4"><strong>Status:</strong> <span id="status"></span></p>

            <button onclick="closeUserDetailsModal()" class="bg-gray-500 text-white py-2 px-4 rounded-md mr-2 hover:bg-gray-600 focus:outline-none">Close</button>
            <button onclick="rejectUser()" class="bg-red-500 text-white py-2 px-4 rounded-md hover:bg-red-600 focus:outline-none">Reject</button>
        </div>
    </div>

    <script>
        function showUserDetails(fullName, contactNo, email, status) {
            document.getElementById('fullName').innerText = fullName;
            document.getElementById('contactNo').innerText = contactNo;
            document.getElementById('email').innerText = email;
            document.getElementById('status').innerText = status;

            document.getElementById('userDetailsModal').classList.remove('hidden');
        }

        function closeUserDetailsModal() {
            document.getElementById('userDetailsModal').classList.add('hidden');
        }

        function rejectUser(fullName) {
            // Perform backend action to change user status to "Rejected"
            // (This is just a client-side example; in a real application, you would make a server-side call)
            alert(fullName + ' has been rejected.');
        }
    </script>
</div>
