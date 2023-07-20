<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ShowProduct.aspx.cs" Inherits="Chokobar.ShowProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="chocolate_section ">
      
      <div class="container">
        <div class="heading_container">
          <h2>
            Our chocolate products
          </h2>
          <p>
            Many desktop publishing packages and web pagend web page editors now use Lorem Ipsum as their
          </p>
        </div>
      </div>
      <div class="container">
        <div class="chocolate_container">
             <div class="box">
            <div class="img-box">
              <img src="Admin/img/hh" alt="" id="pimg" runat="server">
            </div>
            <div class="detail-box">
              <h6>
                Yummy <span  id="pname" runat="server">chocolate</span>
              </h6>
              <h5 id="pprice" runat="server">
                $5.0
              </h5>
              <a href="#">
                  <asp:Button ID="Button1" runat="server" Text="Addcart" onclick="Button1_Click"/>
              </a>
            </div>
          </div>
            </div>

      </div>

    </section>
</asp:Content>
