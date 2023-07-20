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
    public partial class LoginUser : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            connection.Open();
            string checkemail = $"select * from UserReg where email='{TextBox1.Text}'";
            SqlDataReader rd = new SqlCommand(checkemail, connection).ExecuteReader();
            if (rd.Read())
            {
                if (rd["pass"].ToString() == TextBox2.Text)
                {
                    Session["uid"] = rd["id"].ToString();
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    Response.Write("<script>alert('invalid password')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('invalid email')</script>");
            }

        }
    }
}