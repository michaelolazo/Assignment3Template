﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="ProductsPage.aspx.cs" Inherits="A3WebApplication.ProductsPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server"> 
    <asp:DataList ID="dlProducts" runat="server" OnItemCommand="dlProducts_ItemCommand">
        <ItemTemplate>
            <asp:DataList ID="dlProducts" runat="server"></asp:DataList>
  <%--          4 MARKS TOTAL
            1 BONUS MARK TOTAL
            TODO:
            - 2 MARKS: Display a DataList of Products with basic information provided (Name/Price)
            - 1 MARK: Also display the product Image
            - 1 MARK: Make a button to "Add to Cart", this will fire the dlProducts_ItemCommand event (see code behind)
            - BONUS 1 MARK: Make a drop down for quantity (used in code behind).--%>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
