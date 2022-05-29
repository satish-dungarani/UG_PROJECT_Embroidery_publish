using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class SingleFabricDetail : System.Web.UI.Page
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
        da = new SqlDataAdapter("select * from tbl_fab where fbid=@fid",cn);
        da.SelectCommand.Parameters.AddWithValue("@fid",Request.QueryString["fid"].ToString());
        ds = new DataSet();
        da.Fill(ds);

        FormView1.DataSource = ds;
        FormView1.DataBind();

        FormView2.DataSource = ds;
        FormView2.DataBind();
    }
    void exe_fun()
    {
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }

    
    protected void sel_img_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("PlaceOrder.aspx?fid=" + e.CommandArgument + "&pid=" + Request.QueryString["pid"].ToString());
    }
    protected void rvw_lnk_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("Review.aspx?fid=" + e.CommandArgument + "&pid=" + Request.QueryString["pid"].ToString());
    }
}