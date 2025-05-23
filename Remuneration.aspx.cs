using DevExpress.DashboardWeb;
using DevExpress.DataAccess.Web;
using DevExpress.Office.Drawing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Remuneration : System.Web.UI.Page
{
    string dashboardsPath = @"C:/SiteBilanSocial/DashboardXml/";

    protected void Page_Load(object sender, EventArgs e)
    {
        using (DataLayerExperienceDataContext context = new DataLayerExperienceDataContext())
        {

            var countREmList = context.Afficher_Salaire_Min().ToList();
            if (countREmList.Count >= 0)
            {
                txtRemMoyenhomme.Text = countREmList[1].Salaire_Minimum.ToString();
                txtRemMoyenFamme.Text = countREmList[0].Salaire_Minimum.ToString();

            }


            var countRemmList = context.Afficher_Salaire_Max().ToList();
            if (countRemmList.Count >= 0)
            {
                txtMaxHomme.Text = countRemmList[1].Salaire_Max.ToString();
                txtMaxFamme.Text = countRemmList[0]. Salaire_Max.ToString();
            }
        }
        DashboardFileStorage storage = new DashboardFileStorage(dashboardsPath);
        Salaire.SetDashboardStorage(storage);

        Salaire.SetConnectionStringsProvider(new ConfigFileConnectionStringsProvider());
        Salaire.AllowInspectAggregatedData = true;
        Salaire.AllowInspectRawData = true;
        Salaire.DashboardId = "Salaire";

    }

}
