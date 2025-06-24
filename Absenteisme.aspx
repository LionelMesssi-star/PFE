<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Absenteisme.aspx.cs" Inherits="Absenteisme" %>

  <%@ Register Assembly="DevExpress.Dashboard.v20.1.Web.WebForms, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Effectif Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    
</head>
<body>
     <form id="form1" runat="server">
                  <link href="MainStyle.css" rel="stylesheet" type="text/css" />
 
<div class="dxeBase_Office365 SfBreadcrumb" style="font-family: Gugi"> Absenteisme  </div>
       
                            
        <dx:ASPxFormLayout ID="FormEffectif" runat="server" EnableViewState="false" EncodeHtml="false" RequiredMarkDisplayMode="RequiredOnly" ColumnCount="4" Theme="Glass" Width="100%">
            <Items>
                                                  <dx:LayoutGroup ShowCaption="False" ColumnSpan="4" GroupBoxStyle-Caption-Font-Bold="true" Width="100%">
    <Items>
        <dx:LayoutItem ShowCaption="False" HorizontalAlign="Center">
            <LayoutItemNestedControlCollection>
                <dx:LayoutItemNestedControlContainer>
                    <table with="100%x">
                        <tr>

                            <td width="360px">

                                <table style="width: 350px; text-align: center; font-size: 14px; font-weight: 700; padding: 25px; color: #1177D9; border-radius: 5px; background-color: #f5f5f5;">
                                    <tr>
                                        <td height="20px" colspan="5"></td>
                                    </tr>
                                    <tr>
                                        <td width="150px">Durée Absence Moyenne</td>
                                        <td width="80px">
                                            <dx:ASPxImage ID="imghome" Width="32px" EmptyImage-IconID="people_user_32x32" runat="server"></dx:ASPxImage>
                                        </td>
                                        <td width="5px"></td>
                                        <td width="80px">
                                            <dx:ASPxImage ID="imgFamme" Width="32px" EmptyImage-IconID="people_female_32x32" runat="server"></dx:ASPxImage>
                                        </td>
                                        <td width="10px"></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 15px;">
                                            <dx:ASPxLabel ID="txtAbsMoyen" Text="41 ans" runat="server" Theme="Aqua"></dx:ASPxLabel>
                                        </td>
                                        <td style="height: 15px; text-align: center; color: white; border-radius: 5px; background-color: #9b9898">

                                            <dx:ASPxLabel ID="txtAbsMoyenhomme" Text="39 ans" runat="server" Theme="Aqua"></dx:ASPxLabel>


                                        </td>
                                        <td width="5px"></td>
                                        <td style="height: 15px; text-align: center; font-size: 14px; font-weight: 700; color: white; border-radius: 5px; background-color: cornflowerblue;">
                                            <dx:ASPxLabel ID="txtAbsMoyenFamme" Text="42 ans" runat="server" Theme="Aqua"></dx:ASPxLabel>
                                        </td>
                                        <td width="10px"></td>
                                    </tr>
                                    <tr>
                                        <td height="20px" colspan="5"></td>
                                    </tr>
                                </table>

                            </td>
                            <td width="50px"></td>
                            <td width="360px">
                                <table style="width: 350px; text-align: center; font-size: 14px; font-weight: 700; padding: 25px; color: #1177D9; border-radius: 5px; background-color: #f5f5f5;">
                                    <tr>
                                        <td  colspan="5" height="20px"></td>
                                    </tr>
                                    <tr>
                                        <td width="150px" style="">Durée Absence Maximale</td>
                                        <td width="80px">
                                            <dx:ASPxImage ID="ASPxImage1" Width="32px" EmptyImage-IconID="people_user_32x32" runat="server"></dx:ASPxImage>
                                        </td>
                                        <td width="5px"></td>
                                        <td width="80px">
                                            <dx:ASPxImage ID="ASPxImage2" Width="32px" EmptyImage-IconID="people_female_32x32" runat="server"></dx:ASPxImage>
                                        </td>
                                        <td width="10px"></td>
                                    </tr>

                                    <tr>
                                        <td style="height: 15px;">
                                            <dx:ASPxLabel ID="txtAnciennete" Text="6 ans" runat="server" Theme="Aqua"></dx:ASPxLabel>
                                        </td>
                                        <td style="height: 15px; text-align: center; color: white; border-radius: 5px; background-color: #9b9898">
                                            <dx:ASPxLabel ID="txtAbsHomme" Text="7 ans" runat="server" Theme="Aqua"></dx:ASPxLabel>
                                        </td>
                                        <td width="5px"></td>
                                        <td style="height: 15px; text-align: center; color: white; border-radius: 5px; background-color: cornflowerblue;">
                                            <dx:ASPxLabel ID="txtAbsFamme" Text="5 ans" runat="server" Theme="Aqua"></dx:ASPxLabel>
                                        </td>
                                        <td width="10px"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="5" height="20px"></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </dx:LayoutItemNestedControlContainer>
            </LayoutItemNestedControlCollection>
        </dx:LayoutItem>
    </Items>
