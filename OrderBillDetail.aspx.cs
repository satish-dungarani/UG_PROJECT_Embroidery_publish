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
using System.Text;
using System.Net;
using System.IO;
using ASPSnippets.SmsAPI;

public partial class OrderBillDetail : System.Web.UI.Page
{
    SqlConnection cn;
    SqlDataAdapter da,da1;
    DataSet ds;
    SqlCommand cmd;
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
        da = new SqlDataAdapter("select * from tbl_odr inner join tbl_reg on tbl_odr.uname=tbl_reg.uname where oid=@oid",cn);
        da.SelectCommand.Parameters.AddWithValue("@oid",Session["oid"].ToString());
        ds = new DataSet();
        da.Fill(ds);

        FormView1.DataSource = ds;
        FormView1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        Label da = (Label)FormView1.FindControl("da_lbl");
        Label pa = (Label)FormView1.FindControl("pa_lbl");
        Label dc = (Label)FormView1.FindControl("dc_lbl");
        decimal j = ((Convert.ToDecimal(pa.Text) + Convert.ToDecimal(dc.Text)) - Convert.ToDecimal(da.Text));

        da1 = new SqlDataAdapter("select * from tbl_odr inner join tbl_reg on tbl_reg.uname=tbl_odr.uname where tbl_odr.oid=@oid", cn);
        da1.SelectCommand.Parameters.AddWithValue("@oid", Session["oid"].ToString());
        da1.SelectCommand.Parameters.AddWithValue("@un", Session["uname"].ToString());

        ds = new DataSet();
        da1.Fill(ds);


        //sms send .......


        SMS.APIType = SMSGateway.Site2SMS;
        SMS.MashapeKey = "egGNrPbPG3OcRC8UAaHp8ogpXSEKMGvx";
        SMS.Username = "8866804728";
        SMS.Password = "dassu1020";
        if (Convert.ToInt16(Session["flag"]) == 1)
        {
            string msg = "Order ID : " + Session["oid"].ToString()
            + ",     Customer Name : " + ds.Tables[0].Rows[0]["fname"].ToString() + " " + ds.Tables[0].Rows[0]["lname"].ToString()
            + ",     Pattern ID : " + ds.Tables[0].Rows[0]["pid"].ToString()
            + ",     Fabric ID : " + ds.Tables[0].Rows[0]["fid"].ToString()
            + ",     Thread Type : " + ds.Tables[0].Rows[0]["thtype"].ToString()
            + ",     P.A. : " + j + " Rs.";
            
            SMS.SendSms(ds.Tables[0].Rows[0]["phone"].ToString(), msg);
        }
        else
        {
            string msg= "Order ID : " + Session["oid"].ToString()
            + ",     Customer Name : " + ds.Tables[0].Rows[0]["fname"].ToString() + " " + ds.Tables[0].Rows[0]["lname"].ToString()
            + ",     Pattern ID : " + ds.Tables[0].Rows[0]["pid"].ToString()
            + ",     Fabric ID : " + ds.Tables[0].Rows[0]["fid"].ToString()
            + ",     Thread Type : " + ds.Tables[0].Rows[0]["thtype"].ToString()
            + ",     D.A. : " + ds.Tables[0].Rows[0]["diposit"].ToString() + " Rs.";
            
            SMS.SendSms(ds.Tables[0].Rows[0]["phone"].ToString(), msg);
        }


        //mail coding........

        MailMessage mail = new MailMessage();

        mail.To.Add(ds.Tables[0].Rows[0]["email"].ToString());

        mail.From = new MailAddress("gangadwaladarshan@gmail.com");

        mail.Subject = "Payment Bill";


        if (Convert.ToInt16(Session["flag"]) == 1)
        {
            mail.Body = "Order ID : " + Session["oid"].ToString()
            + ",     Customer Name : " + ds.Tables[0].Rows[0]["fname"].ToString() + " " + ds.Tables[0].Rows[0]["lname"].ToString()
            + ",     Pattern ID : " + ds.Tables[0].Rows[0]["pid"].ToString()
            + ",     Fabric ID : " + ds.Tables[0].Rows[0]["fid"].ToString()
            + ",     Thread Type : " + ds.Tables[0].Rows[0]["thtype"].ToString()
            + ",     Final Payment Amount : " + j + " Rs.";

        }
        else
        {

            mail.Body = "Order ID : " + Session["oid"].ToString()
            + ",     Customer Name : " + ds.Tables[0].Rows[0]["fname"].ToString() + " " + ds.Tables[0].Rows[0]["lname"].ToString()
            + ",     Pattern ID : " + ds.Tables[0].Rows[0]["pid"].ToString()
            + ",     Fabric ID : " + ds.Tables[0].Rows[0]["fid"].ToString()
            + ",     Thread Type : " + ds.Tables[0].Rows[0]["thtype"].ToString()
            + ",     Diposit Amount : " + ds.Tables[0].Rows[0]["diposit"].ToString() + " Rs.";
        }

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


        //Payment entry in database.

        cmd = new SqlCommand("insert into tbl_pay values(@oid,@un,@pd,@am,'US Dollar',@pt)", cn);

        cmd.Parameters.AddWithValue("@oid", Session["oid"].ToString());
        cmd.Parameters.AddWithValue("@un", Session["uname"].ToString());
        cmd.Parameters.AddWithValue("@pd", DateTime.Today);
        if (Convert.ToInt16(Session["flag"]) == 1)
        {
            cmd.Parameters.AddWithValue("@am", j.ToString());
            cmd.Parameters.AddWithValue("@pt", "Final");
        }
        else
        {
            cmd.Parameters.AddWithValue("@am", da.Text);
            cmd.Parameters.AddWithValue("@pt", "Diposit");
        }

        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

        //bill generate....

        if (Convert.ToInt16(Session["flag"]) == 1)
        {
            Response.Redirect("finalpaydata.aspx");
        }
        else 
        {
            Response.Redirect("dipositpaydata.aspx");
        }
    }
}