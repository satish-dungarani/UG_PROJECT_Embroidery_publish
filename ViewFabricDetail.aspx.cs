using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ViewFabricDetail : System.Web.UI.Page
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
    protected void FormView1_ModeChanging(object sender, FormViewModeEventArgs e)
    {
       
    }
    void fill_fun()
    {
        da = new SqlDataAdapter("select * from tbl_fab where fbid=@fbid",cn);
        da.SelectCommand.Parameters.AddWithValue("@fbid",Request.QueryString["fbid"].ToString());
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
    protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
     
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Fabric.aspx");
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
            cmd = new SqlCommand("update tbl_fab set fbname=@fn,fbava=@avl,fbused=@use,fbtt=@tt,fbtype=@typ,fbbrand=@bnd,fbclr=@clr,fbprice=@price,imgpath=@imgpath where fbid=@fid", cn);

            Label fid = (Label)FormView1.FindControl("fabid_lbl");
            cmd.Parameters.AddWithValue("@fid", fid.Text);
            TextBox fname = (TextBox)FormView1.FindControl("fabname_txt");
            cmd.Parameters.AddWithValue("@fn", fname.Text);
            TextBox fa = (TextBox)FormView1.FindControl("fabava_txt");
            cmd.Parameters.AddWithValue("@avl", fa.Text);
            TextBox fu = (TextBox)FormView1.FindControl("fabuse_txt");
            cmd.Parameters.AddWithValue("@use", fu.Text);
            TextBox ft = (TextBox)FormView1.FindControl("fabtt_txt");
            cmd.Parameters.AddWithValue("@tt", ft.Text);
            DropDownList typ = (DropDownList)FormView1.FindControl("fabtyp_ddl");
            cmd.Parameters.AddWithValue("@typ", typ.SelectedItem.Text);
            DropDownList bnd = (DropDownList)FormView1.FindControl("ddlbrand");
            cmd.Parameters.AddWithValue("@bnd", bnd.SelectedItem.Text);
            DropDownList clr = (DropDownList)FormView1.FindControl("fabclr_txt");
            cmd.Parameters.AddWithValue("@clr", clr.SelectedItem.Text);
            TextBox prc = (TextBox)FormView1.FindControl("fabprc_txt");
            cmd.Parameters.AddWithValue("@price", prc.Text);


            FileUpload fimg_up = (FileUpload)FormView1.FindControl("fabimg_up");
            string filename = fimg_up.FileName;
            string path = Server.MapPath("fabricimg") + "\\" + fname.Text + filename;
            fimg_up.SaveAs(path);

            string acpath = "~/fabricimg/" + fname.Text + filename;
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