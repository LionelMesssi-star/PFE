<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Remuneration.aspx.cs" Inherits="Remuneration" %>

<%@ Register Assembly="DevExpress.Dashboard.v20.1.Web.WebForms, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

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
 
<div class="dxeBase_Office365 SfBreadcrumb" style="font-family: Gugi"> Remuneration  </div>
       

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
                                        <td width="150px">Rémunération Minimale</td>
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

                                            <dx:ASPxLabel ID="txtRemMoyenhomme" Text="39 ans" runat="server" Theme="Aqua"></dx:ASPxLabel>


                                        </td>
                                        <td width="5px"></td>
                                        <td style="height: 15px; text-align: center; font-size: 14px; font-weight: 700; color: white; border-radius: 5px; background-color: cornflowerblue;">
                                            <dx:ASPxLabel ID="txtRemMoyenFamme" Text="42 ans" runat="server" Theme="Aqua"></dx:ASPxLabel>
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
                                        <td width="150px" style="">Rémunération Maximale</td>
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
                                            <dx:ASPxLabel ID="txtMax" Text="6 ans" runat="server" Theme="Aqua"></dx:ASPxLabel>
                                        </td>
                                        <td style="height: 15px; text-align: center; color: white; border-radius: 5px; background-color: #9b9898">
                                            <dx:ASPxLabel ID="txtMaxHomme" Text="7 ans" runat="server" Theme="Aqua"></dx:ASPxLabel>
                                        </td>
                                        <td width="5px"></td>
                                        <td style="height: 15px; text-align: center; color: white; border-radius: 5px; background-color: cornflowerblue;">
                                            <dx:ASPxLabel ID="txtMaxFamme" Text="5 ans" runat="server" Theme="Aqua"></dx:ASPxLabel>
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
                        <dx:LayoutGroup Caption="Contrat de travail" Width="50%">
                            <Items>
                                <dx:LayoutItem ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxGridView ID="GridCS" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridFor" Theme="Glass"
                                                Width="100%" KeyFieldName="ID" DataSourceID="SqlCS">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Type_Contrat" Caption="Type Formation" VisibleIndex="1" Width="40%"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2025" Caption="2025" VisibleIndex="2" Width="20%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2024" Caption="2024" VisibleIndex="3" Width="20%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2023" Caption="2023" VisibleIndex="4" Width="20%" />
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
                        <dx:LayoutGroup Caption=" " Width="50%">
                            <Items>
                                <dx:LayoutItem ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxGridView ID="GridSF" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridNationalite" Theme="Glass"
                                                Width="100%" KeyFieldName="Id" DataSourceID="SqlSF">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Fonction" Caption="Catégorie professionnelle" VisibleIndex="1" Width="40%"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2025" Caption="2025" VisibleIndex="2" Width="20%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2024" Caption="2024" VisibleIndex="3" Width="20%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2023" Caption="2023" VisibleIndex="4" Width="20%" />
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
                                            <dx:ASPxGridView ID="GridSA" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridSA" Theme="Glass"
                                                Width="100%" KeyFieldName="ID" DataSourceID="SqlSA">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Tranche_Age" Caption="Tranche d'âge" VisibleIndex="1" Width="40%"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2025" Caption="2025" VisibleIndex="2" Width="20%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2024" Caption="2024" VisibleIndex="3" Width="20%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2023" Caption="2023" VisibleIndex="4" Width="20%" />
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
                                            <dx:ASPxGridView ID="GridSS" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridHandicape" Theme="Glass"
                                                Width="100%" KeyFieldName="Id" DataSourceID="SqlSS">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Sexe" Caption="Sexe" VisibleIndex="1" Width="40%"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2025" Caption="2025" VisibleIndex="2" Width="20%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2024" Caption="2024" VisibleIndex="3" Width="20%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2023" Caption="2023" VisibleIndex="4" Width="20%" />
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
                                                        <dx:LayoutGroup Caption="Nationalité" Width="50%">
    <Items>

        <dx:LayoutItem ShowCaption="False">
            <LayoutItemNestedControlCollection>
                <dx:LayoutItemNestedControlContainer>
                    <dx:ASPxGridView ID="GridSN" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridHandicape" Theme="Glass"
                        Width="100%" KeyFieldName="Id" DataSourceID="SqlSN">
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Categorie_Nationalite" Caption="Nationalité" VisibleIndex="1" Width="40%"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Nbr2025" Caption="2025" VisibleIndex="2" Width="20%" />
                            <dx:GridViewDataTextColumn FieldName="Nbr2024" Caption="2024" VisibleIndex="3" Width="20%" />
                            <dx:GridViewDataTextColumn FieldName="Nbr2023" Caption="2023" VisibleIndex="4" Width="20%" />
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

                                <dx:LayoutItem ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <%--                                                                <dx:ASPxDashboard ID="Eff" Width="100%"  Height="250px"  WorkingMode="ViewerOnly" runat="server" ></dx:ASPxDashboard>--%>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        
                    </Items>
                </dx:LayoutGroup>

                <dx:LayoutGroup Caption="   " ColumnSpan="2" GroupBoxStyle-Caption-Font-Bold="true" Width="50%">
                    <Items>
                        
                        <dx:LayoutGroup Caption="Handicap" Width="50%">
                            <Items>
                                <dx:LayoutItem ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxGridView ID="GridSH" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridSH" Theme="Glass"
                                                Width="100%" KeyFieldName="ID" DataSourceID="sqlSH">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Statut_Handicape" Caption="Handicap" VisibleIndex="1" Width="40%"></dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn FieldName="Nbr2025" Caption="2025" VisibleIndex="2" Width="20%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2024" Caption="2024" VisibleIndex="3" Width="20%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2023" Caption="2023" VisibleIndex="4" Width="20%" />
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
                                                    <dx:GridViewDataTextColumn FieldName="Temps_Travail" Caption="Temps de travail" VisibleIndex="1" Width="40%"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2025" Caption="2025" VisibleIndex="2" Width="20%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2024" Caption="2024" VisibleIndex="3" Width="20%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2023" Caption="2023" VisibleIndex="4" Width="20%" />
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
                                            <dx:ASPxGridView ID="GridSAA" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridSAA" Theme="Glass"
                                                Width="100%" KeyFieldName="Id" DataSourceID="SqlSAA">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Anciennete" Caption="Ancienneté" VisibleIndex="1" Width="40%"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2025" Caption="2025" VisibleIndex="2" Width="20%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2024" Caption="2024" VisibleIndex="3" Width="20%" />
                                                    <dx:GridViewDataTextColumn FieldName="Nbr2023" Caption="2023" VisibleIndex="4" Width="20%" />
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
                         
                        <dx:LayoutGroup Caption="Tableau de bord " Width="50%">
                            <Items>
                                <dx:LayoutItem ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxDashboard ID="Salaire" Width="100%"  Height="500px"  WorkingMode="ViewerOnly" runat="server" ></dx:ASPxDashboard>
 
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                    </Items>
                </dx:LayoutGroup>
            </Items>
        </dx:ASPxFormLayout>

       

        <asp:SqlDataSource ID="SqlTemp" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Afficher_TempsT_Salaire" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlCS" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Afficher_Salaire_Contrat" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlSF" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Afficher_Salaire_Fonction" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlSA" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Afficher_SalaireAge" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlSS" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Afficher_Salaire_Sexe" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlSN" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Afficher_Salaire_NAtionalite" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlSH" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Afficher_Handicap_Salaire" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlSAA" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Afficher_Ann_Salaire" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlSD" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Afficher_Dep_Salaire" SelectCommandType="StoredProcedure" />

    </form>
</body>
</html>
