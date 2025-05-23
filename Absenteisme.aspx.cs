using DevExpress.DashboardCommon;
using DevExpress.DashboardWeb;
using DevExpress.DataAccess.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Absenteisme : System.Web.UI.Page
{
    string dashboardsPath = @"C:/SiteBilanSocial/DashboardXml/";

    protected void Page_Load(object sender, EventArgs e)
    {
        using (DataLayerExperienceDataContext context = new DataLayerExperienceDataContext())
        {

            var countAbsList = context.Afficher_Abs_Moyen().ToList();
            if (countAbsList.Count >= 2)
            {
                txtAbsMoyenhomme.Text = countAbsList[0].Moyenne_Jours_Absence.ToString();
                txtAbsMoyenFamme.Text = countAbsList[1].Moyenne_Jours_Absence.ToString();

            }
            var countAnncienteList = context.Afficher_Abs_Max().ToList();
            if (countAnncienteList.Count >= 2)
            {
                 txtAbsHomme.Text = countAnncienteList[0].Max_Jours_Absence.ToString();
                txtAbsFamme.Text = countAnncienteList[1].Max_Jours_Absence.ToString();
            }

        }
        {
            DashboardFileStorage storage = new DashboardFileStorage(dashboardsPath);
            Absenteismee.SetDashboardStorage(storage);

            Absenteismee.SetConnectionStringsProvider(new ConfigFileConnectionStringsProvider());
            Absenteismee.AllowInspectAggregatedData = true;
            Absenteismee.AllowInspectRawData = true;
            Absenteismee.DashboardId = "Absenteismee";

        }
    }
}