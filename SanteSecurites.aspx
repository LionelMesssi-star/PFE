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
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Manrope', sans-serif;
            background: linear-gradient(135deg, #dbeafe, #ffedd5);
            margin: 0;
            padding: 24px;
            color: #1f2937;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }

        #form1 {
            width: 100%;
            padding: 0;
            animation: fadeIn 0.6s ease-out;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .dxgvTable_Glass {
            border-collapse: collapse !important;
            background: #ffffff !important;
            border-radius: 12px !important;
            border: 1px solid #e5e7eb !important;
            transition: transform 0.3s ease !important;
            width: 100% !important;
            table-layout: fixed !important;
        }

        .dxgvTable_Glass:hover {
            transform: translateY(-2px) !important;
        }

        .dxgvHeader_Glass {
            background: linear-gradient(135deg, #2563eb, #1e40af) !important;
            color: #ffffff !important;
            font-weight: 700 !important;
            font-size: 14px !important;
            padding: 14px !important;
            border: none !important;
            text-transform: uppercase !important;
            letter-spacing: 1.2px !important;
            transition: background 0.3s ease, transform 0.2s ease !important;
            text-align: center !important;
        }

        .dxgvHeader_Glass:hover {
            background: linear-gradient(135deg, #1e40af, #2563eb) !important;
            transform: translateY(-1px) !important;
        }

        .dxgvDataRow_Glass td {
            padding: 12px !important;
            font-size: 14px !important;
            line-height: 1.4 !important;
            color: #1f2937 !important;
            border-bottom: 1px solid #e5e7eb !important;
            transition: background-color 0.2s ease, color 0.2s ease !important;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .dxgvDataRow_Glass:hover td {
            background-color: #ffedd5 !important;
            color: #7c2d12 !important;
        }

        .dxflGroupBox_Glass {
            border-radius: 12px !important;
            background: #ffffff !important;
            border: 1px solid #e5e7eb !important;
            margin-bottom: 20px !important;
        }

        .dxflGroupBoxCaption_Glass {
            background: linear-gradient(135deg, #2563eb, #1e40af) !important;
            color: #ffffff !important;
            font-weight: 700 !important;
            font-size: 14px !important;
            padding: 12px !important;
            border-radius: 12px 12px 0 0 !important;
            text-transform: uppercase !important;
        }

        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            width: 100%;
        }

        .dashboard-header-title {
            font-size: 24px;
            font-weight: 700;
            color: #2563eb;
            display: flex;
            align-items: center;
            gap: 12px;
            animation: slideIn 0.8s ease-out;
            position: relative;
            padding-bottom: 6px;
        }

        .dashboard-header-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 50%;
            height: 2px;
            background: linear-gradient(to right, #2563eb, #f97316);
            border-radius: 2px;
            transition: width 0.3s ease;
        }

        .dashboard-header-title:hover::after {
            width: 100%;
        }

        .dxeBase_Glass {
            font-family: 'Manrope', sans-serif !important;
            font-size: 14px !important;
            color: #1f2937 !important;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(12px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateX(-20px); }
            to { opacity: 1; transform: translateX(0); }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-header">
            <div class="dashboard-header-title">
                <span>Santé Securité</span>
            </div>
        </div>

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