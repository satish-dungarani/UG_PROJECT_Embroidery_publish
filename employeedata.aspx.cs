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

public partial class employeedata : System.Web.UI.Page
{
    SqlConnection cn;
    SqlDataAdapter da;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        da = new SqlDataAdapter("select * from tbl_emp", cn);
        dt = new DataTable();
        da.Fill(dt);
        DataSet1.employeetableDataTable dt1 = new DataSet1.employeetableDataTable();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            dt1.AddemployeetableRow(dt.Rows[i]["eid"].ToString(), dt.Rows[i]["ename"].ToString(), dt.Rows[i]["gender"].ToString(), dt.Rows[i]["dob"].ToString(), dt.Rows[i]["age"].ToString(), dt.Rows[i]["state"].ToString(), dt.Rows[i]["city"].ToString(), dt.Rows[i]["addr"].ToString(), dt.Rows[i]["cnno"].ToString(),dt.Rows[i]["email"].ToString(),dt.Rows[i]["salary"].ToString());
        }
        ReportDocument rdoc = new ReportDocument();
        rdoc.Load(Server.MapPath("employeereport.rpt"));
        rdoc.SetDataSource((DataTable)dt1);
        CrystalReportViewer1.ReportSource = rdoc;
    }
}