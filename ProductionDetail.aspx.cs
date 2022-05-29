using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ProductionDetail : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da,da1;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        if (!IsPostBack)
        {
            fill_fun();

            da = new SqlDataAdapter("select * from tbl_odr where status<>'Complete' and status<>'Delivered'", cn);
            ds = new DataSet();
            da.Fill(ds);

            oid_ddl.DataSource = ds;
            oid_ddl.DataTextField = ("oid");
            oid_ddl.DataValueField = ("oid");
            oid_ddl.DataBind();

        }

    }

    protected void ntc_ddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        da = new SqlDataAdapter("select * from tbl_odr where oid=@oid",cn);
        da.SelectCommand.Parameters.AddWithValue("@oid",oid_ddl.SelectedItem.Text);
        ds=new DataSet();
        da.Fill(ds);

        da = new SqlDataAdapter("select * from tbl_thrd where thtype=@typ",cn);
        da.SelectCommand.Parameters.AddWithValue("@typ",ds.Tables[0].Rows[0]["thtype"].ToString());
        ds=new DataSet();
        da.Fill(ds);

        ddl1.DataSource = ds;
        ddl1.DataTextField = ("color");
        ddl1.DataValueField = ("thid");
        ddl1.DataBind();

        ddl2.DataSource = ds;
        ddl2.DataTextField = ("color");
        ddl2.DataValueField = ("thid");
        ddl2.DataBind();

        ddl3.DataSource = ds;
        ddl3.DataTextField = ("color");
        ddl3.DataValueField = ("thid");
        ddl3.DataBind();

        ddl4.DataSource = ds;
        ddl4.DataTextField = ("color");
        ddl4.DataValueField = ("thid");
        ddl4.DataBind();

        ddl5.DataSource = ds;
        ddl5.DataTextField = ("color");
        ddl5.DataValueField = ("thid");
        ddl5.DataBind();
        
    }
    protected void oid_ddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        da = new SqlDataAdapter("select * from tbl_odr where oid=@oid", cn);
        da.SelectCommand.Parameters.AddWithValue("@oid", oid_ddl.SelectedItem.Text);
        ds = new DataSet();
        da.Fill(ds);

        un_txt.Text = ds.Tables[0].Rows[0]["uname"].ToString();
        fq_txt.Text = ds.Tables[0].Rows[0]["fbqnt"].ToString();
       
    }
    protected void sub_btn_Click(object sender, EventArgs e)
    {
        string[] cl = new string[5];
        int[] qn = new int[5];
        string cmp = "";
        int q = 0, tq = 0, tu = 0;
        int aq = 0, uq = 0, ti = 0;

        for (int i = 0; i < 5; i++)
        {
            qn[i] = 0;
        }
        cmd = new SqlCommand("insert into tbl_pro values(@oid,@ntclr,@tclr,@tq,@sd,@cd,@sts)", cn);

        cmd.Parameters.AddWithValue("@oid", oid_ddl.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@ntclr", ntc_ddl.SelectedItem.Text);
        int j = Convert.ToInt16(ntc_ddl.SelectedItem.Text);

        cl[0] = ddl1.SelectedItem.Text;
        cl[1] = ddl2.SelectedItem.Text;
        cl[2] = ddl3.SelectedItem.Text;
        cl[3] = ddl4.SelectedItem.Text;
        cl[4] = ddl5.SelectedItem.Text;
        qn[0] = Convert.ToInt16(TextBox1.Text);
        qn[1] = Convert.ToInt16(TextBox2.Text);
        qn[2] = Convert.ToInt16(TextBox3.Text);
        qn[3] = Convert.ToInt16(TextBox4.Text);
        qn[4] = Convert.ToInt16(TextBox5.Text);
        for (int i = 0; i < j; i++)
        {
            cmp = cmp + cl[i] + ",";
            q = q + qn[i];

        }
        cmd.Parameters.AddWithValue("@tclr", cmp);
        cmd.Parameters.AddWithValue("@tq", q.ToString());
        cmd.Parameters.AddWithValue("@sd", sd_txt.Text);
        cmd.Parameters.AddWithValue("@cd", cd_txt.Text);
        cmd.Parameters.AddWithValue("@sts", sts_rbl.SelectedItem.Text);


        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

        da = new SqlDataAdapter("select * from tbl_odr where oid=@oid", cn);
        da.SelectCommand.Parameters.AddWithValue("@oid", oid_ddl.SelectedItem.Text);
        ds = new DataSet();
        da.Fill(ds);

        string ty = ds.Tables[0].Rows[0]["thtype"].ToString();


        for (int i = 0; i < j; i++)
        {
            da = new SqlDataAdapter("select * from tbl_thrd where color=@clr and thtype=@typ", cn);
            da.SelectCommand.Parameters.AddWithValue("@clr", cl[i]);

            da.SelectCommand.Parameters.AddWithValue("@typ", ty);
            ds = new DataSet();
            da.Fill(ds);




            ti = Convert.ToInt16(ds.Tables[0].Rows[0]["thid"]);
            tq = Convert.ToInt16(ds.Tables[0].Rows[0]["thaq"]);
            tu = Convert.ToInt16(ds.Tables[0].Rows[0]["thuq"]);

            aq = tq - qn[i];
            uq = tu + qn[i];




            da = new SqlDataAdapter("update tbl_thrd set thaq=@ta,thuq=@tu where thid=@tid", cn);

            da.SelectCommand.Parameters.AddWithValue("@tid", ti);
            da.SelectCommand.Parameters.AddWithValue("@ta", aq);
            da.SelectCommand.Parameters.AddWithValue("@tu", uq);

            ds = new DataSet();
            da.Fill(ds);


            cn.Open();
            da.SelectCommand.ExecuteNonQuery();
            cn.Close();
        }

        da1 = new SqlDataAdapter("update tbl_odr set status=@sts where oid=@oid", cn);
        da1.SelectCommand.Parameters.AddWithValue("@oid", oid_ddl.SelectedItem.Text);
        da1.SelectCommand.Parameters.AddWithValue("@sts", sts_rbl.SelectedItem.Text);
        ds = new DataSet();
        da1.Fill(ds);

        cn.Open();
        da1.SelectCommand.ExecuteNonQuery();
        cn.Close();

        fill_fun();

        un_txt.Text = "";
        fq_txt.Text = "";
        ntc_ddl.SelectedIndex = 0;
        TextBox1.Text = "0";
        TextBox2.Text = "0";
        TextBox3.Text = "0";
        TextBox4.Text = "0";
        TextBox5.Text = "0";

        da = new SqlDataAdapter("select * from tbl_odr where status<>'Complete' and status<>'Delivered'", cn);
        ds = new DataSet();
        da.Fill(ds);

        oid_ddl.DataSource = ds;
        oid_ddl.DataTextField = ("oid");
        oid_ddl.DataValueField = ("oid");
        oid_ddl.DataBind();

    }
   
    void fill_fun()
    {
        da = new SqlDataAdapter("select * from tbl_pro",cn);
        ds = new DataSet();
        da.Fill(ds);

        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        fill_fun();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        cmd = new SqlCommand("delete from tbl_pro where prid=@pid",cn);

        Label pid=(Label)GridView1.Rows[e.RowIndex].FindControl("prid_lbl");
        cmd.Parameters.AddWithValue("@pid",pid.Text);

        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

        fill_fun();
    }
    protected void viewlnk_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("ViewProductionStatus.aspx?prid="+e.CommandArgument);
    }
    
}