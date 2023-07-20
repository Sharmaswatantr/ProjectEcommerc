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
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            connection.Open();
            string checkEmail = $"SELECT * FROM UserReg WHERE email='{TextBox4.Text}'";
            if (new SqlCommand(checkEmail, connection).ExecuteReader().Read())
            {
                Response.Write("<script>alert('email already exist')</script>");

            }
            else
            {
                connection.Close();
                connection.Open();
                string query = $"INSERT INTO UserReg(name,Mnumber,Adhar,email,pass) VALUES('{TextBox1.Text}','{TextBox2.Text}','{TextBox3.Text}','{TextBox4.Text}','{TextBox5.Text}')";
                new SqlCommand(query, connection).ExecuteNonQuery();
                Response.Write("<script>alert('regsiteration successfully')</script>");
            }
        }
    }
}