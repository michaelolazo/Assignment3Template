<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="CategoriesPage.aspx.cs" Inherits="A3WebApplication.CategoriesPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <link href="Styles/picturestuff.css " class="img" rel="stylesheet" />
    <asp:DataList ID="dlCategories" OnItemCommand="dlCategories_ItemCommand" RepeatColumns="2" DataKeyField="CategoryID"
        CssClass="img" runat="server" Height="300px" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="3" GridLines="Both">
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"></FooterStyle>
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White"></HeaderStyle>
        <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510"></ItemStyle>
        <ItemTemplate>
            <div class="picturestuff" runat="server">
                <link href="Styles/picturestuff.css" class="img" rel="stylesheet" />
                <b>CategoryID</b> <%#Eval("CategoryID") %><br />
                <b>Name</b> <%#Eval("Name") %><br />
                <b>ImagePath</b> <%#Eval("ImagePath") %>
                <asp:ImageButton runat="server" CommandName="CategoryID" CommandArgument='<%#Eval("CategoryID") %>'
                    ImageUrl='<%# "Images/" + Eval("ImagePath") %>' Height="100" Width="100" />
            </div>
        </ItemTemplate>
        <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White"></SelectedItemStyle>
    </asp:DataList>
    

<%--     TODO: 
    - Show the categories in a DataList (2 MARKS)
    - Make each category a clickable link (2 MARKS) 
        (should redirect to the ProductsPage with a query string of the CategoryID clicked on.
        Example: If you click on Category 2, redirect to ProductsPage.aspx?CategoryID=2)
    - Show each category as an image (1 MARK)--%>
</asp:Content>
