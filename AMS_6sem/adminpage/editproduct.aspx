<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="editproduct.aspx.cs" Inherits="AMS_6sem.adminpage.editproduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="p-8 bg-white rounded-md shadow-md mt-8">
        <h2 class="text-2xl font-semibold text-gray-800 mb-4">Edit Product</h2>
        <form runat="server">
            <asp:FormView ID="formViewEditProduct" runat="server" DefaultMode="Edit" OnItemUpdated="formViewEditProduct_ItemUpdated" OnItemCommand="formViewEditProduct_ItemCommand">
                <EditItemTemplate>
                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <div class="form-group">
                            <label class="block text-gray-700 font-bold mb-2" for="productName">Product Name:</label>
                            <asp:TextBox ID="txtProductName" runat="server" class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" Text='<%# Bind("ProductName") %>'></asp:TextBox>

                        </div>
                        <div class="form-group">
                            <label class="block text-gray-700 font-bold mb-2" for="productDescription">Product Description:</label>
                            <asp:TextBox ID="txtProductDescription" runat="server" class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" TextMode="MultiLine" Rows="4" Text='<%# Bind("ProductDescription") %>'></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="block text-gray-700 font-bold mb-2" for="productImage">Product Image:</label>
                            <asp:Image ID="imgProductImage" runat="server" ImageUrl='<%# ResolveUrl("~/Uploads/product_img/") + Eval("FileName") %>' class="w-16 h-16 object-cover rounded-full" />
                            <asp:FileUpload ID="fileUploadProductImage" runat="server" class="block w-full text-sm text-gray-500 file:mr-4 file:py-2 file:px-4 file:rounded-full file:border-0 file:text-sm file:font-semibold file:bg-blue-50 file:text-blue-700 hover:file:bg-blue-100" />
                        </div>
                        <div class="form-group">
                            <label class="block text-gray-700 font-bold mb-2" for="productPriceInterval">Product Price Interval:</label>
                            <asp:TextBox ID="txtProductPriceInterval" runat="server" class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" Text='<%# Bind("ProductPriceInterval") %>'></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="block text-gray-700 font-bold mb-2" for="minPrice">Min Price:</label>
                            <asp:TextBox ID="txtMinPrice" runat="server" class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" Text='<%# Bind("MinPrice") %>'></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="block text-gray-700 font-bold mb-2" for="auctionStartTime">Auction Start Time:</label>
                            <asp:TextBox ID="txtAuctionStartTime" runat="server" class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" Text='<%# Bind("AuctionStartTime") %>'></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="block text-gray-700 font-bold mb-2" for="auctionEndTime">Auction End Time:</label>
                            <asp:TextBox ID="txtAuctionEndTime" runat="server" class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" Text='<%# Bind("AuctionEndTime") %>'></asp:TextBox>
                        </div>
                    </div>
                    <div class="flex justify-end mt-4">
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" CommandName="Update" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" CommandName="Cancel" />
                    </div>
                </EditItemTemplate>
            </asp:FormView>
        </form>
    </div>
</asp:Content>