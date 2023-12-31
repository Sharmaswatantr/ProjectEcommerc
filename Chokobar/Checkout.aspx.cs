﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chokobar
{
    public partial class Checkout : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] == null)
            {
                Response.Redirect("/LoginUser.aspx");
            }

            string uid = Session["uid"].ToString();

            connection.Open();
            SqlDataReader rd = new SqlCommand($"select * from UserReg where id='{uid}'", connection).ExecuteReader();
            rd.Read();
            email.Value = rd["email"].ToString();
            connection.Close();

        }

        protected void checkoutBtn_Click(object sender, EventArgs e)
        {
            string fname1 = fname.Value;
            string lname1 = lname.Value;
            string phone1 = phone.Value;
            string emai1 = email.Value;
            string address1 = address.Value;
            string city1 = city.Value;
            string state1 = state.Value;
            string country1 = country.Value;
            string pincode1 = pincode.Value;
            string othernotes1 = othernotes.Value;
            string uid1 = Session["uid"].ToString();
            string date1 = DateTime.Now.ToString();

            connection.Open();
            string OrderProduct = $"INSERT INTO Chekoutorder(FName, Lname, Phone, Email, Addres, City, State, Country, Pincode, Ordernotes, Uid,OrderDate) output inserted.CheckoutOrderId VALUES('{fname1}', '{lname1}', '{phone1}', '{emai1}','{address1}', '{city1}', '{state1}', '{country1}', '{pincode1}','{othernotes1}', '{uid1}','{date1}')";
            SqlCommand cmd2 = new SqlCommand(OrderProduct, connection);
            var x = cmd2.ExecuteScalar();
            connection.Close();

            string query = $"select * from AddProduct where id in(select pid from Addcart where uid='{uid1}')";
            SqlCommand cmd = new SqlCommand(query, connection);
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            dataAdapter.Fill(table);

            string values = "";
            foreach (DataRow row in table.Rows)
            {
                var pid = row["id"];
                var pname = row["name"];
                var pprice = row["price"];
                values += $"('{uid1}', '{pid}', '{pname}', '{pprice}', '{x}'),";
            }

            values = values.Remove(values.Length - 1, 1);
            connection.Open();
            string CheckoutProduct = $"INSERT INTO Chekoutproduct(uid,pid,pname,price,Checkoutorderid) VALUES {values};DELETE FROM Addcart WHERE uid='{uid1}'";
            SqlCommand cmd3 = new SqlCommand(CheckoutProduct, connection);
            cmd3.ExecuteNonQuery();
            connection.Close();
        }
    }
}