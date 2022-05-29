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
public partial class fabricdata : System.Web.UI.Page
{
    SqlConnection cn;
    SqlDataAdapter da;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        da = new SqlDataAdapter("select * from tbl_fab where fbid<>'4'",cn);
        dt = new DataTable();
        da.Fill(dt);
        DataSet1.fabrictableDataTable dt1 = new DataSet1.fabrictableDataTable();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            dt1.AddfabrictableRow(dt.Rows[i]["fbid"].ToString(), dt.Rows[i]["fbname"].ToString(), dt.Rows[i]["fbava"].ToString(), dt.Rows[i]["fbused"].ToString(), dt.Rows[i]["fbtt"].ToString(), dt.Rows[i]["fbtype"].ToString(), dt.Rows[i]["fbbrand"].ToString(), dt.Rows[i]["fbclr"].ToString(), dt.Rows[i]["fbprice"].ToString());
        }
        ReportDocument rdoc = new ReportDocument();
        rdoc.Load(Server.MapPath("fabricreport.rpt"));
        rdoc.SetDataSource((DataTable)dt1);
        CrystalReportViewer1.ReportSource = rdoc;
    }
}