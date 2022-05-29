using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.IO;
using ASPSnippets.SmsAPI;

public partial class Forgetpassword : System.Web.UI.Page
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
        da = new SqlDataAdapter("select * from tbl_reg where uname=@un and email=@em and phone=@ph",cn);
        da.SelectCommand.Parameters.AddWithValue("@un", un_txt.Text);
        da.SelectCommand.Parameters.AddWithValue("@em", em_txt.Text);
        da.SelectCommand.Parameters.AddWithValue("@ph", ph_txt.Text);
        ds = new DataSet();
        da.Fill(ds);

        //sms

        SMS.APIType = SMSGateway.Site2SMS;
        SMS.MashapeKey = "egGNrPbPG3OcRC8UAaHp8ogpXSEKMGvx";
        SMS.Username = "8866804728";
        SMS.Password = "dassu1020";
        string msg = "Your password is " + ds.Tables[0].Rows[0]["pwd"].ToString();
        SMS.SendSms(ds.Tables[0].Rows[0]["phone"].ToString(), msg);
        

        //mail

        MailMessage mail = new MailMessage();

        mail.To.Add(ds.Tables[0].Rows[0]["email"].ToString());

        mail.From = new MailAddress("gangadwaladarshan@gmail.com");

        mail.Subject = "Password of Embroidery Customer";

        mail.Body = "Your password is " + ds.Tables[0].Rows[0]["pwd"].ToString();

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

        Response.Redirect("Login.aspx");
    }
}