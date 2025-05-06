<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Effectif.aspx.cs" Inherits="Effectif" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <link href="MainStyle.css" rel="stylesheet" type="text/css" />
        <div>

            <div class="dxeBase_Office365 SfBreadcrumb" style="font-family: Gugi">174 : Effectif Total , au 31 Mars 2025</div>

            <dx:ASPxFormLayout ID="FormEffectif" runat="server" EnableViewState="false" EncodeHtml="false" RequiredMarkDisplayMode="RequiredOnly" ColumnCount="4" Theme="Glass" Width="100%">
                <Items>
                    <dx:LayoutGroup ShowCaption="False" ColumnSpan="4" GroupBoxStyle-Caption-Font-Bold="true" Width="100%">
                        <Items>
                            <dx:LayoutItem ShowCaption="False" HorizontalAlign="Right">
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
                                                            <td width="150px">Age Moyen</td>
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
                                                                <dx:ASPxLabel ID="txtAgeMoyen" Text=" ans" runat="server" Theme="Aqua"></dx:ASPxLabel>


                                                            </td>
                                                            <td style="height: 15px; text-align: center; color: white; border-radius: 5px; background-color: #9b9898">

                                                                <dx:ASPxLabel ID="txtAgeMoyenhomme" Text="" runat="server" Theme="Aqua"></dx:ASPxLabel>


                                                            </td>
                                                            <td width="5px"></td>
                                                            <td style="height: 15px; text-align: center; font-size: 14px; font-weight: 700; color: white; border-radius: 5px; background-color: cornflowerblue;">
                                                                <dx:ASPxLabel ID="txtAgeMoyenFamme" Text="ans" runat="server" Theme="Aqua"></dx:ASPxLabel>
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
                                                            <td width="150px" style="">Ancienneté Moyenne</td>
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
                                                                <dx:ASPxLabel ID="txtAncienneteHomme" Text="7 ans" runat="server" Theme="Aqua"></dx:ASPxLabel>
                                                            </td>
                                                            <td width="5px"></td>
                                                            <td style="height: 15px; text-align: center; color: white; border-radius: 5px; background-color: cornflowerblue;">
                                                                <dx:ASPxLabel ID="txtAncienneteFamme" Text="5 ans" runat="server" Theme="Aqua"></dx:ASPxLabel>
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
                    <dx:LayoutGroup Caption="Contrat de travail" ShowCaption="False" GroupBoxStyle-Caption-Font-Bold="true" Width="25%">
                        <Items>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxGridView ID="GridContract" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridContract" Theme="Glass"
                                            Width="100%" KeyFieldName="ID" DataSourceID="sqlcontrat">

                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataComboBoxColumn FieldName="ID_TypeC" Caption="Contrat de Travail" Width="150px">
     <PropertiesComboBox DataSourceID="SqlTC" TextField="Description" ValueField="ID">
         <ValidationSettings RequiredField-IsRequired="true" />
     </PropertiesComboBox>
 </dx:GridViewDataComboBoxColumn>
                                                <dx:GridViewDataTextColumn FieldName="NbrN" Caption="2025" VisibleIndex="2" Width="80px" />
                                                <dx:GridViewDataTextColumn FieldName="NbrN1" Caption="2024" VisibleIndex="2" Width="80px" />
                                                <dx:GridViewDataTextColumn FieldName="NbrN2" Caption="2023" VisibleIndex="2" Width="80px" />
                                            </Columns>
                                            <SettingsResizing ColumnResizeMode="NextColumn" />
                                            <SettingsSearchPanel Visible="false" />
                                            <SettingsPager Visible="false" PageSize="3">
                                                <PageSizeItemSettings ShowAllItem="True" Visible="True">
                                                </PageSizeItemSettings>
                                            </SettingsPager>
                                            <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                                VerticalScrollBarMode="Visible" VerticalScrollableHeight="100" />
                                        </dx:ASPxGridView>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Temps de travail" ShowCaption="False" GroupBoxStyle-Caption-Font-Bold="true" Width="25%">
                        <Items>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxGridView ID="GridTemp" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridTemp" Theme="Glass"
                                            Width="100%" KeyFieldName="Id">

                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Description" Caption="Temps de travail" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataProgressBarColumn FieldName="Avancement" Caption="2025" VisibleIndex="2" Width="80px" />
                                                <dx:GridViewDataProgressBarColumn FieldName="Avancement" Caption="2024" VisibleIndex="2" Width="80px" />
                                                <dx:GridViewDataProgressBarColumn FieldName="Avancement" Caption="2023" VisibleIndex="2" Width="80px" />
                                            </Columns>
                                            <SettingsResizing ColumnResizeMode="NextColumn" />
                                            <SettingsSearchPanel Visible="false" />
                                            <SettingsPager Visible="false" PageSize="3">
                                                <PageSizeItemSettings ShowAllItem="True" Visible="True">
                                                </PageSizeItemSettings>
                                            </SettingsPager>
                                            <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                                VerticalScrollBarMode="Visible" VerticalScrollableHeight="100" />
                                        </dx:ASPxGridView>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Catégorie professionnelle" ShowCaption="False" GroupBoxStyle-Caption-Font-Bold="true" Width="25%">
                        <Items>
                            <dx:LayoutItem Caption=" ">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxGridView ID="GridCategorie" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridCategorie" Theme="Glass"
                                            Width="100%" KeyFieldName="Id">

                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Description" Caption="Catégorie professionnelle" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataProgressBarColumn FieldName="Avancement" Caption="2025" VisibleIndex="2" Width="80px" />
                                                <dx:GridViewDataProgressBarColumn FieldName="Avancement" Caption="2024" VisibleIndex="2" Width="80px" />
                                                <dx:GridViewDataProgressBarColumn FieldName="Avancement" Caption="2023" VisibleIndex="2" Width="80px" />
                                            </Columns>
                                            <SettingsResizing ColumnResizeMode="NextColumn" />
                                            <SettingsSearchPanel Visible="false" />
                                            <SettingsPager Visible="false" PageSize="3">
                                                <PageSizeItemSettings ShowAllItem="True" Visible="True">
                                                </PageSizeItemSettings>
                                            </SettingsPager>
                                            <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                                VerticalScrollBarMode="Visible" VerticalScrollableHeight="100" />
                                        </dx:ASPxGridView>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Métier" ShowCaption="False" GroupBoxStyle-Caption-Font-Bold="true" Width="25%">
                        <Items>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxGridView ID="GridMetier" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridMetier" Theme="Glass"
                                            Width="100%" KeyFieldName="Id">

                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Description" Caption="Métier" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataProgressBarColumn FieldName="Avancement" Caption="2025" VisibleIndex="2" Width="80px" />
                                                <dx:GridViewDataProgressBarColumn FieldName="Avancement" Caption="2024" VisibleIndex="2" Width="80px" />
                                                <dx:GridViewDataProgressBarColumn FieldName="Avancement" Caption="2023" VisibleIndex="2" Width="80px" />
                                            </Columns>
                                            <SettingsResizing ColumnResizeMode="NextColumn" />
                                            <SettingsSearchPanel Visible="false" />
                                            <SettingsPager Visible="false" PageSize="3">
                                                <PageSizeItemSettings ShowAllItem="True" Visible="True">
                                                </PageSizeItemSettings>
                                            </SettingsPager>
                                            <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                                VerticalScrollBarMode="Visible" VerticalScrollableHeight="100" />
                                        </dx:ASPxGridView>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Tranche d'age" ShowCaption="False" GroupBoxStyle-Caption-Font-Bold="true" Width="25%">
                        <Items>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxGridView ID="GridTranche" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridTranche" Theme="Glass"
                                            Width="100%" KeyFieldName="Id">

                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Description" Caption="Tranche d'age" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataProgressBarColumn FieldName="Avancement" Caption="2025" VisibleIndex="2" Width="80px" />
                                                <dx:GridViewDataProgressBarColumn FieldName="Avancement" Caption="2024" VisibleIndex="2" Width="80px" />
                                                <dx:GridViewDataProgressBarColumn FieldName="Avancement" Caption="2023" VisibleIndex="2" Width="80px" />
                                            </Columns>
                                            <SettingsResizing ColumnResizeMode="NextColumn" />
                                            <SettingsSearchPanel Visible="false" />
                                            <SettingsPager Visible="false" PageSize="3">
                                                <PageSizeItemSettings ShowAllItem="True" Visible="True">
                                                </PageSizeItemSettings>
                                            </SettingsPager>
                                            <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                                VerticalScrollBarMode="Visible" VerticalScrollableHeight="100" />
                                        </dx:ASPxGridView>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Ancienneté" ShowCaption="False" GroupBoxStyle-Caption-Font-Bold="true" Width="25%">
                        <Items>
                            <dx:LayoutItem Caption=" ">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxGridView ID="GridAnciennete" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridAnciennete" Theme="Glass"
                                            Width="100%" KeyFieldName="Id">

                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Description" Caption="Ancienneté" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataProgressBarColumn FieldName="Avancement" Caption="2025" VisibleIndex="2" Width="80px" />
                                                <dx:GridViewDataProgressBarColumn FieldName="Avancement" Caption="2024" VisibleIndex="2" Width="80px" />
                                                <dx:GridViewDataProgressBarColumn FieldName="Avancement" Caption="2023" VisibleIndex="2" Width="80px" />
                                            </Columns>
                                            <SettingsResizing ColumnResizeMode="NextColumn" />
                                            <SettingsSearchPanel Visible="false" />
                                            <SettingsPager Visible="false" PageSize="3">
                                                <PageSizeItemSettings ShowAllItem="True" Visible="True">
                                                </PageSizeItemSettings>
                                            </SettingsPager>
                                            <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                                VerticalScrollBarMode="Visible" VerticalScrollableHeight="100" />
                                        </dx:ASPxGridView>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Sexe" ShowCaption="False" GroupBoxStyle-Caption-Font-Bold="true" Width="25%">
                        <Items>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxGridView ID="GridSexe" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridSexe" Theme="Glass"
                                            Width="100%" KeyFieldName="Id">

                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Description" Caption="Sexe" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataProgressBarColumn FieldName="Avancement" Caption="2025" VisibleIndex="2" Width="80px" />
                                                <dx:GridViewDataProgressBarColumn FieldName="Avancement" Caption="2024" VisibleIndex="2" Width="80px" />
                                                <dx:GridViewDataProgressBarColumn FieldName="Avancement" Caption="2023" VisibleIndex="2" Width="80px" />
                                            </Columns>
                                            <SettingsResizing ColumnResizeMode="NextColumn" />
                                            <SettingsSearchPanel Visible="false" />
                                            <SettingsPager Visible="false" PageSize="3">
                                                <PageSizeItemSettings ShowAllItem="True" Visible="True">
                                                </PageSizeItemSettings>
                                            </SettingsPager>
                                            <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                                VerticalScrollBarMode="Visible" VerticalScrollableHeight="100" />
                                        </dx:ASPxGridView>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Site" ShowCaption="False" GroupBoxStyle-Caption-Font-Bold="true" Width="25%">
                        <Items>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxGridView ID="GridSite" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridSite" Theme="Glass"
                                            Width="100%" KeyFieldName="Id">

                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Description" Caption="Site" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataProgressBarColumn FieldName="Avancement" Caption="2025" VisibleIndex="2" Width="80px" />
                                                <dx:GridViewDataProgressBarColumn FieldName="Avancement" Caption="2024" VisibleIndex="2" Width="80px" />
                                                <dx:GridViewDataProgressBarColumn FieldName="Avancement" Caption="2023" VisibleIndex="2" Width="80px" />
                                            </Columns>
                                            <SettingsResizing ColumnResizeMode="NextColumn" />
                                            <SettingsSearchPanel Visible="false" />
                                            <SettingsPager Visible="false" PageSize="3">
                                                <PageSizeItemSettings ShowAllItem="True" Visible="True">
                                                </PageSizeItemSettings>
                                            </SettingsPager>
                                            <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                                VerticalScrollBarMode="Visible" VerticalScrollableHeight="100" />
                                        </dx:ASPxGridView>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Nationalité" ShowCaption="False" GroupBoxStyle-Caption-Font-Bold="true" Width="25%">
                        <Items>
                            <dx:LayoutItem Caption=" ">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxGridView ID="GridNationalite" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridNationalite" Theme="Glass"
                                            Width="100%" KeyFieldName="Id">

                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Description" Caption="Nationalité" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataProgressBarColumn FieldName="Avancement" Caption="2025" VisibleIndex="2" Width="80px" />
                                                <dx:GridViewDataProgressBarColumn FieldName="Avancement" Caption="2024" VisibleIndex="2" Width="80px" />
                                                <dx:GridViewDataProgressBarColumn FieldName="Avancement" Caption="2023" VisibleIndex="2" Width="80px" />
                                            </Columns>
                                            <SettingsResizing ColumnResizeMode="NextColumn" />
                                            <SettingsSearchPanel Visible="false" />
                                            <SettingsPager Visible="false" PageSize="3">
                                                <PageSizeItemSettings ShowAllItem="True" Visible="True">
                                                </PageSizeItemSettings>
                                            </SettingsPager>
                                            <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                                VerticalScrollBarMode="Visible" VerticalScrollableHeight="100" />
                                        </dx:ASPxGridView>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Département" ShowCaption="False" GroupBoxStyle-Caption-Font-Bold="true" Width="25%">
                        <Items>
                            <dx:LayoutItem Caption=" ">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxGridView ID="GridDepartement" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridDepartement" Theme="Glass"
                                            Width="100%" KeyFieldName="ID" DataSourceID="sqldep">

                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false">
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataComboBoxColumn FieldName="Departement_ID" Caption="Département" Width="150px">
     <PropertiesComboBox DataSourceID="SqlDeep" TextField="Description" ValueField="ID">
         <ValidationSettings RequiredField-IsRequired="true" />
     </PropertiesComboBox>
 </dx:GridViewDataComboBoxColumn>
                                                <dx:GridViewDataTextColumn FieldName="NbrN" Caption="2025" VisibleIndex="2" Width="80px" />
                                                <dx:GridViewDataTextColumn FieldName="NbrN1" Caption="2024" VisibleIndex="2" Width="80px" />
                                                <dx:GridViewDataTextColumn FieldName="NbrN2" Caption="2023" VisibleIndex="2" Width="80px" />
                                            </Columns>
                                            <SettingsResizing ColumnResizeMode="NextColumn" />
                                            <SettingsSearchPanel Visible="false" />
                                            <SettingsPager Visible="false" PageSize="4">
                                                <PageSizeItemSettings ShowAllItem="True" Visible="True">
                                                </PageSizeItemSettings>
                                            </SettingsPager>
                                            <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                                VerticalScrollBarMode="Visible" VerticalScrollableHeight="100" />
                                        </dx:ASPxGridView>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Statut Handicapé" ShowCaption="False" GroupBoxStyle-Caption-Font-Bold="true" Width="25%">
                        <Items>
                            <dx:LayoutItem Caption=" ">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxGridView ID="GridHandicape" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridHandicape" Theme="Glass"
                                            Width="100%" KeyFieldName="Id">

                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Description" Caption="Statut Handicapé" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataProgressBarColumn FieldName="Avancement" Caption="2025" VisibleIndex="2" Width="80px" />
                                                <dx:GridViewDataProgressBarColumn FieldName="Avancement" Caption="2024" VisibleIndex="2" Width="80px" />
                                                <dx:GridViewDataProgressBarColumn FieldName="Avancement" Caption="2023" VisibleIndex="2" Width="80px" />
                                            </Columns>
                                            <SettingsResizing ColumnResizeMode="NextColumn" />
                                            <SettingsSearchPanel Visible="false" />
                                            <SettingsPager Visible="false" PageSize="3">
                                                <PageSizeItemSettings ShowAllItem="True" Visible="True">
                                                </PageSizeItemSettings>
                                            </SettingsPager>
                                            <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                                VerticalScrollBarMode="Visible" VerticalScrollableHeight="100" />
                                        </dx:ASPxGridView>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                </Items>
            </dx:ASPxFormLayout>
            <asp:SqlDataSource ID="sqlcontrat" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
    SelectCommand="afficher_Contrat" SelectCommandType="StoredProcedure" />
            <asp:SqlDataSource ID="SqlTC" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
    SelectCommand="SelectType_Contrat" SelectCommandType="StoredProcedure" />
                    <asp:SqlDataSource ID="SqlDeep" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
SelectCommand="SelectDepartements" SelectCommandType="StoredProcedure" />
                                <asp:SqlDataSource ID="SqlDep" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
SelectCommand="Afficher_Departement" SelectCommandType="StoredProcedure" />

        </div>
    </form>
</body>
</html>