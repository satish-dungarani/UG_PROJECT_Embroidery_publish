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

public partial class patterndata : System.Web.UI.Page
{
    SqlConnection cn;
    SqlDataAdapter da;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        da = new SqlDataAdapter("select * from tbl_ptn", cn);
        dt = new DataTable();
        da.Fill(dt);
        DataSet1.patterntableDataTable dt1 = new DataSet1.patterntableDataTable();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            dt1.AddpatterntableRow(dt.Rows[i]["pid"].ToString(), dt.Rows[i]["pname"].ToString(), dt.Rows[i]["stitches"].ToString(), dt.Rows[i]["color"].ToString(), dt.Rows[i]["height"].ToString(), dt.Rows[i]["width"].ToString(), dt.Rows[i]["price"].ToString());
        }
        ReportDocument rdoc = new ReportDocument();
        rdoc.Load(Server.MapPath("patternreport.rpt"));
        rdoc.SetDataSource((DataTable)dt1);
        CrystalReportViewer1.ReportSource = rdoc;
    }
}