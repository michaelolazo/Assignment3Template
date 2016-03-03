<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="A3WebApplication.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">

    <asp:Panel ID="pnlLogin" runat="server">
      UserName: <asp:TextBox ID="tbUsername" runat="server"></asp:TextBox>
      Password: <asp:TextBox ID="tbPassword" runat="server"></asp:TextBox>
       <br /> <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click"/><br />
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    </asp:Panel>
<%--    7 MARKS TOTAL
    TODO: 
    - Create a login page with username/password (2 MARKS)
    - redirect to an Admin page if they're an Admin (1 MARK)
    - redirect to CategoriesPage if successful login and not Admin (1 MARK)
    - Provide an error message if incorrect (1 MARK)
    - Ensure proper validation is on the screen (no blank username/password) (2 MARKS)--%>
</asp:Content>
