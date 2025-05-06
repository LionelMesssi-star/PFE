using DevExpress.Web;
using DevExpress.XtraCharts.Native;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

public partial class Ressource : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    { 
    }



        protected void GridCl_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
    {
        GridCl.JSProperties["cp_Update"] = "";

        var PeriodesDate = DateTime.Now.Date.ToString("yyyyMMdd");
        var PeriodesHeur = DateTime.Now.ToString("hhmmss");
        String password = "Eppm" + PeriodesDate + PeriodesHeur;// txtConfirmedPwd.Text;

        var ID = Convert.ToInt32(GridCl.GetRowValues(GridCl.FocusedRowIndex, "ID"));

        DataLayerExperienceDataContext layer = new DataLayerExperienceDataContext();

        layer.updateUsersession1(ID, password);
        GridCl.DataBind();

    }
}


//var Nom = Convert.ToInt32(GridCl.GetRowValues(GridCl.FocusedRowIndex, "Nom_Prenom"));



//GridCl.JSProperties["cp_Update"] = "Update";




