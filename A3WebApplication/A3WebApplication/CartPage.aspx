<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="CartPage.aspx.cs" Inherits="A3WebApplication.CartPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    Cart Page
    <asp:DataList ID="dlCartFam" 
           RepeatColumns="2" DataKeyField="CategoryID"
        CssClass="img" runat="server" Height="250px" Width="250px" BackColor="#CCCCCC" BorderColor="#999999"
        BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" GridLines="Both" ForeColor="Black">
        <FooterStyle BackColor="#CCCCCC"></FooterStyle>

<HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White"></HeaderStyle>

<ItemStyle BackColor="White"></ItemStyle>
        <ItemTemplate>  
            ProductID
            <asp:Label runat="server" Text='<%#Eval("ProductID") %>' /><br />
            Name
            <asp:Label runat="server" Text='<%#Eval("Name") %>' /><br />
            Price 
            <asp:Label runat="server" Text='<%#Eval("Price") %>' /><br />
            Quantity
            <asp:Label runat="server" Text='<%#Eval("Quantity") %>' /><br />
            Subtotal 
            <asp:Label runat="server" Text='<%#Eval("Subtotal") %>' /><br />
            <asp:Image runat="server"
                ImageUrl='<%# "Images/" + Eval("PrimaryImagePath") %>' Height="125" Width="125" />
        </ItemTemplate>
    <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White"></SelectedItemStyle>
</asp:DataList>
    <asp:Button ID="btnClearCart" runat="server" OnClick="btnClearCart_Click" Text="Clear Cart" />]
    <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID">
        <Columns>
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" ReadOnly="True" InsertVisible="False" SortExpression="ProductID"></asp:BoundField>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price"></asp:BoundField>
            <asp:BoundField DataField="PrimaryImagePath" HeaderText="PrimaryImagePath" SortExpression="PrimaryImagePath"></asp:BoundField>
            <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <%-- 17 MARKS TOTAL
    - BONUS 1 MARK: Show images on each rowm
    1 BONUS MARK TOTAL
    TODO:
    - 2 MARKS: Show a GridView of the ShoppingCart CartItems.
    - 5 MARKS: Add functionality to Update the quantity of an item or all ites in cart
    - 5 MARKS: Add functionality to Remove an item from the cart
    - 3 MARKS: Add Functionality to remove ALL items from the cart at once
    - 2 MARKS: Add functionality to check out (no need for payment page, assume they already have put in proper payment, just save to database that the order is complete!)--%>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:dbA3ConnStr %>' DeleteCommand="spDeleteProduct" DeleteCommandType="StoredProcedure" InsertCommand="spInsertProduct" InsertCommandType="StoredProcedure" SelectCommand="spGetProductByID" SelectCommandType="StoredProcedure" UpdateCommand="spUpdateProduct" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="ProductID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="Price" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="PrimaryImagePath" Type="String"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="ProductID" Type="Int32"></asp:Parameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ProductID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="Price" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="PrimaryImagePath" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
