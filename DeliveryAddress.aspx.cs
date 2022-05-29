using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class DeliveryAddress : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    string o;
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
    }
    void fill_fun()
    {
        da = new SqlDataAdapter("select tbl_odr.oid,tbl_reg.fname,tbl_reg.pincode,tbl_reg.address,tbl_reg.landmark,tbl_reg.city,tbl_reg.state,tbl_reg.country,tbl_reg.phone from tbl_reg inner join tbl_odr on tbl_odr.uname=tbl_reg.uname where tbl_reg.uname=@un order by tbl_odr.oid desc", cn);
        da.SelectCommand.Parameters.AddWithValue("@un",Session["uname"].ToString());
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
    protected void FormView1_ModeChanging(object sender, FormViewModeEventArgs e)
    {
        FormView1.ChangeMode(e.NewMode);
        fill_fun();
    }
    protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        cmd = new SqlCommand("update tbl_reg set pincode=@pc,address=@addr,landmark=@lm,city=@ct,state=@st,phone=@ph where uname=@un",cn);

        cmd.Parameters.AddWithValue("@un", Session["uname"].ToString());
        TextBox pn=(TextBox)FormView1.FindControl("pin_txt");
        cmd.Parameters.AddWithValue("@pc",pn.Text);
        TextBox adr = (TextBox)FormView1.FindControl("addr_txt");
        cmd.Parameters.AddWithValue("@addr", adr.Text);
        TextBox lm = (TextBox)FormView1.FindControl("lm_txt");
        cmd.Parameters.AddWithValue("@lm", lm.Text);
        DropDownList ct = (DropDownList)FormView1.FindControl("ct_ddl");
        cmd.Parameters.AddWithValue("@ct",ct.SelectedItem.Text);
        DropDownList st = (DropDownList)FormView1.FindControl("st_ddl");
        cmd.Parameters.AddWithValue("@st", st.SelectedItem.Text);
        TextBox phn = (TextBox)FormView1.FindControl("pn_txt");
        cmd.Parameters.AddWithValue("@ph", phn.Text);

        exe_fun();

        FormView1.ChangeMode(FormViewMode.ReadOnly);

        fill_fun();
    }
    
    protected void con_img_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("OrderSummary.aspx?fid=" + Request.QueryString["fid"].ToString() + "&pid=" + Request.QueryString["pid"].ToString() + "&oid=" + e.CommandArgument);
        Session["oid"] = e.CommandArgument;
    }
}