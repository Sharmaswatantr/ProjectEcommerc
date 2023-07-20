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
    public partial class Addproduct : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["uid"]==null)
            {
                Response.Redirect("Login.aspx");
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            FileUpload1.SaveAs(Server.MapPath("~/Admin/img/hh/" + FileUpload1.FileName));
            string productName = TextBox1.Text;
            string productprice = TextBox2.Text;  
            string productImage = FileUpload1.FileName;
            string query = $"INSERT INTO AddProduct VALUES('{productName}','{productprice}','{productImage}')";
            conn.Open();
            new SqlCommand(query, conn).ExecuteNonQuery();
           
        }
    }
}