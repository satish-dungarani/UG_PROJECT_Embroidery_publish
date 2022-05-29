using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class SalaryPayment : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection( ConfigurationManager.ConnectionStrings["conn"].ToString());

        da = new SqlDataAdapter("select * from tbl_emp", cn);
        ds = new DataSet();
        da.Fill(ds);

        if (!IsPostBack)
        {
            if (Request.QueryString["eid"] == null)
            {
                da = new SqlDataAdapter("select * from tbl_emp", cn);
                ds = new DataSet();
                da.Fill(ds);

                FormView1.DataSource = ds;
                FormView1.DataBind();
            }
            else 
            {
                fill_fun();
            }
            //en_ddl.Items.Insert(0, "-----Select-----");

            //en_ddl.DataSource = ds;
            //en_ddl.DataTextField = ("ename");
            //en_ddl.DataValueField = ("eid");
            //en_ddl.DataBind();
        }


        for (int i = 0; i <= ds.Tables[0].Rows.Count/4; i++)
        {
            HyperLink link = new HyperLink();
            link.NavigateUrl = "SalaryPayment.aspx?id=" + i;
            link.Text = (i + 1).ToString();
            Panel1.Controls.Add(link);
        }
        if (Request.QueryString["id"] == null)
        {
            da = new SqlDataAdapter("select * from tbl_emp", cn);
            ds = new DataSet();
            da.Fill(ds,0,4,"tbl_emp");

            DataList1.DataSource = ds;
            DataList1.DataBind();
        }
        else 
        {
            int ct = Convert.ToInt16(Request.QueryString["id"].ToString());
            da = new SqlDataAdapter("select * from tbl_emp", cn);
            ds = new DataSet();
            da.Fill(ds,ct*4,4,"tbl_emp");

            DataList1.DataSource = ds;
            DataList1.DataBind();
        }
    }
    void fill_fun()
    {
        da = new SqlDataAdapter("select * from tbl_emp where eid=@eid",cn);
        da.SelectCommand.Parameters.AddWithValue("@eid",Request.QueryString["eid"].ToString());
        ds = new DataSet();
        da.Fill(ds);

        FormView1.DataSource = ds;
        FormView1.DataBind();


        
    }
    //void fill_list()
    //{
    //    da = new SqlDataAdapter("select * from tbl_emp", cn);

    //    ds = new DataSet();
    //    da.Fill(ds);

    //    ProductsListView.DataSource = ds;
    //    ProductsListView.DataBind();
    //}
    protected void submit_btn(object sender, EventArgs e)
    {
        if (31 < Convert.ToInt16(td_txt.Text))
        {
            Response.Write("<script>alert('Please Enter valid number of days.')</script>");
            ld_txt.Focus();
        }
        else
        {

            cmd = new SqlCommand("insert into tbl_sal values (@eid,@ad,@ld,@td,@bs,@cs,@ps,@dt)", cn);

            cmd.Parameters.AddWithValue("@eid", Request.QueryString["eid"].ToString());
            cmd.Parameters.AddWithValue("@ad", ad_txt.Text);
            cmd.Parameters.AddWithValue("@ld", ld_txt.Text);
            cmd.Parameters.AddWithValue("@td", td_txt.Text);
            cmd.Parameters.AddWithValue("@bs", bs_txt.Text);
            cmd.Parameters.AddWithValue("@cs", cs_txt.Text);
            cmd.Parameters.AddWithValue("@ps", ps_txt.Text);
            cmd.Parameters.AddWithValue("@dt", pd_txt.Text);

            exe_fun();

            ad_txt.Text = "";
            ld_txt.Text = "";
            td_txt.Text = "";
            bs_txt.Text = "";
            cs_txt.Text = "";
            ps_txt.Text = "";
            pd_txt.Text = "";
        }
    }
    void exe_fun()
    {
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }


    protected void ld_txt_TextChanged(object sender, EventArgs e)
    {
       
        
        
        td_txt.Text = (Convert.ToInt16(ad_txt.Text) + Convert.ToInt16(ld_txt.Text)).ToString();
        
        if (Request.QueryString["eid"] == null)
        {
            da = new SqlDataAdapter("select * from tbl_emp", cn);
            ds = new DataSet();
            da.Fill(ds);

            bs_txt.Text = ds.Tables[0].Rows[0]["salary"].ToString();
        }
      
        else 
        {
            da = new SqlDataAdapter("select * from tbl_emp where eid=@eid", cn);
            da.SelectCommand.Parameters.AddWithValue("@eid",Request.QueryString["eid"].ToString());
            ds = new DataSet();
            da.Fill(ds);

            bs_txt.Text = ds.Tables[0].Rows[0]["salary"].ToString();
        }
        cs_txt.Text = ((Convert.ToDecimal(bs_txt.Text) / Convert.ToDecimal(td_txt.Text)) * Convert.ToDecimal(ld_txt.Text)).ToString();
        ps_txt.Text = (Convert.ToDecimal(bs_txt.Text) - Convert.ToDecimal(cs_txt.Text)).ToString();
        pd_txt.Focus();
        
    }
    
   
    protected void img_lnk_Command(object sender, CommandEventArgs e)
    {
        LinkButton link = (LinkButton)(sender);
        Response.Redirect("SalaryPayment.aspx?eid="+link.CommandArgument);
    }
    //protected void en_ddl_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    da = new SqlDataAdapter("select * from tbl_emp where ename=@en", cn);
    //    da.SelectCommand.Parameters.AddWithValue("@en", en_ddl.SelectedItem.Text);
    //    ds = new DataSet();
    //    da.Fill(ds);

    //    DataList1.DataSource = ds;
    //    DataList1.DataBind();

    //    en_ddl.Focus();
    //}
    protected void src_btn_Click(object sender, EventArgs e)
    {

        da = new SqlDataAdapter("select * from tbl_emp where ename=@en", cn);
        da.SelectCommand.Parameters.AddWithValue("@en", src_txt.Text);
        ds = new DataSet();
        da.Fill(ds);

        DataList1.DataSource = ds;
        DataList1.DataBind();
    }
    protected void view_btn_Click(object sender, EventArgs e)
    {
        ad_txt.Text = "";
        ld_txt.Text = "";
        td_txt.Text = "";
        bs_txt.Text = "";
        cs_txt.Text = "";
        ps_txt.Text = "";
        pd_txt.Text = "";
    }
}