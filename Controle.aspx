<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Controle.aspx.cs" Inherits="Controle" %>
<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Gestion des Contrôles</title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    
    <script type="text/javascript">
        

        function CliTest() {
            var Nom = lbNom.GetText();
            lbRepe.SetText(Nom);
        }

        function CallAP() {
            cmbArticle.PerformCallback();
            GrdAp.PerformCallback();
        }

        function AddCl() {
            // Clear the form fields
            txtDescription.SetValue('');
            txtRibbonName.SetValue('');
            popuAdd.Show();
        }

        function btnAddValider() {
            try {
                var description = txtDescription.GetValue();
                var ribbonName = txtRibbonName.GetValue();

                if (!description || !ribbonName) {
                    alert('Please fill in all fields.');
                    return;
                }

                GridCl.AddNewRow();
                var index = GridCl.GetRowCount() - 1;
                GridCl.SetEditValue('Description', description);
                GridCl.SetEditValue('RibbonName', ribbonName);

                GridCl.UpdateEdit();
                popuAdd.Hide();
            } catch (e) {
                console.error('Error in btnAddValider:', e);
                alert('An error occurred while adding the new control: ' + e.message);
            }
        }

        function EditCl(s, e) {
            try {
                var index = GridCl.GetFocusedRowIndex();
                if (index < 0) {
                    alert('Please select a row to edit.');
                    return;
                }
                console.log('Edit button clicked, index:', index); // Debug log
                // Populate the form with the selected row's data
                GridCl.GetRowValues(index, 'Description;RibbonName', function (values) {
                    txtEditDescription.SetValue(values[0]);
                    txtEditRibbonName.SetValue(values[1]);
                });
                popuEdit.Show(); // Show popup immediately
            } catch (e) {
                console.error('Error in EditCl:', e);
                alert('An error occurred while opening the edit popup: ' + e.message);
            }
        }

        function OnCustomButtonClick(s, e) {
            if (e.buttonID === 'CustomEditButton') {
                GridCl.SetFocusedRowIndex(e.visibleIndex); // Set the focused row
                EditCl(s, e);
            }
        }

        function btnEditValider() {
            try {
                var index = GridCl.GetFocusedRowIndex();
                if (index < 0) {
                    alert('No row selected for editing.');
                    return;
                }

                var description = txtEditDescription.GetValue();
                var ribbonName = txtEditRibbonName.GetValue();

                if (!description || !ribbonName) {
                    alert('Please fill in all fields.');
                    return;
                }

                GridCl.StartEditRow(index);
                GridCl.SetEditValue('Description', description);
                GridCl.SetEditValue('RibbonName', ribbonName);
                GridCl.UpdateEdit();

                popuEdit.Hide();
            } catch (e) {
                console.error('Error in btnEditValider:', e);
                alert('An error occurred while updating the control: ' + e.message);
            }
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
                GridCl.DeleteRow(index);
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
</head>
<body>
    <canvas id="particle-canvas"></canvas>
    <form id="form1" runat="server">
        <div class="dashboard-header">
            <div class="dashboard-header-title">
                <span>Gestion des Contrôles</span>
            </div>
        </div>

        <div class="card">
            <div class="grid-container">
                <dx:ASPxPopupMenu ID="pupmnInspection" runat="server" ClientInstanceName="pupmnInspection" GutterWidth="0px" Theme="Office365"
                    SeparatorColor="#7EACB1">
                    <Items>
                        <dx:MenuItem Name="mAdd" Text="Ajouter">
                            <Image IconID="iconbuilder_actions_add_svg_16x16" Width="16px" Height="16px" />
                        </dx:MenuItem>
                        <dx:MenuItem Name="mDelete" Text="Supprimer">
                            <Image IconID="iconbuilder_actions_delete_svg_16x16" Width="16px" Height="16px" />
                        </dx:MenuItem>
                    </Items>
                    <ItemStyle ImageSpacing="5px" />
                    <SubMenuStyle BackColor="#EDF3F4" GutterWidth="0px" SeparatorColor="#7EACB1" />
                    <ClientSideEvents ItemClick="function(s, e) {GridMenuItemInspectionClick(e);}" />
                    <SubMenuItemImage Height="7px" Width="7px" />
                </dx:ASPxPopupMenu>

                <asp:SqlDataSource ID="SqlCt" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
                    SelectCommand="SelectControle" SelectCommandType="StoredProcedure"
                    DeleteCommand="deleteControle" DeleteCommandType="StoredProcedure"
                    UpdateCommand="updateControle" UpdateCommandType="StoredProcedure"
                    InsertCommand="insertControle" InsertCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="ID_Controle" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ID_Controle" />
                        <asp:Parameter Name="Description" />
                        <asp:Parameter Name="RibbonName" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Description" />
                        <asp:Parameter Name="RibbonName" />
                    </InsertParameters>
                </asp:SqlDataSource>

                <dx:ASPxGridView ID="GridCl" ClientInstanceName="GridCl" Theme="iOS"
                    runat="server" AutoGenerateColumns="False" DataSourceID="SqlCt"
                    KeyFieldName="ID_Controle" Width="100%">
                    <ClientSideEvents 
                        ContextMenu="grdInterventionContextMenu" 
                        RowClick="function(s, e) { s.SetFocusedRowIndex(e.visibleIndex); }" 
                        CustomButtonClick="OnCustomButtonClick" />
                    <Columns>
                        <dx:GridViewCommandColumn ButtonType="Image" Caption=" " Width="150px"
                            ShowSelectCheckbox="false" VisibleIndex="0"
                            ShowEditButton="FALSE"
                            ShowUpdateButton="true"
                            ShowDeleteButton="true"
                            ShowCancelButton="true">
                            <CustomButtons>
                                <dx:GridViewCommandColumnCustomButton ID="CustomEditButton" Text="Edit">
                                    <Image IconID="iconbuilder_actions_edit_svg_16x16" Width="16px" />
                                </dx:GridViewCommandColumnCustomButton>
                            </CustomButtons>
                            <HeaderTemplate>
                                <div class="add-button-container">
                                    <dx:ASPxButton HorizontalAlign="Center" runat="server" Text=" " RenderMode="Link" AutoPostBack="false" ToolTip="Add New">
                                        <Image IconID="iconbuilder_actions_add_svg_16x16" Width="16px"></Image>
                                        <ClientSideEvents Click="AddCl" />
                                    </dx:ASPxButton>
                                </div>
                            </HeaderTemplate>
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="ID_Controle" Visible="false">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Description" />
                        <dx:GridViewDataTextColumn FieldName="RibbonName" />
                    </Columns>
                    <SettingsSearchPanel Visible="true" />
                    <SettingsCommandButton>
                        <PreviewChangesButton Text="Preview">
                        </PreviewChangesButton>
                        <EditButton ButtonType="Image">
                            <Image IconID="iconbuilder_actions_edit_svg_16x16" Width="16px">
                            </Image>
                        </EditButton>
                        <DeleteButton ButtonType="Image">
                            <Image IconID="iconbuilder_actions_delete_svg_16x16" Width="16px">
                            </Image>
                        </DeleteButton>
                        <CancelButton Text="Cancel">
                            <Image IconID="iconbuilder_actions_undo_svg_16x16" Width="16px">
                            </Image>
                        </CancelButton>
                        <UpdateButton Text="Save">
                            <Image IconID="iconbuilder_actions_edit_svg_16x16" Width="16px">
                            </Image>
                        </UpdateButton>
                    </SettingsCommandButton>
                    <Styles>
                        <FocusedRow BackColor="#F0F8FF" ForeColor="Black"></FocusedRow>
                    </Styles>
                    <SettingsPager PageSize="50" EnableAdaptivity="true">
                        <PageSizeItemSettings Visible="true" Position="Right" ShowAllItem="true">
                        </PageSizeItemSettings>
                    </SettingsPager>
                    <SettingsEditing Mode="Batch">
                    </SettingsEditing>
                    <SettingsBehavior AutoExpandAllGroups="true" AllowDragDrop="False" AllowGroup="False" AllowFocusedRow="True" />
                    <Settings ShowFooter="false" ShowColumnHeaders="true" ShowGroupPanel="false" ShowGroupFooter="VisibleIfExpanded"
                        VerticalScrollableHeight="500" VerticalScrollBarMode="Visible">
                    </Settings>
                </dx:ASPxGridView>

                <!-- Add Popup -->
                <dx:ASPxPopupControl ID="popuAdd" ClientInstanceName="popuAdd" ShowCloseButton="true" ShowHeader="true" HeaderText="Ajouter un Contrôle"
                    Width="400px" PopupVerticalAlign="TopSides" PopupHorizontalAlign="WindowCenter"
                    runat="server" Theme="iOS">
                    <ContentCollection>
                        <dx:PopupControlContentControl>
                            <div class="dxpc-content">
                                <div>
                                    <label for="txtDescription">Description</label>
                                    <dx:ASPxTextBox ID="txtDescription" ClientInstanceName="txtDescription" runat="server" Width="100%" Theme="iOS" />
                                </div>
                                <div>
                                    <label for="txtRibbonName">Ribbon Name</label>
                                    <dx:ASPxTextBox ID="txtRibbonName" ClientInstanceName="txtRibbonName" runat="server" Width="100%" Theme="iOS" />
                                </div>
                                <div class="popup-buttons">
                                    <dx:ASPxButton ID="btnAddOK" runat="server" Width="100px" ClientInstanceName="btnAddOK" Text="OK" Theme="iOS" AutoPostBack="false">
                                        <ClientSideEvents Click="btnAddValider" />
                                    </dx:ASPxButton>
                                    <dx:ASPxButton ID="btnAddCancel" runat="server" Width="100px" ClientInstanceName="btnAddCancel" Text="Cancel" Theme="iOS" AutoPostBack="false">
                                        <ClientSideEvents Click="function(s, e) { popuAdd.Hide(); }" />
                                    </dx:ASPxButton>
                                </div>
                            </div>
                        </dx:PopupControlContentControl>
                    </ContentCollection>
                </dx:ASPxPopupControl>

                <!-- Edit Popup -->
                <dx:ASPxPopupControl ID="popuEdit" ClientInstanceName="popuEdit" ShowCloseButton="true" ShowHeader="true" HeaderText="Modifier un Contrôle"
                    Width="400px" PopupVerticalAlign="TopSides" PopupHorizontalAlign="WindowCenter"
                    runat="server" Theme="iOS">
                    <ContentCollection>
                        <dx:PopupControlContentControl>
                            <div class="dxpc-content">
                                <div>
                                    <label for="txtEditDescription">Description</label>
                                    <dx:ASPxTextBox ID="txtEditDescription" ClientInstanceName="txtEditDescription" runat="server" Width="100%" Theme="iOS" />
                                </div>
                                <div>
                                    <label for="txtEditRibbonName">Ribbon Name</label>
                                    <dx:ASPxTextBox ID="txtEditRibbonName" ClientInstanceName="txtEditRibbonName" runat="server" Width="100%" Theme="iOS" />
                                </div>
                                <div class="popup-buttons">
                                    <dx:ASPxButton ID="btnEditOK" runat="server" Width="100px" ClientInstanceName="btnEditOK" Text="OK" Theme="iOS" AutoPostBack="false">
                                        <ClientSideEvents Click="btnEditValider" />
                                    </dx:ASPxButton>
                                    <dx:ASPxButton ID="btnEditCancel" runat="server" Width="100px" ClientInstanceName="btnEditCancel" Text="Cancel" Theme="iOS" AutoPostBack="false">
                                        <ClientSideEvents Click="function(s, e) { popuEdit.Hide(); }" />
                                    </dx:ASPxButton>
                                </div>
                            </div>
                        </dx:PopupControlContentControl>
                    </ContentCollection>
                </dx:ASPxPopupControl>
            </div>
        </div>
    </form>
</body>
</html>