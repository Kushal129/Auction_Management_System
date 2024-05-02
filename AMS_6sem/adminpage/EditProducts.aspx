<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="EditProducts.aspx.cs" Inherits="AMS_6sem.adminpage.EditProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="p-8 bg-white rounded-md shadow-md mt-8">
        <h2 class="text-2xl font-semibold text-gray-800 mb-4">Edit Product</h2>
        <form runat="server">
            <div class="form-group">
                <label class="block text-gray-700 font-bold mb-2" for="txtProductNameEdit">Product Name:</label>
                <asp:TextBox ID="txtProductNameEdit" runat="server" CssClass="form-control w-100 rounded-md"></asp:TextBox>
                <asp:RegularExpressionValidator ID="ValidatorProductName" runat="server" ControlToValidate="txtProductNameEdit"
                    ErrorMessage="Product Name cannot contain special characters." ValidationExpression="^[a-zA-Z0-9\s-]*$"
                    ValidationGroup="ProductValidationGroup"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <label class="block text-gray-700 font-bold mb-2" for="txtProductDescription">Product Description:</label>
                <asp:TextBox ID="txtProductDescription" runat="server" CssClass="form-control form-control w-100 rounded-md" TextMode="MultiLine" Rows="4"></asp:TextBox>
            </div>
            <div class="form-group">
                <label class="block text-gray-700 font-bold mb-2" for="fileUploadProductImage">Product Image:</label>
                <asp:Image ID="imgProductImage" runat="server" CssClass="w-32 h-32 object-cover rounded-xl" />
                <asp:FileUpload ID="fileUploadProductImage" runat="server" CssClass="block w-full m-3 text-sm text-gray-500 file:mr-4 file:py-2 file:px-4 file:rounded-full file:border-0 file:text-sm file:font-semibold file:bg-purple-50 file:text-purple-700 hover:file:bg-purple-100" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Only JPG, JPEG, or PNG files are allowed." ControlToValidate="fileUploadProductImage" ValidationExpression="^.*\.(jpg|JPG|jpeg|JPEG|png|PNG)$"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <label class="block text-gray-700 font-bold mb-2" for="txtProductPriceInterval">Product Price Interval:</label>
                <asp:TextBox ID="txtProductPriceInterval" runat="server" CssClass="form-control form-control w-100 rounded-md"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ValidatorProductPriceInterval" runat="server"
                    ControlToValidate="txtProductPriceInterval" ErrorMessage="Product Price Interval is required."
                    ValidationGroup="ProductValidationGroup"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="numberValidatorProductPriceInterval" runat="server"
                    ControlToValidate="txtProductPriceInterval" ErrorMessage="Product Price Interval must be a non-zero number."
                    ValidationExpression="^(?!0+(\.0+)?$)\d+(\.\d{1,2})?$" ValidationGroup="ProductValidationGroup">
                </asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <label class="block text-gray-700 font-bold mb-2" for="txtMinPrice">Min Price:</label>
                <asp:TextBox ID="txtMinPrice" runat="server" CssClass="form-control form-control w-100 rounded-md"></asp:TextBox>
                <asp:RegularExpressionValidator ID="miniValidatValidatorProduct" runat="server" ControlToValidate="txtMinPrice"
                    ErrorMessage="Product Price must be a non-zero number." ValidationExpression="^(?!0+(\.0+)?$)\d+(\.\d{1,2})?$"
                    ValidationGroup="ProductValidationGroup">
                </asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <label class="block text-gray-700 font-bold mb-2" for="txtAuctionStartTime">Auction Start Time:</label>
                <asp:TextBox ID="txtAuctionStart" runat="server" CssClass="form-control form-control w-100 rounded-md"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidatorAuctionStartTime" runat="server" ControlToValidate="txtAuctionStart"
                    ErrorMessage="Auction Start Time cannot be earlier than the current time." OnServerValidate="CustomValidatorAuctionStartTime_ServerValidate"
                    ValidationGroup="AuctionValidationGroup"></asp:CustomValidator>
            </div>
            
            <div class="form-group">
                <label class="block text-gray-700 font-bold mb-2" for="txtAuctionEndTime">Auction End Time:</label>
                <asp:TextBox ID="txtAuctionEnd" runat="server" CssClass="form-control form-control w-100 rounded-md"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidatorAuctionTime" runat="server" ControlToValidate="txtAuctionEnd"
                    ErrorMessage="Auction End Time must be after Auction Start Time" OnServerValidate="CustomValidatorAuctionTime_ServerValidate"
                    ValidationGroup="AuctionValidationGroup"></asp:CustomValidator>
            </div>


            <div class="flex justify-end mt-4">
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" CssClass="btn m-2 border-purple-300 bg-purple-200 hover:bg-purple-600" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="btn m-2 border-red-300 bg-red-200 hover:bg-red-600" />
            </div>
        </form>
    </div>


</asp:Content>
