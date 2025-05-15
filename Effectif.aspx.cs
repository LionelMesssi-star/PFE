using DevExpress.DashboardCommon;
using DevExpress.DashboardWeb;
using DevExpress.DataAccess.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Effectif : System.Web.UI.Page
{
    string dashboardsPath = @"C:/SiteBilanSocial/DashboardXml/";

    protected void Page_Load(object sender, EventArgs e)
    {
        using (DataLayerExperienceDataContext context = new DataLayerExperienceDataContext())
        {

            var countSexeList = context.CountAgeMoy().ToList();
            if (countSexeList.Count >= 0)
            {
                txtAgeMoyen.Text = countSexeList[0].AgeMoyen.ToString();
                txtAgeMoyenhomme.Text = countSexeList[0].AgeH.ToString();
                txtAgeMoyenFamme.Text = countSexeList[0].AgeF.ToString();

            }
            var countAnncienteList = context.CountAnciennte().ToList();
            if (countAnncienteList.Count >= 0)
            {
                txtAnciennete.Text = countAnncienteList[0].AnciennteMoyen.ToString();
                txtAncienneteHomme.Text = countAnncienteList[0].AnciennteH.ToString();
                txtAncienneteFamme.Text = countAnncienteList[0].AnciennteF.ToString();
            }


        }
        {
            DashboardFileStorage storage = new DashboardFileStorage(dashboardsPath);
            Eff.SetDashboardStorage(storage);

            Eff.SetConnectionStringsProvider(new ConfigFileConnectionStringsProvider());
            Eff.AllowInspectAggregatedData = true;
            Eff.AllowInspectRawData = true;
            Eff.DashboardId = "Eff";

        }
    }
}
