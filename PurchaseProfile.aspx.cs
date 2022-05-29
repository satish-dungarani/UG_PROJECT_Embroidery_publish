using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class PurchaseProfile : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            Label1.Text = Session["uname"].ToString();
        }
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        if (!IsPostBack == true)
        {
            fill_vill_form();
        }

    }
    public void fill_vill_form()
    {
        string str = Session["uname"].ToString();
        da = new SqlDataAdapter("select * from tbl_reg where uname=@un", cn);
        da.SelectCommand.Parameters.AddWithValue("@un", str);
        dt = new DataTable();
        da.Fill(dt);
        FormView1.DataSource = dt;
        FormView1.DataBind();

    }
    protected void FormView1_ModeChanging(object sender, FormViewModeEventArgs e)
    {
        FormView1.ChangeMode(e.NewMode);
        fill_vill_form();
    }

    protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        try
        {
            cmd = new SqlCommand("update tbl_reg set fname=@fn,lname=@ln,gender=@gen,pincode=@pin,address=@addr,landmark=@lm,city=@ct,state=@st,country=@cnt,phone=@pn,email=@email where uname=@un", cn);

            Label un = (Label)FormView1.FindControl("un_lbl");
            cmd.Parameters.AddWithValue("@un", un.Text);
            TextBox fname = (TextBox)FormView1.FindControl("fn_txt");
            cmd.Parameters.AddWithValue("@fn", fname.Text);
            TextBox lname = (TextBox)FormView1.FindControl("ln_txt");
            cmd.Parameters.AddWithValue("@ln", lname.Text);
            RadioButtonList gender = (RadioButtonList)FormView1.FindControl("gen_rbl");
            cmd.Parameters.AddWithValue("@gen", gender.SelectedItem.Text);
            TextBox pin = (TextBox)FormView1.FindControl("pin_txt");
            cmd.Parameters.AddWithValue("@pin", pin.Text);
            TextBox addr = (TextBox)FormView1.FindControl("addr_txt");
            cmd.Parameters.AddWithValue("@addr", addr.Text);
            TextBox lm = (TextBox)FormView1.FindControl("lm_txt");
            cmd.Parameters.AddWithValue("@lm", lm.Text);
            DropDownList city = (DropDownList)FormView1.FindControl("ct_ddl");
            cmd.Parameters.AddWithValue("@ct", city.SelectedItem.Text);
            DropDownList state = (DropDownList)FormView1.FindControl("st_ddl");
            cmd.Parameters.AddWithValue("@st", state.SelectedItem.Text);
            TextBox cnt = (TextBox)FormView1.FindControl("cnt_txt");
            cmd.Parameters.AddWithValue("@cnt", cnt.Text);
            TextBox pno = (TextBox)FormView1.FindControl("pn_txt");
            cmd.Parameters.AddWithValue("@pn", pno.Text);
            TextBox email = (TextBox)FormView1.FindControl("mail_txt");
            cmd.Parameters.AddWithValue("@email", email.Text);

            exe_fun();

            FormView1.ChangeMode(FormViewMode.ReadOnly);
            fill_vill_form();

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
}