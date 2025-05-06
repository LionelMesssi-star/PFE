using DevExpress.Web;
using System;

public partial class Salaire : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void GridCl_DataBound(object sender, EventArgs e)
    {
        lblRecordCount.Text = GridCl.VisibleRowCount.ToString() + " salaires";
    }

    
}