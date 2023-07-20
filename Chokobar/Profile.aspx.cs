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
    public partial class Profile : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] == null)
            {
                Response.Redirect("LoginUser.aspx");
            }
            string uid = Session["uid"].ToString();

            string query = $"SELECT * FROM UserReg WHERE id = '{uid}'";
            conn.Open();
            SqlDataReader reader = new SqlCommand(query, conn).ExecuteReader();
            reader.Read();
            name.InnerText = reader["name"].ToString();
            email.InnerText = reader["email"].ToString();

        }
    }
}