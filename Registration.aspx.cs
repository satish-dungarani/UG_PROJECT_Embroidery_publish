using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Registration : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {

            

            //da = new SqlDataAdapter("select uname from tbl_reg", cn);
            //ds = new DataSet();
            //da.Fill(ds);
            //string un=ds.Tables[0].Rows[0]["uname"].ToString();

            //if ( un == tbuname.Text)
            //{
            //    tbuname.Text = "";
            //    tbuname.Focus();
            //    Response.Write("<script>alert('Please enter another user name this is allready used.')</script>");
            //}
            //else
            //{
                cmd = new SqlCommand("insert into tbl_reg values(@un,@pwd,@fname,@lname,@gen,@pin,@add,@lm,@ct,@st,@cnt,@pno,@em)", cn);

                cmd.Parameters.AddWithValue("@un", tbuname.Text);
                cmd.Parameters.AddWithValue("@pwd", tbpwd.Text);
                cmd.Parameters.AddWithValue("@fname", tbfname.Text);
                cmd.Parameters.AddWithValue("@lname", tblname.Text);
                cmd.Parameters.AddWithValue("@gen", rblgender.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@pin", tbpin.Text);
                cmd.Parameters.AddWithValue("@add", tbaddress.Text);
                cmd.Parameters.AddWithValue("@lm", tblm.Text);
                cmd.Parameters.AddWithValue("@ct", ddlcity.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@st", ddlstate.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@cnt", tbcnt.Text);
                cmd.Parameters.AddWithValue("@pno", tbcontno.Text);
                cmd.Parameters.AddWithValue("@em", tbemail.Text);
            
       
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();

                tbuname.Text = "";
                tbpwd.Text = "";
                tbfname.Text = "";
                tblname.Text = "";
                tbemail.Text = "";
                tbcontno.Text = "";
                tbaddress.Text = "";
                tbpin.Text = "";
                tblm.Text = "";
                tbcnt.Text = "(India) Only available for india.";

                //Response.Write("<script>alert('Successfully Register in Embroidery site now you login in our site.')</script>");
                Response.Redirect("Login.aspx");
            //}
       
        }
        catch(Exception eq)
        {
            Console.WriteLine("<script>alert('There is some problem regarding connection')</script>");
        }
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        tbuname.Text = "";
        tbpwd.Text = "";
        tbfname.Text = "";
        tblname.Text = "";
        tbemail.Text = "";
        tbcontno.Text = "";
        tbaddress.Text = "";
        tbpin.Text = "";
        tblm.Text = "";
        tbcnt.Text = "(India) Only available for india.";
    }

}