using DevExpress.DashboardWeb;
using DevExpress.DataAccess.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SanteSecurites : System.Web.UI.Page
{
    string dashboardsPath = @"C:/SiteBilanSocial/DashboardXml/";

    protected void Page_Load(object sender, EventArgs e)
    {
        DashboardFileStorage storage = new DashboardFileStorage(dashboardsPath);
        Maladie.SetDashboardStorage(storage);

        Maladie.SetConnectionStringsProvider(new ConfigFileConnectionStringsProvider());
        Maladie.AllowInspectAggregatedData = true;
        Maladie.AllowInspectRawData = true;
        Maladie.DashboardId = "Maladie";

        Accident.SetDashboardStorage(storage);

        Accident.SetConnectionStringsProvider(new ConfigFileConnectionStringsProvider());
        Accident.AllowInspectAggregatedData = true;
        Accident.AllowInspectRawData = true;
        Accident.DashboardId = "Accident";
    }
}