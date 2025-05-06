using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnValidation_Click(object sender, EventArgs e)
    {
        DataLayerExperienceDataContext Layer = new DataLayerExperienceDataContext();



        var req = (from p in Layer.Usersession
                   where p.Login == Textlogin.Text & p.Password == Textmdp.Text
                   select p).ToList();


        if ((req.Count > 0))
        {
            Page.Session["matricule"] = req[0].Login;
            Page.Session["ID_Role"] = req[0].ID_Role;
            Page.Session["UtilisateurSession"] = req[0].Nom_Prenom;

            Page.Response.Redirect("Default.aspx?ModuleID=10");
        }
        else { 
            Page.Response.Redirect("Contact.aspx");
        }
    }
}