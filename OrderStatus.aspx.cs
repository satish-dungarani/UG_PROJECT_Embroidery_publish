using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class OrderStatus : System.Web.UI.Page
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
        da = new SqlDataAdapter("select * from tbl_odr where oid=@oid order by oid desc",cn);
        da.SelectCommand.Parameters.AddWithValue("@oid",Request.QueryString["oid"].ToString());
        ds = new DataSet();
        da.Fill(ds);

        FormView1.DataSource = ds;
        FormView1.DataBind();
    }
    protected void FormView1_ModeChanging(object sender, FormViewModeEventArgs e)
    {
        FormView1.ChangeMode(e.NewMode);
        fill_fun();
    }
    protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        cmd = new SqlCommand("update tbl_odr set ddate=@dt,status=@sts where oid=@oid",cn);

        cmd.Parameters.AddWithValue("@oid",Request.QueryString["oid"].ToString());
        TextBox dt = (TextBox)FormView1.FindControl("dd_txt");
        cmd.Parameters.AddWithValue("@dt", dt.Text.Split(' ')[0]);
        RadioButtonList st = (RadioButtonList)FormView1.FindControl("os_rbl");
        cmd.Parameters.AddWithValue("@sts",st.SelectedItem.Text);

        exe_fun();

        FormView1.ChangeMode(FormViewMode.ReadOnly);

        fill_fun();
    }
    void exe_fun()
    {
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("AllOrder.aspx");
    }
}