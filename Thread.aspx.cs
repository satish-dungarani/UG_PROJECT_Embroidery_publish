using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Thread : System.Web.UI.Page
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

            cmd = new SqlCommand("insert into tbl_thrd values(@thn,@aq,@used,@tq,@typ,@clr,@prc,@imgp)", cn);
           
            cmd.Parameters.AddWithValue("@thn", tbtname.Text);
            cmd.Parameters.AddWithValue("@aq", tbaq.Text);
            cmd.Parameters.AddWithValue("@used", tbut.Text);
            cmd.Parameters.AddWithValue("@tq", tbtq.Text);
            cmd.Parameters.AddWithValue("@typ", ttyp_ddl.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@clr", tbclr.Text);
            cmd.Parameters.AddWithValue("@prc", tbpr.Text);

            string filename = imgup.FileName;
            string path = Server.MapPath("threadimg") + "\\" + tbtname.Text + filename;
            imgup.SaveAs(path);

            string acpath = "~/threadimg/" + tbtname.Text + filename;
            cmd.Parameters.AddWithValue("@imgp",acpath);

            exe_fun();
            fill_fun();

            tbtname.Text = "";
            tbaq.Text = "";
            tbut.Text = "";
            tbtq.Text = "";
            tbclr.Text = "";
            tbpr.Text = "";

        }
        catch (Exception eq)
        {
            Console.WriteLine("<script>alert('There is some problem regarding connection')</script>");
        }
    }
    void exe_fun()
    {
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }
    void fill_fun()
    {
        da = new SqlDataAdapter("select * from tbl_thrd",cn);
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
        cmd = new SqlCommand("delete from tbl_thrd where thid=@tid",cn);

        Label tid = (Label)GridView1.Rows[e.RowIndex].FindControl("tid_lbl");
        cmd.Parameters.AddWithValue("@tid",tid.Text);

        exe_fun();
        fill_fun();
    }
    protected void viewlnk_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("ViewThreadDetail.aspx?thid="+e.CommandArgument);
    }
}