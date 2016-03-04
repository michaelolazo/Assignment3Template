<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="A3WebApplication.AdminPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <br />
    <link href="Styles/picturestuff.css" class="img" rel="stylesheet" />
    <asp:GridView ID="gvAdminProducts" CssClass="img" AutoGenerateColumns="false"
         OnRowCommand="gvAdminProducts_RowCommand" DataKeyNames="ProductID" OnRowDeleting="gvAdminProducts_RowDeleting" runat="server">
        <Columns>
            <asp:ButtonField CommandName="Delete" ButtonType="Button" Text="Delete " />
            <asp:ButtonField CommandName="Update" ButtonType="Button" Text="Update " />
            <asp:ButtonField CommandName="Edit" ButtonType="Button" Text="Edit " />
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:BoundField DataField="Price" HeaderText="Price" />
            <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" />
            <asp:BoundField DataField="PrimaryImagePath" HeaderText="ImagePath" />
            <asp:ImageField DataImageUrlField="PrimaryImagePath" HeaderText="Image" DataImageUrlFormatString="images/{0}" ItemStyle-Height="75px" ItemStyle-Width="75px" />  
        </Columns>
    </asp:GridView>
    <%--    17 MARKS TOTAL
    1 BONUS MARK TOTAL
    TODO:  Impliment CRUD operations for Product as an admin.
    - 2 MARKS: Display all products with all column information
    - 1 MARK: Hide the ProductID columns
    - 2 MARKS: Allow edit
    - 2 MARKS: Allow delete (BONUS 1 MARK: provided error message for FOREGIN KEY CONSTRAINT ISSUES)
    - 2 MARKS: Allow insert
    - 2 MARKS: Provide Validation for input when inserting
    - 1 MARK: Ensure Image Upload works for insert
    - 1 MARK: Ensure Image Upload works for update (default to old image value if no new image is provided)
    - 2 MARKS: Manual Sorting by one or more columns (you do not need to do all columns)
    - 2 MARKS: Manual Paging  create a gridview binded to product table with functioning crud operations--%>
</asp:Content>
