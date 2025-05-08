<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Employes.aspx.cs" Inherits="Employes" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Gestion des Employés</title>
    
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h1> Gestion des Employés</h1></div>
                 

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

                    
                    

                </script>

                <dx:ASPxGridView ID="GridCl" runat="server" DataSourceID="SqlEmployes" Width="100%" Theme="Office365" KeyFieldName="ID"
                    ClientInstanceName="GridCl">
                    <SettingsSearchPanel Visible="true" ShowApplyButton="true" />

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