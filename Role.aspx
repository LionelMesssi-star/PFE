<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Role.aspx.cs" Inherits="Role" %>
<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Role Management</title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
 
    <script type="text/javascript">
         

        var currentRoleId = '';

        function CliTest() {
            var Nom = lbNom.GetText();
            lbRepe.SetText(Nom);
        }

        function CallAP() {
            cmbArticle.PerformCallback();
            GrdAp.PerformCallback();
        }

        function ShowAddPopup() {
            try {
                console.log('ShowAddPopup called');
                if (typeof popupRole === 'undefined' || typeof txtDescription === 'undefined') {
                    alert('Error: Popup or text box not initialized.');
                    return;
                }
                txtDescription.SetText('');
                popupRole.SetHeaderText('Add New Role');
                currentRoleId = '';
                popupRole.Show();
            } catch (e) {
                console.error('Error in ShowAddPopup:', e);
                alert('An error occurred while opening the popup: ' + e.message);
            }
        }

        function ShowEditPopup(s, e) {
            try {
                console.log('ShowEditPopup called');
                var index = GridCl.GetFocusedRowIndex();
                if (index >= 0) {
                    GridCl.GetRowValues(index, 'Description', function (values) {
                        txtDescription.SetText(values);
                        var id = GridCl.GetRowKey(index);
                        popupRole.SetHeaderText('Edit Role');
                        currentRoleId = id;
                        popupRole.Show();
                    });
                }
            } catch (e) {
                console.error('Error in ShowEditPopup:', e);
                alert('An error occurred while opening the edit popup: ' + e.message);
            }
        }

        function SavePopup() {
            try {
                var description = txtDescription.GetText();
                if (description.trim() === '') {
                    alert('Description cannot be empty.');
                    return;
                }
                if (currentRoleId === '') {
                    // Add new role
                    GridCl.AddNewRow();
                    GridCl.SetEditValue('Description', description);
                    GridCl.UpdateEdit();
                } else {
                    // Update existing role
                    var index = GridCl.GetFocusedRowIndex();
                    if (index >= 0) {
                        GridCl.StartEditRow(index);
                        GridCl.SetEditValue('Description', description);
                        GridCl.UpdateEdit();
                    }
                }
                popupRole.Hide();
            } catch (e) {
                console.error('Error in SavePopup:', e);
                alert('An error occurred while saving: ' + e.message);
            }
        }

        function CancelPopup() {
            popupRole.Hide();
        }

        function MenuItemClickGamme(e) {
            if (e.item == null) return;
            var name = e.item.name;
            if (name == "mAdd") ShowAddPopup();
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
            alert(name);
            if (name == "mAdd") ShowAddPopup();
            if (name == "mDelete") DelCl();
        }

        function OnCustomButtonClick(s, e) {
            if (e.buttonID === "EditButton") {
                GridCl.SetFocusedRowIndex(e.visibleIndex);
                ShowEditPopup(s, e);
            }
        }
    </script>
</head>
<body>
     <form id="form1" runat="server">
        
        <div class="card">
            <div class="grid-container">
                <asp:SqlDataSource ID="SqlRl" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
                    SelectCommand="SelectRole" SelectCommandType="StoredProcedure"
                    DeleteCommand="deleteRole" DeleteCommandType="StoredProcedure"
                    UpdateCommand="updateRole" UpdateCommandType="StoredProcedure"
                    InsertCommand="insertRole" InsertCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="ID_Role" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ID_Role" />
                        <asp:Parameter Name="Description" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Description" />
                    </InsertParameters>
                </asp:SqlDataSource>

                <dx:ASPxGridView ID="GridCl" ClientInstanceName="GridCl" Theme="iOS"
                    runat="server" AutoGenerateColumns="False" DataSourceID="SqlRl"
                    KeyFieldName="ID_Role" Width="100%">
                    <ClientSideEvents 
                        ContextMenu="grdInterventionContextMenu" 
                        RowDblClick="ShowEditPopup" 
                        CustomButtonClick="OnCustomButtonClick" 
                        RowClick="function(s, e) { s.SetFocusedRowIndex(e.visibleIndex); }" />
                    <Columns>
                        <dx:GridViewCommandColumn ButtonType="Image" Caption=" " Width="60"
                            ShowSelectCheckbox="false" VisibleIndex="0"
                            ShowUpdateButton="false"
                            ShowDeleteButton="true"
                            ShowCancelButton="true">
                             
                            <HeaderTemplate>
                                <div class="add-button-container">
                                    <dx:ASPxButton ID="btnAddRole" ClientInstanceName="btnAddRole" HorizontalAlign="Center" runat="server" Text=" " RenderMode="Link" AutoPostBack="false" ToolTip="Add New Role">
                                        <Image IconID="iconbuilder_actions_add_svg_16x16" Width="16px"></Image>
                                        <ClientSideEvents Click="function(s, e) { ShowAddPopup(); }" />
                                    </dx:ASPxButton>
                                </div>
                            </HeaderTemplate>
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="ID_Role" Visible="false">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Description" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#dedede" />
                    </Columns>
                    <SettingsSearchPanel Visible="true" />
                    <SettingsCommandButton>
                        <PreviewChangesButton Text="Preview">
                        </PreviewChangesButton>
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
                    <SettingsPager PageSize="10" EnableAdaptivity="true">
                        <PageSizeItemSettings Visible="true" Position="Right" ShowAllItem="true">
                        </PageSizeItemSettings>
                    </SettingsPager>
                    <SettingsEditing Mode="Batch">
                    </SettingsEditing>
                    <SettingsBehavior AutoExpandAllGroups="true" AllowDragDrop="False" AllowGroup="False" AllowFocusedRow="True" />
                    <Settings ShowFooter="false" ShowColumnHeaders="true" ShowGroupPanel="false" ShowGroupFooter="VisibleIfExpanded"
                        VerticalScrollableHeight="200" VerticalScrollBarMode="Visible">
                    </Settings>
                </dx:ASPxGridView>

                <dx:ASPxPopupControl ID="popupRole" ClientInstanceName="popupRole" runat="server" Theme="office365"
                    PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="TopSides" Modal="true"
                    CloseAction="CloseButton" HeaderText="Add New Role">
                    <ContentCollection>
                        <dx:PopupControlContentControl>
                            <div class="dxpc-content">
                                <div>
                                    <label for="txtDescription">Role Description</label>
                                    <dx:ASPxTextBox ID="txtDescription" ClientInstanceName="txtDescription" runat="server"
                                        Width="100%" Theme="office365">
                                    </dx:ASPxTextBox>
                                </div>
                                <div class="popup-buttons">
                                    <dx:ASPxButton ID="btnSavePopup" runat="server" Text="Save" Theme="office365" AutoPostBack="false" ToolTip="Save">
                                        <Image IconID="iconbuilder_actions_save_svg_16x16" Width="16px" />
                                        <ClientSideEvents Click="SavePopup" />
                                    </dx:ASPxButton>
                                    <dx:ASPxButton ID="btnCancelPopup" runat="server" Text="Cancel" Theme="office365" AutoPostBack="false" ToolTip="Cancel">
                                        <Image IconID="iconbuilder_actions_close_svg_16x16" Width="16px" />
                                        <ClientSideEvents Click="CancelPopup" />
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