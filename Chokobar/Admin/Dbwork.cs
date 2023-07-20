using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

namespace Chokobar.Admin
{
    public class Dbwork
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        public SqlDataReader reader;
        public SqlDataReader getAllProducts()
        {
            conn.Open();
            return new SqlCommand("select * from AddProduct", conn).ExecuteReader();
        }
    }
}