using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        da = new SqlDataAdapter("select * from tbl_reg where  uname=@uname and pwd=@pwd", cn);
        da.SelectCommand.Parameters.AddWithValue("@uname", tbuname.Text);
        da.SelectCommand.Parameters.AddWithValue("@pwd", tbpwd.Text);
        
        if (tbuname.Text=="Admin" && tbpwd.Text=="Darshan@007")
        {
            Session["uname"] = tbuname.Text;
            Response.Redirect("AdminHome.aspx");
        }
        else
        {
            dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["uname"] = tbuname.Text;
                Response.Redirect("PurchaseHome.aspx");
            }
            //else
            //{
            //    Response.Write("<script>alert('Username or Password is invalid')</script>");
            //    //Response.Redirect("Login.aspx");
            //}
        }
        
    }
    protected void fp_lnk_Click(object sender, EventArgs e)
    {
        Response.Redirect("Forgetpassword.aspx");
    }
}