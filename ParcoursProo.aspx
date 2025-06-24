<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ParcoursProo.aspx.cs" Inherits="ParcoursProo" %>
 <%@ Register Assembly="DevExpress.Dashboard.v20.1.Web.WebForms, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Parcours Pro Dashboard</title>
     
</head>
<body>
    <form id="form1" runat="server">
        <link href="MainStyle.css" rel="stylesheet" type="text/css" />
 
     <div class="dxeBase_Office365 SfBreadcrumb" style="font-family: Gugi"> Parcours Pro  </div>

        <dx:ASPxFormLayout ID="FormEffectif" runat="server" EnableViewState="false" EncodeHtml="false" RequiredMarkDisplayMode="RequiredOnly" ColumnCount="4" Theme="Glass" Width="100%">
            <Items>
                <dx:LayoutGroup Caption="Embauche" GroupBoxStyle-Caption-Font-Bold="true" Width="25%">
                    <Items>
                        <dx:LayoutItem Caption="" Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxGridView ID="GridContract" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridContract" Theme="Glass"
                                        Width="100%" KeyFieldName="ID" DataSourceID="sqlcontrat">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataComboBoxColumn FieldName="Type_Contrat" Caption="Contrat de Travail" Width="40%">
                                                <PropertiesComboBox DataSourceID="SqlTC" TextField="Description" ValueField="ID">
                                                    <ValidationSettings RequiredField-IsRequired="true" />
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2025" Caption="2025" VisibleIndex="2" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2024" Caption="2024" VisibleIndex="3" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2023" Caption="2023" VisibleIndex="4" Width="20%" />
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
                        <dx:LayoutItem Caption=" " Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxGridView ID="GridDepartement" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridDepartement" Theme="Glass"
                                        Width="100%" KeyFieldName="ID" DataSourceID="sqldep">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataComboBoxColumn FieldName="Departement" Caption="Département" Width="40%">
                                                <PropertiesComboBox DataSourceID="SqlDeep" TextField="Description" ValueField="ID">
                                                    <ValidationSettings RequiredField-IsRequired="true" />
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2025" Caption="2025" VisibleIndex="2" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2024" Caption="2024" VisibleIndex="3" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2023" Caption="2023" VisibleIndex="4" Width="20%" />
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
                        <dx:LayoutItem Caption=" " Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxGridView ID="GridCategorie" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridCategorie" Theme="Glass"
                                        Width="100%" KeyFieldName="Id" DataSourceID="SqlFA">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Fonction" Caption="Catégorie professionnelle" VisibleIndex="1" Width="40%"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2025" Caption="2025" VisibleIndex="2" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2024" Caption="2024" VisibleIndex="3" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2023" Caption="2023" VisibleIndex="4" Width="20%" />
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
                        <dx:LayoutItem Caption=" " Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxGridView ID="GridSexe" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridSexe" Theme="Glass"
                                        Width="100%" KeyFieldName="ID" DataSourceID="SqlSexe">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Sexe" Caption="Sexe" VisibleIndex="1" Width="40%"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2025" Caption="2025" VisibleIndex="2" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2024" Caption="2024" VisibleIndex="3" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2023" Caption="2023" VisibleIndex="4" Width="20%" />
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
                <dx:LayoutGroup Caption="Depart" GroupBoxStyle-Caption-Font-Bold="true" Width="25%">
                    <Items>
                        <dx:LayoutItem Caption=" " Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxGridView ID="GridDepartFonction" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridDepartFonction" Theme="Glass"
                                        Width="100%" KeyFieldName="Id" DataSourceID="SqlDF">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Fonction" Caption="Catégorie Professionelle" VisibleIndex="1" Width="40%"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2025" Caption="2025" VisibleIndex="2" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2024" Caption="2024" VisibleIndex="3" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2023" Caption="2023" VisibleIndex="4" Width="20%" />
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
                        <dx:LayoutItem Caption=" " Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxGridView ID="GridDepartDepartement" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridDepartDepartement" Theme="Glass"
                                        Width="100%" KeyFieldName="ID" DataSourceID="SqlDD">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Departement" Caption="Département" VisibleIndex="1" Width="40%"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2025" Caption="2025" VisibleIndex="2" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2024" Caption="2024" VisibleIndex="3" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2023" Caption="2023" VisibleIndex="4" Width="20%" />
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
                        <dx:LayoutItem Caption=" " Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxGridView ID="GridSexeDepart" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridSexeDepart" Theme="Glass"
                                        Width="100%" KeyFieldName="ID" DataSourceID="SqlSD">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Sexe" Caption="Sexe" VisibleIndex="1" Width="40%"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2025" Caption="2025" VisibleIndex="2" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2024" Caption="2024" VisibleIndex="3" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2023" Caption="2023" VisibleIndex="4" Width="20%" />
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
                <dx:LayoutGroup Caption="Mouvement" GroupBoxStyle-Caption-Font-Bold="true" Width="25%">
                    <Items>
                        <dx:LayoutItem ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxGridView ID="GridMv" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridMv" Theme="Glass"
                                        Width="100%" KeyFieldName="Id" DataSourceID="SqlTemp">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Type_Mouvement" Caption="Type Mouvement" VisibleIndex="1" Width="40%"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2025" Caption="2025" VisibleIndex="2" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2024" Caption="2024" VisibleIndex="3" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2023" Caption="2023" VisibleIndex="4" Width="20%" />
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
                                    <dx:ASPxGridView ID="GridFonctionMouvement" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridFonctionMouvement" Theme="Glass"
                                        Width="100%" KeyFieldName="Id" DataSourceID="SqlNA">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Fonction" Caption="Catégorie Professionelle" VisibleIndex="1" Width="40%"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Type_Mouvement" Caption="Type Mouvement" VisibleIndex="2" Width="40%"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2025" Caption="2025" VisibleIndex="3" Width="13%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2024" Caption="2024" VisibleIndex="4" Width="13%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2023" Caption="2023" VisibleIndex="5" Width="13%" />
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
                                                                <dx:ASPxDashboard ID="Mouvement" Width="100%"  Height="340px"  WorkingMode="ViewerOnly" runat="server" ></dx:ASPxDashboard>

        </dx:LayoutItemNestedControlContainer>
    </LayoutItemNestedControlCollection>
