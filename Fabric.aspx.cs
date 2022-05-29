using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Fabric : System.Web.UI.Page
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
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {

            cmd = new SqlCommand("insert into tbl_fab values(@fn,@qnt,@used,@tt,@typ,@brand,@clr,@prc,@imgpt)", cn);
            
            cmd.Parameters.AddWithValue("@fn", tbfname.Text);
            cmd.Parameters.AddWithValue("@qnt", tbqt.Text);
            cmd.Parameters.AddWithValue("@used", tbused.Text);
            cmd.Parameters.AddWithValue("@tt", tbtl.Text);
            cmd.Parameters.AddWithValue("@typ", ddltype.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@brand", ddlbrand.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@clr", tbclr.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@prc", tbpr.Text);

            string filename = imgup.FileName;
            string path = Server.MapPath("fabricimg") + "\\" +tbfname.Text + filename;
            imgup.SaveAs(path);

            string apath = "~/fabricimg/" + tbfname.Text + filename;
            cmd.Parameters.AddWithValue("@imgpt",apath);

            exe_fun();

            fill_fun();

            tbfname.Text = "";
            tbqt.Text = "";
            tbused.Text = "";
            tbtl.Text = "";
            ddltype.Text = "";
            tbclr.Text = "";
            tbpr.Text = "";

        }
        catch (Exception eq)
        {
            Console.WriteLine("<script>alert('There is some problem regarding connection')</script>");
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        fill_fun();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        cmd = new SqlCommand("delete from tbl_fab where fbid=@fid",cn);

        Label fid=(Label)GridView1.Rows[e.RowIndex].FindControl("fbid_lbl");
        cmd.Parameters.AddWithValue("@fid", fid.Text);

        exe_fun();

        fill_fun();
    }
    void exe_fun()
    {
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }
    void fill_fun()
    {
        da = new SqlDataAdapter("select * from tbl_fab where fbid<>'4'",cn);
        ds = new DataSet();
        da.Fill(ds);

        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    protected void viewlnk_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("ViewFabricDetail.aspx?fbid="+e.CommandArgument);
    }
}