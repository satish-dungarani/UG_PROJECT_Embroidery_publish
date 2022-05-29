using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Pattern : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    DataSet ds;
    SqlDataAdapter da;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        if(!IsPostBack)
        {
            fill_fun();
        }

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {

            cmd = new SqlCommand("insert into tbl_ptn values(@pn,@stc,@clr,@ht,@wd,@prc,@imgpt)", cn);
            
            cmd.Parameters.AddWithValue("@pn", tbpname.Text);
            cmd.Parameters.AddWithValue("@stc", tbstc.Text);
            cmd.Parameters.AddWithValue("@clr", tbclr.Text);
            cmd.Parameters.AddWithValue("@ht", tbht.Text);
            cmd.Parameters.AddWithValue("@wd", tbwd.Text);
            cmd.Parameters.AddWithValue("@prc", tbpr.Text);

            string filename = imgup.FileName;
            string path = Server.MapPath("patternimg") + "\\" + filename;
            imgup.SaveAs(path);

            string apath = "~/patternimg/" + filename;
            cmd.Parameters.AddWithValue("@imgpt", apath);

            exe_fun();

            fill_fun();
            
            tbpname.Text = "";
            tbstc.Text = "";
            tbclr.Text = "";
            tbht.Text = "";
            tbwd.Text = "";
            tbpr.Text = "";

        }
        catch (Exception eq)
        {
            Console.WriteLine("<script>alert('There is some problem regarding connection')</script>");
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex=e.NewPageIndex;
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
        da = new SqlDataAdapter("select * from tbl_ptn",cn);
        ds = new DataSet();
        da.Fill(ds);

        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        cmd = new SqlCommand("delete from tbl_ptn where pid=@pid",cn);

        Label pid=(Label)GridView1.Rows[e.RowIndex].FindControl("pid_lbl");
        cmd.Parameters.AddWithValue("@pid",pid.Text);

        exe_fun();
        fill_fun();
    }
    protected void viewlnk_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("ViewPatternDetail.aspx?pid="+e.CommandArgument);
    }
}