<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ressource.aspx.cs" Inherits="Ressource" %>

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
            function fermerPopupCreateUser() {

                PoPNewUser.Hide();
            }
            function CreateUser() {
                GridCl.PerformCallback("NewUser");
                PoPNewUser.Hide();

            }
            function AddCl() {


                PoPNewUser.Show();
                //GridCl.AddNewRow();

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

                popupValidation.Show();
            }




            function MoPa() {

                window.parent.MoPa();
            }




            //function btnValider() {
            //    GridCl.PerformCallback();
            //    popuPassword.Hide();

            //}
            function ClosePoup() {
                popupValidation.Hide();
            }

            function PopupVAlide() {
                GridCl.PerformCallback('Password');
            }
            function EndCallback_Password(s, e) {
                var choix = s.cp_Update;
                if (choix == 'UpdatePassword') {

                    popupValidation.Hide();

                    PoPModifieravecS.Show();
                }








            }
            function PopupModifier() {
                PoPModifieravecS.Hide();

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


            <dx:ASPxGridView ID="GridCl" ClientInstanceName="GridCl" Theme="office365" OnCustomCallback="GridCl_CustomCallback"
                runat="server" AutoGenerateColumns="False" DataSourceID="SqlRessources"
                KeyFieldName="ID" Width="100%">
                <ClientSideEvents ContextMenu="grdInterventionContextMenu" EndCallback="EndCallback_Password" />


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
                    <dx:GridViewDataTextColumn FieldName="ID" Visible="false">
                    </dx:GridViewDataTextColumn>


                    <dx:GridViewDataTextColumn Caption="NomPrenom" FieldName="Nom_Prenom" Width="40%" Visible="True" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#dedede" />
                    <dx:GridViewDataTextColumn Caption="Login" FieldName="Login" Width="40%" Visible="True" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#dedede" />
                     <dx:GridViewDataTextColumn Caption="Email" FieldName="Email" Width="40%" Visible="True" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#dedede" />

                    <dx:GridViewDataTextColumn Caption="Password" FieldName="Password" Width="40%" Visible="True" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#dedede">
                        <PropertiesTextEdit Password="true" />
                        <Settings ShowEditorInBatchEditMode="false" />
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
                    VerticalScrollableHeight="500" VerticalScrollBarMode="Visible"></Settings>

            </dx:ASPxGridView>




            <asp:SqlDataSource ID="SqlRessources" runat="server"
                ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
                SelectCommand="SelectUsersession" SelectCommandType="StoredProcedure"
                DeleteCommand="deleteUsersession" DeleteCommandType="StoredProcedure"
                UpdateCommand="updateUsersession" UpdateCommandType="StoredProcedure"
                InsertCommand="insertUsersession" InsertCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />

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








            <dx:ASPxPopupControl ID="popupValidation" runat="server" Theme="iOS" HeaderText="Mot de passe forcé" ClientInstanceName="popupValidation"
                PopupHorizontalAlign="WindowCenter" CloseAction="None" ShowCloseButton="false"
                PopupVerticalAlign="TopSides" Modal="True" Width="500px">
                <ContentCollection>
                    <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                        <table style="width: 100%">
                            <tr>
                                <td colspan="3" style="width: 100%; text-align: center">
                                    <dx:ASPxLabel ID="labelError" runat="server" Text="Voulez-vous vraiment modifier votre mot de passe ?" ForeColor="Maroon" Font-Bold="true" ClientInstanceName="labelError" Theme="iOS" Width="100%"></dx:ASPxLabel>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <dx:ASPxButton ID="ASPxButton2" runat="server" AutoPostBack="False" Text="Oui" Theme="Material" Width="100px">
                                        <ClientSideEvents Click="PopupVAlide" />
                                    </dx:ASPxButton>
                                </td>
                                <td width="20px"></td>
                                <td align="left">
                                    <dx:ASPxButton ID="btnValidation" runat="server" AutoPostBack="False" Text="Fermer" Theme="Material" Width="100px">

                                        <ClientSideEvents Click="ClosePoup" />
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </dx:PopupControlContentControl>
                </ContentCollection>
                <CloseButtonImage Height="17px" Width="17px" />
            </dx:ASPxPopupControl>


            <dx:ASPxPopupControl ID="PoPModifieravecS" runat="server" Theme="iOS" HeaderText="Mot de passe forcé" ClientInstanceName="PoPModifieravecS"
                PopupHorizontalAlign="WindowCenter" CloseAction="None" ShowCloseButton="false"
                PopupVerticalAlign="TopSides" Modal="True" Width="300px">
                <ContentCollection>
                    <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 100%; text-align: center">
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Mot de passe changé avec succès" ForeColor="Maroon" Font-Bold="true" ClientInstanceName="labelError" Theme="iOS" Width="100%"></dx:ASPxLabel>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100%; text-align: center">
                                    <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="OK" Theme="Material" Width="100px">
                                        <ClientSideEvents Click="PopupModifier" />
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </dx:PopupControlContentControl>
                </ContentCollection>
                <CloseButtonImage Height="17px" Width="17px" />
            </dx:ASPxPopupControl>

            <dx:ASPxPopupControl ID="PoPNewUser" ClientInstanceName="PoPNewUser" ShowCloseButton="true" ShowHeader="true"
                PopupHorizontalAlign="WindowCenter"  PopupVerticalAlign="TopSides" HeaderText="Ajouter un utilisateur" Width="500px" runat="server" Theme="Office365">
                <ContentCollection>
                    <dx:PopupControlContentControl>
                        <dx:ASPxFormLayout runat="server">
                            <Items>

                                <dx:LayoutGroup ShowCaption="False" ColumnCount="2">

                                    <Items>
                                        <dx:LayoutItem  Caption="Nom Prénom"  >
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>
                                                    <dx:ASPxTextBox ID="txtNomPrenom" ClientInstanceName="txtNomPrenom" runat="server"   Theme="iOS">
                                                        <ValidationSettings RequiredField-IsRequired="true"  Display="Dynamic" ErrorText="Le nom et le prénom sont requis." />
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                          <dx:LayoutItem  Caption="Login"  >
      <LayoutItemNestedControlCollection>
          <dx:LayoutItemNestedControlContainer>
              <dx:ASPxTextBox ID="txtLogin" ClientInstanceName="txtLogin" runat="server"   Theme="iOS">
                  <ValidationSettings RequiredField-IsRequired="true"  Display="Dynamic" ErrorText="Le nom et le prénom sont requis." />
              </dx:ASPxTextBox>
          </dx:LayoutItemNestedControlContainer>
      </LayoutItemNestedControlCollection>
  </dx:LayoutItem>
                                        
                                        <dx:LayoutItem   Caption="Email" ColumnSpan="2" >
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>
                                                    <dx:ASPxTextBox ID="txtEmail" ClientInstanceName="txtEmail" runat="server" Caption="" Theme="iOS">
                                                        <ValidationSettings RequiredField-IsRequired="true"  Display="Dynamic" ErrorText="L'adresse email est requise." />
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem   Caption="Role" ColumnSpan="2" >
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>
                                                    <dx:ASPxComboBox ID="cmbRole" ClientInstanceName="cmbRole" FieldName="ID_Role" TextField="Description" Theme="iOS"
                                                        ValueField="ID_Role" runat="server" DataSourceID="SqlRole" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#dedede">
                                                                                                            <ValidationSettings  Display="Dynamic" RequiredField-IsRequired="true" ErrorText="Le role est requis" />
</dx:ASPxComboBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem ShowCaption="False"   HorizontalAlign="Right" >
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>
                                                    <br /> <br />
                                                    <dx:ASPxButton ID="btnAjoutBEA" runat="server" Width="150px" ClientInstanceName="btnAjoutBEA" Theme="Glass" Text="Valider">
                                                        <ClientSideEvents Click="CreateUser" />
                                                    </dx:ASPxButton>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem ShowCaption="False" HorizontalAlign="Center" >
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>
                                                    <br /> <br />
                                                    <dx:ASPxButton ID="btnFermer" runat="server" Width="150px" ClientInstanceName="btnFermer" Text="Fermer" Theme="Glass" AutoPostBack="false">
                                                        <ClientSideEvents Click="fermerPopupCreateUser" />
                                                    </dx:ASPxButton>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>


                            </Items>
                        </dx:ASPxFormLayout>


                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>




        </div>
    </form>
</body>
</html>

