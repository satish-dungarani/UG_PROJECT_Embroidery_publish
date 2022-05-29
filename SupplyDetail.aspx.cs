using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class SupplyDetail : System.Web.UI.Page
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
        da = new SqlDataAdapter("select * from tbl_sup where spid=@spid",cn);
        da.SelectCommand.Parameters.AddWithValue("@spid",Request.QueryString["spid"].ToString());
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
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Supplier.aspx");
    }
    protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        cmd = new SqlCommand("update tbl_sup set spname=@sn,sptyp=@st,oid=@oid,vname=@vn,vtype=@vt,vno=@vno,spdate=@sd,spamo=@sa where spid=@spid",cn);

        cmd.Parameters.AddWithValue("@spid",Request.QueryString["spid"].ToString());
        TextBox sn=(TextBox)FormView1.FindControl("spname");
        cmd.Parameters.AddWithValue("@sn",sn.Text);
        RadioButtonList st=(RadioButtonList)FormView1.FindControl("styp");
        cmd.Parameters.AddWithValue("@st",st.SelectedItem.Text);
        TextBox oid = (TextBox)FormView1.FindControl("oid_txt");
        cmd.Parameters.AddWithValue("@oid",oid.Text);
        TextBox vn = (TextBox)FormView1.FindControl("vname");
        cmd.Parameters.AddWithValue("@vn", vn.Text);
        DropDownList vt = (DropDownList)FormView1.FindControl("vtyp");
        cmd.Parameters.AddWithValue("@vt", vt.SelectedItem.Text);
        TextBox vno = (TextBox)FormView1.FindControl("vno");
        cmd.Parameters.AddWithValue("@vno", vno.Text);
        TextBox sd = (TextBox)FormView1.FindControl("spdate");
        cmd.Parameters.AddWithValue("@sd", sd.Text);
        TextBox amo = (TextBox)FormView1.FindControl("amo");
        cmd.Parameters.AddWithValue("@sa", amo.Text);

        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

        FormView1.ChangeMode(FormViewMode.ReadOnly);

        fill_fun();

        
    }
}