<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="OrderProduct.aspx.cs" Inherits="Chokobar.OrderProduct" %>
  <%@ Import Namespace="Chokobar" %>
    <%@ Import Namespace="System.Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     

    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg" style="background-image: url(&quot;img/breadcrumb.jpg&quot;);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Your Orders</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Shopping Cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>





    <section class="shoping-cart spad">
        <div class="container">
            
             <%
            dbwork db = new dbwork();
            DataTable orders = db.getCheckoutOrder(Session["uid"].ToString());

            foreach (DataRow orderRow in orders.Rows)
            {
                string CheckoutOrderId = orderRow["Checkoutorderid"].ToString();
                string OrderDate = orderRow["OrderDate"].ToString();

        %>
            
            
            <div class="row border my-5 py-2">
                <div class="col-lg-8">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Sr No.</th>
                                    <th>Name</th>
                                    <th>Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                 <%

                                     DataTable products = db.getCheckoutProduct(CheckoutOrderId);
                                     int total = 0;
                                     int srno = 1;
                                     foreach (DataRow productRow in products.Rows)
                                     {
                                         string pname = productRow["pname"].ToString();
                                         string Price = productRow["rice"].ToString();
                                         total += Convert.ToInt32(Price);

                        %>
                                <tr>
                                    <td class="shoping__cart__item"><%= srno++ %></td>
                                    <td class="shoping__cart__quantity"><%=pname %></td>
                                    <td class="shoping__cart__price"><%= Price %></td>
                                </tr> 
                                
                                <%
                            }
                        %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="shoping__checkout" style="margin-top:0;">
                        <div class="row">
                            <div class="col-md-6">OrderId:<%= CheckoutOrderId %> </div>
                            <div class="col-md-6">Date:<%= OrderDate %></div>
                        </div>
                        <br /><br />
                        <h5>Order Total</h5>
                        <ul>
                            <li>Total <span>$<%=total %></span></li>
                        </ul>
                    </div>
                </div>
            </div>

            <%



            }

        %>

            
        </div>
    </section>

</asp:Content>
