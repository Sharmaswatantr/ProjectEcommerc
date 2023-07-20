<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Chokobar.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card" style="width: 18rem;">
  <img height="200px" width="200px" src="images/insta-img.png" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title" id="name" runat="server">Card </h5>
    <p class="card-text" id="email" runat="server">Some </p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
</asp:Content>
