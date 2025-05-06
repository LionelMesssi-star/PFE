using System;
using System.Linq;
using System.Web.UI;

public partial class Bilan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (DataLayerExperienceDataContext context = new DataLayerExperienceDataContext())
        {
            
            var countSexeList = context.countSexe().ToList();
            if (countSexeList.Count >= 2)
            {
                Txtnbr.Text = countSexeList[0].Nbr_Sexe.ToString();
                TxtnbrF.Text = countSexeList[1].Nbr_Sexe.ToString();
            }

            
            var countDepartementList = context.countDepartement().ToList();
            if (countDepartementList.Count >= 4)
            {
                Txtinfo.Text = countDepartementList[0].Nbr_Departement.ToString();
                TxtRH.Text = countDepartementList[1].Nbr_Departement.ToString();
                TxtMec.Text = countDepartementList[2].Nbr_Departement.ToString();
                TxtElec.Text = countDepartementList[3].Nbr_Departement.ToString();
            }

           
            var countFonctionList = context.countFonction().ToList();
            if (countFonctionList.Count >= 3)
            {
                TxtIng.Text = countFonctionList[0].Nbr_Fonction.ToString();
                TxtProj.Text = countFonctionList[1].Nbr_Fonction.ToString();
                TxtCad.Text = countFonctionList[2].Nbr_Fonction.ToString();
            }

            var countDateDepartList = context.countDateDepart().ToList();
            if (countDateDepartList.Count >= 3)
            {
                TxtDateD.Text = countDateDepartList[0].Number.ToString();
                TxtDateDD.Text = countDateDepartList[1].Number.ToString();
                TxtDateDDD.Text = countDateDepartList[2].Number.ToString();
            }

          
            var countDateEmbaucheList = context.countDateEmbauche().ToList();
            if (countDateEmbaucheList.Count >= 3)
            {
                TxtDateE.Text = countDateEmbaucheList[0].Number.ToString();
                TxtDateEE.Text = countDateEmbaucheList[1].Number.ToString();
                TxtDateEEE.Text = countDateEmbaucheList[2].Number.ToString();
            }

            
        }
    }
}