</dx:LayoutGroup>

                 <dx:LayoutGroup Caption="   " ColumnSpan="2" GroupBoxStyle-Caption-Font-Bold="true" Width="50%">
                    <Items>
                        <dx:LayoutGroup Caption="Motif Absence" Width="50%">
                            <Items>
                                <dx:LayoutItem ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxGridView ID="GridMA" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridSexe" Theme="Glass"
                                                Width="100%" KeyFieldName="ID" DataSourceID="SqlMA">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Motif" Caption="Motif" VisibleIndex="1" Width="60%"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Absents_2025" Caption="2025" VisibleIndex="2" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="Absents_2024" Caption="2024" VisibleIndex="3" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="Absents_2023" Caption="2023" VisibleIndex="4" Width="13%" />
                                                </Columns>
                                                <SettingsResizing ColumnResizeMode="NextColumn" />
                                                <SettingsSearchPanel Visible="false" />
                                                <SettingsPager Visible="false" />
                                                <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                                    VerticalScrollBarMode="Visible" VerticalScrollableHeight="120" />
                                            </dx:ASPxGridView>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutGroup Caption="Catégorie Professionelle" Width="50%">
                            <Items>
                                <dx:LayoutItem ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxGridView ID="GridCP" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridNationalite" Theme="Glass"
                                                Width="100%" KeyFieldName="Id" DataSourceID="SqlAF">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Fonction" Caption="Fonction" VisibleIndex="1" Width="60%"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2025" Caption="2025" VisibleIndex="2" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2024" Caption="2024" VisibleIndex="3" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2023" Caption="2023" VisibleIndex="4" Width="13%" />
                                                </Columns>
                                                <SettingsResizing ColumnResizeMode="NextColumn" />
                                                <SettingsSearchPanel Visible="false" />
                                                <SettingsPager Visible="false" />
                                                <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                                    VerticalScrollBarMode="Visible" VerticalScrollableHeight="120" />
                                            </dx:ASPxGridView>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutGroup Caption="Tranche d'âge" Width="50%">
                            <Items>
                                <dx:LayoutItem ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxGridView ID="GridTranche" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridTranche" Theme="Glass"
                                                Width="100%" KeyFieldName="ID" DataSourceID="SqlTA">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Tranche_Age" Caption="Tranche d'âge" VisibleIndex="1" Width="60%"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2025" Caption="2025" VisibleIndex="2" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2024" Caption="2024" VisibleIndex="3" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2023" Caption="2023" VisibleIndex="4" Width="13%" />
                                                </Columns>
                                                <SettingsResizing ColumnResizeMode="NextColumn" />
                                                <SettingsSearchPanel Visible="false" />
                                                <SettingsPager Visible="false" />
                                                <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                                    VerticalScrollBarMode="Visible" VerticalScrollableHeight="120" />
                                            </dx:ASPxGridView>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutGroup Caption="Sexe" Width="50%">
                            <Items>
                                <dx:LayoutItem ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxGridView ID="GridSexe" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridHandicape" Theme="Glass"
                                                Width="100%" KeyFieldName="Id" DataSourceID="SqlAS">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Sexe" Caption="Sexe" VisibleIndex="1" Width="60%"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Total_Absents_2025" Caption="2025" VisibleIndex="2" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="Total_Absents_2024" Caption="2024" VisibleIndex="3" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="Total_Absents_2023" Caption="2023" VisibleIndex="4" Width="13%" />
                                                </Columns>
                                                <SettingsResizing ColumnResizeMode="NextColumn" />
                                                <SettingsSearchPanel Visible="false" />
                                                <SettingsPager Visible="false" />
                                                <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                                    VerticalScrollBarMode="Visible" VerticalScrollableHeight="120" />
                                            </dx:ASPxGridView>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                                        <dx:LayoutItem ShowCaption="False">
    <LayoutItemNestedControlCollection>
        <dx:LayoutItemNestedControlContainer>
                                                                <dx:ASPxDashboard ID="Absenteismee" Width="100%"  Height="350px"  WorkingMode="ViewerOnly" runat="server" ></dx:ASPxDashboard>

        </dx:LayoutItemNestedControlContainer>
    </LayoutItemNestedControlCollection>
</dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                    </Items>
                </dx:LayoutGroup>

                 <dx:LayoutGroup Caption="   " ColumnSpan="2" GroupBoxStyle-Caption-Font-Bold="true" Width="50%">
                    <Items>
                        <dx:LayoutGroup Caption="Temps de Travail" Width="50%">
                            <Items>
                                <dx:LayoutItem ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxGridView ID="GridContract" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridContract" Theme="Glass"
                                                Width="100%" KeyFieldName="ID" DataSourceID="sqlAT">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataComboBoxColumn FieldName="Temps_Travail" Caption="Temps de Travail" Width="60%">
                                                         
                                                    </dx:GridViewDataComboBoxColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2025" Caption="2025" VisibleIndex="2" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2024" Caption="2024" VisibleIndex="3" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2023" Caption="2023" VisibleIndex="4" Width="13%" />
                                                </Columns>
                                                <SettingsResizing ColumnResizeMode="NextColumn" />
                                                <SettingsSearchPanel Visible="false" />
                                                <SettingsPager Visible="false" />
                                                <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                                    VerticalScrollBarMode="Visible" VerticalScrollableHeight="120" />
                                            </dx:ASPxGridView>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutGroup Caption="Département" Width="50%">
                            <Items>
                                <dx:LayoutItem ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxGridView ID="GridDep" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridTemp" Theme="Glass"
                                                Width="100%" KeyFieldName="Id" DataSourceID="SqlAD">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Departement" Caption="Département" VisibleIndex="1" Width="60%"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2025" Caption="2025" VisibleIndex="2" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2024" Caption="2024" VisibleIndex="3" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2023" Caption="2023" VisibleIndex="4" Width="13%" />
                                                </Columns>
                                                <SettingsResizing ColumnResizeMode="NextColumn" />
                                                <SettingsSearchPanel Visible="false" />
                                                <SettingsPager Visible="false" />
                                                <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                                    VerticalScrollBarMode="Visible" VerticalScrollableHeight="120" />
                                            </dx:ASPxGridView>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutGroup Caption="Anciénnete" Width="50%">
                            <Items>
                                <dx:LayoutItem ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxGridView ID="GridAN" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridCategorie" Theme="Glass"
                                                Width="100%" KeyFieldName="Id" DataSourceID="SqlAA">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Anciennete" Caption="Anciénnete" VisibleIndex="1" Width="60%"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2025" Caption="2025" VisibleIndex="2" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2024" Caption="2024" VisibleIndex="3" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2023" Caption="2023" VisibleIndex="4" Width="13%" />
                                                </Columns>
                                                <SettingsResizing ColumnResizeMode="NextColumn" />
                                                <SettingsSearchPanel Visible="false" />
                                                <SettingsPager Visible="false" />
                                                <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                                    VerticalScrollBarMode="Visible" VerticalScrollableHeight="120" />
                                            </dx:ASPxGridView>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutGroup Caption="Jours Absences Par Employé" Width="50%">
                            <Items>
                                <dx:LayoutItem ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxGridView ID="GridEmp" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridDepartement" Theme="Glass"
                                                Width="100%" KeyFieldName="ID" DataSourceID="SqlEmp">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Nom" Caption="Nom" Width="30%" VisibleIndex="1"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Prenom" Caption="Prénom" Width="30%" VisibleIndex="2"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2025" Caption="2025" VisibleIndex="3" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2024" Caption="2024" VisibleIndex="4" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2023" Caption="2023" VisibleIndex="5" Width="13%" />
                                                </Columns>
                                                <SettingsResizing ColumnResizeMode="NextColumn" />
                                                <SettingsSearchPanel Visible="false" />
                                                <SettingsPager Visible="false" />
                                                <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                                    VerticalScrollBarMode="Visible" VerticalScrollableHeight="500" />
                                            </dx:ASPxGridView>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                         
                    </Items>
                </dx:LayoutGroup>
            </Items>
        </dx:ASPxFormLayout>

         <asp:SqlDataSource ID="SqlHa" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="GetRepartitionHandicap" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="sqlcontrat" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="afficher_Contrat" SelectCommandType="StoredProcedure" />
        
        <asp:SqlDataSource ID="SqlDeep" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="SelectDepartements" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlDep" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Afficher_Departement" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlSexe" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="countSexe" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlAnn" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="AfficherAnnciente" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlNA" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Afficher_Nationnalite" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlFA" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="countFonction" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlTemp" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Afficher_TempsTravail" SelectCommandType="StoredProcedure" />

        <asp:SqlDataSource ID="SqlMA" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
    SelectCommand="Afficher_Absen_Motif" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlAF" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
    SelectCommand="Afficher_Abs_Fonction" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlTA" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
    SelectCommand="Afficher_Abs_Age" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlAS" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
    SelectCommand="Afficher_Abs_Sexe" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlAT" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
    SelectCommand="Afficher_Abs_Temps" SelectCommandType="StoredProcedure" />
         <asp:SqlDataSource ID="SqlAD" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
     SelectCommand="Afficher_Abs_Departement" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlAA" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
    SelectCommand="Afficher_Abs_Anciennte" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlEmp" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
    SelectCommand="Afficher_Abs_Emp" SelectCommandType="StoredProcedure" />

    </form>
</body>
</html>