using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ViewPatternDetail : System.Web.UI.Page
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
    protected void FormView1_ModeChanging1(object sender, FormViewModeEventArgs e)
    {
        FormView1.ChangeMode(e.NewMode);
        fill_fun();
    }
    void fill_fun()
    {
        da = new SqlDataAdapter("select * from tbl_ptn where pid=@pid",cn);
        da.SelectCommand.Parameters.AddWithValue("@pid",Request.QueryString["pid"].ToString());
        ds = new DataSet();
        da.Fill(ds);

        FormView1.DataSource = ds;
        FormView1.DataBind();
    }
    void exe_fun()
    {
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }

   
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Pattern.aspx");
    }
    protected void FormView1_ItemUpdating1(object sender, FormViewUpdateEventArgs e)
    {
        try
        {
            cmd = new SqlCommand("update tbl_ptn set pname=@pn,stitches=@stc,color=@clr,height=@ht,width=@wt,price=@price,pimgpath=@imgpath where pid=@pid", cn);

            Label pid = (Label)FormView1.FindControl("ptnid_lbl");
            cmd.Parameters.AddWithValue("@pid", pid.Text);
            TextBox pname = (TextBox)FormView1.FindControl("ptnname_txt");
            cmd.Parameters.AddWithValue("@pn", pname.Text);
            TextBox stc = (TextBox)FormView1.FindControl("stc_txt");
            cmd.Parameters.AddWithValue("@stc", stc.Text);
            TextBox clr = (TextBox)FormView1.FindControl("clr_txt");
            cmd.Parameters.AddWithValue("@clr", clr.Text);
            TextBox ht = (TextBox)FormView1.FindControl("hgt_txt");
            cmd.Parameters.AddWithValue("@ht", ht.Text);
            TextBox wt = (TextBox)FormView1.FindControl("wdt_txt");
            cmd.Parameters.AddWithValue("@wt", wt.Text);
            TextBox prc = (TextBox)FormView1.FindControl("prc_txt");
            cmd.Parameters.AddWithValue("@price", prc.Text);


            FileUpload pimg_up = (FileUpload)FormView1.FindControl("ptnimg_up");
            string filename = pimg_up.FileName;
            string path = Server.MapPath("patternimg") + "\\" + pname.Text + filename;
            pimg_up.SaveAs(path);

            string acpath = "~/patternimg/" + pname.Text + filename;
            cmd.Parameters.AddWithValue("@imgpath", acpath);

            exe_fun();

            FormView1.ChangeMode(FormViewMode.ReadOnly);
            fill_fun();
        }
        catch (Exception eq)
        {
            Console.WriteLine("<script>alert('There is some problem regarding connection')</script>");
        }
    }
}