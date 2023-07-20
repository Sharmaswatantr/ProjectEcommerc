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
    public partial class Removecart : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] == null)
            {
                Response.Redirect("LoginUser.aspx");
            }

            string cid = Request.QueryString["cid"];
            conn.Open();
            string query = $"DELETE FROM Addcart WHERE cid='{cid}' and uid='{Session["uid"]}'";
            new SqlCommand(query, conn).ExecuteNonQuery();
            Response.Redirect("Cart.aspx");
        }
    
    }
}