</dx:LayoutItem>
                
                    </Items>

                </dx:LayoutGroup>
                <dx:LayoutGroup Caption="Sanctions" GroupBoxStyle-Caption-Font-Bold="true" Width="25%">
                    <Items>
                        <dx:LayoutItem Caption=" " Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxGridView ID="GridSanction" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridSan" Theme="Glass"
                                        Width="100%" KeyFieldName="Id" DataSourceID="SqlSan">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Type_Sanction" Caption="Type Sanction" VisibleIndex="1" Width="40%"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2025" Caption="2025" VisibleIndex="2" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2024" Caption="2024" VisibleIndex="3" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2023" Caption="2023" VisibleIndex="4" Width="20%" />
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
                        <dx:LayoutItem Caption=" " Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxGridView ID="GridSanF" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridSanF" Theme="Glass"
                                        Width="100%" KeyFieldName="ID" DataSourceID="SqlSanF">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Fonction" Caption="Catégorie Professionelle" VisibleIndex="1" Width="40%"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Type_Sanction" Caption="Type Sanction" VisibleIndex="2" Width="40%"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2025" Caption="2025" VisibleIndex="3" Width="13%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2024" Caption="2024" VisibleIndex="4" Width="13%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2023" Caption="2023" VisibleIndex="5" Width="13%" />
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
                                                                <dx:ASPxDashboard ID="Sanction" Width="100%"  Height="340px"  WorkingMode="ViewerOnly" runat="server" ></dx:ASPxDashboard>

        </dx:LayoutItemNestedControlContainer>
    </LayoutItemNestedControlCollection>
</dx:LayoutItem>
                    </Items>
                </dx:LayoutGroup>
            </Items>
        </dx:ASPxFormLayout>

        <asp:SqlDataSource ID="SqlDF" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Depart_Fonction" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="sqlcontrat" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Embauce_Contrat" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlTC" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="SelectType_Contrat" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlDeep" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="SelectDepartements" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlDep" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Embauce_Departement" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlSexe" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Embauce_Sexe" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlDD" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Depart_Departement" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlSD" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Depart_Sexe" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlNA" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Fonction_Mouvement" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlFA" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Embauce_Fonction" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlTemp" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Type_Mouvement" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlSan" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Afficher_Sanction" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlSanF" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Afficher_SanctionFonction" SelectCommandType="StoredProcedure" />
    </form>
</body>
</html>
