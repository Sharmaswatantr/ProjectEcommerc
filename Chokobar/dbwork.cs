using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Chokobar
{
    public class dbwork
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        public SqlDataReader reader;
        public SqlDataReader getAllProducts()
        {
            conn.Open();
            return new SqlCommand("select * from AddProduct", conn).ExecuteReader();
        }
        public SqlDataReader getCartProducts(string uid)
        {
            conn.Open();
            return new SqlCommand($"select * from AddProduct join Addcart on AddProduct.id=Addcart.pid where uid='{uid}'", conn).ExecuteReader();
        }
        public DataTable getCheckoutOrder(string uid)
        {
            SqlCommand cmd = new SqlCommand($"select * from CheckoutOrder where uid = '{uid}' ORDER BY CheckoutOrderId DESC ", conn);
            SqlDataAdapter rd = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            rd.Fill(table);
            return table;
        }
        public DataTable getCheckoutProduct(string oid)
        {
            SqlCommand cmd = new SqlCommand($"select * from CheckoutProduct where CheckoutOrderId = '{oid}'", conn);
            SqlDataAdapter rd = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            rd.Fill(table);
            return table;
        }
    }
}