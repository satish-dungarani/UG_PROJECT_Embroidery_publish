using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class ViewPattern : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataTable dt;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());

        if (!IsPostBack)
        {
            srt_ddl.Items.Insert(0, "-----Select Value-----");
            fill_fun();
        }
        
        
    }

    void fill_fun()
    {
        da = new SqlDataAdapter("select * from tbl_ptn", cn);
        dt = new DataTable();
        da.Fill(dt);

        DataList1.DataSource = dt;
        DataList1.DataBind();
    }
    void exe_fun()
    {
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }

    protected void srt_ddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (srt_ddl.SelectedIndex == 1)
        {
            da = new SqlDataAdapter("select * from tbl_ptn order by price",cn);
            dt = new DataTable();
            da.Fill(dt);

            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
        if (srt_ddl.SelectedIndex == 2)
        {
            da = new SqlDataAdapter("select * from tbl_ptn order by price desc", cn);
            dt = new DataTable();
            da.Fill(dt);

            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
        if (srt_ddl.SelectedIndex == 3)
        {
            da = new SqlDataAdapter("select * from tbl_ptn order by pname", cn);
            dt = new DataTable();
            da.Fill(dt);

            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
    }
    protected void srch_btn_Click(object sender, EventArgs e)
    {
        da = new SqlDataAdapter("select * from tbl_ptn where pname=@src or price=@src or stitches=@src",cn);
        da.SelectCommand.Parameters.AddWithValue("@src",srch_txt.Text);
        dt = new DataTable();
        da.Fill(dt);

        DataList1.DataSource = dt;
        DataList1.DataBind();
    }


    protected void img_lnk_Command(object sender, CommandEventArgs e)
    {
       
        LinkButton link = (LinkButton)(sender);
       
        Response.Redirect("SinglePatternDetail.aspx?pid=" + link.CommandArgument);
    }

    protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int j = CheckBoxList1.SelectedValue.Count();
        string upper = "";
        string lower = "1";
        bool flag = false;

        for (int i = 0; i < CheckBoxList1.Items.Count; i++)
        {
            if (CheckBoxList1.Items[i].Selected)
            {

                string range = CheckBoxList1.Items[i].Value;
                string[] r1 = range.Split('-');
                if (flag == false)
                {
                    lower = r1[0];
                }

                upper = r1[1];
                flag = true;
            }




        }
        da = new SqlDataAdapter("select * from tbl_ptn where price between @l and @u", cn);
        da.SelectCommand.Parameters.AddWithValue("@l", lower);
        da.SelectCommand.Parameters.AddWithValue("@u", upper);
        dt = new DataTable();
        da.Fill(dt);
        Session["dta"] = dt;
        DataList1.DataSource = (DataTable)Session["dta"];
        DataList1.DataBind();
        if (j == 0)
        {
            fill_fun();
        }
    }
    protected void CheckBoxList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        int j = CheckBoxList2.SelectedValue.Count();
        string upper = "";
        string lower = "1";
        bool flag = false;

        for (int i = 0; i < CheckBoxList2.Items.Count; i++)
        {
            if (CheckBoxList2.Items[i].Selected)
            {

                string range = CheckBoxList2.Items[i].Value;
                string[] r1 = range.Split('-');
                if (flag == false)
                {
                    lower = r1[0];
                }

                upper = r1[1];
                flag = true;
            }

        }
        if (j == 0)
        {
            upper = "99999";

        }
        da = new SqlDataAdapter("select * from tbl_ptn where stitches between @l and @u", cn);
        da.SelectCommand.Parameters.AddWithValue("@l", lower);
        da.SelectCommand.Parameters.AddWithValue("@u", upper);
        dt = new DataTable();
        da.Fill(dt);
        Session["dta"] = dt;
        DataList1.DataSource = (DataTable)Session["dta"];
        DataList1.DataBind();
        
    }
    protected void CheckBoxList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        int j = CheckBoxList3.SelectedValue.Count();
        string upper = "";
        string lower = "1";
        bool flag = false;

        for (int i = 0; i < CheckBoxList3.Items.Count; i++)
        {
            if (CheckBoxList3.Items[i].Selected)
            {

                string range = CheckBoxList3.Items[i].Value;
                string[] r1 = range.Split('-');
                if (flag == false)
                {
                    lower = r1[0];
                }

                upper = r1[1];
                flag = true;
            }

        }
        if (j == 0)
        {
            upper = "10000";
            
        }
        da = new SqlDataAdapter("select * from tbl_ptn where height between @l and @u", cn);
        da.SelectCommand.Parameters.AddWithValue("@l", lower);
        da.SelectCommand.Parameters.AddWithValue("@u", upper);
        dt = new DataTable();
        da.Fill(dt);
        Session["dta"] = dt;
        DataList1.DataSource = (DataTable)Session["dta"];
        DataList1.DataBind();
        
    }
    protected void CheckBoxList4_SelectedIndexChanged(object sender, EventArgs e)
    {
        int j = CheckBoxList4.SelectedValue.Count();
        string upper = "";
        string lower = "1";
        bool flag = false;

        for (int i = 0; i < CheckBoxList4.Items.Count; i++)
        {
            if (CheckBoxList4.Items[i].Selected)
            {

                string range = CheckBoxList4.Items[i].Value;
                string[] r1 = range.Split('-');
                if (flag == false)
                {
                    lower = r1[0];
                }

                upper = r1[1];
                flag = true;
            }

        }
        if (j == 0)
        {
            upper = "10000";

        }
        da = new SqlDataAdapter("select * from tbl_ptn where width between @l and @u", cn);
        da.SelectCommand.Parameters.AddWithValue("@l", lower);
        da.SelectCommand.Parameters.AddWithValue("@u", upper);
        dt = new DataTable();
        da.Fill(dt);
        Session["dta"] = dt;
        DataList1.DataSource = (DataTable)Session["dta"];
        DataList1.DataBind();
        
    }
}