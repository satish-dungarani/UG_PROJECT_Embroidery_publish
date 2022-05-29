using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class PlaceOrder : System.Web.UI.Page
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

        if (Session["uname"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (!IsPostBack)
        {
            
            fill_fun();
        }
        Image fimg = (Image)FormView1.FindControl("Image2");
        if (Request.QueryString["fid"] == null)
        {
            fimg.ImageUrl = "~/images/nf.png";
        }
        else
        {
            da = new SqlDataAdapter("select * from tbl_fab where fbid=@fid", cn);
            da.SelectCommand.Parameters.AddWithValue("@fid", Request.QueryString["fid"].ToString());
            ds = new DataSet();
            da.Fill(ds);

            string fi = ds.Tables[0].Rows[0]["imgpath"].ToString();
            fimg.ImageUrl = fi;
        }
      
        
        od_lbl.Text = (DateTime.Today).ToString();
    }

    void fill_fun()
    {
        da = new SqlDataAdapter("select * from tbl_ptn where pid=@pid",cn);
        da.SelectCommand.Parameters.AddWithValue("@pid",Request.QueryString["pid"].ToString());
        ds = new DataSet();
        da.Fill(ds);
        

        FormView1.DataSource = ds;
        FormView1.DataBind();

        
    }
    void exe_fun()
    {
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }
    protected void con_img_Click(object sender, ImageClickEventArgs e)
    {

        if (ttyp_ddl.SelectedItem.Text == "-----Select-----")
        {
            Response.Write("<script>alert('Please Select thread type from dropdown list.')</script>");
        }
        else
        {
            cmd = new SqlCommand("insert into tbl_odr values(@un,@pid,@fid,@tty,@fq,@od,@dd,@dc,@dip,@am,@sts)", cn);

            cmd.Parameters.AddWithValue("@un", Session["uname"].ToString());
            cmd.Parameters.AddWithValue("@pid", Request.QueryString["pid"].ToString());
            if (Request.QueryString["fid"] == null)
            {
                cmd.Parameters.AddWithValue("@fid", 4);
            }
            else
            {
                cmd.Parameters.AddWithValue("@fid", Request.QueryString["fid"].ToString());
            }

            cmd.Parameters.AddWithValue("@tty", ttyp_ddl.SelectedItem.Text);

            cmd.Parameters.AddWithValue("@fq", fq_txt.Text);
            cmd.Parameters.AddWithValue("@od", DateTime.Now);
            cmd.Parameters.AddWithValue("@am", ap_lbl.Text);
            cmd.Parameters.AddWithValue("@dd", DateTime.Today.AddMonths(1));
            decimal tp = Convert.ToDecimal(fq_txt.Text) / 1000;
            cmd.Parameters.AddWithValue("@dc", (tp + 1) * 500);
            cmd.Parameters.AddWithValue("@dip", (Convert.ToDecimal(ap_lbl.Text) * 20) / 100);
            cmd.Parameters.AddWithValue("@sts", "Pending");


            exe_fun();



            if (Request.QueryString["fid"] == null)
            {
                Response.Redirect("DeliveryAddress.aspx?fid=" + 4 + "&pid=" + Request.QueryString["pid"].ToString());
            }
            else
            {
                Response.Redirect("DeliveryAddress.aspx?fid=" + Request.QueryString["fid"].ToString() + "&pid=" + Request.QueryString["pid"].ToString());
            }
        }
    }

    protected void ttyp_ddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ttyp_ddl.SelectedItem.Text == "-----Select-----")
        {
            ap_lbl.Text = null;
        }
        
        da = new SqlDataAdapter("select price from tbl_thrd where thtype=@tty", cn);
        
        da.SelectCommand.Parameters.AddWithValue("@tty",ttyp_ddl.SelectedItem.Text);
        ds = new DataSet();
        da.Fill(ds);
        string price=ds.Tables[0].Rows[0]["price"].ToString();

        da = new SqlDataAdapter("select price from tbl_ptn where pid=@pid", cn);
        da.SelectCommand.Parameters.AddWithValue("@pid",Request.QueryString["pid"].ToString());
        ds = new DataSet();
        da.Fill(ds);
        string pr = ds.Tables[0].Rows[0]["price"].ToString();

        
        decimal f = Convert.ToDecimal(fq_txt.Text);

        if (Request.QueryString["fid"] == null)
        {
            decimal am = (Convert.ToDecimal(pr) * 8 * f) + (50 * Convert.ToDecimal(price));
            ap_lbl.Text = am.ToString();
        }
        else
        {
            da = new SqlDataAdapter("select fbprice from tbl_fab where fbid=@fid", cn);
            da.SelectCommand.Parameters.AddWithValue("@fid", Request.QueryString["fid"].ToString());
            ds = new DataSet();
            da.Fill(ds);
            string fpr = ds.Tables[0].Rows[0]["fbprice"].ToString();


            decimal am = (Convert.ToDecimal(fpr) * f) + (Convert.ToDecimal(pr) * 8 * f) + (50 * Convert.ToDecimal(price));
            ap_lbl.Text = am.ToString();
        }

        
    }
}