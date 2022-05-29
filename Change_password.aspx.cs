using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Change_password : System.Web.UI.Page
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
            op_txt.Text = "";
            np_txt.Text = "";
            cp_txt.Text = "";
            fill_fun();
        }
    }
    void fill_fun()
    {
        da = new SqlDataAdapter("select * from tbl_reg where uname=@un",cn);
        da.SelectCommand.Parameters.AddWithValue("@un", Session["uname"].ToString());
        ds = new DataSet();
        da.Fill(ds);

        FormView1.DataSource = ds;
        FormView1.DataBind();
    }

    protected void sm_btn_Click1(object sender, EventArgs e)
    {
        cmd = new SqlCommand("update tbl_reg set pwd=@np where uname=@un and pwd=@op", cn);

        cmd.Parameters.AddWithValue("@un", Session["uname"].ToString());
        cmd.Parameters.AddWithValue("@op", op_txt.Text);
        cmd.Parameters.AddWithValue("@np", np_txt.Text);

        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

        Response.Redirect("PurchaseHome.aspx");
    }
}