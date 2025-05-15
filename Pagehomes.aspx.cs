using DevExpress.DashboardWeb;
using DevExpress.DataAccess.Web;
using DevExpress.Office.Drawing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pagehomes : System.Web.UI.Page
{
    
        string dashboardsPath = @"C:/SiteBilanSocial/DashboardXml/";
    protected void Page_Load(object sender, EventArgs e)
    {
        DashboardFileStorage storage = new DashboardFileStorage(dashboardsPath);
        EffTT.SetDashboardStorage(storage);

         EffTT.SetConnectionStringsProvider(new ConfigFileConnectionStringsProvider());
        EffTT.AllowInspectAggregatedData = true;
        EffTT.AllowInspectRawData = true;
        EffTT.DashboardId = "EffTT";

    }
}
