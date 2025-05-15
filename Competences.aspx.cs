using DevExpress.DashboardCommon;
using DevExpress.DashboardWeb;
using DevExpress.DataAccess.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Competences : System.Web.UI.Page
{
    string dashboardsPath = @"C:/SiteBilanSocial/DashboardXml/";
    protected void Page_Load(object sender, EventArgs e)
    {
        DashboardFileStorage storage = new DashboardFileStorage(dashboardsPath);
        Competence.SetDashboardStorage(storage);

        Competence.SetConnectionStringsProvider(new ConfigFileConnectionStringsProvider());
        Competence.AllowInspectAggregatedData = true;
        Competence.AllowInspectRawData = true;
        Competence.DashboardId = "Competence";
    }
}