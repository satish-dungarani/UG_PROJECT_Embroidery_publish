using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;

public partial class ContactReply : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        fill_fun();
    }
    
    void fill_fun()
    {
        da = new SqlDataAdapter("select * from tbl_cnt where cid=@cid",cn);
        da.SelectCommand.Parameters.AddWithValue("@cid",Request.QueryString["cid"].ToString());
        ds = new DataSet();
        da.Fill(ds);

        nm_lbl.Text = ds.Tables[0].Rows[0]["name"].ToString();
        em_lbl.Text = ds.Tables[0].Rows[0]["email"].ToString();
        pn_lbl.Text = ds.Tables[0].Rows[0]["phno"].ToString();
        sb_lbl.Text = ds.Tables[0].Rows[0]["sub"].ToString();
        msg_lbl.Text = ds.Tables[0].Rows[0]["msg"].ToString();
    }

    protected void rp_btn_Click(object sender, EventArgs e)
    {
        cmd = new SqlCommand("update tbl_cnt set reply='yes' where cid=@cid",cn);

        cmd.Parameters.AddWithValue("@cid",Request.QueryString["cid"].ToString());

        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

        //reply mail coding

        MailMessage mail = new MailMessage();

        mail.To.Add(em_lbl.Text);

        mail.From = new MailAddress("gangadwaladarshan@gmail.com");

        mail.Subject = "Reply By Customer Care of Embroidery";

        mail.Body = "Reply Message : " + rm_txt.Text;

        //string atch = Server.MapPath("problem.docx");
        // mail.Attachments.Add(new Attachment(atch));
        SmtpClient smtp = new SmtpClient();
        //smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis;
        smtp.Host = "smtp.gmail.com"; //Or Your SMTP Server Address   587
        smtp.Port = 587;
        //pop.mail.yahoo.com
        smtp.Credentials = new System.Net.NetworkCredential
           ("gangadwaladarshan@gmail.com", "ddd3277426");
        //Or your Smtp Email ID and Password
        smtp.EnableSsl = true;
        smtp.Send(mail);


        Response.Redirect("ViewContact.aspx");
    }
}