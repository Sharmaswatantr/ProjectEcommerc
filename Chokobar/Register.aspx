<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Chokobar.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center style="height:700px; width:100%;background-color:chocolate">
        <br/>
        <br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server" placeholder="Name" Height="35px" Width="300px"></asp:TextBox>
         <br/>
        <br />
        <br />
        <asp:TextBox ID="TextBox2" runat="server" placeholder="Mobile No" Height="35px" Width="303px"></asp:TextBox>
         <br/>
        <br />
        <br />
        <asp:TextBox ID="TextBox3" runat="server" placeholder="Adhar No" Height="34px" Width="306px"></asp:TextBox>
         <br/>
        <br />
        <br />
        <asp:TextBox ID="TextBox4" runat="server" placeholder="email" Height="34px" Width="303px"></asp:TextBox>
         <br/>
        <br />
        <br />
        <asp:TextBox ID="TextBox5" runat="server" placeholder="Password" Height="35px" Width="302px"></asp:TextBox>
         <br/>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Submit" Width="141px" OnClick="Button1_Click" />
         <br/>
        <br />
        <br />
    </center>
</asp:Content>
