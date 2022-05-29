using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class ViewStatus : System.Web.UI.Page
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
        da = new SqlDataAdapter("select tbl_ptn.pimgpath,tbl_fab.imgpath,tbl_odr.oid,tbl_odr.uname,tbl_odr.thtype,tbl_odr.fbqnt,tbl_odr.odate,tbl_odr.ddate,tbl_odr.dcharge,tbl_odr.diposit,tbl_odr.amount,tbl_odr.status from tbl_odr inner join tbl_ptn on tbl_odr.pid=tbl_ptn.pid inner join tbl_fab on tbl_odr.fid=tbl_fab.fbid  where tbl_odr.oid=@oid", cn);
        da.SelectCommand.Parameters.AddWithValue("@oid", Request.QueryString["oid"].ToString());
        ds = new DataSet();
        da.Fill(ds);

        FormView1.DataSource = ds;
        FormView1.DataBind();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("CustomerOrder.aspx");
    }
}