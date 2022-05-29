using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Supplier : System.Web.UI.Page
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
        da = new SqlDataAdapter("select * from tbl_sup",cn);
        ds = new DataSet();
        da.Fill(ds);

        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        cmd = new SqlCommand("insert into tbl_sup values(@sn,@st,@oid,@vn,@vt,@vno,@sd,@sa)",cn);

        cmd.Parameters.AddWithValue("@sn",spname.Text);
        cmd.Parameters.AddWithValue("@st",styp.SelectedItem.Text);
        if (styp.SelectedItem.Text == "Purchase")
        {
            cmd.Parameters.AddWithValue("@oid", oid_ddl.SelectedItem.Text);
        }
        else 
        {
            cmd.Parameters.AddWithValue("@oid", "");
        }
        cmd.Parameters.AddWithValue("@vn",vname.Text);
        cmd.Parameters.AddWithValue("@vt",vtyp.SelectedItem.Text);
        cmd.Parameters.AddWithValue("vno",vno.Text);
        cmd.Parameters.AddWithValue("@sd",spdate.Text);
        cmd.Parameters.AddWithValue("@sa", amo.Text);

        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

        if (styp.SelectedItem.Text == "Purchase")
        {
            da = new SqlDataAdapter("update tbl_odr set status=@sts where oid=@oid", cn);
            da.SelectCommand.Parameters.AddWithValue("@oid", oid_ddl.SelectedItem.Text);
            da.SelectCommand.Parameters.AddWithValue("@sts", "Delivered");
            ds = new DataSet();
            da.Fill(ds);

            cn.Open();
            da.SelectCommand.ExecuteNonQuery();
            cn.Close();
        }

        fill_fun();

        spname.Text = "";
        vname.Text = "";
        vtyp.SelectedIndex = 0;
        vno.Text = "";
        spdate.Text = "";
        amo.Text = "";

        da = new SqlDataAdapter("select * from tbl_odr where status='Complete'", cn);
        ds = new DataSet();
        da.Fill(ds);

        oid_ddl.DataSource = ds;
        oid_ddl.DataTextField = ("oid");
        oid_ddl.DataValueField = ("oid");
        oid_ddl.DataBind();

        spname.Focus();
        
    }
    protected void styp_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (styp.SelectedItem.Text == "Purchase")
        {
            oid_ddl.Enabled = true;

            da = new SqlDataAdapter("select * from tbl_odr where status='Complete'", cn);
            ds = new DataSet();
            da.Fill(ds);

            oid_ddl.DataSource = ds;
            oid_ddl.DataTextField = ("oid");
            oid_ddl.DataValueField = ("oid");
            oid_ddl.DataBind();
        }
        else { oid_ddl.Enabled = false;  }
    }
    protected void viewlnk_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("SupplyDetail.aspx?spid="+e.CommandArgument);
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        cmd = new SqlCommand("delete from tbl_sup where spid=@sid",cn);

        Label sid=(Label)GridView1.Rows[e.RowIndex].FindControl("sid_lbl");
        cmd.Parameters.AddWithValue("@sid",sid.Text);

        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

        fill_fun();
        
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        fill_fun();
    }
}