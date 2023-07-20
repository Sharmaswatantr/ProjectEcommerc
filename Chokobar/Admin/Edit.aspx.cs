using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chokobar.Admin
{
    public partial class Edit : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["uid"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    string PId = Request.QueryString["PId"];
                    if (PId == null)
                    {
                        Response.Redirect("Login.aspx");
                    }
                    string query = $"SELECT * FROM AddProduct  WHERE id='{PId}'";
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataReader rd = cmd.ExecuteReader();
                    if (rd.Read())
                    {
                        TextBox1.Text = rd["name"].ToString();

                        TextBox2.Text = rd["price"].ToString();

                    }
                    else
                    {
                        Response.Redirect("AllProduct.aspx");
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string PId = Request.QueryString["PId"];
            FileUpload1.SaveAs(Server.MapPath("~/Admin/img/hh/" + FileUpload1.FileName));
            string productName = TextBox1.Text;
            string productImage = FileUpload1.FileName;
            string productprice = TextBox2.Text;
            string query = $"UPDATE AddProduct SET name='{productName}',price='{productprice}' WHERE id='{PId}'";

            if (FileUpload1.HasFile)
            {
                FileUpload1.SaveAs(Server.MapPath("~/Admin/img/hh/" + FileUpload1.FileName));
                string productImag = FileUpload1.FileName;
                query = $"UPDATE AddProduct SET name='{productName}',price='{productprice}',img='{productImag}' WHERE id='{PId}'";
            }
            conn.Open();
            new SqlCommand(query, conn).ExecuteNonQuery();
        }
    }
    }
