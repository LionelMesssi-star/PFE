<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Parcours.aspx.cs" Inherits="Parcours" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />

    <title></title>
    <style>
        /* Styles globaux */
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
        }

        /* Conteneur principal */
        .bilan-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            background: linear-gradient(135deg, #ffffff, #f9f9f9);
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            max-width: 1200px;
            margin: 0 auto;
        }

        /* Sections (Sexe, Département, Fonction) */
        .bilan-section {
            flex: 1 1 300px;
            background: white;
            border-radius: 10px;
            padding: 15px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

            .bilan-section:hover {
                transform: translateY(-5px);
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            }

        /* Titres de section */
        .section-title {
            font-size: 1.5em;
            font-weight: bold;
            color: #333;
            margin-bottom: 15px;
            border-bottom: 2px solid #007bff;
            padding-bottom: 5px;
        }

        /* Éléments individuels */
        .bilan-item {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

            .bilan-item:hover {
                background-color: #f1f1f1;
            }

        /* Icônes */
        .bilan-image {
            font-size: 20px;
            color: #007bff;
        }

        /* Labels */
        .label {
            font-size: 16px;
            font-weight: bold;
            color: #555;
        }

        /* Section Date */
        .bilan-container4 {
            background: white;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: 20px auto;
        }

        .year-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            border-bottom: 1px solid #eee;
        }

            .year-item:last-child {
                border-bottom: none;
            }

        .year-label {
            font-weight: bold;
            color: #333;
        }

        /* Styles pour les tableaux */
        .grid-container {
            margin-top: 30px;
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .grid-title {
            font-size: 1.5em;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

            .grid-title i {
                font-size: 1.2em;
            }

        .top-salaire {
            color: #28a745; /* Vert pour le top salaire */
        }

        .bas-salaire {
            color: #dc3545; /* Rouge pour le plus bas salaire */
        }

        .grid-wrapper {
            flex: 1 1 48%;
            background: white;
            border-radius: 10px;
            padding: 15px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

            .grid-wrapper:hover {
                transform: translateY(-5px);
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <script type="text/javascript">

            function ShowCalendar(s, e) {
                s.ShowDropDown();
            }

            function AddCl() {
                GridCl.AddNewRow();
            }
            function AdddCl() {
                GridSanction.AddNewRow();
            }
            function DellCl() {
                var index = GridSanction.GetFocusedRowIndex();
                if (index >= 0) {
                    GridSanction.DeleteRow(index);
                }
            }
            function DelCl() {
                var index = GridCl.GetFocusedRowIndex();
                if (index >= 0) {
                    GridCl.DeleteRow(index);
                }
            }

            function grdInterventionContextMenu(s, e) {
                var x = ASPxClientUtils.GetEventX(e.htmlEvent);
                var y = ASPxClientUtils.GetEventY(e.htmlEvent);
                GridCl.SetFocusedRowIndex(e.index);
                pupmnInspection.ShowAtPos(x, y);
            }
        </script>

        <div>
            <dx:ASPxGridView ID="GridCl" runat="server" DataSourceID="SqlParcours" Width="100%" Theme="Office365" KeyFieldName="ID">
                <SettingsSearchPanel Visible="true" />
                <ClientSideEvents ContextMenu="grdInterventionContextMenu" />
                <Columns>
                    <dx:GridViewCommandColumn ButtonType="Image" Caption=" " Width="5%"
                        ShowSelectCheckbox="false" VisibleIndex="0"
                        ShowEditButton="false"
                        ShowUpdateButton="true"
                        ShowDeleteButton="true"
                        ShowCancelButton="true">
                        <HeaderTemplate>
                            <div style="display: flex; justify-content: center; align-items: center;">
                                <dx:ASPxButton HorizontalAlign="Center" runat="server" Text=" " RenderMode="Link" AutoPostBack="false">
                                    <Image IconID="iconbuilder_actions_add_svg_16x16" Width="16px"></Image>
                                    <ClientSideEvents Click="AddCl" />
                                </dx:ASPxButton>
                            </div>
                        </HeaderTemplate>
                    </dx:GridViewCommandColumn>

                    <dx:GridViewDataTextColumn FieldName="ID" Visible="false" />

                    <dx:GridViewDataComboBoxColumn FieldName="ID_Employes" Caption="Nom Prenom">
                        <PropertiesComboBox DataSourceID="SqlEmployes" TextField="Nom_Prenom" ValueField="ID" />
                    </dx:GridViewDataComboBoxColumn>

                    <dx:GridViewDataComboBoxColumn FieldName="Type_Mouvement" Caption="Type Mouvement">
                        <PropertiesComboBox>
                            <Items>
                                <dx:ListEditItem Text="Chomage" Value="Chomage" />
                                <dx:ListEditItem Text="Chomage Partiel" Value="Chomage_Partiel" />
                                <dx:ListEditItem Text="Mutation" Value="Mutation" />
                                <dx:ListEditItem Text="Promotion" Value="Promotion" />

                            </Items>
                            <ValidationSettings RequiredField-IsRequired="true" />
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>

                    <dx:GridViewDataDateColumn FieldName="Date_Effet" Caption="Date Debut" Visible="true">
                        <PropertiesDateEdit EditFormat="Date" UseMaskBehavior="true" DisplayFormatString="dd/MM/yyyy">
                            <ClientSideEvents GotFocus="ShowCalendar" />
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn FieldName="Date_Fin" Caption="Date Fin" Visible="true">
                        <PropertiesDateEdit EditFormat="Date" UseMaskBehavior="true" DisplayFormatString="dd/MM/yyyy">
                            <ClientSideEvents GotFocus="ShowCalendar" />
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="Description" Visible="true" Caption="Description" />

                </Columns>

                <SettingsCommandButton>
                    <PreviewChangesButton Text="Preview" />
                    <EditButton>
                        <Image IconID="iconbuilder_actions_edit_svg_16x16" Width="16px" />
                    </EditButton>
                    <DeleteButton>
                        <Image IconID="iconbuilder_actions_delete_svg_16x16" Width="16px" />
                    </DeleteButton>
                    <CancelButton Text="Cancel">
                        <Image IconID="iconbuilder_actions_undo_svg_16x16" Width="16px" />
                    </CancelButton>
                    <UpdateButton Text="Save">
                        <Image IconID="iconbuilder_actions_edit_svg_16x16" Width="16px" />
                    </UpdateButton>
                </SettingsCommandButton>

                <Styles>
                    <FocusedRow BackColor="#F0F8FF" ForeColor="Black" />
                </Styles>

                <SettingsPager PageSize="50" EnableAdaptivity="true">
                    <PageSizeItemSettings Visible="true" Position="Right" ShowAllItem="true" />
                </SettingsPager>

                <SettingsEditing Mode="Batch" />
                <SettingsBehavior AutoExpandAllGroups="true" AllowDragDrop="False" AllowGroup="False" AllowFocusedRow="True" />
                <Settings ShowFooter="false" ShowColumnHeaders="true" ShowGroupPanel="false" ShowGroupFooter="VisibleIfExpanded"
                    VerticalScrollableHeight="250" VerticalScrollBarMode="Visible" />
            </dx:ASPxGridView>
            </div>
            <div>
            <dx:ASPxGridView ID="GridSanction" runat="server" DataSourceID="SqlSanction" Width="100%" Theme="Office365" KeyFieldName="ID">
                <SettingsSearchPanel Visible="true" />
                <ClientSideEvents ContextMenu="grdInterventionContextMenu" />
                <Columns>
                    <dx:GridViewCommandColumn ButtonType="Image" Caption=" " Width="5%"
                        ShowSelectCheckbox="false" VisibleIndex="0"
                        ShowEditButton="false"
                        ShowUpdateButton="true"
                        ShowDeleteButton="true"
                        ShowCancelButton="true">
                        <HeaderTemplate>
                            <div style="display: flex; justify-content: center; align-items: center;">
                                <dx:ASPxButton HorizontalAlign="Center" runat="server" Text=" " RenderMode="Link" AutoPostBack="false">
                                    <Image IconID="iconbuilder_actions_add_svg_16x16" Width="16px"></Image>
                                    <ClientSideEvents Click="AdddCl" />
                                </dx:ASPxButton>
                            </div>
                        </HeaderTemplate>
                    </dx:GridViewCommandColumn>

                    <dx:GridViewDataTextColumn FieldName="ID" Visible="false" />

                    <dx:GridViewDataComboBoxColumn FieldName="ID_Employes" Caption="Nom Prenom">
                        <PropertiesComboBox DataSourceID="SqlEmployes" TextField="Nom_Prenom" ValueField="ID" />
                    </dx:GridViewDataComboBoxColumn>

                    <dx:GridViewDataComboBoxColumn FieldName="Type_Sanction" Caption="Type Sanction">
                        <PropertiesComboBox>
                            <Items>
                                <dx:ListEditItem Text="Avertissement" Value="Avertissement" />
                                <dx:ListEditItem Text="Licenciement" Value="Licenciement" />
                                <dx:ListEditItem Text="Mise à Pied" Value="Mise_a_Pied" />

                            </Items>
                            <ValidationSettings RequiredField-IsRequired="true" />
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="Motif_Sanction" Caption="Motif Sanction">
                        <PropertiesComboBox>
                            <Items>
                                <dx:ListEditItem Text="Faute Grave" Value="Faute_grave" />
                                <dx:ListEditItem Text="Faute Lourde" Value="Faute_lourde" />
                                <dx:ListEditItem Text="Faute Simple" Value="Faute_simple" />

                            </Items>
                            <ValidationSettings RequiredField-IsRequired="true" />
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataDateColumn FieldName="Date_Effet" Caption="Date Debut" Visible="true">
                        <PropertiesDateEdit EditFormat="Date" UseMaskBehavior="true" DisplayFormatString="dd/MM/yyyy">
                            <ClientSideEvents GotFocus="ShowCalendar" />
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn FieldName="Date_Fin" Caption="Date Fin" Visible="true">
                        <PropertiesDateEdit EditFormat="Date" UseMaskBehavior="true" DisplayFormatString="dd/MM/yyyy">
                            <ClientSideEvents GotFocus="ShowCalendar" />
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="Description" Visible="true" Caption="Description" />

                </Columns>

                <SettingsCommandButton>
                    <PreviewChangesButton Text="Preview" />
                    <EditButton>
                        <Image IconID="iconbuilder_actions_edit_svg_16x16" Width="16px" />
                    </EditButton>
                    <DeleteButton>
                        <Image IconID="iconbuilder_actions_delete_svg_16x16" Width="16px" />
                    </DeleteButton>
                    <CancelButton Text="Cancel">
                        <Image IconID="iconbuilder_actions_undo_svg_16x16" Width="16px" />
                    </CancelButton>
                    <UpdateButton Text="Save">
                        <Image IconID="iconbuilder_actions_edit_svg_16x16" Width="16px" />
                    </UpdateButton>
                </SettingsCommandButton>

                <Styles>
                    <FocusedRow BackColor="#F0F8FF" ForeColor="Black" />
                </Styles>

                <SettingsPager PageSize="50" EnableAdaptivity="true">
                    <PageSizeItemSettings Visible="true" Position="Right" ShowAllItem="true" />
                </SettingsPager>

                <SettingsEditing Mode="Batch" />
                <SettingsBehavior AutoExpandAllGroups="true" AllowDragDrop="False" AllowGroup="False" AllowFocusedRow="True" />
                <Settings ShowFooter="false" ShowColumnHeaders="true" ShowGroupPanel="false" ShowGroupFooter="VisibleIfExpanded"
                    VerticalScrollableHeight="250" VerticalScrollBarMode="Visible" />
            </dx:ASPxGridView>
                 </div>
            <asp:SqlDataSource ID="SqlParcours" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
                SelectCommand="SelectParcours_Pro" SelectCommandType="StoredProcedure"
                DeleteCommand="deleteParcours_Pro" DeleteCommandType="StoredProcedure"
                UpdateCommand="updateParcours_Pro" UpdateCommandType="StoredProcedure"
                InsertCommand="insertParcours_Pro" InsertCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter Name="ID" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ID" />
                    <asp:Parameter Name="ID_Employes" />
                    <asp:Parameter Name="Type_Mouvement" />
                    <asp:Parameter Name="Date_Effet" />
                    <asp:Parameter Name="Date_Fin" />
                    <asp:Parameter Name="Description" />

                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID_Employes" />
                    <asp:Parameter Name="Type_Mouvement" />
                    <asp:Parameter Name="Date_Effet" />
                    <asp:Parameter Name="Date_Fin" />
                    <asp:Parameter Name="Description" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlSanction" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
                SelectCommand="SelectSanction" SelectCommandType="StoredProcedure"
                DeleteCommand="deleteSanction" DeleteCommandType="StoredProcedure"
                UpdateCommand="updateSanction" UpdateCommandType="StoredProcedure"
                InsertCommand="insertSanction" InsertCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter Name="ID" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ID" />
                    <asp:Parameter Name="ID_Employes" />
                    <asp:Parameter Name="Type_Sanction" />
                    <asp:Parameter Name="Motif_Sanction" />
                    <asp:Parameter Name="Date_Effet" />
                    <asp:Parameter Name="Date_Fin" />
                    <asp:Parameter Name="Description" />

                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID_Employes" />
                    <asp:Parameter Name="Type_Sanction" />
                    <asp:Parameter Name="Motif_Sanction" />
                    <asp:Parameter Name="Date_Effet" />
                    <asp:Parameter Name="Date_Fin" />
                    <asp:Parameter Name="Description" />

                </InsertParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlEmployes" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
                SelectCommand="SelectEmployes" SelectCommandType="StoredProcedure" />
            <asp:SqlDataSource ID="SqlMouvement" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
                SelectCommand="SelectMouvement" SelectCommandType="StoredProcedure" />
       
    </form>
</body>
</html>
