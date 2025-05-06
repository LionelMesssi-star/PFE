<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Employes.aspx.cs" Inherits="Employes" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Gestion des Employés</title>
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2c3e50;
            --accent-color: #e74c3c;
            --light-color: #ecf0f1;
            --dark-color: #34495e;
            --success-color: #2ecc71;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f7fa;
            color: #333;
        }
        
        .container {
            max-width: 95%;
            margin: 20px auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }
        
        .header h1 {
            color: var(--secondary-color);
            margin: 0;
            font-size: 24px;
        }
        
        .action-buttons {
            display: flex;
            gap: 10px;
        }
        
        .grid-container {
            position: relative;
        }
        
        .status-bar {
            background-color: var(--light-color);
            padding: 10px 15px;
            border-radius: 4px;
            margin-bottom: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 14px;
        }
        
        .employee-count {
            font-weight: bold;
            color: var(--primary-color);
        }

        .grid-actions {
            margin-top: 15px;
            text-align: right;
            padding: 10px;
            background-color: #f8f9fa;
            border-radius: 4px;
        }
        
        /* Custom grid styling */
        .dxgvHeader_Office365, .dxgvHeader_Office365 table {
            background-color: var(--secondary-color) !important;
            color: white !important;
            border-radius: 4px 4px 0 0 !important;
        }
        
        .dxgvTitlePanel_Office365 {
            background-color: var(--light-color) !important;
            border-bottom: 1px solid #ddd !important;
        }
        
        .dxgvDataRow_Office365 td {
            border-bottom: 1px solid #f0f0f0 !important;
        }
        
        .dxgvDataRow_Office365:hover td {
            background-color: #f8f9fa !important;
        }
        
        .dxgvFocusedRow_Office365 td {
            background-color: var(--light-color) !important;
            color: var(--dark-color) !important;
        }
        
        /* Custom buttons */
        .dxbButton_Office365 {
            border-radius: 4px !important;
            transition: all 0.3s ease !important;
        }
        
        .dxbButton_Office365.dxbTSys {
            background-color: var(--primary-color) !important;
            border-color: var(--primary-color) !important;
        }
        
        .dxbButton_Office365.dxbTSys:hover {
            background-color: #2980b9 !important;
        }
        
        .dxbButton_Office365.dxbDSys {
            background-color: var(--accent-color) !important;
            border-color: var(--accent-color) !important;
        }
        
        .dxbButton_Office365.dxbDSys:hover {
            background-color: #c0392b !important;
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }
            
            .action-buttons {
                width: 100%;
                justify-content: flex-end;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h1>📊 Gestion des Employés</h1>
                <div class="action-buttons">
                    <dx:ASPxButton runat="server" Text="Exporter Excel" Theme="Office365" IconID="export_exporttoxlsx_svg_16x16" />
                    <dx:ASPxButton runat="server" Text="Imprimer" Theme="Office365" IconID="print_print_svg_16x16" />
                </div>
            </div>

            <div class="status-bar">
                <div>
                    <span>Statut: </span>
                    <span class="employee-count">
                        <dx:ASPxLabel ID="TxtEffT" runat="server" CssClass="label"></dx:ASPxLabel>
                        employés actifs</span>
                </div>
                <div>
                    <span>Dernière mise à jour: </span>
                    <span><%= DateTime.Now.ToString("dd/MM/yyyy HH:mm") %></span>
                </div>
            </div>

            <div class="grid-container">
                <script type="text/javascript">
                    function AddCl() {
                        GridCl.AddNewRow();
                    }


                    function MenuItemClickGamme(e) {
                        if (e.item == null) return;
                        var name = e.item.name;
                        if (name == "mAdd") AddCl();
                        if (name == "mDelete") DelCl();
                    }

                    function DelCl() {
                        var index = GridCl.GetFocusedRowIndex();
                        if (index >= 0) {
                            if (confirm("Êtes-vous sûr de vouloir supprimer cet employé ?")) {
                                GridCl.DeleteRow(index);
                            }
                        }
                    }

                    function grdInterventionContextMenu(s, e) {
                        var x = ASPxClientUtils.GetEventX(e.htmlEvent);
                        var y = ASPxClientUtils.GetEventY(e.htmlEvent);
                        GridCl.SetFocusedRowIndex(e.index);
                        pupmnInspection.ShowAtPos(x, y);
                    }

                    function GridMenuItemInspectionClick(e) {
                        if (e.item == null) return;
                        var name = e.item.name;
                        if (name == "mAdd") AddCl();
                        if (name == "mDelete") DelCl();
                    }

                    function onGridInit(s, e) {
                        // Customize the search panel
                        var searchPanel = s.FindSearchPanel();
                        if (searchPanel) {
                            searchPanel.SetPlaceholder("Rechercher un employé...");
                        }
                    }
                    

                </script>

                <dx:ASPxGridView ID="GridCl" runat="server" DataSourceID="SqlEmployes" Width="100%" Theme="Office365" KeyFieldName="ID"
                    ClientInstanceName="GridCl">
                    <ClientSideEvents ContextMenu="grdInterventionContextMenu" Init="onGridInit" />
                    <SettingsSearchPanel Visible="true" ShowApplyButton="true" />
                    <SettingsText SearchPanelEditorNullText="Rechercher un employé..." />

                    <Columns>
                        <dx:GridViewCommandColumn ButtonType="Image" Caption=" " Width="60px"
                            ShowSelectCheckbox="false" VisibleIndex="0"
                            ShowEditButton="false"
                            ShowDeleteButton="true"
                            >

                            <HeaderTemplate>
                                <dx:ASPxButton runat="server" Text="" RenderMode="Link" AutoPostBack="false" CssClass="add-button">
                                    <Image IconID="actions_add_16x16" Width="16px"></Image>
                                    <ClientSideEvents Click="AddCl" />
                                </dx:ASPxButton>
                            </HeaderTemplate>
                            <CellStyle HorizontalAlign="Center" />
                        </dx:GridViewCommandColumn>

                        <dx:GridViewDataTextColumn FieldName="ID" Visible="false" />

                        <dx:GridViewDataTextColumn FieldName="Nom" Caption="Nom" Width="120px">
                            <PropertiesTextEdit>
                                <ValidationSettings RequiredField-IsRequired="true" />
                            </PropertiesTextEdit>
                            <CellStyle Font-Bold="true" />
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataTextColumn FieldName="Prenom" Caption="Prénom" Width="120px">
                            <PropertiesTextEdit>
                                <ValidationSettings RequiredField-IsRequired="true" />
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>

                         <dx:GridViewDataDateColumn FieldName="Date_Naissance" Caption="Date de Naissance" Width="120px">
     <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
         <ValidationSettings RequiredField-IsRequired="true" />
     </PropertiesDateEdit>
 </dx:GridViewDataDateColumn>

                        <dx:GridViewDataComboBoxColumn FieldName="ID_Sexe" Caption="Sexe" Width="80px">
                            <PropertiesComboBox DataSourceID="SqlGender" TextField="Description" ValueField="ID">
                                <ValidationSettings RequiredField-IsRequired="true" />
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>

                        <dx:GridViewDataComboBoxColumn FieldName="ID_Fonction" Caption="Fonction" Width="150px">
                            <PropertiesComboBox DataSourceID="SqlFonction" TextField="Description" ValueField="ID">
                                <ValidationSettings RequiredField-IsRequired="true" />
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>

                        <dx:GridViewDataComboBoxColumn FieldName="Departement_ID" Caption="Département" Width="150px">
                            <PropertiesComboBox DataSourceID="SqlDep" TextField="Description" ValueField="ID">
                                <ValidationSettings RequiredField-IsRequired="true" />
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>

                        <dx:GridViewDataTextColumn FieldName="Email" Width="180px">
                            <PropertiesTextEdit>
                                <ValidationSettings RequiredField-IsRequired="true" RegularExpression-ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataDateColumn FieldName="Date_Embauche" Caption="Date Embauche" Width="120px">
                            <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                                <ValidationSettings RequiredField-IsRequired="true" />
                            </PropertiesDateEdit>
                        </dx:GridViewDataDateColumn>

                        <dx:GridViewDataDateColumn FieldName="Date_Depart" Caption="Date Départ" Width="120px">
                            <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" />
                        </dx:GridViewDataDateColumn>

                        <dx:GridViewDataComboBoxColumn FieldName="ID_TypeC" Caption="Type Contrat" Width="120px">
                            <PropertiesComboBox DataSourceID="SqlTC" TextField="Description" ValueField="ID">
                                <ValidationSettings RequiredField-IsRequired="true" />
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>

                        <dx:GridViewDataTextColumn FieldName="Nationalite" Caption="Nationalité" Width="120px" />

                        <dx:GridViewDataComboBoxColumn FieldName="Status_Handicape" Caption="Handicap" Width="80px">
                            <PropertiesComboBox>
                                <Items>
                                    <dx:ListEditItem Text="Oui" Value="Oui" />
                                    <dx:ListEditItem Text="Non" Value="Non" />
                                </Items>
                                <ValidationSettings RequiredField-IsRequired="true" />
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                    </Columns>

                    <SettingsCommandButton>
                        <EditButton>
                            <Image IconID="edit_edit_16x16" Width="16px" />
                        </EditButton>
                        <DeleteButton>
                            <Image IconID="actions_cancel_16x16" Width="16px" />
                        </DeleteButton>
                    </SettingsCommandButton>

                    <Styles>
                        <Header HorizontalAlign="Center" />
                        <FocusedRow BackColor="#f0f7ff" ForeColor="#333" />
                        <SelectedRow BackColor="#e6f2ff" />
                    </Styles>

                    <SettingsPager PageSize="20" EnableAdaptivity="true">
                        <PageSizeItemSettings Visible="true" Items="10,20,50,100" Position="Right" ShowAllItem="true" />
                    </SettingsPager>

                    <SettingsEditing Mode="Batch" />
                    <SettingsBehavior AutoExpandAllGroups="true" AllowDragDrop="False" AllowGroup="False" AllowFocusedRow="True" />
                    <Settings ShowFooter="true" ShowColumnHeaders="true" ShowGroupPanel="false" ShowGroupFooter="VisibleIfExpanded"
                        VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" HorizontalScrollBarMode="Auto" />

                    <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true" />

                    <Templates>
                        <StatusBar>
                            <div style="padding: 8px; background-color: #f8f9fa; border-top: 1px solid #ddd; text-align: right;">
                                <dx:ASPxLabel runat="server" Text='<%# "Total: " + GridCl.VisibleRowCount + " employés" %>' />
                            </div>
                        </StatusBar>
                    </Templates>
                </dx:ASPxGridView>

                <!-- Boutons Enregistrer/Annuler sous la grille -->
                <div class="grid-actions">
                    <dx:ASPxButton ID="btnUpdate" runat="server" Text="Enregistrer" Theme="Office365" AutoPostBack="false" UseSubmitBehavior="false">
                        <ClientSideEvents Click="function(s, e) { GridCl.UpdateEdit(); }" />
                        <Image IconID="save_save_16x16" Width="16px" />
                    </dx:ASPxButton>
                    <dx:ASPxButton ID="btnCancel" runat="server" Text="Annuler" Theme="Office365" AutoPostBack="false" UseSubmitBehavior="false" style="margin-left: 10px;">
                        <ClientSideEvents Click="function(s, e) { GridCl.CancelEdit(); }" />
                        <Image IconID="actions_cancel_16x16" Width="16px" />
                    </dx:ASPxButton>
                </div>
            </div>
        </div>

        <asp:SqlDataSource ID="SqlEmployes" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="SelectEmployes" SelectCommandType="StoredProcedure"
            DeleteCommand="deleteEmployes" DeleteCommandType="StoredProcedure"
            UpdateCommand="updateEmployes" UpdateCommandType="StoredProcedure"
            InsertCommand="insertEmployes" InsertCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="ID" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="ID" />
                <asp:Parameter Name="Nom" />
                <asp:Parameter Name="Prenom" />
                <asp:Parameter Name="Date_Naissance" />
                <asp:Parameter Name="Date_Embauche" />
                <asp:Parameter Name="Date_Depart" />
                <asp:Parameter Name="Departement_ID" />
                <asp:Parameter Name="ID_Fonction" />
                <asp:Parameter Name="Email" />
                <asp:Parameter Name="ID_Sexe" />
                <asp:Parameter Name="ID_TypeC" />
                <asp:Parameter Name="Nationalite" />
                <asp:Parameter Name="Status_Handicape" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="Nom" />
                <asp:Parameter Name="Prenom" />
                <asp:Parameter Name="Date_Naissance" />
                <asp:Parameter Name="Date_Embauche" />
                <asp:Parameter Name="Date_Depart" />
                <asp:Parameter Name="Departement_ID" />
                <asp:Parameter Name="ID_Fonction" />
                <asp:Parameter Name="Email" />
                <asp:Parameter Name="ID_Sexe" />
                <asp:Parameter Name="ID_TypeC" />
                <asp:Parameter Name="Nationalite" />
                <asp:Parameter Name="Status_Handicape" />
            </InsertParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlGender" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="SelectSexe" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlFonction" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="SelectFonction" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlDep" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="SelectDepartements" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlTC" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="SelectType_Contrat" SelectCommandType="StoredProcedure" />
    </form>
</body>
</html>