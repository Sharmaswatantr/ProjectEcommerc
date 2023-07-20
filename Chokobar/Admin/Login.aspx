<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Home.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Chokobar.Admin.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <center style="height:381px; width:100%;background-color:chocolate">
        <br />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Width="379px" Height="39px" placeholder="Email"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>&nbsp;&nbsp;
        <asp:TextBox ID="TextBox2" runat="server" Width="380px" Height="39px" placeholder="Password"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
        <br />
        <br />
    </center>
</asp:Content>
