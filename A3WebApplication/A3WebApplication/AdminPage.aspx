<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="A3WebApplication.AdminPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <br />
    <link href="Styles/picturestuff.css" class="img" rel="stylesheet" />
    <asp:GridView ID="gvAdminProducts" CssClass="img" AutoGenerateColumns="false"
        OnRowCommand="gvAdminProducts_RowCommand"
        DataKeyNames="ProductID" OnRowEditing="gvAdminProducts_RowEditing"
        OnRowDeleting="gvAdminProducts_RowDeleting" OnRowCancelingEdit="gvAdminProducts_RowCancelingEdit"
        OnRowUpdating="gvAdminProducts_RowUpdating" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
        <Columns>
            <%--            <asp:TemplateField InsertVisible="false" SortExpression="DeleteProduct" />--%>
            <asp:ButtonField CommandName="DeleteProduct" ButtonType="Button" Text="Delete " />
            <asp:ButtonField CommandName="UpdateProduct" InsertVisible="false" ButtonType="Button" Text="Update " />
            <asp:ButtonField CommandName="Edit" ButtonType="Button" Text="Edit " />
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:BoundField DataField="Price" HeaderText="Price" />
            <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" />
            <asp:BoundField DataField="PrimaryImagePath" HeaderText="ImagePath" />
            <asp:ImageField DataImageUrlField="PrimaryImagePath" HeaderText="Image"
                DataImageUrlFormatString="images/{0}" ControlStyle-Height="100px" ControlStyle-Width="100px" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC"></FooterStyle>

        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White"></HeaderStyle>

        <PagerStyle HorizontalAlign="Left" BackColor="#CCCCCC" ForeColor="Black"></PagerStyle>

        <RowStyle BackColor="White"></RowStyle>

        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

        <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

        <SortedAscendingHeaderStyle BackColor="#808080"></SortedAscendingHeaderStyle>

        <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

        <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
    </asp:GridView>
    <asp:Label ID="lblMessage" Text="" Visible="false" runat="server" />
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
