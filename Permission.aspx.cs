using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

public partial class Permission : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridRessources_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
    {
        var IDRole = Convert.ToInt32(GridRoles.GetRowValues(GridRoles.FocusedRowIndex, "ID_Role"));

        SqlRessources.SelectParameters["ID_Role"].DefaultValue = IDRole.ToString();

        GridRessources.DataBind();
    }



    protected void callDetailArticle_Callback(object sender, CallbackEventArgsBase e)
    {
        callDetailArticle.DataBind();

    }



    protected void GridRC_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
    {
        GridRC.DataBind();

    }

    protected void SqlRC_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        var IDRoles = Convert.ToInt32(GridRoles.GetRowValues(GridRoles.FocusedRowIndex, "ID_Role"));
        e.Command.Parameters[0].Value = IDRoles;
    }
}