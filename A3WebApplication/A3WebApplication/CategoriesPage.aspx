<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="CategoriesPage.aspx.cs" Inherits="A3WebApplication.CategoriesPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <link href="Styles/picturestuff.css " class="img" rel="stylesheet" />
    <asp:DataList ID="dlCategories" RepeatColumns="2" DataKeyField="CategoryID"
        CssClass="img" OnItemCommand="dlCategories_ItemCommand" runat="server" Height="205px">
        <ItemTemplate>
            <div class="img" runat="server">
                <link href="Styles/picturestuff.css" class="img" rel="stylesheet" />
                <b>CategoryID</b> <%#Eval("CategoryID")%><br />
                <b>Name</b> <%#Eval("Name") %><br />
                <b>ImagePath</b> 
                <asp:Image  ID="img1" ImageUrl="~/Images/grounded.jpg" CssClass="img" runat="server" />
                <asp:Image ID="imgCategory" ImageUrl='~/Images/mage.png' CssClass="img" runat="server" />
            </div>
        </ItemTemplate>
    </asp:DataList>


<%--     TODO: 
    - Show the categories in a DataList (2 MARKS)
    - Make each category a clickable link (2 MARKS) 
        (should redirect to the ProductsPage with a query string of the CategoryID clicked on.
        Example: If you click on Category 2, redirect to ProductsPage.aspx?CategoryID=2)
    - Show each category as an image (1 MARK)--%>
</asp:Content>
