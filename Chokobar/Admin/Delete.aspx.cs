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
    public partial class Delete : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
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
                    Response.Redirect("AllProduct.aspx");
                }
                string query = $"DELETE  FROM AddProduct WHERE id='{PId}'";
                conn.Open();
                new SqlCommand(query, conn).ExecuteNonQuery();

                Response.Redirect("AllProduct.aspx");

            }
        }
    }
    }
