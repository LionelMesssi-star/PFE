<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Competences.aspx.cs" Inherits="Competences" %>
<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
 <%@ Register Assembly="DevExpress.Dashboard.v20.1.Web.WebForms, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Competence</title>
 </head>
<body>
     <form id="form1" runat="server">
          <link href="MainStyle.css" rel="stylesheet" type="text/css" />
 
<div class="dxeBase_Office365 SfBreadcrumb" style="font-family: Gugi">  Compétence  </div>


        <dx:ASPxFormLayout ID="FormEffectif" runat="server" EnableViewState="false" EncodeHtml="false" RequiredMarkDisplayMode="RequiredOnly" ColumnCount="4" Theme="Glass" Width="100%">
            <Items>
                  

                 <dx:LayoutGroup Caption="   " ColumnSpan="2" GroupBoxStyle-Caption-Font-Bold="true" Width="60%">
                    <Items>
                        <dx:LayoutGroup Caption="Compétence" Width="50%">
                            <Items>
                                <dx:LayoutItem ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxGridView ID="GridComp" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridCl" Theme="Glass"
                                                Width="100%" KeyFieldName="ID" DataSourceID="SqlComp">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Competence" Caption="Compétence" VisibleIndex="1" Width="60%"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Total_Employes" Caption="Employes" VisibleIndex="2" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="Expert" Caption="Expert" VisibleIndex="3" Width="13%" />
                                                    <dx:GridViewDataTextColumn FieldName="Avance" Caption="Avance" VisibleIndex="4" Width="13%" />
                                                                                                        <dx:GridViewDataTextColumn FieldName="Intermediaire" Caption="Intermediaire" VisibleIndex="5" Width="13%" />

                                                                                                        <dx:GridViewDataTextColumn FieldName="Moyen" Caption="Moyen" VisibleIndex="6" Width="13%" />
                                                                                                        <dx:GridViewDataTextColumn FieldName="Debutant" Caption="Debutant" VisibleIndex="7" Width="13%" />

                                                </Columns>
                                                <SettingsResizing ColumnResizeMode="NextColumn" />
                                                <SettingsSearchPanel Visible="false" />
                                                <SettingsPager Visible="false" />
                                                <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                                    VerticalScrollBarMode="Visible" VerticalScrollableHeight="200" />
                                            </dx:ASPxGridView>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                         
                         
                         
                    </Items>
                </dx:LayoutGroup>

                 <dx:LayoutGroup Caption="   " ColumnSpan="2" GroupBoxStyle-Caption-Font-Bold="true" Width="40%">
                    <Items>
                        <dx:LayoutGroup Caption="Besoins Formations" Width="50%">
                            <Items>
                                <dx:LayoutItem ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxGridView ID="GridFor" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridCl" Theme="Glass"
                                                Width="100%" KeyFieldName="ID" DataSourceID="sqlFor">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Type_Formation_Necessaire" Caption="Besoins Formation" Width="60%"></dx:GridViewDataTextColumn>
                                                                                                            <dx:GridViewDataTextColumn FieldName="Total_Employes" Caption="Employes" Width="40%"></dx:GridViewDataTextColumn>

                                                      
                                                </Columns>
                                                <SettingsResizing ColumnResizeMode="NextColumn" />
                                                <SettingsSearchPanel Visible="false" />
                                                <SettingsPager Visible="false" />
                                                <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                                    VerticalScrollBarMode="Visible" VerticalScrollableHeight="200" />
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

        <dx:ASPxFormLayout ID="DashboardLayout" runat="server" EnableViewState="false" EncodeHtml="false" Theme="Glass" Width="100%">
    <Items>
        <dx:LayoutGroup Caption="Tableau de Bord"   GroupBoxStyle-Caption-Font-Bold="true">
            <Items>
                <dx:LayoutItem ShowCaption="False">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer>
       <dx:ASPxDashboard ID="Competence" Width="100%"  Height="400px"  WorkingMode="ViewerOnly" runat="server" ></dx:ASPxDashboard>
                         </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
            </Items>
        </dx:LayoutGroup>
    </Items>
</dx:ASPxFormLayout>
       
        <asp:SqlDataSource ID="SqlComp" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
    SelectCommand="Afficher_Competence" SelectCommandType="StoredProcedure" />
         <asp:SqlDataSource ID="SqlFor" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Afficher_Formation_Necessaire" SelectCommandType="StoredProcedure" />
         
    </form>
</body>
</html>
