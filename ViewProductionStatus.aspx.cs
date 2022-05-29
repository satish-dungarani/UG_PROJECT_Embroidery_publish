using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ViewProductionStatus : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da,da1;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        if(!IsPostBack)
        {
            fill_fun();
        }
    }
    void fill_fun()
    {
        da = new SqlDataAdapter("select * from tbl_pro inner join tbl_odr on tbl_pro.oid=tbl_odr.oid where prid=@prid",cn);
        da.SelectCommand.Parameters.AddWithValue("@prid",Request.QueryString["prid"].ToString());
        ds = new DataSet();
        da.Fill(ds);

        FormView1.DataSource = ds;
        FormView1.DataBind();
    }


    protected void FormView1_ModeChanging(object sender, FormViewModeEventArgs e)
    {
        FormView1.ChangeMode(e.NewMode);
        fill_fun();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ProductionDetail.aspx");
    }
    protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
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

        cmd = new SqlCommand("update tbl_pro set oid=@oid,ntclr=@ntc,tclr=@tc,thqnt=@tq,sdate=@sd,cdate=@cd,status=@sts where prid=@prid",cn);

        cmd.Parameters.AddWithValue("@prid",Request.QueryString["prid"].ToString());
        TextBox oid = (TextBox)FormView1.FindControl("oid_txt");
        cmd.Parameters.AddWithValue("@oid",oid.Text);
        DropDownList ntc = (DropDownList)FormView1.FindControl("ntc_ddl");
        cmd.Parameters.AddWithValue("@ntc", ntc.SelectedItem.Text);

        int j = Convert.ToInt16(ntc.SelectedItem.Text);
        DropDownList ddl1 = (DropDownList)FormView1.FindControl("ddl1");
        DropDownList ddl2 = (DropDownList)FormView1.FindControl("ddl2");
        DropDownList ddl3 = (DropDownList)FormView1.FindControl("ddl3");
        DropDownList ddl4 = (DropDownList)FormView1.FindControl("ddl4");
        DropDownList ddl5 = (DropDownList)FormView1.FindControl("ddl5");
        cl[0] = ddl1.SelectedItem.Text;
        cl[1] = ddl2.SelectedItem.Text;
        cl[2] = ddl3.SelectedItem.Text;
        cl[3] = ddl4.SelectedItem.Text;
        cl[4] = ddl5.SelectedItem.Text;
        TextBox TextBox1 = (TextBox)FormView1.FindControl("TextBox1");
        TextBox TextBox2 = (TextBox)FormView1.FindControl("TextBox2");
        TextBox TextBox3 = (TextBox)FormView1.FindControl("TextBox3");
        TextBox TextBox4 = (TextBox)FormView1.FindControl("TextBox4");
        TextBox TextBox5 = (TextBox)FormView1.FindControl("TextBox5");
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

        cmd.Parameters.AddWithValue("@tc", cmp);
        cmd.Parameters.AddWithValue("@tq", q.ToString());
        TextBox sd_txt = (TextBox)FormView1.FindControl("sd_txt");
        cmd.Parameters.AddWithValue("@sd", sd_txt.Text);
        TextBox cd_txt = (TextBox)FormView1.FindControl("cd_txt");
        cmd.Parameters.AddWithValue("@cd", cd_txt.Text);
        RadioButtonList sts_rbl = (RadioButtonList)FormView1.FindControl("sts_rbl");
        cmd.Parameters.AddWithValue("@sts", sts_rbl.SelectedItem.Text);


        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

        da = new SqlDataAdapter("select * from tbl_odr where oid=@oid", cn);
        da.SelectCommand.Parameters.AddWithValue("@oid", oid.Text);
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
        da1.SelectCommand.Parameters.AddWithValue("@oid", oid.Text);
        da1.SelectCommand.Parameters.AddWithValue("@sts", sts_rbl.SelectedItem.Text);
        ds = new DataSet();
        da1.Fill(ds);

        cn.Open();
        da1.SelectCommand.ExecuteNonQuery();
        cn.Close();

        FormView1.ChangeMode(FormViewMode.ReadOnly);

        fill_fun();


    }
    protected void ntc_ddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox oid = (TextBox)FormView1.FindControl("oid_txt");
        da = new SqlDataAdapter("select * from tbl_odr where oid=@oid", cn);
        da.SelectCommand.Parameters.AddWithValue("@oid", oid.Text);
        ds = new DataSet();
        da.Fill(ds);

        da = new SqlDataAdapter("select * from tbl_thrd where thtype=@typ", cn);
        da.SelectCommand.Parameters.AddWithValue("@typ", ds.Tables[0].Rows[0]["thtype"].ToString());
        ds = new DataSet();
        da.Fill(ds);

        DropDownList ddl1 = (DropDownList)FormView1.FindControl("ddl1");
        ddl1.DataSource = ds;
        ddl1.DataTextField = ("color");
        ddl1.DataValueField = ("thid");
        ddl1.DataBind();
        DropDownList ddl2 = (DropDownList)FormView1.FindControl("ddl2");
        ddl2.DataSource = ds;
        ddl2.DataTextField = ("color");
        ddl2.DataValueField = ("thid");
        ddl2.DataBind();
        DropDownList ddl3 = (DropDownList)FormView1.FindControl("ddl3");
        ddl3.DataSource = ds;
        ddl3.DataTextField = ("color");
        ddl3.DataValueField = ("thid");
        ddl3.DataBind();
        DropDownList ddl4 = (DropDownList)FormView1.FindControl("ddl4");
        ddl4.DataSource = ds;
        ddl4.DataTextField = ("color");
        ddl4.DataValueField = ("thid");
        ddl4.DataBind();
        DropDownList ddl5 = (DropDownList)FormView1.FindControl("ddl5");
        ddl5.DataSource = ds;
        ddl5.DataTextField = ("color");
        ddl5.DataValueField = ("thid");
        ddl5.DataBind();
    }
}