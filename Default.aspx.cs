using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeWebUI;

public partial class _Default : Page
{


 


    protected void Page_Load(object sender, EventArgs e)
    {

        var Matricule = Page.Session["matricule"];
        var User = Page.Session["UtilisateurSession"];

        if (Matricule == null)
        {
            Page.Response.Redirect("Contact.aspx");
        }
        else
        {
            lblNomSession.InnerText = User.ToString();

            var IdRole = Convert.ToInt32(  Page.Session["ID_Role"]);

            DataLayerExperienceDataContext Layer = new DataLayerExperienceDataContext();

            // Gestion des workflows
            var req = (from p in Layer.Permition_GetByIDRole(IdRole)
                       select p).ToList();


            if ((req.Count > 0))
            {
                MainMenuRibbon.Tabs[1].Groups[0].Items[0].Visible = (bool) req[0].RibbonEffectif;
                MainMenuRibbon.Tabs[1].Groups[0].Items[1].Visible = (bool)req[0].RibbonParcoursproo;
                MainMenuRibbon.Tabs[1].Groups[0].Items[2].Visible = (bool)req[0].RibbonCompetences;
                MainMenuRibbon.Tabs[1].Groups[0].Items[3].Visible = (bool)req[0].RibbonFormation;
                MainMenuRibbon.Tabs[1].Groups[0].Items[4].Visible = (bool)req[0].RibbonRemuneration;
                MainMenuRibbon.Tabs[1].Groups[0].Items[5].Visible = (bool)req[0].RibbonSanteSecurites;
                MainMenuRibbon.Tabs[1].Groups[0].Items[6].Visible = (bool)req[0].RibbonAbsentiesme;


                // Stock

                // Management Ajout données 
                MainMenuRibbon.Tabs[2].Groups[0].Items[0].Visible = (bool)req[0].RibbonEmployes;
                MainMenuRibbon.Tabs[2].Groups[0].Items[1].Visible = (bool)req[0].RibbonSalaire;
                MainMenuRibbon.Tabs[2].Groups[0].Items[2].Visible = (bool)req[0].RibbonAbsentiesmes;
                MainMenuRibbon.Tabs[2].Groups[0].Items[3].Visible = (bool)req[0].RibbonFormationmation;
                MainMenuRibbon.Tabs[2].Groups[0].Items[4].Visible = (bool)req[0].RibbonParcourspro;
                MainMenuRibbon.Tabs[2].Groups[0].Items[5].Visible = (bool)req[0].RibbonCompetence;
                MainMenuRibbon.Tabs[2].Groups[0].Items[6].Visible = (bool)req[0].RibbonSanteSecurite;
                MainMenuRibbon.Tabs[2].Groups[0].Items[7].Visible = (bool)req[0].RibbonDepenseFormation;

                MainMenuRibbon.Tabs[2].Groups[1].Items[0].Visible = (bool)req[0].RibbonControle;
                MainMenuRibbon.Tabs[2].Groups[1].Items[1].Visible = (bool)req[0].RibbonRessource;
                MainMenuRibbon.Tabs[2].Groups[1].Items[2].Visible = (bool)req[0].RibbonPermission;
                MainMenuRibbon.Tabs[2].Groups[1].Items[3].Visible = (bool)req[0].RibbonRole;

                // Paramétrages
                MainMenuRibbon.Tabs[3].Visible = (bool)req[0].RibbonParametrage;

            }
        }


        //DataLayerExperienceDataContext Layer = new DataLayerExperienceDataContext();

        //var req = (from q in Layer.GetAdminByMatricule(Matricule.ToString()) select q).ToList();

        //var chois = req.Count();


        //if (chois == 0)
        //{

        //    MainMenuRibbon.Contexts[0].Tabs[2].Visible = false;
        //    MainMenuRibbon.Contexts[0].Tabs[3].Visible = false;

        //}
    }
}