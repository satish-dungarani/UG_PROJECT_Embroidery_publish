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

public partial class ContactUs : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlConnection cn;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        cmd = new SqlCommand("insert into tbl_cnt values(@nm,@em,@pn,@sub,@msg,@rp)",cn);

        cmd.Parameters.AddWithValue("@nm",fn_txt.Text + ln_txt.Text);
        cmd.Parameters.AddWithValue("@em", em_txt.Text);
        cmd.Parameters.AddWithValue("@pn", pn_txt.Text);
        cmd.Parameters.AddWithValue("@sub",sb_txt.Text);
        cmd.Parameters.AddWithValue("@msg", msg_txt.Text);
        cmd.Parameters.AddWithValue("@rp", "no");

        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

        //mail send to customer care.

        MailMessage mail = new MailMessage();

        mail.To.Add("gangadwaladarshan@gmail.com");

        mail.From = new MailAddress("gangadwaladarshan@gmail.com");

        mail.Subject = "Contact Us";

        mail.Body = "Customer Message : " + msg_txt.Text;

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

        if (cp_cb.Checked == true)
        {
            MailMessage mal = new MailMessage();

            mal.To.Add(em_txt.Text);

            mal.From = new MailAddress("gangadwaladarshan@gmail.com");

            mal.Subject = "Contact Us";

            mal.Body = "Customer Message : " + msg_txt.Text;

            //string atch = Server.MapPath("problem.docx");
            // mail.Attachments.Add(new Attachment(atch));
            SmtpClient smp = new SmtpClient();
            //smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis;
            smp.Host = "smtp.gmail.com"; //Or Your SMTP Server Address   587
            smp.Port = 587;
            //pop.mail.yahoo.com
            smp.Credentials = new System.Net.NetworkCredential
               ("gangadwaladarshan@gmail.com", "ddd3277426");
            //Or your Smtp Email ID and Password
            smp.EnableSsl = true;
            smp.Send(mal);
        }

        fn_txt.Text ="";
        ln_txt.Text="";
        em_txt.Text="";
        pn_txt.Text="";
        sb_txt.Text="";
        msg_txt.Text = "";
    }
}