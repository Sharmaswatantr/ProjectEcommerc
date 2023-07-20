<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Home.Master" AutoEventWireup="true" CodeBehind="Addproduct.aspx.cs" Inherits="Chokobar.Admin.Addproduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <center>
   <div style="border:10px double black;background-color:chocolate; width:100%;height:600px" >
       <br/>
       <br />
       <h1>Add<span style="color:aqua;"> Products</span></h1>
  <div class="mb-3">
      <br />
      <br />
      <asp:TextBox ID="TextBox1" runat="server" Height="46px" Width="49%" placeholder="Productname" ></asp:TextBox>
      <br />
     
  </div>
        <div class="mb-3">
      <br />
      <br />
      <asp:TextBox ID="TextBox2" runat="server" Height="46px" Width="49%" placeholder="price" TextMode="Number" ></asp:TextBox>
      <br />
     
       <div class="mb-3">
      <br/>
      <br />
           <asp:FileUpload ID="FileUpload1" runat="server"  placeholder="image" Height="45px" CssClass="offset-sm-0" Width="693px"  />
      <br />    
      <br />
      &nbsp;&nbsp;<asp:Button ID="Button1" runat="server" Text="Submit" Width="152px" Height="52px" OnClick="Button1_Click"  />

      <br />
  </div>

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </div>
    </center>

   
</asp:Content>
