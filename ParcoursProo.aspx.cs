using DevExpress.DashboardWeb;
using DevExpress.DataAccess.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ParcoursProo : System.Web.UI.Page
{
    string dashboardsPath = @"C:/SiteBilanSocial/DashboardXml/";
    protected void Page_Load(object sender, EventArgs e)
    {
        DashboardFileStorage storage = new DashboardFileStorage(dashboardsPath);
        Mouvement.SetDashboardStorage(storage);

        Mouvement.SetConnectionStringsProvider(new ConfigFileConnectionStringsProvider());
        Mouvement.AllowInspectAggregatedData = true;
        Mouvement.AllowInspectRawData = true;
        Mouvement.DashboardId = "Mouvement";
        Sanction.SetDashboardStorage(storage);

        Sanction.SetConnectionStringsProvider(new ConfigFileConnectionStringsProvider());
        Sanction.AllowInspectAggregatedData = true;
        Sanction.AllowInspectRawData = true;
        Sanction.DashboardId = "Sanction";

    }
}