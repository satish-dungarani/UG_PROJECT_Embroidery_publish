using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;

public partial class Payment : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds; 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        
        if (!IsPostBack)
        {
            if (Convert.ToInt16(Request.QueryString["flag"]) == 1)
            {
                Session["flag"] = 1;
                fill_fun_final();
            }
            else
            {
                Session["flag"] = 0;
                fill_fun();
            }
        }
    }
    
    protected void lo_link_Command(object sender, CommandEventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("Home.aspx");
    }
    void fill_fun()
    {
        da = new SqlDataAdapter("select * from tbl_odr inner join tbl_reg on tbl_reg.uname=tbl_odr.uname where tbl_odr.oid=@oid", cn);
        da.SelectCommand.Parameters.AddWithValue("@oid", Request.QueryString["oid"].ToString());
        ds = new DataSet();
        da.Fill(ds);

        Session["oid"] = Request.QueryString["oid"].ToString();

        int am = Convert.ToInt16(ds.Tables[0].Rows[0]["diposit"])/63;

        fname.Value = ds.Tables[0].Rows[0]["uname"].ToString();
        email.Value = ds.Tables[0].Rows[0]["email"].ToString();
        phone.Value = ds.Tables[0].Rows[0]["phone"].ToString();
        amount.Value = am.ToString().Split('.')[0];
    }
    void fill_fun_final()
    {
        da = new SqlDataAdapter("select * from tbl_odr inner join tbl_reg on tbl_reg.uname=tbl_odr.uname where tbl_odr.oid=@oid", cn);
        da.SelectCommand.Parameters.AddWithValue("@oid", Request.QueryString["oid"].ToString());
        ds = new DataSet();
        da.Fill(ds);

        Session["oid"] = Request.QueryString["oid"].ToString();

        int am = ((Convert.ToInt32(ds.Tables[0].Rows[0]["amount"])+Convert.ToInt16(ds.Tables[0].Rows[0]["dcharge"]))-Convert.ToInt16(ds.Tables[0].Rows[0]["diposit"])) / 63;

        fname.Value = ds.Tables[0].Rows[0]["uname"].ToString();
        email.Value = ds.Tables[0].Rows[0]["email"].ToString();
        phone.Value = ds.Tables[0].Rows[0]["phone"].ToString();
        amount.Value = am.ToString().Split('.')[0];
    }

   
}