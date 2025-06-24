<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Formation.aspx.cs" Inherits="Formation" %>
<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Dashboard.v20.1.Web.WebForms, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Effectif Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   
</head>
<body>
     <form id="form1" runat="server">
        <link href="MainStyle.css" rel="stylesheet" type="text/css" />
 
<div class="dxeBase_Office365 SfBreadcrumb" style="font-family: Gugi"> Formation  </div>

        <dx:ASPxFormLayout ID="FormEffectif" runat="server" EnableViewState="false" EncodeHtml="false" RequiredMarkDisplayMode="RequiredOnly" ColumnCount="4" Theme="Glass" Width="100%">
            <Items>


                <dx:LayoutGroup Caption="   " ColumnSpan="1" GroupBoxStyle-Caption-Font-Bold="true" Width="50%">
                    <Items>
                        <dx:LayoutGroup Caption="Type Formation" Width="50%">
                            <Items>
                                <dx:LayoutItem ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxGridView ID="GridFor" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridFor" Theme="Glass"
                                                Width="100%" KeyFieldName="ID" DataSourceID="SqlForm">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Nom_Formation" Caption="Type Formation" VisibleIndex="1" Width="60%"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2025" Caption="2025" VisibleIndex="2" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2024" Caption="2024" VisibleIndex="3" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2023" Caption="2023" VisibleIndex="4" Width="13%" />
                                                </Columns>
                                                <SettingsResizing ColumnResizeMode="NextColumn" />
                                                <SettingsSearchPanel Visible="false" />
                                                <SettingsPager Visible="false" />
                                                <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                                    VerticalScrollBarMode="Visible" VerticalScrollableHeight="180" />
                                            </dx:ASPxGridView>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutGroup Caption="Compétence Cible" Width="50%">
                            <Items>
                                <dx:LayoutItem ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxGridView ID="GridFN" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridFN" Theme="Glass"
                                                Width="100%" KeyFieldName="Id" DataSourceID="SqlFN">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Formation_Necessaire" Caption="Competence Cible" VisibleIndex="1" Width="60%"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2025" Caption="2025" VisibleIndex="2" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2024" Caption="2024" VisibleIndex="3" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2023" Caption="2023" VisibleIndex="4" Width="13%" />
                                                </Columns>
                                                <SettingsResizing ColumnResizeMode="NextColumn" />
                                                <SettingsSearchPanel Visible="false" />
                                                <SettingsPager Visible="false" />
                                                <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                                    VerticalScrollBarMode="Visible" VerticalScrollableHeight="150" />
                                            </dx:ASPxGridView>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutGroup Caption="Catégorie Profesionelle" Width="50%">
                            <Items>
                                <dx:LayoutItem ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxGridView ID="GridFF" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridFF" Theme="Glass"
                                                Width="100%" KeyFieldName="Id" DataSourceID="SqlFF">
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
                                                    VerticalScrollBarMode="Visible" VerticalScrollableHeight="150" />
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
                                            <dx:ASPxGridView ID="GridSF" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridSF" Theme="Glass"
                                                Width="100%" KeyFieldName="ID" DataSourceID="SqlSF">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Sexe" Caption="Sexe" VisibleIndex="1" Width="60%"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2025" Caption="2025" VisibleIndex="2" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2024" Caption="2024" VisibleIndex="3" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2023" Caption="2023" VisibleIndex="4" Width="13%" />
                                                </Columns>
                                                <SettingsResizing ColumnResizeMode="NextColumn" />
                                                <SettingsSearchPanel Visible="false" />
                                                <SettingsPager Visible="false" />
                                                <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                                    VerticalScrollBarMode="Visible" VerticalScrollableHeight="150" />
                                            </dx:ASPxGridView>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        

                    </Items>
                </dx:LayoutGroup>

                <dx:LayoutGroup Caption="   " ColumnSpan="2" GroupBoxStyle-Caption-Font-Bold="true" Width="50%">
    <Items>
        <dx:LayoutGroup Caption="Departement" Width="50%">
            <Items>
                <dx:LayoutItem ShowCaption="False">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer>
                            <dx:ASPxGridView ID="GridFD" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridFD" Theme="Glass"
                                Width="100%" KeyFieldName="ID" DataSourceID="sqlFD">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Departement" Caption="Departement" Width="60%">
                                    </dx:GridViewDataTextColumn>
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
        <dx:LayoutGroup Caption="Anncienneté" Width="50%">
            <Items>
                <dx:LayoutItem ShowCaption="False">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer>
                            <dx:ASPxGridView ID="GridFA" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridFA" Theme="Glass"
                                Width="100%" KeyFieldName="Id" DataSourceID="SqlFA">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Anciennete" Caption="" VisibleIndex="1" Width="60%"></dx:GridViewDataTextColumn>
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


        <dx:LayoutGroup Caption="Heure Formation par emploés" Width="50%">
            <Items>
                <dx:LayoutItem ShowCaption="False">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer>
                            <dx:ASPxGridView ID="GridTemp" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridTemp" Theme="Glass"
                                Width="100%" KeyFieldName="Id" DataSourceID="SqlTemp">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Employe_ID" Caption="Nom_Prenom" Width="100%">
                                        <PropertiesComboBox DataSourceID="SqlEmployes" TextField="Nom_Prenom" ValueField="ID" />
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
        
                                <dx:LayoutGroup Caption="Tableau de bord" Width="50%">
    <Items>
                                                                  <dx:LayoutItem ShowCaption="False">
    <LayoutItemNestedControlCollection>
        <dx:LayoutItemNestedControlContainer>
                                                                <dx:ASPxDashboard ID="Formations" Width="100%"  Height="320px"  WorkingMode="ViewerOnly" runat="server" ></dx:ASPxDashboard>

        </dx:LayoutItemNestedControlContainer>
    </LayoutItemNestedControlCollection>
</dx:LayoutItem>
 
    </Items>
</dx:LayoutGroup>
    </Items>
 
</dx:LayoutGroup>
                 
                
            </Items>
        </dx:ASPxFormLayout>




        <asp:SqlDataSource ID="SqlForm" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Afficher_Formation" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlFN" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Afficher_Formation_Nec" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlFF" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Afficher_FormationFonction" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlSF" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="AfficherSexeFormation" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="sqlFD" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Afficher_Formation_Departement" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlFA" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Afficher_Formation_Annciente" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlTemp" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Afficher_Heure_Formation" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlEmployes" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="SelectEmployes" SelectCommandType="StoredProcedure" />



        <asp:SqlDataSource ID="SqlTC" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="SelectType_Contrat" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlDeep" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="SelectDepartements" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlDep" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Afficher_Departement" SelectCommandType="StoredProcedure" />


        <asp:SqlDataSource ID="SqlAnn" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="AfficherAnnciente" SelectCommandType="StoredProcedure" />



    </form>
</body>
</html>
