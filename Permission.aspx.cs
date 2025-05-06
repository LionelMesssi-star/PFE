using DevExpress.Web;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Permission : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Tu peux mettre ici des initialisations si besoin
    }

    protected void GridRessources_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
    {
        if (GridCl.FocusedRowIndex >= 0)
        {
            object idRoleObj = GridCl.GetRowValues(GridCl.FocusedRowIndex, "ID_Role");

            if (idRoleObj != null)
            {
                int IDRole = Convert.ToInt32(idRoleObj);
                SqlAP_Ressource.SelectParameters["ID_Role"].DefaultValue = IDRole.ToString();
                GridRessources.DataBind();
            }
        }
    }

    protected void callDetailArticle_Callback(object sender, CallbackEventArgsBase e)
    {
        callDetailArticle.DataBind();
    }

    protected void GridRC_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
    {
        GridRC.DataBind();
    }

    protected void SqlRC_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        if (GridCl.FocusedRowIndex >= 0)
        {
            object idRoleObj = GridCl.GetRowValues(GridCl.FocusedRowIndex, "ID_Role");

            if (idRoleObj != null)
            {
                int IDRole = Convert.ToInt32(idRoleObj);
                e.Command.Parameters[0].Value = IDRole;
            }
        }
    }
}