<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Chokobar.Cart" %>
<%@ Import Namespace="Chokobar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-4 col-sm-4">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table style="width:100%" border="1">
                            <thead>
                                <tr>
                                    <th class="shoping__product">Product Name</th>
                                    <th>Product Image</th>
                                    <th>Product Price</th>
                                   <th>Remove Product</th>
                                </tr>
                            </thead>
                            <tbody>

                                <% dbwork db = new dbwork();
                                    db.reader = db.getCartProducts(Session["uid"].ToString());
                                    int price = 0;
                                    while (db.reader.Read())
                                    {
                                       price += Convert.ToInt32(db.reader["price"]);
                                        %>


                                
                                <tr>
                                    <td><h5><%=db.reader["name"] %></h5></td>
                                    <td class="shoping__cart__item">
                                        <img src="Admin/img/hh/<%=db.reader["img"] %>" alt="" height="200px" width="200px">
                                        
                                    </td>
                                    <td class="shoping__cart__price">
                                        $<%=db.reader["price"] %>
                                    </td>                                    
                                    <td class="shoping__cart__item__close">
                                    <a href='removeCart.aspx?cid=<%=db.reader["cid"] %>'><span class="icon_close"> Remove</span></a>
                                    </td>
                                </tr>
                                <%
                                    }
                                   totalPrice.InnerText += price.ToString();
                                    %>
                               
                            </tbody>
                        </table>
                          </div></div></div>
      <!-- electronic section end -->
                <br/><br />
                  <br/><br />
                  <br/><br />
                  <br/><br />
              <div class="row">
                  <div  class="col-lg-12">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li>Total <span id="totalPrice" runat="server">$</span></li>
                        </ul>
                        <a href="Checkout.aspx" class="primary-btn">PROCEED TO CHECKOUT</a>
                    </div>
                </div>
                </div></div></div>
</asp:Content>
