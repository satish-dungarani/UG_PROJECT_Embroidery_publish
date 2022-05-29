using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class SinglePatternDetail : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
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
        ImageButton sl = (ImageButton)FormView1.FindControl("sel_img");
        if (Session["uname"] == null)
        {
            
            sl.Enabled = false;
        }
        else
        {
            sl.Enabled = true;
        }
    }
    void fill_fun()
    {
        da = new SqlDataAdapter("select * from tbl_ptn where pid=@pid", cn);
        da.SelectCommand.Parameters.AddWithValue("@pid",Request.QueryString["pid"].ToString());
        ds = new DataSet();
        da.Fill(ds);
        Label1.Text = ds.Tables[0].Rows[0]["pname"].ToString();
        FormView1.DataSource = ds;
        FormView1.DataBind();
        FormView2.DataSource = ds;
        FormView2.DataBind();
    }

  
    protected void sel_img_Command(object sender, CommandEventArgs e)
    {
        CheckBox fs = (CheckBox)FormView1.FindControl("fab_sel");
        if (fs.Checked == true)
        {
            Response.Redirect("ViewFabric.aspx?pid=" + e.CommandArgument);
        }
        else
        {
            Response.Redirect("PlaceOrder.aspx?pid="+e.CommandArgument);
        }
    }
    protected void rvw_lnk_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("Review.aspx?pid="+e.CommandArgument +"&pt="+1);
    }
}