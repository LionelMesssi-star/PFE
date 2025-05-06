<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Departement.aspx.cs" Inherits="Departement" %>
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
            

            <asp:SqlDataSource ID="SqlDep" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
                SelectCommand="SelectDepartements" SelectCommandType="StoredProcedure"
                DeleteCommand="deleteDepartements" DeleteCommandType="StoredProcedure"
                UpdateCommand="updateDepartements" UpdateCommandType="StoredProcedure"
                InsertCommand="insertDepartements" InsertCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter Name="ID" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ID" />
                    <asp:Parameter Name="Description" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="Description" />
                </InsertParameters>

            </asp:SqlDataSource>
            <dx:aspxgridview id="GridCl" clientinstancename="GridCl" theme="Office365"
                runat="server" autogeneratecolumns="False" datasourceid="SqlDep"
                keyfieldname="ID" width="100%">
                <clientsideevents contextmenu="grdInterventionContextMenu" />
                <columns>
                    <dx:gridviewcommandcolumn buttontype="Image" caption=" " width="40px"
                        showselectcheckbox="false" visibleindex="0"
                        showeditbutton="false"
                        showupdatebutton="true"
                        showdeletebutton="true"
                        showcancelbutton="true">
                        <headertemplate>
                            <dx:aspxbutton horizontalalign="Center" runat="server" text=" " rendermode="Link" autopostback="false">
                                <image iconid="iconbuilder_actions_add_svg_16x16" width="16px"></image>
                                <clientsideevents click="AddCl" />
                            </dx:aspxbutton>
                        </headertemplate>

                    </dx:gridviewcommandcolumn>
                    <dx:gridviewdatatextcolumn fieldname="ID" visible="false">
                    </dx:gridviewdatatextcolumn>
                    <dx:gridviewdatatextcolumn fieldname="Description" width="100%" />
                </columns>
                <settingssearchpanel visible="true" />

                <settingscommandbutton>
                    <previewchangesbutton text="Preview">
                    </previewchangesbutton>
                    <editbutton>
                        <image iconid="iconbuilder_actions_edit_svg_16x16" width="16px">
                        </image>
                    </editbutton>
                    <deletebutton>
                        <image iconid="iconbuilder_actions_delete_svg_16x16" width="16px">
                        </image>
                    </deletebutton>
                    <cancelbutton text="Cancel">
                        <image iconid="iconbuilder_actions_undo_svg_16x16" width="16px">
                        </image>
                    </cancelbutton>
                    <updatebutton text="Save">
                        <image iconid="iconbuilder_actions_edit_svg_16x16" width="16px">
                        </image>
                    </updatebutton>
                </settingscommandbutton>

                <styles>
                    <focusedrow backcolor="#F0F8FF" forecolor="Black"></focusedrow>

                </styles>
                <settingspager pagesize="50" enableadaptivity="true">
                    <pagesizeitemsettings visible="true" position="Right" showallitem="true">
                    </pagesizeitemsettings>
                </settingspager>
                <settingsediting mode="Batch">
                </settingsediting>

                <settingsbehavior autoexpandallgroups="true" allowdragdrop="False" allowgroup="False" allowfocusedrow="True" />
                <settings showfooter="false" showcolumnheaders="true" showgrouppanel="false" showgroupfooter="VisibleIfExpanded"
                    verticalscrollableheight="250" verticalscrollbarmode="Visible">
                </settings>

            </dx:aspxgridview>
        </div>


    </form>
</body>
</html>
