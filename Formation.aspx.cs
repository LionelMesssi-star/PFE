using DevExpress.DashboardWeb;
using DevExpress.DataAccess.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Formation : System.Web.UI.Page
{
    string dashboardsPath = @"C:/SiteBilanSocial/DashboardXml/";
    protected void Page_Load(object sender, EventArgs e)
    {
        DashboardFileStorage storage = new DashboardFileStorage(dashboardsPath);
        Formations.SetDashboardStorage(storage);

        Formations.SetConnectionStringsProvider(new ConfigFileConnectionStringsProvider());
        Formations.AllowInspectAggregatedData = true;
        Formations.AllowInspectRawData = true;
        Formations.DashboardId = "Formation";
         

    }
}