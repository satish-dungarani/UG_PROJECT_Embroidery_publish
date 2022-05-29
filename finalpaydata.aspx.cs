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

public partial class finalpaydata : System.Web.UI.Page
{
    DataTable dt;
    SqlDataAdapter da;
    SqlConnection cn;

    protected void Page_Load(object sender, EventArgs e)
    {
        
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        da = new SqlDataAdapter("select * from tbl_odr where oid=@oid", cn);
        da.SelectCommand.Parameters.AddWithValue("@oid", Session["oid"].ToString());
        dt = new DataTable();
        da.Fill(dt);
        DataSet1.ordertableDataTable dt1 = new DataSet1.ordertableDataTable();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            dt1.AddordertableRow(dt.Rows[i]["oid"].ToString(), dt.Rows[i]["uname"].ToString(), dt.Rows[i]["pid"].ToString(), dt.Rows[i]["fid"].ToString(), dt.Rows[i]["thtype"].ToString(), dt.Rows[i]["fbqnt"].ToString(), dt.Rows[i]["odate"].ToString(), dt.Rows[i]["ddate"].ToString(), dt.Rows[i]["dcharge"].ToString(), dt.Rows[i]["diposit"].ToString(), dt.Rows[i]["amount"].ToString(), dt.Rows[i]["status"].ToString());
        }
        ReportDocument rdoc = new ReportDocument();
        rdoc.Load(Server.MapPath("finalpayreport.rpt"));
        rdoc.SetDataSource((DataTable)dt1);
        CrystalReportViewer1.ReportSource = rdoc;
    }
}