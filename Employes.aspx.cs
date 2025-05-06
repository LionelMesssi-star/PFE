using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Employes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        using (DataLayerExperienceDataContext context = new DataLayerExperienceDataContext())
        {
            var countEffT = context.countEffTotal().ToList();
            if (countEffT.Count >= 1)
            {
                TxtEffT.Text = countEffT[0].EffectifTotal.ToString();

            }
        }
    }
    public string GetEmployeeCountText()
    {
        // Vous devrez implémenter la logique pour obtenir le nombre réel d'employés
        // Par exemple, si vous avez accès à GridCl :
        if (GridCl != null && GridCl.VisibleRowCount > 0)
        {
            return $"{GridCl.VisibleRowCount} employés affichés";
        }
        return "Aucun employé trouvé";
    }

}