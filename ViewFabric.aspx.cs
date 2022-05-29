using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class ViewFabric : System.Web.UI.Page
{
    SqlConnection cn;
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
            fill_fun();
        }
        
    }
    protected void img_lnk_Command(object sender, CommandEventArgs e)
    {
        
        LinkButton link = (LinkButton)(sender);
        Response.Redirect("SingleFabricDetail.aspx?fid=" + link.CommandArgument + "&pid=" + Request.QueryString["pid"].ToString());
        
    }
    void fill_fun()
    {
        da = new SqlDataAdapter("select * from tbl_fab where fbid<>'4'", cn);
        dt = new DataTable();
        da.Fill(dt);

        DataList1.DataSource = dt;
        DataList1.DataBind();
    }
    protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int j=CheckBoxList1.SelectedValue.Count();
        string upper = "";
        string lower = "1";
        bool flag = false;

        for (int i = 0; i<CheckBoxList1.Items.Count; i++)
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
        da = new SqlDataAdapter("select * from tbl_fab where fbprice between @l and @u and fbid<>'4'", cn);
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
        
    protected void  CheckBoxList4_SelectedIndexChanged(object sender, EventArgs e)
    {

        int j = CheckBoxList4.SelectedValue.Count();
        string[] c=new string[20] ;
        

        for (int i = 0; i < 20; i++)
		{
		    c[i]="n";
		}
        for (int i = 0; i < CheckBoxList4.Items.Count; i++)
        {
            if (CheckBoxList4.Items[i].Selected)
            {

                c[i] = CheckBoxList4.Items[i].Text;
                
            }

        }
        if (j == 0)
        {
            fill_fun();
        }
        else
        {
            da = new SqlDataAdapter("select * from tbl_fab where fbclr=@c1 or fbclr=@c2 or fbclr=@c3 or fbclr=@c4 or fbclr=@c5 or fbclr=@c6 or fbclr=@c7 or fbclr=@c8 or fbclr=@c9 or fbclr=@c10 or fbclr=@c11 or fbclr=@c12 or fbclr=@c13 or fbclr=@c14 or fbclr=@c15 or fbclr=@c16 or fbclr=@c17 or fbclr=@c18 or fbclr=@c19 or fbclr=@c20 and fbid<>'4'", cn);
            da.SelectCommand.Parameters.AddWithValue("@c1", c[0]);
            da.SelectCommand.Parameters.AddWithValue("@c2", c[1]);
            da.SelectCommand.Parameters.AddWithValue("@c3", c[2]);
            da.SelectCommand.Parameters.AddWithValue("@c4", c[3]);
            da.SelectCommand.Parameters.AddWithValue("@c5", c[4]);
            da.SelectCommand.Parameters.AddWithValue("@c6", c[5]);
            da.SelectCommand.Parameters.AddWithValue("@c7", c[6]);
            da.SelectCommand.Parameters.AddWithValue("@c8", c[7]);
            da.SelectCommand.Parameters.AddWithValue("@c9", c[8]);
            da.SelectCommand.Parameters.AddWithValue("@c10", c[9]);
            da.SelectCommand.Parameters.AddWithValue("@c11", c[10]);
            da.SelectCommand.Parameters.AddWithValue("@c12", c[11]);
            da.SelectCommand.Parameters.AddWithValue("@c13", c[12]);
            da.SelectCommand.Parameters.AddWithValue("@c14", c[13]);
            da.SelectCommand.Parameters.AddWithValue("@c15", c[14]);
            da.SelectCommand.Parameters.AddWithValue("@c16", c[15]);
            da.SelectCommand.Parameters.AddWithValue("@c17", c[16]);
            da.SelectCommand.Parameters.AddWithValue("@c18", c[17]);
            da.SelectCommand.Parameters.AddWithValue("@c19", c[18]);
            da.SelectCommand.Parameters.AddWithValue("@c20", c[19]);
            dt = new DataTable();
            da.Fill(dt);

            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
    }
        
    protected void  srch_btn_Click(object sender, EventArgs e)
    {
        da = new SqlDataAdapter("select * from tbl_fab where fbname=@src or fbprice=@src or fbtype=@src", cn);
        da.SelectCommand.Parameters.AddWithValue("@src", srch_txt.Text);
        dt = new DataTable();
        da.Fill(dt);

        DataList1.DataSource = dt;
        DataList1.DataBind();
    }
    protected void srt_ddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (srt_ddl.SelectedIndex == 1)
        {
            da = new SqlDataAdapter("select * from tbl_fab where fbid<>'4' order by fbprice", cn);
            dt = new DataTable();
            da.Fill(dt);

            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
        if (srt_ddl.SelectedIndex == 2)
        {
            da = new SqlDataAdapter("select * from tbl_fab where fbid<>'4' order by fbprice desc", cn);
            dt = new DataTable();
            da.Fill(dt);

            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
        if (srt_ddl.SelectedIndex == 3)
        {
            da = new SqlDataAdapter("select * from tbl_fab where fbid<>'4' order by fbname ", cn);
            dt = new DataTable();
            da.Fill(dt);

            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
        if (srt_ddl.SelectedIndex == 4)
        {
            da = new SqlDataAdapter("select * from tbl_fab where fbid<>'4' order by fbtype", cn);
            dt = new DataTable();
            da.Fill(dt);

            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
    }
    protected void CheckBoxList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        int j = CheckBoxList3.SelectedValue.Count();
        string[] c = new string[20];


        for (int i = 0; i < 20; i++)
        {
            c[i] = "n";
        }
        for (int i = 0; i < CheckBoxList3.Items.Count; i++)
        {
            if (CheckBoxList3.Items[i].Selected)
            {

                c[i] = CheckBoxList3.Items[i].Text;

            }

        }
        if (j == 0)
        {
            fill_fun();
        }
        else
        {
            da = new SqlDataAdapter("select * from tbl_fab where fbbrand=@c1 or fbbrand=@c2 or fbbrand=@c3 or fbbrand=@c4 or fbbrand=@c5 or fbbrand=@c6 or fbbrand=@c7 or fbbrand=@c8 or fbbrand=@c9 or fbbrand=@c10 or fbbrand=@c11 or fbbrand=@c12 or fbbrand=@c13 or fbbrand=@c14 or fbbrand=@c15 or fbbrand=@c16 or fbbrand=@c17 or fbbrand=@c18 or fbbrand=@c19 or fbbrand=@c20 and fbid<>'4'", cn);
            da.SelectCommand.Parameters.AddWithValue("@c1", c[0]);
            da.SelectCommand.Parameters.AddWithValue("@c2", c[1]);
            da.SelectCommand.Parameters.AddWithValue("@c3", c[2]);
            da.SelectCommand.Parameters.AddWithValue("@c4", c[3]);
            da.SelectCommand.Parameters.AddWithValue("@c5", c[4]);
            da.SelectCommand.Parameters.AddWithValue("@c6", c[5]);
            da.SelectCommand.Parameters.AddWithValue("@c7", c[6]);
            da.SelectCommand.Parameters.AddWithValue("@c8", c[7]);
            da.SelectCommand.Parameters.AddWithValue("@c9", c[8]);
            da.SelectCommand.Parameters.AddWithValue("@c10", c[9]);
            da.SelectCommand.Parameters.AddWithValue("@c11", c[10]);
            da.SelectCommand.Parameters.AddWithValue("@c12", c[11]);
            da.SelectCommand.Parameters.AddWithValue("@c13", c[12]);
            da.SelectCommand.Parameters.AddWithValue("@c14", c[13]);
            da.SelectCommand.Parameters.AddWithValue("@c15", c[14]);
            da.SelectCommand.Parameters.AddWithValue("@c16", c[15]);
            da.SelectCommand.Parameters.AddWithValue("@c17", c[16]);
            da.SelectCommand.Parameters.AddWithValue("@c18", c[17]);
            da.SelectCommand.Parameters.AddWithValue("@c19", c[18]);
            da.SelectCommand.Parameters.AddWithValue("@c20", c[19]);
            dt = new DataTable();
            da.Fill(dt);

            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
    }
    protected void CheckBoxList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        int j = CheckBoxList2.SelectedValue.Count();
        string[] c = new string[17];


        for (int i = 0; i < 17; i++)
        {
            c[i] = "n";
        }
        for (int i = 0; i < CheckBoxList2.Items.Count; i++)
        {
            if (CheckBoxList2.Items[i].Selected)
            {

                c[i] = CheckBoxList2.Items[i].Text;

            }

        }
        if (j == 0)
        {
            fill_fun();
        }
        else
        {
            da = new SqlDataAdapter("select * from tbl_fab where fbtype=@c1 or fbtype=@c2 or fbtype=@c3 or fbtype=@c4 or fbtype=@c5 or fbtype=@c6 or fbtype=@c7 or fbtype=@c8 or fbtype=@c9 or fbtype=@c10 or fbtype=@c11 or fbtype=@c12 or fbtype=@c13 or fbtype=@c14 or fbtype=@c15 or fbtype=@c16 or fbtype=@c17 and fbid<>'4'", cn);
            da.SelectCommand.Parameters.AddWithValue("@c1", c[0]);
            da.SelectCommand.Parameters.AddWithValue("@c2", c[1]);
            da.SelectCommand.Parameters.AddWithValue("@c3", c[2]);
            da.SelectCommand.Parameters.AddWithValue("@c4", c[3]);
            da.SelectCommand.Parameters.AddWithValue("@c5", c[4]);
            da.SelectCommand.Parameters.AddWithValue("@c6", c[5]);
            da.SelectCommand.Parameters.AddWithValue("@c7", c[6]);
            da.SelectCommand.Parameters.AddWithValue("@c8", c[7]);
            da.SelectCommand.Parameters.AddWithValue("@c9", c[8]);
            da.SelectCommand.Parameters.AddWithValue("@c10", c[9]);
            da.SelectCommand.Parameters.AddWithValue("@c11", c[10]);
            da.SelectCommand.Parameters.AddWithValue("@c12", c[11]);
            da.SelectCommand.Parameters.AddWithValue("@c13", c[12]);
            da.SelectCommand.Parameters.AddWithValue("@c14", c[13]);
            da.SelectCommand.Parameters.AddWithValue("@c15", c[14]);
            da.SelectCommand.Parameters.AddWithValue("@c16", c[15]);
            da.SelectCommand.Parameters.AddWithValue("@c17", c[16]);
            dt = new DataTable();
            da.Fill(dt);

            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
    }
}  
  
   