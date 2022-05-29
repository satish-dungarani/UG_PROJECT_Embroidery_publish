using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class ViewContact : System.Web.UI.Page
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
        da = new SqlDataAdapter("select * from tbl_cnt where reply='no'",cn);
        ds = new DataSet();
        da.Fill(ds);

        GridView1.DataSource = ds;
        GridView1.DataBind();

    }
    protected void rpylnk_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("ContactReply.aspx?cid="+e.CommandArgument);
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        fill_fun();
    }
}