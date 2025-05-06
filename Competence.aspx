<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Competence.aspx.cs" Inherits="Competence" %>

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

            function CliTest() {

                var Nom = lbNom.GetText();
                lbRepe.SetText(Nom);



            }

            function CallAP() {
                cmbArticle.PerformCallback();
                GrdAp.PerformCallback();
            }



            function AddCl() {

                GridCl.AddNewRow();

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

                if (name == "mAdd") AddCl();
                if (name == "mDelete") DelCl();

            }
</script>
        <div>
            <div>
                
 <asp:SqlDataSource ID="SqlComp" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
                    SelectCommand="SelectCompetence" SelectCommandType="StoredProcedure"
                    DeleteCommand="deleteCompetence" DeleteCommandType="StoredProcedure"
                    UpdateCommand="updateCompetence" UpdateCommandType="StoredProcedure"
                    InsertCommand="insertCompetence" InsertCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="ID" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ID" />
                        <asp:Parameter Name="Competence" />
                        <asp:Parameter Name="Niveau_Actuel" />
                        <asp:Parameter Name="Niveau_Cible" />
                        <asp:Parameter Name="Type_Formation_Necessaire" />
                        <asp:Parameter Name="ID_Employes" />


                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Competence" />
                        <asp:Parameter Name="Niveau_Actuel" />
                        <asp:Parameter Name="Niveau_Cible" />
                        <asp:Parameter Name="Type_Formation_Necessaire" />
                        <asp:Parameter Name="ID_Employes" />

                    </InsertParameters>

                </asp:SqlDataSource>
                <div>
                    <dx:ASPxGridView ID="GridCl" ClientInstanceName="GridCl" Theme="Office365"
                        runat="server" AutoGenerateColumns="False" DataSourceID="SqlComp"
                        KeyFieldName="ID" Width="100%">
                        <ClientSideEvents ContextMenu="grdInterventionContextMenu" />
                        <Columns>

                            <dx:GridViewCommandColumn ButtonType="Image" Caption=" " Width="40px"
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
                            <dx:GridViewDataComboBoxColumn FieldName="ID_Employes" Caption="Nom Prenom" Width="100%">
                                <PropertiesComboBox DataSourceID="SqlEmployes" TextField="Nom_Prenom" ValueField="ID" />
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataTextColumn FieldName="Competence" Width="100%" />
                            <dx:GridViewDataComboBoxColumn FieldName="Niveau_Actuel" Caption="Niveau Actuel" Width="100%">
                                <PropertiesComboBox>
                                    <Items>
                                        <dx:ListEditItem Text="Débutant" Value="Débutant" />
                                        <dx:ListEditItem Text="Moyen" Value="Moyen" />
                                        <dx:ListEditItem Text="Avancé" Value="Avancé" />
                                    </Items>
                                    <ValidationSettings RequiredField-IsRequired="true" />
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>

                            <dx:GridViewDataComboBoxColumn FieldName="Niveau_Cible" Caption="Niveau cible" Width="100%">
                                <PropertiesComboBox>
                                    <Items>
                                        <dx:ListEditItem Text="Débutant" Value="Débutant" />
                                        <dx:ListEditItem Text="Moyen" Value="Moyen" />
                                        <dx:ListEditItem Text="Avancé" Value="Avancé" />
                                    </Items>
                                    <ValidationSettings RequiredField-IsRequired="true" />
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn FieldName="Type_Formation_Necessaire" Caption="Type Formation Necessaire" Width="100%">
                                <PropertiesComboBox DataSourceID="SqlFor" TextField="Nom_Formation" ValueField="ID" />
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
                        <SettingsEditing Mode="Batch">
                        </SettingsEditing>

                        <SettingsBehavior AutoExpandAllGroups="true" AllowDragDrop="False" AllowGroup="False" AllowFocusedRow="True" />
                        <Settings ShowFooter="false" ShowColumnHeaders="true" ShowGroupPanel="false" ShowGroupFooter="VisibleIfExpanded"
                            VerticalScrollableHeight="250" VerticalScrollBarMode="Visible"></Settings>

                    </dx:ASPxGridView>
                </div>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlEmployes" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="SelectEmployes" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlFor" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="SelectFormations" SelectCommandType="StoredProcedure" />
    </form>
</body>
</html>
