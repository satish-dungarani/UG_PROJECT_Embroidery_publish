using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
	
public partial class Employee_Reg : System.Web.UI.Page
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
    protected void submit_btn(object sender, EventArgs e)
    {
        try
        {
            cmd = new SqlCommand("insert into tbl_emp values(@en,@gen,@dob,@age,@st,@ct,@addr,@mn,@email,@bs,@imgpath)", cn);

            cmd.Parameters.AddWithValue("@en", ename_txt.Text);
            cmd.Parameters.AddWithValue("@gen", gen_rbl.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@dob", dob_txt.Text);
            cmd.Parameters.AddWithValue("@age", age_txt.Text);
            cmd.Parameters.AddWithValue("@st", state_ddl.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ct", city_ddl.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@addr", addr_txt.Text);
            cmd.Parameters.AddWithValue("@mn", mn_txt.Text);
            cmd.Parameters.AddWithValue("@email", email_txt.Text);
            cmd.Parameters.AddWithValue("@bs",bs_txt.Text);

            string filename = img_up.FileName;
            string path = Server.MapPath("employeeimg") + "\\" + filename;
            img_up.SaveAs(path);

            string acpath = "~/employeeimg/" + filename;
            cmd.Parameters.AddWithValue("@imgpath", acpath);

            exe_fun();

            ename_txt.Text = "";
            dob_txt.Text = "";
            age_txt.Text = "";
            addr_txt.Text = "";
            mn_txt.Text = "";
            email_txt.Text = "";

            fill_fun();
        }
        catch (Exception eq)
        {
            Console.WriteLine("<script>alert('There is some problem regarding connection')</script>");
        }
    }


    void fill_fun()
    {
        da = new SqlDataAdapter("select * from tbl_emp", cn);
        ds = new DataSet();
        da.Fill(ds);

        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    
    void exe_fun()
    {
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }
   
 
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        fill_fun();
    }

    protected void view_lnk_Command(object sender, CommandEventArgs e)
    {
        
        Response.Redirect("ViewEmployeeDetail.aspx?eid="+e.CommandArgument);
    }
    protected void multi_CheckedChanged(object sender, EventArgs e)
    {

        CheckBox chk1 = (CheckBox)GridView1.HeaderRow.FindControl("multi");
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox chk = (CheckBox)GridView1.Rows[i].FindControl("single");
            if (chk1.Checked)
            {
                chk.Checked = true;
            }
            else
            {
                chk.Checked = false;
            }

        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        cmd = new SqlCommand("delete from tbl_emp where eid=@eid",cn);

        Label eid = (Label)GridView1.Rows[e.RowIndex].FindControl("empid_lbl");
        cmd.Parameters.AddWithValue("@eid",eid.Text);

        exe_fun();

        fill_fun();
    }

    protected void sal_lnk_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("SalaryPayment.aspx?eid=" + e.CommandArgument);
    }
}