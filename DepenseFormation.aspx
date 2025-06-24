<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DepenseFormation.aspx.cs" Inherits="DepenseFormation" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Depense Formation</title>

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
</head>
<body>
    <form id="form1" runat="server">
        
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


    <dx:ASPxGridView ID="GridCl" ClientInstanceName="GridCl" Theme="office365"  
        runat="server" AutoGenerateColumns="False" DataSourceID="SqlDF"
        KeyFieldName="ID" Width="100%">
        <ClientSideEvents ContextMenu="grdInterventionContextMenu"  />


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


            <dx:GridViewDataTextColumn Caption="Type_Depense" FieldName="Type_Depense" Width="40%" Visible="True" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#dedede" />
            <dx:GridViewDataTextColumn Caption="Montant" FieldName="Montant" Width="40%" Visible="True" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#dedede" />
 <dx:GridViewDataDateColumn FieldName="Date" Caption="Date" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#dedede" Visible="true" >
     <PropertiesDateEdit>
         <CalendarProperties TodayButtonText="Aujourd'hui" ClearButtonText="Effacer">
         </CalendarProperties>
     </PropertiesDateEdit>
     <EditFormSettings Visible="True" />
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

        <SettingsEditing Mode="Batch" />


        <SettingsBehavior AutoExpandAllGroups="true" AllowDragDrop="False" AllowGroup="False" AllowFocusedRow="True" />
        <Settings ShowFooter="false" ShowColumnHeaders="true" ShowGroupPanel="false" ShowGroupFooter="VisibleIfExpanded"
            VerticalScrollableHeight="250" VerticalScrollBarMode="Visible"></Settings>

    </dx:ASPxGridView>
              
        <asp:SqlDataSource ID="SqlEmployes" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="SelectEmployes" SelectCommandType="StoredProcedure" />
 <asp:SqlDataSource ID="SqlDF" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
     SelectCommand="SelectDepense_Formation" SelectCommandType="StoredProcedure"
     deleteCommand="deleteDepense_Formation" DeleteCommandType="StoredProcedure"
     updateCommand="updateDepense_Formation" UpdateCommandType="StoredProcedure"
     insertCommand="insertDepense_Formation"/>    </form>
</body>
</html>
