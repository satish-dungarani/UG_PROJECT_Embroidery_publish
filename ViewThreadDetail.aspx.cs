using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ViewThreadDetail : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da;
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
        da = new SqlDataAdapter("select * from tbl_thrd where thid=@thid",cn);
        da.SelectCommand.Parameters.AddWithValue("@thid",Request.QueryString["thid"].ToString());
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

    protected void FormView1_ModeChanging1(object sender, FormViewModeEventArgs e)
    {
        FormView1.ChangeMode(e.NewMode);
        fill_fun();

    }
    protected void FormView1_ItemUpdating1(object sender, FormViewUpdateEventArgs e)
    {
        try
        {
            cmd = new SqlCommand("update tbl_thrd set thname=@tn,thaq=@aq,thuq=@uq,thtq=@tq,thtype=@typ,color=@clr,price=@price,imgpath=@imgpath where thid=@tid", cn);

            Label tid = (Label)FormView1.FindControl("thdid_lbl");
            cmd.Parameters.AddWithValue("@tid", tid.Text);
            TextBox tname = (TextBox)FormView1.FindControl("thdname_txt");
            cmd.Parameters.AddWithValue("@tn", tname.Text);
            TextBox aq = (TextBox)FormView1.FindControl("aq_txt");
            cmd.Parameters.AddWithValue("@aq", aq.Text);
            TextBox uq = (TextBox)FormView1.FindControl("ut_txt");
            cmd.Parameters.AddWithValue("@uq", uq.Text);
            TextBox tq = (TextBox)FormView1.FindControl("tq_txt");
            cmd.Parameters.AddWithValue("@tq", tq.Text);
            DropDownList typ = (DropDownList)FormView1.FindControl("ttyp_ddl");
            cmd.Parameters.AddWithValue("@typ", typ.SelectedItem.Text);
            TextBox clr = (TextBox)FormView1.FindControl("clr_txt");
            cmd.Parameters.AddWithValue("@clr", clr.Text);
            TextBox prc = (TextBox)FormView1.FindControl("prc_txt");
            cmd.Parameters.AddWithValue("@price", prc.Text);


            FileUpload timg_up = (FileUpload)FormView1.FindControl("thdimg_up");
            string filename = timg_up.FileName;
            string path = Server.MapPath("threadimg") + "\\" + tname.Text + filename;
            timg_up.SaveAs(path);

            string acpath = "~/threadimg/" + tname.Text + filename;
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
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Thread.aspx");
    }
}