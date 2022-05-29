using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class PurchaseMaterial : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());

        

    }

    protected void typ_ddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        da = new SqlDataAdapter("select * from tbl_thrd where thtype=@typ", cn);
        da.SelectCommand.Parameters.AddWithValue("@typ",typ_ddl.SelectedItem.Text);
        ds = new DataSet();
        da.Fill(ds);

        clr_ddl.DataSource = ds;
        clr_ddl.DataTextField = ("color");
        clr_ddl.DataValueField = ("thid");
        clr_ddl.DataBind();
    }
    protected void sub_btn_Click(object sender, EventArgs e)
    {

        cmd = new SqlCommand("insert into tbl_pur values(@tid,'Thread',@qnt,@dt,@prc)",cn);
        
        da = new SqlDataAdapter("select * from tbl_thrd where thtype=@typ and color=@clr",cn);
        da.SelectCommand.Parameters.AddWithValue("@typ",typ_ddl.SelectedItem.Text);
        da.SelectCommand.Parameters.AddWithValue("@clr",clr_ddl.SelectedItem.Text);
        ds = new DataSet();
        da.Fill(ds);

        int aq =Convert.ToInt16(ds.Tables[0].Rows[0]["thaq"].ToString());
        int tq = Convert.ToInt16(ds.Tables[0].Rows[0]["thtq"].ToString());
        aq = aq + Convert.ToInt16(qnt_txt.Text);
        tq = tq + Convert.ToInt16(qnt_txt.Text);
        decimal pr= Convert.ToDecimal(prc_txt.Text) / Convert.ToDecimal(qnt_txt.Text);

        cmd.Parameters.AddWithValue("@tid", ds.Tables[0].Rows[0]["thid"].ToString());
        cmd.Parameters.AddWithValue("@qnt", qnt_txt.Text);
        cmd.Parameters.AddWithValue("@dt", dt_txt.Text);
        cmd.Parameters.AddWithValue("@prc", prc_txt.Text);

        da = new SqlDataAdapter("update tbl_thrd set thaq=@ta,thtq=@tt,price=@pr where thid=@tid", cn);
        da.SelectCommand.Parameters.AddWithValue("@tid", ds.Tables[0].Rows[0]["thid"].ToString());
        da.SelectCommand.Parameters.AddWithValue("@ta",aq.ToString());
        da.SelectCommand.Parameters.AddWithValue("@tt", tq.ToString());
        da.SelectCommand.Parameters.AddWithValue("@pr", pr.ToString());

        cn.Open();
        cmd.ExecuteNonQuery();
        da.SelectCommand.ExecuteNonQuery();
        cn.Close();

        qnt_txt.Text = "";
        prc_txt.Text = "";

    }
    protected void smt_btn_Click(object sender, EventArgs e)
    {
        cmd = new SqlCommand("insert into tbl_pur values(@fid,'Fabric',@qnt,@dt,@prc)", cn);

        da = new SqlDataAdapter("select * from tbl_fab where fbtype=@typ and fbclr=@clr", cn);
        da.SelectCommand.Parameters.AddWithValue("@typ", ft_ddl.SelectedItem.Text);
        da.SelectCommand.Parameters.AddWithValue("@clr", fc_ddl.SelectedItem.Text);
        ds = new DataSet();
        da.Fill(ds);

        int aq = Convert.ToInt16(ds.Tables[0].Rows[0]["fbava"].ToString());
        int tq = Convert.ToInt16(ds.Tables[0].Rows[0]["fbtt"].ToString());
        aq = aq + Convert.ToInt16(fq_txt.Text);
        tq = tq + Convert.ToInt16(fq_txt.Text);
        decimal pr = Convert.ToDecimal(pp_txt.Text) / Convert.ToDecimal(fq_txt.Text);

        cmd.Parameters.AddWithValue("@fid", ds.Tables[0].Rows[0]["fbid"].ToString());
        cmd.Parameters.AddWithValue("@qnt", fq_txt.Text);
        cmd.Parameters.AddWithValue("@dt", pd_txt.Text);
        cmd.Parameters.AddWithValue("@prc", pp_txt.Text);

        da = new SqlDataAdapter("update tbl_fab set fbava=@fa,fbtt=@ft,fbprice=@pr where fbid=@fid", cn);
        da.SelectCommand.Parameters.AddWithValue("@fid", ds.Tables[0].Rows[0]["fbid"].ToString());
        da.SelectCommand.Parameters.AddWithValue("@fa", aq.ToString());
        da.SelectCommand.Parameters.AddWithValue("@ft", tq.ToString());
        da.SelectCommand.Parameters.AddWithValue("@pr", pr.ToString());

        cn.Open();
        cmd.ExecuteNonQuery();
        da.SelectCommand.ExecuteNonQuery();
        cn.Close();

        fq_txt.Text = "";
        pp_txt.Text = "";

    }
    protected void ft_ddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        da = new SqlDataAdapter("select * from tbl_fab where fbtype=@typ", cn);
        da.SelectCommand.Parameters.AddWithValue("@typ", ft_ddl.SelectedItem.Text);
        ds = new DataSet();
        da.Fill(ds);

        fc_ddl.DataSource = ds;
        fc_ddl.DataTextField = ("fbclr");
        fc_ddl.DataValueField = ("fbid");
        fc_ddl.DataBind();
    }
}