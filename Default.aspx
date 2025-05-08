<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Assembly="OfficeWebUI, Version=2.4.4086.15482" Namespace="OfficeWebUI" TagPrefix="OfficeWebUI" %>
<%@ Register Assembly="OfficeWebUI, Version=2.4.4086.15482" Namespace="OfficeWebUI.Ribbon" TagPrefix="OfficeWebUI" %>
<%@ Register Assembly="OfficeWebUI" Namespace="OfficeWebUI.Ribbon" TagPrefix="cc1" %>

<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .w3-badge, .w3-tag {
            color: #fff;
            display: inline-block;
            padding-left: 8px;
            padding-right: 8px;
            text-align: center;
        }

        .w3-badge {
            border-radius: 100%;
        }

        .w3-red, .w3-hover-red:hover {
            color: #fff !important;
            background-color: #f44336 !important;
        }

        .w3-tiny {
            font-size: 10px !important;
        }

        .w3-small {
            font-size: 12px !important;
        }

        .w3-medium {
            font-size: 15px !important;
        }

        .w3-large {
            font-size: 18px !important;
        }

        .w3-xlarge {
            font-size: 24px !important;
        }

        .w3-xxlarge {
            font-size: 36px !important;
        }

        .w3-xxxlarge {
            font-size: 48px !important;
        }

        .w3-jumbo {
            font-size: 64px !important;
        }

        .w3-left-align {
            text-align: left !important;
        }

        .w3-right-align {
            text-align: right !important;
        }

        .w3-justify {
            text-align: justify !important;
        }

        .w3-center {
            text-align: center !important;
        }
    </style>

    <link href="Theme/Theme.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function popup(url, height, width, title) {
            popupWind.SetSize(height, width);
            popupWind.SetHeaderText(title);
            popupWind.SetContentUrl(url);
            popupWind.Show();
        }

        function endCallMotsPass(s, e) {

            var errPoin = s.cp_Ress;
            lblErr.SetText(errPoin);
            //PopupAlert.Show();
        }

        function ChangePasswrd() {
            //          txtMotsPass.SetText('');
            //          txtConfirMotsPass.SetText('');
            //          Modifier votre mot de passe
            //          PopupMotPass.Show();
            popup("ChangMotsPass.aspx", 580, 700, "Modifier votre mot de passe");
        }


        function AffectationRessourceProj() {
            popup("AffectePermission.aspx", 800, 400, "AFFECTATIONS");

        }




        function CallMenOrgTravPlanif() {
            GridDCR.GetRowValues(GridDCR.GetFocusedRowIndex(), 'CodeDocumentOld', SelectOrigPlani);
        }

        function SelectOrigPlani(value) {

            popup("TravauxByCodDocOriginal.aspx?CodeDocument=" + value, 1000, 550, "Travaux");
        }

        function CallMenOrigQualiProj() {
            GridDCR.GetRowValues(GridDCR.GetFocusedRowIndex(), 'CodeDocumentOld', SelectOrigPCQP);
        }


        function SelectOrigPCQP(value) {

            popup("PCQPbyCodDoc.aspx?CodeDocument=" + value, 1200, 700, "PCQP");
        }

        function CallMenOrgPrioritePla() {
            GridDCR.GetRowValues(GridDCR.GetFocusedRowIndex(), 'CodeDocumentOld', SelectOrigPriorite);
        }


        function CallMenOrgPrioritePlaOrg() {
            GridDCR.GetRowValues(GridDCR.GetFocusedRowIndex(), 'CodeDocumentOld', SelectOrigPrioriteOrg);
        }

        function SelectOrigPrioriteOrg(value) {
            popup("PriorityOriginal.aspx?CodeDocument=" + value, 1000, 700, "Priority");
        }

        function SelectOrigPriorite(value) {
            popup("Priority.aspx?CodeDocument=" + value, 800, 500, "Priority");
        }

        //  ---------------------------   
        function CallMenPCQP() {
            GridDCR.GetRowValues(GridDCR.GetFocusedRowIndex(), 'CodeDocument', SelectPCQP);
        }

        function SelectPCQP(valusindec) {
            popup("PCQPbyCodDocUser.aspx?CodDoc=" + valusindec, 1500, 700, "Controle qualite projet");
        }
        function CallMenuTravaux() {
            GridDCR.GetRowValues(GridDCR.GetFocusedRowIndex(), 'CodeDocument', SelectTravaux);
        }

        function SelectTravaux(valusindec) {
            popup("TravauxUser.aspx?CodDoc=" + valusindec, 1200, 700, "Travaux planifié");
        }

        function CallMenPriorite() {
            GridDCR.GetRowValues(GridDCR.GetFocusedRowIndex(), 'CodeDocument', SelectPriorite);
        }

        function SelectPriorite(valusindec) {
            popup("PriorityUser.aspx?CodDoc=" + valusindec, 900, 700, "Priorité");
        }


        function CallMenRemarqProj() {
            GridDCR.GetRowValues(GridDCR.GetFocusedRowIndex(), 'ReferenceOld', SelectRemarqProj);
        }

        function SelectRemarqProj(valusindec) {
            popup("RemarqProjetUser.aspx?References=" + valusindec, 800, 550, "Remarque à projet");
        }

        function CallMenRemarqCodeDoc() {
            GridDCR.GetRowValues(GridDCR.GetFocusedRowIndex(), 'CodeDocument', SelectRemarqCodeDoc);
        }

        function SelectRemarqCodeDoc(valusindec) {
            popup("RemarqCodeDocUser.aspx?CodDoc=" + valusindec, 800, 550, "Remarque à code document");
        }


        function CallMenRemarqClient() {
            GridDCR.GetRowValues(GridDCR.GetFocusedRowIndex(), 'ReferenceOld', SelectRemarqClientc);
        }

        function SelectRemarqClientc(valusindec) {
            popup("RemarqClient.aspx?References=" + valusindec, 800, 550, "Remarque de client");
        }




        function CallMenDetailProjet() {
            GridDCR.GetRowValues(GridDCR.GetFocusedRowIndex(), 'ReferenceOld', SelectDetailProj);
        }

        function SelectDetailProj(valusindec) {
            popup("DetailProjetbyReference.aspx?References=" + valusindec, 1300, 750, "Détail Projet");
        }


        function CallMenDetailCodeDoc() {
            GridDCR.GetRowValues(GridDCR.GetFocusedRowIndex(), 'CodeDocumentOld', SelectDetaicodd);
        }

        function SelectDetaicodd(valusindec) {
            popup("DetailCodeDocument.aspx?CodDoc=" + valusindec, 1100, 550, "Détail code document");
        }




        function AddFicheEvaliation() {
            popup("AP_AddFicheEvaliation.aspx", 1000, 600, "Ajouter Appels d'offres");
        }

        function AtelierRessourceFunction(values) {
            var ID = values.split(';')[0];
            var Matricule = values.split(';')[1];

            popup("AP_AtelierRessourceFunction.aspx?IDAP=" + ID + "&Matricule=" + Matricule, 1400, 700, "Suivi d'atelier");
        }


        function EditFicheEvaliation(values) {

            popup("AP_EditFicheEvaliation.aspx?IDAP=" + values, 1000, 600, "Modifier Appels d'offres ");
        }

        function AccepterAP(values) {

            popup("AP_Accepter.aspx?IDAP=" + values, 800, 500, "Accepter Appels d'offres ");
        }

        function DetailNotification() {

            popup("AP_DetailNotification.aspx", 900, 550, "Délai Commission");
        }


        function DetailFilter() {

            popup("AP_DetailFilter.aspx", 1000, 650, "Filtre");
        }


        function Ajouter() {
            ASPxPopupAddPermision.Show();
        }


        function AjouterIntroduction() {
            PopupControl.Show();
            popup("OrganisationProjet.aspx", 1500, 900, "");
        }

        function GetAddRessouAff() {
            popup("AddRessourceOrgan.aspx", 1500, 900, "");


        }
        function GetListnonJus() {
            popup("ListepointgageNonJustifier.aspx", 1500, 900, "");


        }







        function Ajouterhome() {
            popup("Pagehome.aspx", 1000, 500, "");
        }





        function ModifierIntroduction() {
            popup("PopupAvancemant.aspx", 1000, 500, "");
        }

        function ProblematiqueRemarque() {
            var proj = CmbProject.GetText();
            popup("ProblematiqueRemarque.aspx?proj=" + proj, 1300, 800, "");
        }

        function ShudowPopupAnalyse() {
            var proj = CmbProject.GetText();
            popup("DetailAnalyse.aspx?proj=" + proj, 1300, 800, "");
        }


        function ShudowPopupFaitMar() {
            var proj = CmbProject.GetText();
            popup("DetailFaiMarq.aspx?proj=" + proj, 1300, 800, "");
        }




        function ShudowPopupApprise() {
            var proj = CmbProject.GetText();
            popup("DetailLeconapprise.aspx?proj=" + proj, 1300, 800, "");
        }


        function ShudowPopupAction() {
            var proj = CmbProject.GetText();
            popup("DetailAction.aspx?proj=" + proj, 1300, 800, "");
        }


        function showPCQP(value) {

            popup("PCQPbyCodDoc.aspx?CodeDocument=" + value, 1500, 800, "PCQP");
        }
        function showPriorite(value) {
            popup("Priority.aspx?CodeDocument=" + value, 800, 500, "Priority");
        }
        function AddAP() {

            popup("Addemp.aspx", 1200, 700, "ADD AP");

        }

        function ImportNouvDCR() {
            PupImportPDoc.Show()
        }

        function ImportControlQualite() {
            PupImportQualite.Show()
        }

        function ImportTravaux() {
            PupImportTravaux.Show()
        }

        function ImportPriorite() {
            PupImportPriority.Show()
        }



        function GetInfocercuit() {
            popup("Infosecrcuits.aspx", 1000, 650, "Informations");
        }

        function PermissionRessourceAllProj() {
            popup("Permission.aspx", 600, 500, "Permission administrateur");

        }

    </script>

    <link href="/Resources/Shared/stylesheets/menu.css" type="text/css" rel="stylesheet">
    <script>
        function MainMenuRibbon_ActiveTabChanged(s, e) {
            try {
                switch (e.tab.name) {
                    case "tabTableauBord":
                        SetSplitterPane('Pagehomes.aspx');
                        break;
                    case "tabGestWorkflow":
                        SetSplitterPane('Bilan.aspx');
                        break;
                    case "tabGestWorkflowGTT":
                        SetSplitterPane('GTT_Conventions_Resulta.aspx');
                        break;
                    case "RibbonParametrage":
                        SetSplitterPane('TechnicalDataMenu.aspx');
                        break;

                    case "tabManagement":
                        SetSplitterPane('Management.aspx');
                        break;

                        break;

                    default:
                        break;
                }
            } catch (e) { }
        }
        function MainMenuRibbon_CommandExecuted(s, e) {
            try {
                var itemId = e.item.name;
                if (e.item.selectedValue != undefined) itemId = e.item.selectedValue;
                switch (itemId) {



                    //case "LargePlanInter":
                    //    SetSplitterPane('EIF.Softic.Maintenance/SuiviEvenements.ascx');
                    //    break;
                    //case "LargePlanWeek":
                    //    SetSplitterPane('EIF.Softic.Maintenance/SuiviEvenements_hebdomadaire.ascx');
                    //    break;
                    ////case "MedNotifResp":
                    ////    ShowNotification();
                    ////    break;
                    //case "RibBaseImport":
                    //    ShowImportDonne();
                    //    break;
                    case "RibbonControle":
                        SetSplitterPane('Controle.aspx');
                        break;
                    case "LargFonction":
                        SetSplitterPane('Fonction.aspx');
                        break;
                    case "Dep":
                        SetSplitterPane('Departement.aspx');
                        break;
                    case "LarAgent":
                        SetSplitterPane('AtelierRessource.aspx');
                        break;
                    case "LargeType_Contrat":
                        SetSplitterPane('Type_Contrat.aspx');
                        break;
                    case "RibbonAbsentiesme":
                        SetSplitterPane('Absenteisme.aspx');
                        break;
                    case "RibbonSanteSecurites":
                        SetSplitterPane('SanteSecurites.aspx');
                        break;
                    case "RibbonSanteSecurite":
                        SetSplitterPane('SanteSecurite.aspx');
                        break;
                    case "RibbonRemuneration":
                        SetSplitterPane('Remuneration.aspx');
                        break;
                    case "RibbonFormation":
                        SetSplitterPane('Formation.aspx');
                        break;
                    case "RibbonCompetence":
                        SetSplitterPane('Competence.aspx');
                        break;
                    case "RibbonCompetences":
                        SetSplitterPane('Competences.aspx');
                        break;
                    case "RibbonParcourspro":
                        SetSplitterPane('Parcours.aspx');
                        break;
                    case "RibbonParcoursproo":
                        SetSplitterPane('ParcoursProo.aspx');
                        break;

                    case "RibbonEffectif":
                        SetSplitterPane('Effectif.aspx');
                        break;
                    case "RibbonAbsentiesmes":
                        SetSplitterPane('Absenteismes.aspx');
                        break;
                    case "RibbonFormationmation":
                        SetSplitterPane('Formations.aspx');
                        break;
                    case "RibbonDepenseFormation":
                        SetSplitterPane('DepenseFormation.aspx');
                        break;
                    case "RibbonDepenseFormations":
                        SetSplitterPane('DepenseFormations.aspx');
                        break;



                    case "LargeEquipement":
                        SetSplitterPane('EIF.Softic.Maintenance/ManagementEquipement.ascx');
                        break;

                    case "navGammes":
                        SetSplitterPane('EIF.Softic.Maintenance/ManagementGammes.ascx');
                        break;
                    case "RibbonSalaire":
                        SetSplitterPane('Salaire.aspx');
                        break;


                    case "LargeBilan":
                        SetSplitterPane('Bilan.aspx');
                        break;
                    //case "RibTest":
                    //    SetSplitterPane('Test.aspx');
                    //    break;



                    case "navShutdown":
                        SetSplitterPane('EIF.Softic.Maintenance/ManagementShutdown.ascx');
                        break;
                    case "navReleve":
                        SetSplitterPane('EIF.Softic.Maintenance/ManagementReLeveMachine.ascx');
                        break;
                    case "LargenavManagingWork":
                        SetSplitterPane('EIF.Softic.Maintenance/ManagementWorfFlow.ascx');
                        break;
                    case "RibbonEmployes":
                        SetSplitterPane('Employes.aspx');
                        break;
                    case "RibbonRessource":
                        SetSplitterPane('Ressource.aspx');
                        break;
                    case "RibbonRole":
                        SetSplitterPane('Role.aspx');
                        break;

                    case "RibbonPermission":
                        SetSplitterPane('Permission.aspx');
                        break;

                    case "litShowReportsExportPDF":
                        ReportsViwer_ExportPDF();
                        break;
                    case "litShowReportsExportExcel":
                        ReportsViwer_ExportExcel();
                        break;
                    case "litPrint_ReportsViewer":
                        ReportsViewer_PrintReport();
                        break;
                    case "litExpandTree_ReportsViewer":
                        ReportsViewer_ExpandCollapse();
                        break;
                    default:
                        break;
                }
            } catch (e) { }
        }
    </script>

    <OfficeWebUI:Manager ID="rbManager" runat="server" UITheme="Office2010Silver" />
    <table width="100%">
        <tr>
            <td align="center">
                <div class="navbar navbar-inverse navbar-fixed-top">
                    <div class="container">
                        <div class="navbar-collapse collapse">


                            <table style="width: 100%; font-size: 1px;">

                                <tr>

                                    <td></td>
                                    <td align="right" width="180px">
                                        <a href="javascript: ChangePasswrd();">
                                            <div runat="server" id="lblNomSession" style="font-size: 12px; color: Black; text-transform: uppercase; font-weight: bold;">
                                            </div>
                                        </a>
                                    </td>
                                    <td align="right" width="80px">
                                        <dx:ASPxComboBox ID="LanguageComboBox" runat="server" AutoPostBack="True" meta:resourcekey="ASPxComboBoxResource1" Theme="Glass" Width="70px" ClientVisible="true">
                                            <Items>
                                                <dx:ListEditItem Text="Francais" Value="FR" meta:resourcekey="users_Francais" Selected="true" />
                                                <dx:ListEditItem Text="English" Value="en" meta:resourcekey="users_English" />
                                                <dx:ListEditItem Text="Arabic" Value="AR" meta:resourcekey="users_Arabic" />


                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                            </table>

                        </div>
                    </div>
                </div>

            </td>
        </tr>
        <tr>
            <td>


                <table style="width: 100%; font-size: 1px;">
                    <tr>
                        <td>
                            <dx:ASPxRibbon ID="MainMenuRibbon" ClientInstanceName="MainMenuRibbon" runat="server" Width="100%" FileTabText="Bilan Social" Font-Size="12px" Styles-TabContent-Height="100px" Styles-GroupLabel-Font-Size="11px" Styles-GroupLabel-Font-Bold="false" Styles-FileTab-Height="30px" StylesTabControl-Tab-Height="30px" Styles-GroupLabel-ForeColor="#888888" Theme="Office365">
                                <%--<applicationmenu>
            <menuitems>
            </menuitems>
        </applicationmenu>--%>
                                <%--<extracontrolsarea>
        </extracontrolsarea>--%>
                                <Tabs>
                                    <dx:RibbonTab Name="tabTableauBord" runat="server" Text="Tableaux de Bord">
                                        <Groups>
                                        </Groups>
                                    </dx:RibbonTab>



                                    <dx:RibbonTab Name="tabGestWorkflow" runat="server" Text="Gestion des workflows">
                                        <Groups>
                                            <dx:RibbonGroup Name="RibbonSuiviAgent" runat="server" Text="Suivi">
                                                <Items>
                                                    <%--                                                    <dx:RibbonButtonItem Size="Large" Name="LargeBilan" Text="Bilan" runat="server" Visible="true" LargeImage-IconID="chart_chartchangelayout_32x32"></dx:RibbonButtonItem>--%>
                                                    <dx:RibbonButtonItem Size="Large" Name="RibbonEffectif" Text="Effectif" runat="server" Visible="true" LargeImage-IconID="hybriddemoicons_tiles_hybriddemo_allemployees_svg_32x32"></dx:RibbonButtonItem>
                                                    <dx:RibbonButtonItem Size="Large" Name="RibbonParcoursproo" Text="Parcours Pro" runat="server" Visible="true" LargeImage-IconID="hybriddemoicons_bottompanel_hybriddemo_mapview_svg_32x32"></dx:RibbonButtonItem>
                                                    <dx:RibbonButtonItem Size="Large" Name="RibbonCompetences" Text="Compétence" runat="server" Visible="true" LargeImage-IconID="richedit_richeditbookmark_svg_dark_32x32"></dx:RibbonButtonItem>
                                                    <dx:RibbonButtonItem Size="Large" Name="RibbonFormation" Text="Formation" runat="server" Visible="true" LargeImage-IconID="businessobjects_bo_project_svg_dark_32x32"></dx:RibbonButtonItem>
                                                    <dx:RibbonButtonItem Size="Large" Name="RibbonRemuneration" Text="Rémunération" runat="server" Visible="true" LargeImage-IconID="iconbuilder_business_money_svg_dark_32x32"></dx:RibbonButtonItem>
                                                    <dx:RibbonButtonItem Size="Large" Name="RibbonSanteSecurites" Text="Santé sécurité" runat="server" Visible="true" LargeImage-IconID="businessobjects_bo_security_permission_svg_dark_32x32"></dx:RibbonButtonItem>
                                                    <dx:RibbonButtonItem Size="Large" Name="RibbonAbsentiesme" Text="Absentéisme" runat="server" Visible="true" LargeImage-IconID="actions_delete_32x32gray"></dx:RibbonButtonItem>
                                                </Items>
                                            </dx:RibbonGroup>
                                        </Groups>
                                    </dx:RibbonTab>

                                    <dx:RibbonTab Name="TabManagement" runat="server" Text="Management" >

                                        <Groups>
                                            <dx:RibbonGroup Name="RibbonSuivi" runat="server" Text="Suivi">
                                                <Items>
                                                    <dx:RibbonButtonItem Size="Large" Name="RibbonEmployes" runat="server" Text="Employes" LargeImage-IconID="iconbuilder_actions_user_svg_dark_32x32" />
                                                    <dx:RibbonButtonItem Size="Large" Name="RibbonSalaire" runat="server" Text="Salaire" LargeImage-IconID="iconbuilder_business_money_svg_32x32" />
                                                    <dx:RibbonButtonItem Size="Large" Name="RibbonAbsentiesmes" runat="server" Text="Absenteisme" LargeImage-IconID="actions_delete_32x32gray" />
                                                    <dx:RibbonButtonItem Size="Large" Name="RibbonFormationmation" runat="server" Text="Formation" LargeImage-IconID="businessobjects_bo_note_svg_dark_32x32" />
                                                    <dx:RibbonButtonItem Size="Large" Name="RibbonParcourspro" runat="server" Text="Parcours Pro" LargeImage-IconID="iconbuilder_travel_walk_svg_dark_32x32" />
                                                    <dx:RibbonButtonItem Size="Large" Name="RibbonCompetence" runat="server" Text="Compétence" LargeImage-IconID="richedit_richeditbookmark_svg_dark_32x32" />
                                                    <dx:RibbonButtonItem Size="Large" Name="RibbonSanteSecurite" runat="server" Text="Santé sécurité" LargeImage-IconID="businessobjects_bo_security_permission_svg_dark_32x32" />
                                                    <dx:RibbonButtonItem Size="Large" Name="RibbonDepenseFormation" runat="server" Text="Depense Formation" LargeImage-IconID="actions_stretch_32x32gray" />
                                                </Items>
                                            </dx:RibbonGroup>

                                            <dx:RibbonGroup Name="RibbonControle" runat="server" Text="">
                                                <Items>
                                                    <dx:RibbonButtonItem Size="Large" Name="RibbonControle" runat="server" Text="Controle" LargeImage-IconID="xaf_modeleditor_controllers_svg_dark_32x32" />
                                                    <dx:RibbonButtonItem Size="Large" Name="RibbonRessource" runat="server" Text="Ressource" LargeImage-IconID="actions_up_svg_dark_32x32" />
                                                    <dx:RibbonButtonItem Size="Large" Name="RibbonPermission" runat="server" Text="Permission" LargeImage-IconID="actions_show_32x32gray" />
                                                    <dx:RibbonButtonItem Size="Small" Name="RibbonRole" runat="server" Text="Role" SmallImage-IconID="businessobjects_bo_role_svg_dark_16x16" />

                                                </Items>
                                            </dx:RibbonGroup>
                                        </Groups>
                                    </dx:RibbonTab>

                                    <dx:RibbonTab Name="RibbonParametrage" runat="server" Text="Paramétrages">
                                    </dx:RibbonTab>

                                </Tabs>
                                <ClientSideEvents ActiveTabChanged="MainMenuRibbon_ActiveTabChanged" CommandExecuted="MainMenuRibbon_CommandExecuted"></ClientSideEvents>
                            </dx:ASPxRibbon>
                        </td>
                    </tr>

                </table>

            </td>
        </tr>

    </table>
    <div style="padding-right: 2px;">
        <iframe name="ifrDetails" src="Pagehomes.aspx" style="border-right: 1px solid #C0C0C0; border-left: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; background-color: Transparent;" width="100%" height="1500px" frameborder="1" scrolling="no" id="Iframe1"></iframe>

    </div>

    <script>
        window.onload = new function () {


            var docAP = getQueryString("t", window.parent.location.href);
            var docRess = getQueryString("R", window.parent.location.href);

            if (docAP != '') {
                var popup = window.parent;
                SetSplitterPaneAp("AP_ListeAppelOffre.aspx");
            }
            else if (docRess != '') {
                var popup = window.parent;
                SetSplitterPaneRess("AtelierRessource.aspx");
            }
            else {
                SetSplitterPane("Pagehomes.aspx");
            }

        }
    </script>


    <dx:ASPxPopupControl ID="PopupMotPass" ClientInstanceName="PopupMotPass" AutoUpdatePosition="false" runat="server" Theme="Glass" Width="400px"
        HeaderText="Modifier votre mot de passe"
        Modal="True"
        PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter">


        <HeaderImage Url="~/Image/Session.jpg" Width="25">
        </HeaderImage>

        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">

                <dx:ASPxCallbackPanel ID="cpPopup" runat="server" ClientInstanceName="cpPopup" Theme="Office2010Blue">
                    <ClientSideEvents EndCallback="endCallMotsPass" />
                    <PanelCollection>

                        <dx:PanelContent ID="PanelContent2" runat="server">
                            <table widht="100%">
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="LblMot" runat="server" Text="Nouveau Mot de passe">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtMotsPass" ClientInstanceName="txtMotsPass" Password="true" Theme="Glass" runat="server" Width="170px"></dx:ASPxTextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="LblCon" runat="server" Text="Confirmez le mot de passe"></dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtConfirMotsPass" ClientInstanceName="txtConfirMotsPass" Password="true" Theme="Glass" runat="server" Width="170px"></dx:ASPxTextBox>
                                    </td>
                                </tr>
                            </table>
                            <table border="0" width="100%">
                                <tr>
                                    <td align="right" width="80%">
                                        <dx:ASPxButton ID="buttonOk" runat="server" Text="Ok" Width="100px" Theme="Glass"
                                            AutoPostBack="false">
                                            <ClientSideEvents Click="function(s, e) {

                                                       cpPopup.PerformCallback();
                                                     //  PopupMotPass.Hide();

                                  }"></ClientSideEvents>
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="ButtonAnnuler" runat="server" Text="Annuler" Width="100px" Theme="Glass"
                                            AutoPostBack="false">
                                            <ClientSideEvents Click="function(s, e) {PopupMotPass.Hide();}" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxCallbackPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxPopupControl ID="PopupAlert" ClientInstanceName="PopupAlert" AutoUpdatePosition="false"
        runat="server" Theme="Glass" Width="400px" HeaderText="Information"
        Modal="True"
        PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter">
        <HeaderImage Url="~/Image/Session.jpg" Width="25">
        </HeaderImage>

        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">




                <table width="100%">
                    <tr align="center">

                        <td>
                            <dx:ASPxLabel ID="lblErr" runat="server" ClientInstanceName="lblErr" ForeColor="Red"></dx:ASPxLabel>
                        </td>

                    </tr>

                    <tr>
                        <td align="right">
                            <dx:ASPxButton ID="ASPxButton14" runat="server" Text="Fermer" Width="100%" AutoPostBack="False"
                                Theme="Glass">
                                <ClientSideEvents Click="function(s, e) {
                                                   PopupAlert.Hide();  	
                                                   }"></ClientSideEvents>
                            </dx:ASPxButton>
                        </td>
                    </tr>
                </table>
            </dx:PopupControlContentControl>

        </ContentCollection>
    </dx:ASPxPopupControl>



</asp:Content>
