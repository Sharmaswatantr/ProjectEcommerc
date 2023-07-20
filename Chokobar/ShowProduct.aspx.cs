using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chokobar
{
    public partial class ShowProduct : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            if (id == null)
            {
                Response.Redirect("Default.aspx");
            }

            string query = $"SELECT * FROM AddProduct WHERE id='{id}'";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                string name = rd["name"].ToString();
                string price = rd["price"].ToString();
               
                pname.InnerText = name;
                pprice.InnerText = price;
                
                pimg.Src = "Admin/img/hh/" + rd["img"].ToString();
                conn.Close();
            }
            else
            {
                Response.Redirect("Default.aspx");
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["uid"] == null)
            {
              Response.Redirect("LoginUser.aspx");
            }

            string pid = Request.QueryString["id"];
            string uid = Session["uid"].ToString();
            //  string quant = quantity.Value;



            string check = $"SELECT * FROM Addcart WHERE uid='{uid}' and pid='{pid}'";
           conn.Open();

           if (new SqlCommand(check, conn).ExecuteReader().Read())
            {
                Response.Write("<script>alert('product already in cart')</script>");

            }
            else
            {
                conn.Close();
                conn.Open();
                string query = $"INSERT INTO Addcart(pid,uid) VALUES('{pid}','{uid}')";
                new SqlCommand(query, conn).ExecuteNonQuery();
                Response.Write("<script>alert('product added to cart')</script>");
            }
            conn.Close();
        }
    }
    }


        