<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <script type="text/javascript">

            function grdInterventionContextMenu(s, e) {
                var x = ASPxClientUtils.GetEventX(e.htmlEvent);
                var y = ASPxClientUtils.GetEventY(e.htmlEvent);
                GridCl.SetFocusedRowIndex(e.index);
                popupBonEntree.ShowAtPos(x, y);
            }



            function MenuItemClickGamme(e) {
                if (e.item == null) return;
                var name = e.item.name;



                if (name == "mAdd") AddCl();
                if (name == "mDelete") DelCl();

            }


            function AddCl() {

                GridCl.AddNewRow();

            }

            function DelCl() {
                var index = GridCl.GetFocusedRowIndex();
                if (index >= 0) {
                    GridCl.DeleteRow(index);
                }
            }



            function GridMenuItemInspectionClick(e) {
                if (e.item == null) return;
                var name = e.item.name;

                if (name == "MenuEditRessources") EditRessources();

            }



            function EditRessources() {
                //window.parent.EditRessources();

                popuPassword.Show();
            }




            function MoPa() {

                window.parent.MoPa();
            }


            

            function btnValider() {
                GridCl.PerformCallback();
            }




        </script>
        <div>


          
            <dx:ASPxPopupMenu ID="popupBonEntree" runat="server" ClientInstanceName="popupBonEntree" GutterWidth="0px" Theme="Office365"
                SeparatorColor="#7EACB1">
                <Items>

                    <dx:MenuItem Name="MenuEditRessources" Text="Modifier">
                        <Image IconID="dashboards_update_svg_16x16" Width="16px" Height="16px" />
                    </dx:MenuItem>

                </Items>
                <ItemStyle ImageSpacing="5px" />
                <SubMenuStyle BackColor="#EDF3F4" GutterWidth="0px" SeparatorColor="#7EACB1" />
                <ClientSideEvents ItemClick="function(s, e) {GridMenuItemInspectionClick(e);}" />
                <SubMenuItemImage Height="7px" Width="7px" />
            </dx:ASPxPopupMenu>


            <dx:ASPxGridView ID="GridCl" ClientInstanceName="GridCl" Theme="iOS" OnCustomCallback="GridCl_CustomCallback"
                runat="server" AutoGenerateColumns="False" DataSourceID="SqlRessources"
                KeyFieldName="ID" Width="100%">
                <ClientSideEvents ContextMenu="grdInterventionContextMenu" />

                <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="false" />

                <Columns>
                    <dx:GridViewCommandColumn ButtonType="Image" Caption=" " Width="65px"
                        ShowSelectCheckbox="false" VisibleIndex="0"
                        ShowEditButton="false"
                        ShowUpdateButton="true"
                        ShowDeleteButton="true"
                        ShowCancelButton="true">
                        <HeaderTemplate>
                            <dx:ASPxButton HorizontalAlign="Center" runat="server" Text=" " RenderMode="Link" AutoPostBack="false">
                                <Image IconID="iconbuilder_actions_add_svg_16x16" Width="16px"></Image>
                                <ClientSideEvents Click="AddCl" />

                            </dx:ASPxButton>
                        </HeaderTemplate>


                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="IdUser" Visible="false">
                    </dx:GridViewDataTextColumn>


                    <dx:GridViewDataTextColumn Caption="NomPrenom" FieldName="Nom_Prenom" Width="40%" Visible="True" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#dedede" />
                    <dx:GridViewDataTextColumn Caption="Login" FieldName="Login" Width="40%" Visible="True" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#dedede" />
                    <dx:GridViewDataTextColumn Caption="Email" FieldName="Email" Width="40%" Visible="True" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#dedede" />

                    <dx:GridViewDataTextColumn Caption="Password" FieldName="Password" Width="40%" Visible="True" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#dedede">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="ID_Role" Caption="Role" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#dedede" Width="40%">
                        <PropertiesComboBox DataSourceID="SqlRole" TextField="Description" ValueField="ID_Role" />
                    </dx:GridViewDataComboBoxColumn>

                </Columns>
                <SettingsSearchPanel Visible="true" />

                <SettingsCommandButton>
                    <PreviewChangesButton Text="Preview">
                    </PreviewChangesButton>
                    <EditButton>
                        <Image IconID="iconbuilder_actions_edit_svg_16x16" Width="16px">
                        </Image>
                    </EditButton>
                    <DeleteButton>
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

                <SettingsEditing Mode="Batch" />


                <SettingsBehavior AutoExpandAllGroups="true" AllowDragDrop="False" AllowGroup="False" AllowFocusedRow="True" />
                <Settings ShowFooter="false" ShowColumnHeaders="true" ShowGroupPanel="false" ShowGroupFooter="VisibleIfExpanded"
                    VerticalScrollableHeight="250" VerticalScrollBarMode="Visible"></Settings>

            </dx:ASPxGridView>
            <asp:SqlDataSource ID="SqlRessources" runat="server"
                ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
                SelectCommand="SelectUsersession" SelectCommandType="StoredProcedure"
                DeleteCommand="deleteUsersession" DeleteCommandType="StoredProcedure"
                UpdateCommand="updateUsersession" UpdateCommandType="StoredProcedure"
                InsertCommand="insertUsersession" InsertCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter Name="IdUser" Type="Int32" />

                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Email" />
                    <asp:Parameter Name="Password" />
                    <asp:Parameter Name="Nom_Prenom" />
                    <asp:Parameter Name="Login" />
                    <asp:Parameter Name="ID_Role" />

                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="Email" />
                    <asp:Parameter Name="Password" />
                    <asp:Parameter Name="Nom_Prenom" />
                    <asp:Parameter Name="Login" />
                    <asp:Parameter Name="ID_Role" />

                </InsertParameters>
            </asp:SqlDataSource>



            <asp:SqlDataSource ID="SqlRole" runat="server"
                ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
                SelectCommand="SelectRole" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

            <dx:ASPxPopupControl ID="popuPassword" ClientInstanceName="popuPassword" ShowCloseButton="true" ShowHeader="true" HeaderText="Information"
    Width="400px" PopupVerticalAlign="TopSides" PopupHorizontalAlign="WindowCenter"
    runat="server" Theme="Aqua">
    <ContentCollection>
        <dx:PopupControlContentControl>
            <table width="100%">
                <tr>
                    <td colspan="2" align="center">
                        <dx:ASPxLabel ID="txtEror" ClientInstanceName="txtEror"  Text="zzzzzzzzzzzzzzzzzzzzzzzzzz" ForeColor="Maroon" Font-Bold="true" runat="server"></dx:ASPxLabel>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                   <td align="center">
                        <dx:ASPxButton ID="ASPxButton1" runat="server" Width="100px" ClientInstanceName="btnok" Text="OK" Theme="Glass" AutoPostBack="false">
                            <ClientSideEvents Click="btnValider" />
                        </dx:ASPxButton>
                    </td>
                    <td align="center">
                        <dx:ASPxButton ID="btnok" runat="server" Width="100px" ClientInstanceName="btnok" Text="Fermer" Theme="Glass" AutoPostBack="false">
                            
                        </dx:ASPxButton>
                    </td>
                </tr>
            </table>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
                       


        </div>
    </form>
</body>
</html>