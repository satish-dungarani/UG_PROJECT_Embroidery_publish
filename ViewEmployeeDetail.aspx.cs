using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ViewEmployeeDetail : System.Web.UI.Page
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
        da = new SqlDataAdapter("select * from tbl_emp where eid=@eid", cn);
        da.SelectCommand.Parameters.AddWithValue("@eid",Request.QueryString["eid"].ToString());
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
        try
        {
            cmd = new SqlCommand("update tbl_emp set ename=@en,gender=@gen,dob=@dob,age=@age,state=@st,city=@ct,addr=@addr,cnno=@mn,email=@email,salary=@bs,imgpath=@imgpath where eid=@eid", cn);

            Label empid = (Label)FormView1.FindControl("empid_lbl");
            cmd.Parameters.AddWithValue("@eid", empid.Text);
            TextBox empname = (TextBox)FormView1.FindControl("empname_txt");
            cmd.Parameters.AddWithValue("@en", empname.Text);
            RadioButtonList gender = (RadioButtonList)FormView1.FindControl("empgen_rbl");
            cmd.Parameters.AddWithValue("@gen", gender.SelectedItem.Text);
            TextBox dob = (TextBox)FormView1.FindControl("empdob_txt");
            cmd.Parameters.AddWithValue("@dob", dob.Text);
            TextBox age = (TextBox)FormView1.FindControl("empage_txt");
            cmd.Parameters.AddWithValue("@age", age.Text);
            DropDownList state = (DropDownList)FormView1.FindControl("empst_ddl");
            cmd.Parameters.AddWithValue("@st", state.SelectedItem.Text);
            DropDownList city = (DropDownList)FormView1.FindControl("empct_ddl");
            cmd.Parameters.AddWithValue("@ct", city.SelectedItem.Text);
            TextBox addr = (TextBox)FormView1.FindControl("empaddr_txt");
            cmd.Parameters.AddWithValue("@addr", addr.Text);
            TextBox cnno = (TextBox)FormView1.FindControl("empcn_txt");
            cmd.Parameters.AddWithValue("@mn", cnno.Text);
            TextBox email = (TextBox)FormView1.FindControl("empmail_txt");
            cmd.Parameters.AddWithValue("@email", email.Text);
            TextBox bs = (TextBox)FormView1.FindControl("bs_txt");
            cmd.Parameters.AddWithValue("@bs", bs.Text);

            FileUpload eimg_up = (FileUpload)FormView1.FindControl("empimg_up");
            string filename = eimg_up.FileName;
            string path = Server.MapPath("employeeimg") + "\\" + filename;
            eimg_up.SaveAs(path);

            string acpath = "~/employeeimg/" + filename;
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
        Response.Redirect("Employee_Reg.aspx");
    }
}