<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Salaire.aspx.cs" Inherits="Salaire" %>

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


                
                <div>
                    <dx:ASPxGridView ID="GridCl" ClientInstanceName="GridCl" Theme="Office365"
                        runat="server" AutoGenerateColumns="False" DataSourceID="SqlSalaire"
                        KeyFieldName="ID_salaire" Width="100%">
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
                                                        <dx:GridViewDataTextColumn FieldName="ID_salaire" Visible="false"></dx:GridViewDataTextColumn>

                            <dx:GridViewDataComboBoxColumn FieldName="ID_Employes" Caption="Employé" Width="33%">
                           <PropertiesComboBox DataSourceID="SqlEmployes" TextField="Nom_Prenom" ValueField="ID">
                               <ValidationSettings RequiredField-IsRequired="true" />
                           </PropertiesComboBox>
                       </dx:GridViewDataComboBoxColumn>

                       <dx:GridViewDataTextColumn FieldName="salaire" Caption="Salaire (TND)" Width="33%">
                           <PropertiesTextEdit DisplayFormatString="N3">
                               <ValidationSettings RequiredField-IsRequired="true" />
                           </PropertiesTextEdit>
                       </dx:GridViewDataTextColumn>

                       <dx:GridViewDataDateColumn FieldName="Date" Caption="Date" Width="33%">
                          <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy">
    <CalendarProperties FirstDayOfWeek="Monday">
        <FastNavProperties DisplayMode="Inline" />
    </CalendarProperties>
</PropertiesDateEdit>
                       </dx:GridViewDataDateColumn>



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
                <asp:SqlDataSource ID="SqlSalaire" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
     SelectCommand="SelectSalaire" SelectCommandType="StoredProcedure"
     DeleteCommand="deleteSalaire" DeleteCommandType="StoredProcedure"
     UpdateCommand="updateSalaire" UpdateCommandType="StoredProcedure"
     InsertCommand="insertSalaire" InsertCommandType="StoredProcedure">
     <DeleteParameters>
         <asp:Parameter Name="ID_salaire" />
     </DeleteParameters>
     <UpdateParameters>
         <asp:Parameter Name="ID_salaire" />
         <asp:Parameter Name="salaire" />
         <asp:Parameter Name="Date" />
         <asp:Parameter Name="ID_Employes" />
     </UpdateParameters>
     <InsertParameters>
         <asp:Parameter Name="salaire" />
        <asp:Parameter Name="Date" />
        <asp:Parameter Name="ID_Employes" />
     </InsertParameters>
 </asp:SqlDataSource>

 <asp:SqlDataSource ID="SqlEmployes" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
     SelectCommand="SELECT ID, Nom + ' ' + Prenom AS Nom_Prenom FROM Employes ORDER BY Nom, Prenom" />
   </form>
</body>
</html>
