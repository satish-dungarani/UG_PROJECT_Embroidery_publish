using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using CrystalDecisions.CrystalReports.Engine;

public partial class BillGenerate : System.Web.UI.Page
{
    DataTable dt;
    SqlDataAdapter da;
    SqlConnection cn;

    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        da = new SqlDataAdapter("select * from tbl_pay inner join tbl_odr on tbl_odr.oid=tbl_pay.oid where tbl_pay.pyid=@pyid", cn);
        da.SelectCommand.Parameters.AddWithValue("@pyid", Request.QueryString["pyid"].ToString());
        dt = new DataTable();
        da.Fill(dt);
        DataSet1.paymentDataTable dt1 = new DataSet1.paymentDataTable();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            dt1.AddpaymentRow(dt.Rows[i]["pyid"].ToString(), dt.Rows[i]["oid"].ToString(), dt.Rows[i]["uname"].ToString(), dt.Rows[i]["pid"].ToString(), dt.Rows[i]["fid"].ToString(), dt.Rows[i]["pydate"].ToString(), dt.Rows[i]["amount"].ToString(), dt.Rows[i]["ptype"].ToString());
        }
        ReportDocument rdoc = new ReportDocument();
        rdoc.Load(Server.MapPath("Billgenerate.rpt"));
        rdoc.SetDataSource((DataTable)dt1);
        CrystalReportViewer1.ReportSource = rdoc;
    }
}