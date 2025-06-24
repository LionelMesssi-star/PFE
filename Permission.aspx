<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Permission.aspx.cs" Inherits="Permission" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <script type="text/javascript">
                function onRowClick() {
                    GridRessources.PerformCallback();
                    GridRC.PerformCallback();

                    GridRoles.GetRowValues(GridRoles.GetFocusedRowIndex(), 'ID_Role', ShowRole);

                }
                function ShowRole(value) {
                    txtRole.SetText(value);
                }

            </script>
            <dx:ASPxSplitter ID="ASPxSplitter2" runat="server" Width="100%" Theme="office365" BackColor="#ccffcc" Height="700px">
                <Panes>
                    <dx:SplitterPane Size="30%">
                        <ContentCollection>
                            <dx:SplitterContentControl runat="server">
                                <dx:ASPxGridView ID="GridRoles" Theme="office365" ClientInstanceName="GridRoles" runat="server" KeyFieldName="ID_Role"
                                    DataSourceID="SqlRole"
                                    Width="100%" AutoGenerateColumns="False" Border-BorderColor="WindowFrame">
                                    <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="false" />
                                    <ClientSideEvents FocusedRowChanged="onRowClick" />
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="ID_Role" Caption="ID" Width="20px" Visible="True" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#dedede" />
                                        <dx:GridViewDataTextColumn FieldName="Description" Caption="Role" Width="100%" Visible="True" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#dedede" />
                                    </Columns>
                                    <Settings ShowFilterRow="true" ShowFilterRowMenu="false" ShowGroupPanel="false" ShowFooter="true" />
                                    <SettingsPager>
                                        <PageSizeItemSettings Visible="true" Items="10, 20, 50" />
                                    </SettingsPager>
                                </dx:ASPxGridView>
                            </dx:SplitterContentControl>
                        </ContentCollection>
                    </dx:SplitterPane>

                    <dx:SplitterPane>
                        <ContentCollection>
                            <dx:SplitterContentControl runat="server">

                                <dx:ASPxPageControl ID="citiesTabPage" Width="100%" runat="server" CssClass="dxtcFixed" ActiveTabIndex="0" EnableHierarchyRecreation="True" Theme="office365">
                                    <TabPages>
                                        <dx:TabPage Text="Ressources">
                                            <ContentCollection>
                                                <dx:ContentControl ID="ContentControl1" runat="server">
                                                    <dx:ASPxCallbackPanel runat="server" Width="100%" ID="callDetailArticle" ClientInstanceName="callDetailArticle" OnCallback="callDetailArticle_Callback">
                                                        <PanelCollection>
                                                            <dx:PanelContent ID="PanelContent3" runat="server">
                                                                <div style="height: 620px; overflow: scroll;">
                                                                    <dx:ASPxFormLayout runat="server" ID="formLayout" Width="100%">
                                                                        <Items>
                                                                            <dx:LayoutItem ShowCaption="False" Caption="Description" ColumnSpan="1" RowSpan="1">
                                                                                <LayoutItemNestedControlCollection>
                                                                                    <dx:LayoutItemNestedControlContainer>

                                                                                        <dx:ASPxGridView ID="GridRessources" ClientInstanceName="GridRessources" runat="server"
                                                                                            Width="100%" AutoGenerateColumns="False" Theme="office365" OnCustomCallback="GridRessources_CustomCallback" KeyFieldName="ID" DataSourceID="SqlRessources">
                                                                                            <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="false" />
                                                                                            <Columns>
                                                                                                <dx:GridViewDataTextColumn Caption="Nom & Prénom" FieldName="Nom_Prenom" Width="40%" Visible="True" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#dedede" />
                                                                                            </Columns>
                                                                                            <Settings ShowFilterRow="true" ShowFilterRowMenu="true" ShowGroupPanel="false" ShowFooter="true" />
                                                                                            <SettingsPager>
                                                                                                <PageSizeItemSettings Visible="true" Items="10, 20, 50" />
                                                                                            </SettingsPager>
                                                                                        </dx:ASPxGridView>
                                                                                    </dx:LayoutItemNestedControlContainer>
                                                                                </LayoutItemNestedControlCollection>
                                                                            </dx:LayoutItem>
                                                                            <dx:LayoutItem ShowCaption="False" Caption="Description" ColumnSpan="1" RowSpan="1">
                                                                                <LayoutItemNestedControlCollection>
                                                                                    <dx:LayoutItemNestedControlContainer>
                                                                                        <dx:ASPxGridView ID="GridRC" ClientInstanceName="GridRC" runat="server" Theme="office365"
                                                                                            Width="100%" AutoGenerateColumns="False" KeyFieldName="ID_Controle" DataSourceID="SqlRC" OnCustomCallback="GridRC_CustomCallback">
                                                                                            <SettingsBehavior AllowFocusedRow="true" />
                                                                                            <Columns>
                                                                                                <dx:GridViewDataTextColumn FieldName="ID_Controle" Visible="false" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#dedede"></dx:GridViewDataTextColumn>
                                                                                                <dx:GridViewDataTextColumn Caption="Description" FieldName="Description" Width="100%" Visible="True" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#dedede"></dx:GridViewDataTextColumn>
                                                                                                <dx:GridViewDataCheckColumn Caption="Etat" FieldName="Etat" Width="50px"></dx:GridViewDataCheckColumn>

                                                                                            </Columns>
                                                                                            <SettingsEditing Mode="Batch"></SettingsEditing>
                                                                                            <Settings ShowFooter="true" VerticalScrollableHeight="300" VerticalScrollBarMode="Visible" />
                                                                                            <SettingsPager>
                                                                                                <PageSizeItemSettings Visible="true" Items="10, 20, 50" />
                                                                                            </SettingsPager>
                                                                                        </dx:ASPxGridView>
                                                                                    </dx:LayoutItemNestedControlContainer>
                                                                                </LayoutItemNestedControlCollection>
                                                                            </dx:LayoutItem>

                                                                        </Items>
                                                                    </dx:ASPxFormLayout>
                                                                </div>
                                                            </dx:PanelContent>
                                                        </PanelCollection>
                                                    </dx:ASPxCallbackPanel>
                                                </dx:ContentControl>
                                            </ContentCollection>
                                        </dx:TabPage>
                                        <dx:TabPage Text="Liste des Utilisateurs">
                                            <ContentCollection>
                                                <dx:ContentControl ID="ContentControl2" runat="server">
                                                    <dx:ASPxFormLayout runat="server" ID="ASPxFormLayout1" Width="100%">
                                                        <Items>
                                                            <dx:LayoutItem ShowCaption="False" Caption="Description" ColumnSpan="1" RowSpan="1">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer>
                                                                        <dx:ASPxGridView ID="GridUsers" ClientInstanceName="GridUsers" runat="server" Theme="office365"
                                                                            Width="100%" AutoGenerateColumns="False" KeyFieldName="ID" DataSourceID="SqlRessources1">
                                                                            <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="false" />
                                                                            <Columns>
                                                                                <dx:GridViewDataTextColumn Caption="Nom & Prénom" FieldName="Nom_Prenom" Width="40%" Visible="True" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#dedede" />
                                                                                <dx:GridViewDataComboBoxColumn FieldName="ID_Role" Caption="Role" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#dedede">
                                                                                    <PropertiesComboBox DataSourceID="SqlRole" TextField="Description" ValueField="ID_Role" />
                                                                                </dx:GridViewDataComboBoxColumn>

                                                                                <dx:GridViewDataTextColumn Caption="Assignation" Width="40%" Visible="True" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#dedede" />
                                                                            </Columns>
                                                                            <Settings ShowFilterRow="true" ShowFilterRowMenu="true" ShowGroupPanel="true" ShowFooter="true" />
                                                                            <Settings ShowFooter="true" VerticalScrollableHeight="200" VerticalScrollBarMode="Visible" />

                                                                            <SettingsPager>
                                                                                <PageSizeItemSettings Visible="true" Items="10, 20, 50" />
                                                                            </SettingsPager>
                                                                        </dx:ASPxGridView>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                        </Items>
                                                    </dx:ASPxFormLayout>
                                                </dx:ContentControl>
                                            </ContentCollection>
                                        </dx:TabPage>
                                    </TabPages>
                                </dx:ASPxPageControl>

                            </dx:SplitterContentControl>
                        </ContentCollection>
                    </dx:SplitterPane>
                </Panes>
            </dx:ASPxSplitter>

            <asp:SqlDataSource ID="SqlRole" runat="server"
                ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
                SelectCommand="SelectRole" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlRessources" runat="server"
                ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
                SelectCommand="User_session_GetByIdRole" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter Name="ID_Role" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlRC" runat="server"
                ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
                SelectCommand="GetByRole" SelectCommandType="StoredProcedure"
                UpdateCommand="Role_Controle_UpdateEtatC" UpdateCommandType="StoredProcedure" OnSelecting="SqlRC_Selecting">
                <UpdateParameters>
                    <asp:Parameter Name="ID_Controle" />
                    <asp:Parameter Name="Etat" />
                    <asp:ControlParameter ControlID="txtRole" Name="ID_Role" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:Parameter Name="ID_Role" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlRessources1" runat="server"
                ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
                SelectCommand="SelectUsersession" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlEmployes" runat="server"
                ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
                SelectCommand="SelectEmployes" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

            <dx:ASPxTextBox ID="txtRole" ClientInstanceName="txtRole" Text="1" runat="server" Width="100%"></dx:ASPxTextBox>
        </div>
    </form>
</body>
</html>
