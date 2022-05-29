using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using CrystalDecisions.CrystalReports.Engine;
public partial class threaddata : System.Web.UI.Page
{
    SqlConnection cn;
    SqlDataAdapter da;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        da = new SqlDataAdapter("select * from tbl_thrd",cn);
        dt = new DataTable();
        da.Fill(dt);
        DataSet1.threadtableDataTable dt1 = new DataSet1.threadtableDataTable();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            dt1.AddthreadtableRow(dt.Rows[i]["thid"].ToString(), dt.Rows[i]["thname"].ToString(), dt.Rows[i]["thaq"].ToString(), dt.Rows[i]["thuq"].ToString(), dt.Rows[i]["thtq"].ToString(), dt.Rows[i]["thtype"].ToString(), dt.Rows[i]["color"].ToString(), dt.Rows[i]["price"].ToString());
        }
        ReportDocument rdoc=new ReportDocument();
        rdoc.Load(Server.MapPath("threadreport.rpt"));
        rdoc.SetDataSource((DataTable)dt1);
        CrystalReportViewer1.ReportSource = rdoc;
    }
}