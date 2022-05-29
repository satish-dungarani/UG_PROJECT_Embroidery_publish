using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class CustomerOrder : System.Web.UI.Page
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
            
            fill_fun();

        }
    }
    void fill_fun()
    {
        da = new SqlDataAdapter("select tbl_ptn.pimgpath,tbl_fab.imgpath,tbl_odr.oid,tbl_odr.uname,tbl_odr.thtype,tbl_odr.fbqnt,tbl_odr.amount,tbl_odr.status from tbl_odr inner join tbl_ptn on tbl_odr.pid=tbl_ptn.pid inner join tbl_fab on tbl_odr.fid=tbl_fab.fbid inner join tbl_pay on tbl_pay.oid=tbl_odr.oid where tbl_odr.uname=@un and tbl_pay.ptype='Diposit' order by oid desc", cn);
        da.SelectCommand.Parameters.AddWithValue("@un", Session["uname"].ToString());
        ds = new DataSet();
        da.Fill(ds);

        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void viewlnk_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("ViewStatus.aspx?oid=" + e.CommandArgument);
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        fill_fun();
    }

    protected void paylink_Command(object sender, CommandEventArgs e)
    {
        
        
            Response.Redirect("Payment.aspx?oid=" + e.CommandArgument + "&flag=" + 1);
        
    }
   
}