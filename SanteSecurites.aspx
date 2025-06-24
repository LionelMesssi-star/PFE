<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SanteSecurites.aspx.cs" Inherits="SanteSecurites" %>
 <%@ Register Assembly="DevExpress.Dashboard.v20.1.Web.WebForms, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Parcours Pro Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     
</head>
<body>
    <form id="form1" runat="server">
        <link href="MainStyle.css" rel="stylesheet" type="text/css" />
 
     <div class="dxeBase_Office365 SfBreadcrumb" style="font-family: Gugi">Santé Sécurite </div>

        <dx:ASPxFormLayout ID="FormEffectif" runat="server" EnableViewState="false" EncodeHtml="false" RequiredMarkDisplayMode="RequiredOnly" ColumnCount="4" Theme="Glass" Width="100%">
            <Items>
                <dx:LayoutGroup Caption="Accident de travail" GroupBoxStyle-Caption-Font-Bold="true" Width="50%">
                    <Items>
                        <dx:LayoutItem Caption=" " Width="100%">
    <LayoutItemNestedControlCollection>
        <dx:LayoutItemNestedControlContainer>
           <dx:ASPxDashboard ID="Accident" Width="100%"  Height="340px"  WorkingMode="ViewerOnly" runat="server" ></dx:ASPxDashboard>

        </dx:LayoutItemNestedControlContainer>
    </LayoutItemNestedControlCollection>
</dx:LayoutItem>
                        <dx:LayoutItem Caption="" Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxGridView ID="Gridcon" runat="server" AutoGenerateColumns="False" ClientInstanceName="Gridcon" Theme="Glass"
                                        Width="100%" KeyFieldName="ID" DataSourceID="sqlcon">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataComboBoxColumn FieldName="Consequence" Caption="Conséquence" Width="40%" VisibleIndex="1">
                                             </dx:GridViewDataComboBoxColumn>
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
                        <dx:LayoutItem Caption=" " Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxGridView ID="GridDepartement" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridDepartement" Theme="Glass"
                                        Width="100%" KeyFieldName="ID_Fonction" DataSourceID="sqlFAT">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="ID_Fonction" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataComboBoxColumn FieldName="Fonction" Caption="Catégorie professionelles" Width="40%">
                                                <PropertiesComboBox DataSourceID="SqlFon" TextField="Description" ValueField="ID">
                                                    <ValidationSettings RequiredField-IsRequired="true" />
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
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
                 
                 
                <dx:LayoutGroup Caption="Maladies Professionelles" GroupBoxStyle-Caption-Font-Bold="true" Width="50%">
                    <Items>
                                                                        <dx:LayoutItem ShowCaption="False">
    <LayoutItemNestedControlCollection>
        <dx:LayoutItemNestedControlContainer>
                                                                <dx:ASPxDashboard ID="Maladie" Width="100%"  Height="340px"  WorkingMode="ViewerOnly" runat="server" ></dx:ASPxDashboard>

        </dx:LayoutItemNestedControlContainer>
    </LayoutItemNestedControlCollection>
</dx:LayoutItem>
                        <dx:LayoutItem Caption=" " Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxGridView ID="Gridmaladie" runat="server" AutoGenerateColumns="False" ClientInstanceName="Gridmaladie" Theme="Glass"
                                        Width="100%" KeyFieldName="Id" DataSourceID="SqlMal">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Consequence" Caption="Conséquence" VisibleIndex="1" Width="40%"></dx:GridViewDataTextColumn>
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
                        <dx:LayoutItem Caption=" " Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxGridView ID="GridFMP" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridFMP" Theme="Glass"
                                        Width="100%" KeyFieldName="ID" DataSourceID="SqlFMP">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
<dx:GridViewDataComboBoxColumn FieldName="Fonction" Caption="Catégorie professionelles" Width="40%">
    <PropertiesComboBox DataSourceID="SqlFon" TextField="Description" ValueField="ID">
        <ValidationSettings RequiredField-IsRequired="true" />
    </PropertiesComboBox>
</dx:GridViewDataComboBoxColumn>                                   
                                             <dx:GridViewDataTextColumn FieldName="Nbr2025" Caption="2025" VisibleIndex="3" Width="13%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr2024" Caption="2024" VisibleIndex="4" Width="13%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr2023" Caption="2023" VisibleIndex="5" Width="13%" />
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
        </dx:ASPxFormLayout>

         
       
            <asp:SqlDataSource ID="SqlMal" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
SelectCommand="Afficher_Sante_ConseqMP" SelectCommandType="StoredProcedure" />
          <asp:SqlDataSource ID="sqlcon" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
      SelectCommand="Afficher_Sante_Conseq" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlFAT" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
    SelectCommand="Afficher_Sante_Fonction_AT" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlFon" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
    SelectCommand="SelectFonction" SelectCommandType="StoredProcedure" />
         <asp:SqlDataSource ID="SqlFMP" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
     SelectCommand="Afficher_Sante_Fonction_MP" SelectCommandType="StoredProcedure" />
        
    </form>
</body>
</html>