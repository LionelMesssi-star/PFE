<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Effectif.aspx.cs" Inherits="Effectif" %>
 <%@ Register Assembly="DevExpress.Dashboard.v20.1.Web.WebForms, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Effectif Dashboard</title>
     
      </head>
<body>
     <form id="form1" runat="server">
        <link href="MainStyle.css" rel="stylesheet" type="text/css" />
 
            <div class="dxeBase_Office365 SfBreadcrumb" style="font-family: Gugi"> Effectif Total  </div>
             <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" EnableViewState="false" EncodeHtml="false" RequiredMarkDisplayMode="RequiredOnly" ColumnCount="4" Theme="Glass" Width="100%">
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
                                                     <dx:ASPxLabel ID="txtAgeMoyen" Text="41 ans" runat="server" Theme="Aqua"></dx:ASPxLabel>
                                                 </td>
                                                 <td style="height: 15px; text-align: center; color: white; border-radius: 5px; background-color: #9b9898">

                                                     <dx:ASPxLabel ID="txtAgeMoyenhomme" Text="39 ans" runat="server" Theme="Aqua"></dx:ASPxLabel>


                                                 </td>
                                                 <td width="5px"></td>
                                                 <td style="height: 15px; text-align: center; font-size: 14px; font-weight: 700; color: white; border-radius: 5px; background-color: cornflowerblue;">
                                                     <dx:ASPxLabel ID="txtAgeMoyenFamme" Text="42 ans" runat="server" Theme="Aqua"></dx:ASPxLabel>
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
                                                     <dx:ASPxLabel ID="txtAncienneteFamme" Text=" " runat="server" Theme="Aqua"></dx:ASPxLabel>
                                                 </td>
                                                 <td style="height: 15px; text-align: center; color: white; border-radius: 5px; background-color: #9b9898">
                                                     <dx:ASPxLabel ID="txtAncienneteHomme" Text=" " runat="server" Theme="Aqua"></dx:ASPxLabel>
                                                 </td>
                                                 <td width="5px"></td>
                                                 <td style="height: 15px; text-align: center; color: white; border-radius: 5px; background-color: cornflowerblue;">
                                                     <dx:ASPxLabel ID="txtAnciennete" Text=" " runat="server" Theme="Aqua"></dx:ASPxLabel>
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
                        <dx:LayoutGroup Caption="Sexe" Width="50%">
                            <Items>
                                <dx:LayoutItem ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxGridView ID="GridSexe" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridSexe" Theme="Glass"
                                                Width="100%" KeyFieldName="ID" DataSourceID="SqlSexe">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Sexe" Caption="Sexe" VisibleIndex="1" Width="60%"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="2025" Caption="2025" VisibleIndex="2" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="2024" Caption="2024" VisibleIndex="3" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="2023" Caption="2023" VisibleIndex="4" Width="13%" />
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
                        <dx:LayoutGroup Caption="Nationalité" Width="50%">
                            <Items>
                                <dx:LayoutItem ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxGridView ID="GridNationalite" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridNationalite" Theme="Glass"
                                                Width="100%" KeyFieldName="Id" DataSourceID="SqlNA">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="TypeNationalite" Caption="Nationalité" VisibleIndex="1" Width="60%"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="2025" Caption="2025" VisibleIndex="2" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="2024" Caption="2024" VisibleIndex="3" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="2023" Caption="2023" VisibleIndex="4" Width="13%" />
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
                                                    <dx:GridViewDataTextColumn FieldName="TrancheAge" Caption="Tranche d'âge" VisibleIndex="1" Width="60%"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="2025" Caption="2025" VisibleIndex="2" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="2024" Caption="2024" VisibleIndex="3" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="2023" Caption="2023" VisibleIndex="4" Width="13%" />
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
                        <dx:LayoutGroup Caption="Statut Handicapé" Width="50%">
                            <Items>
                                <dx:LayoutItem ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxGridView ID="GridHandicape" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridHandicape" Theme="Glass"
                                                Width="100%" KeyFieldName="Id" DataSourceID="SqlHa">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Handicape" Caption="Statut Handicapé" VisibleIndex="1" Width="60%"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="2025" Caption="2025" VisibleIndex="2" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="2024" Caption="2024" VisibleIndex="3" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="2023" Caption="2023" VisibleIndex="4" Width="13%" />
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
                                                                <dx:ASPxDashboard ID="Eff" Width="100%"  Height="250px"  WorkingMode="ViewerOnly" runat="server" ></dx:ASPxDashboard>

        </dx:LayoutItemNestedControlContainer>
    </LayoutItemNestedControlCollection>
</dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                    </Items>
                </dx:LayoutGroup>

                 <dx:LayoutGroup Caption="   " ColumnSpan="2" GroupBoxStyle-Caption-Font-Bold="true" Width="50%">
                    <Items>
                        <dx:LayoutGroup Caption="Contrat de travail" Width="50%">
                            <Items>
                                <dx:LayoutItem ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxGridView ID="GridContract" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridContract" Theme="Glass"
                                                Width="100%" KeyFieldName="ID" DataSourceID="sqlcontrat">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataComboBoxColumn FieldName="ID_TypeC" Caption="Contrat de Travail" Width="60%">
                                                        <PropertiesComboBox DataSourceID="SqlTC" TextField="Description" ValueField="ID">
                                                            <ValidationSettings RequiredField-IsRequired="true" />
                                                        </PropertiesComboBox>
                                                    </dx:GridViewDataComboBoxColumn>
                                                    <dx:GridViewDataTextColumn FieldName="NbrN" Caption="2025" VisibleIndex="2" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="NbrN1" Caption="2024" VisibleIndex="3" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="NbrN2" Caption="2023" VisibleIndex="4" Width="13%" />
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
                        <dx:LayoutGroup Caption="Temps de travail" Width="50%">
                            <Items>
                                <dx:LayoutItem ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxGridView ID="GridTemp" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridTemp" Theme="Glass"
                                                Width="100%" KeyFieldName="Id" DataSourceID="SqlTemp">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Type_Contrat" Caption="Temps de travail" VisibleIndex="1" Width="60%"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="2025" Caption="2025" VisibleIndex="2" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="2024" Caption="2024" VisibleIndex="3" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="2023" Caption="2023" VisibleIndex="4" Width="13%" />
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
                        <dx:LayoutGroup Caption="Catégorie professionnelle" Width="50%">
                            <Items>
                                <dx:LayoutItem ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxGridView ID="GridCategorie" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridCategorie" Theme="Glass"
                                                Width="100%" KeyFieldName="Id" DataSourceID="SqlFA">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Fonction" Caption="Catégorie professionnelle" VisibleIndex="1" Width="60%"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="2025" Caption="2025" VisibleIndex="2" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="2024" Caption="2024" VisibleIndex="3" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="2023" Caption="2023" VisibleIndex="4" Width="13%" />
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
                                            <dx:ASPxGridView ID="GridDepartement" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridDepartement" Theme="Glass"
                                                Width="100%" KeyFieldName="ID" DataSourceID="SqlDep">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataComboBoxColumn FieldName="Departement_ID" Caption="Département" Width="60%">
                                                        <PropertiesComboBox DataSourceID="SqlDeep" TextField="Description" ValueField="ID">
                                                            <ValidationSettings RequiredField-IsRequired="true" />
                                                        </PropertiesComboBox>
                                                    </dx:GridViewDataComboBoxColumn>
                                                    <dx:GridViewDataTextColumn FieldName="NbrN" Caption="2025" VisibleIndex="2" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="NbrN1" Caption="2024" VisibleIndex="3" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="NbrN2" Caption="2023" VisibleIndex="4" Width="13%" />
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
                        <dx:LayoutGroup Caption="Ancienneté" Width="50%">
                            <Items>
                                <dx:LayoutItem ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxGridView ID="GridAnciennete" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridAnciennete" Theme="Glass"
                                                Width="100%" KeyFieldName="ID" DataSourceID="SqlAnn">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="TrancheAnciennete" Caption="Ancienneté" VisibleIndex="1" Width="60%"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="2025" Caption="2025" VisibleIndex="2" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="2024" Caption="2024" VisibleIndex="3" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="2023" Caption="2023" VisibleIndex="4" Width="13%" />
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
                    </Items>
                </dx:LayoutGroup>
            </Items>
          
        </dx:ASPxFormLayout>

         <asp:SqlDataSource ID="SqlHa" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="GetRepartitionHandicap" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="sqlcontrat" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="afficher_Contrat" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlTC" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="SelectType_Contrat" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlDeep" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="SelectDepartements" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlDep" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Afficher_Departement" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlSexe" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="countSexe" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlTA" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="GetRepartitionParAge" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlAnn" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="AfficherAnnciente" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlNA" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Afficher_Nationnalite" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlFA" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="countFonction" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlTemp" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Afficher_TempsTravail" SelectCommandType="StoredProcedure" />
    </form>
</body>
</html>