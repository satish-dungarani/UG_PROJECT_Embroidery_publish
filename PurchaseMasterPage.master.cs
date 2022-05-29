using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PurchaseMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }
    protected void lo_link_Command(object sender, CommandEventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("Home.aspx");
    }
}
