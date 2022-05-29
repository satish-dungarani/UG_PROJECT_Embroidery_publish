using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class OrderSummary : System.Web.UI.Page
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
    protected void con_img_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Payment.aspx?oid=" + Request.QueryString["oid"].ToString());
        
    }
    void fill_fun()
    {
        da = new SqlDataAdapter("select tbl_ptn.pimgpath,tbl_ptn.pname,tbl_ptn.price,tbl_fab.fbname,tbl_fab.imgpath,tbl_fab.fbprice,tbl_odr.fbqnt,tbl_reg.phone,tbl_odr.amount from tbl_fab inner join tbl_odr on tbl_fab.fbid=tbl_odr.fid inner join tbl_reg on tbl_reg.uname=tbl_odr.uname inner join tbl_ptn on tbl_ptn.pid=tbl_odr.pid where tbl_odr.uname=@un order by tbl_odr.oid desc", cn);
        da.SelectCommand.Parameters.AddWithValue("@un", Session["uname"].ToString());
        ds = new DataSet();
        da.Fill(ds);

        FormView1.DataSource = ds;
        FormView1.DataBind();

        Label ap_lbl = (Label)FormView1.FindControl("ap_lbl");
        string fp = ds.Tables[0].Rows[0]["fbprice"].ToString();
        string fq = ds.Tables[0].Rows[0]["fbqnt"].ToString();
        ap_lbl.Text +=(Convert.ToDecimal(ds.Tables[0].Rows[0]["amount"])+500).ToString();

        Label ld = (Label)FormView1.FindControl("ld_lbl");
        ld.Text +=DateTime.Today.ToString();

        Label st = (Label)FormView1.FindControl("sta_lbl");
        st.Text = ((Convert.ToDecimal(fp) * Convert.ToDecimal(fq)) + 500).ToString() ;


    }
}