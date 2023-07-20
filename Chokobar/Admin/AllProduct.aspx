<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Home.Master" AutoEventWireup="true" CodeBehind="AllProduct.aspx.cs" Inherits="Chokobar.Admin.AllProduct" %>
<%@ Import Namespace="Chokobar.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- chocolate section -->

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
             <%
           Dbwork db = new Dbwork();
           db.reader = db.getAllProducts();
           while (db.reader.Read())
           {
               %>
          <div class="box">
            <div class="img-box">
              <img src="/Admin/img/hh/<%= db.reader["img"] %>" alt="">
            </div>
            <div class="detail-box">
              <h6>
                Yummy <span><%=db.reader["name"] %></span>
              </h6>
              <h5>
                $<%=db.reader["price"] %>
              </h5>
              <a href="Edit.aspx?PId=<%=db.reader["id"] %>" class="btn btn-outline-success">
                edit
              </a> <a href="Delete.aspx?PId=<%=db.reader["id"] %>" class="btn btn-outline-success">
                delete
              </a>
            </div>
              <%
           }
                  %>
          </div>
          <div class="box">
            <div class="img-box">
              <img src="images/chocolate2.png" alt="">
            </div>
            <div class="detail-box">
              <h6>
                Yummy <span>chocolate</span>
              </h6>
              <h5>
                $5.0
              </h5>
              <a href="">
                BUY NOW
              </a>
            </div>
          </div>
          <div class="box">
      

                    <div class="img-box">
              <img src="images/chocolate3.png" alt="">
            </div>
            <div class="detail-box">
              <h6>
                Yummy <span>chocolate</span>
              </h6>
              <h5>
                $5.0
              </h5>
              <a href="">
                BUY NOW
              </a>
            </div>
          </div>
          <div class="box">
            <div class="img-box">
              <img src="images/chocolate1.png" alt="">
            </div>
            <div class="detail-box">
              <h6>
                Yummy <span>chocolate</span>
              </h6>
              <h5>
                $5.0
              </h5>
              <a href="">
                BUY NOW
              </a>
            </div>
          </div>
          <div class="box">
            <div class="img-box">
              <img src="images/chocolate2.png" alt="">
            </div>
            <div class="detail-box">
              <h6>
                Yummy <span>chocolate</span>
              </h6>
              <h5>
                $5.0
              </h5>
              <a href="">
                BUY NOW
              </a>
            </div>
          </div>
          <div class="box">
            <div class="img-box">
              <img src="images/chocolate3.png" alt="">
            </div>
            <div class="detail-box">
              <h6>
                Yummy <span>chocolate</span>
              </h6>
              <h5>
                $5.0
              </h5>
              <a href="">
                BUY NOW
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- end chocolate section -->
</asp:Content>
