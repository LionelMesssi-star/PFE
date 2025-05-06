using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Effectif : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (DataLayerExperienceDataContext context = new DataLayerExperienceDataContext())
        {

            var countSexeList = context.CountAgeMoy().ToList();
            if (countSexeList.Count >= 0)
            {
                txtAgeMoyen.Text = countSexeList[0].AgeMoyen.ToString();
                txtAgeMoyenhomme.Text = countSexeList[0].AgeH.ToString();
                txtAgeMoyenFamme.Text = countSexeList[0].AgeF.ToString();

            }
                var countAnncienteList = context.CountAnciennte().ToList();
                if (countAnncienteList.Count >= 0)
                {
                    txtAnciennete.Text = countAnncienteList[0].AnciennteMoyen.ToString();
                    txtAncienneteHomme.Text = countAnncienteList[0].AnciennteH.ToString();
                    txtAncienneteFamme.Text = countAnncienteList[0].AnciennteF.ToString();
                }


            //    var countFonctionList = context.countFonction().ToList();
            //    if (countFonctionList.Count >= 3)
            //    {
            //        TxtIng.Text = countFonctionList[0].Nbr_Fonction.ToString();
            //        TxtProj.Text = countFonctionList[1].Nbr_Fonction.ToString();
            //        TxtCad.Text = countFonctionList[2].Nbr_Fonction.ToString();
            //    }


            //    var countDateDepartList = context.countDateDepart().ToList();
            //    if (countDateDepartList.Count >= 3)
            //    {
            //        TxtDateD.Text = countDateDepartList[0].Number.ToString();
            //        TxtDateDD.Text = countDateDepartList[1].Number.ToString();
            //        TxtDateDDD.Text = countDateDepartList[2].Number.ToString();
            //    }


            //    var countDateEmbaucheList = context.countDateEmbauche().ToList();
            //    if (countDateEmbaucheList.Count >= 3)
            //    {
            //        TxtDateE.Text = countDateEmbaucheList[0].Number.ToString();
            //        TxtDateEE.Text = countDateEmbaucheList[1].Number.ToString();
            //        TxtDateEEE.Text = countDateEmbaucheList[2].Number.ToString();
            //    }
            //    var countEffT = context.countEffTotal().ToList();
            //    if (countEffT.Count >= 1)
            //    {
            //        TxtEffT.Text = countEffT[0].EffectifTotal.ToString();

            //    }
            //    var counttrancheAgeList = context.GetRepartitionParAge().ToList();
            //    if (counttrancheAgeList.Count >=3)
            //    {
            //        TxtMoins30.Text = counttrancheAgeList[0].NombreEmployes.ToString();
            //        Txt30a50.Text = counttrancheAgeList[1].NombreEmployes.ToString();
            //        TxtPlus50.Text = counttrancheAgeList[2].NombreEmployes.ToString();


            //    }
            //    var countContratList = context.GetRepartitionParTypeContrat().ToList();
            //    if (countContratList.Count>=3)
            //    {
            //        TxtCDI.Text = countContratList[0].NombreEmployes.ToString();
            //        TxtCDD.Text = countContratList[1].NombreEmployes.ToString();
            //        TxtTempsPartiel.Text = countContratList[2].NombreEmployes.ToString();

            //    }
            //    var countTauxTurnover = context.GetTauxTurnover().ToList();
            //    if (countTauxTurnover.Count >= 3)
            //    {
            //        AnneeTxt.Text = countTauxTurnover[0].Annee.ToString();
            //        EffmTxt.Text = countTauxTurnover[0].EffectifMoyen.ToString();
            //        NDsTxt.Text = countTauxTurnover[0].NombreDeparts.ToString();
            //        NEsTxt.Text = countTauxTurnover[0].NombreEmbauches.ToString();
            //        TauxTxt.Text = countTauxTurnover[0].TauxTurnover.ToString();
            //        TauxRTxt.Text = countTauxTurnover[0].TauxRotationGlobale.ToString();


            //    }
            //    var countHandicap = context.GetRepartitionHandicap().ToList();
            //    if (countHandicap.Count >= 2)
            //    {
            //        OUItxt.Text = countHandicap[0].Nombre.ToString();
            //        NonTxt.Text = countHandicap[1].Nombre.ToString();

            //    }


        }

    }
}
