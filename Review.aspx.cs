using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Review : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    int i;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        if (!IsPostBack)
        {
            fill_fun();
        }
    }
    protected void img1_Click(object sender, ImageClickEventArgs e)
    {
        img1.ImageUrl = "~/images/yellowstar.gif";
        img2.ImageUrl = "~/images/whitestar.gif";
        img3.ImageUrl = "~/images/whitestar.gif";
        img4.ImageUrl = "~/images/whitestar.gif";
        img5.ImageUrl = "~/images/whitestar.gif";
        i = 1;
    }
    protected void img2_Click(object sender, ImageClickEventArgs e)
    {
        img1.ImageUrl = "~/images/yellowstar.gif";
        img2.ImageUrl = "~/images/yellowstar.gif";
        img3.ImageUrl = "~/images/whitestar.gif";
        img4.ImageUrl = "~/images/whitestar.gif";
        img5.ImageUrl = "~/images/whitestar.gif";
        i = 2;
    }
    protected void img3_Click(object sender, ImageClickEventArgs e)
    {
        img1.ImageUrl = "~/images/yellowstar.gif";
        img2.ImageUrl = "~/images/yellowstar.gif";
        img3.ImageUrl = "~/images/yellowstar.gif";
        
        img4.ImageUrl = "~/images/whitestar.gif";
        img5.ImageUrl = "~/images/whitestar.gif";
        i = 3;

    }
    protected void img4_Click(object sender, ImageClickEventArgs e)
    {
        img1.ImageUrl = "~/images/yellowstar.gif";
        img2.ImageUrl = "~/images/yellowstar.gif";
        img3.ImageUrl = "~/images/yellowstar.gif";
        img4.ImageUrl = "~/images/yellowstar.gif";
        img5.ImageUrl = "~/images/whitestar.gif";
        i = 4;
    }
    protected void img5_Click(object sender, ImageClickEventArgs e)
    {
        img1.ImageUrl = "~/images/yellowstar.gif";
        img2.ImageUrl = "~/images/yellowstar.gif";
        img3.ImageUrl = "~/images/yellowstar.gif";
        img4.ImageUrl = "~/images/yellowstar.gif";
        img5.ImageUrl = "~/images/yellowstar.gif";
        i = 5;
    }
    void fill_fun()
    {
        da = new SqlDataAdapter("select * from tbl_reg where uname=@un",cn);
        da.SelectCommand.Parameters.AddWithValue("@un", Session["uname"].ToString());
        ds = new DataSet();
        da.Fill(ds);

        nm_lbl.Text = ds.Tables[0].Rows[0]["fname"].ToString() + " " + ds.Tables[0].Rows[0]["lname"].ToString(); 
    }
    protected void Sbm_btn_Click(object sender, EventArgs e)
    {
        cmd = new SqlCommand("insert into tbl_rvw values(@pid,@pt,@rt,@rv,@rat,@nm)",cn);

        
        cmd.Parameters.AddWithValue("@rt",rt_txt.Text);
        cmd.Parameters.AddWithValue("@rv", rvw_txt.Text);
        cmd.Parameters.AddWithValue("@rat", i);
        cmd.Parameters.AddWithValue("@nm", nm_lbl.Text);
        if (Convert.ToInt16(Request.QueryString["pt"]) == 1)
        {
            cmd.Parameters.AddWithValue("@pt", "ptn");
            cmd.Parameters.AddWithValue("@pid", Request.QueryString["pid"].ToString());
        }
        else
        {
            cmd.Parameters.AddWithValue("@pt", "fab");
            cmd.Parameters.AddWithValue("@pid", Request.QueryString["fid"].ToString());
        }

        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
        if (Convert.ToInt16(Request.QueryString["pt"]) == 1)
        {
            Response.Redirect("SinglePatternDetail.aspx?pid=" + Request.QueryString["pid"].ToString());
        }
        else
        {
            Response.Redirect("SingleFabricDetail.aspx?fid=" + Request.QueryString["pid"].ToString() + "&pid=" + Request.QueryString["pid"].ToString());
        }
    }
}