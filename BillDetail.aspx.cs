using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class BillDetail : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        if (!IsPostBack)
        {
            fill_fun();
        }
    }
    void fill_fun()
    {
        da = new SqlDataAdapter("select * from tbl_pay order by pyid desc",cn);
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
    protected void paylink_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("BillGenerate.aspx?pyid="+e.CommandArgument);
    }
    protected void srch_btn_Click(object sender, EventArgs e)
    {
        if (rs.SelectedIndex == 0)
        {
            da = new SqlDataAdapter("select * from tbl_pay where pyid=@src", cn);
            da.SelectCommand.Parameters.AddWithValue("@src", srch_txt.Text);
            ds = new DataSet();
            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        else
        {
            da = new SqlDataAdapter("select * from tbl_pay where oid=@src", cn);
            da.SelectCommand.Parameters.AddWithValue("@src", srch_txt.Text);
            ds = new DataSet();
            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }
}