<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TechnicalDataMenu.aspx.cs" Inherits="TechnicalDataMenu" %>

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

                function PaneCollPage() {
                    var selectedItemName = nbMain.GetSelectedItem().name;
                    splitter.GetPaneByName('ContentUrlPane').SetContentUrl(selectedItemName);
                }

                function test() {
                    var selectedItemName = nbMain.GetSelectedItem().name;

                }
                function splitter_Init() {

                    var popup = window.parent;
                    popup.window['splitter'] = splitter;
                }

              </script>

            <dx:ASPxSplitter ID="splitter" ClientInstanceName="splitter" runat="server" FullscreenMode="true" Theme="Office365" Width="100%">
                <ClientSideEvents Init="splitter_Init" PaneCollapsed="PaneCollPage" PaneExpanded="PaneCollPage" />
                <Panes>
                    <dx:SplitterPane Size="400px" Collapsed="false" ShowCollapseBackwardButton="True" Name="paneMenu">
                        <ContentCollection>
                            <dx:SplitterContentControl runat="server">

                                <dx:ASPxNavBar ID="navBarSettings" ClientInstanceName="NavBar" runat="server" AllowSelectItem="True" Target="contentUrlPane" Width="100%" Theme="Office365"
                                    EnableAnimation="true">



                                    <Groups>
                                        <dx:NavBarGroup Name="navBarGrpTechnicalData" Expanded="true" Text="Donnée technique">
                                            <HeaderImage IconID="actions_viewsetting_16x16devav">
                                            </HeaderImage>
                                            <Items>
                                                <dx:NavBarItem Name="HF_Gen" NavigateUrl="Gender.aspx" Text="Sexe" ClientVisible="true">
                                                    <Image IconID="iconbuilder_security_personalid_svg_dark_32x32">
                                                    </Image>
                                                </dx:NavBarItem>
                                                <dx:NavBarItem Name="LargFonction" Text="Fonction" ClientVisible="true"
                                                    NavigateUrl="Fonction.aspx">
                                                    <Image IconID="functionlibrary_morefunctions_32x32" />
                                                </dx:NavBarItem>
                                                <dx:NavBarItem Name="Dep" Text="Departement" ClientVisible="true"
                                                    NavigateUrl="Departement.aspx">
                                                    <Image IconID="businessobjects_bodepartment_32x32" Height="32px" Width="32px" />
                                                </dx:NavBarItem>
                                                <dx:NavBarItem Name="TC" Text="Type de contrat" ClientVisible="true"
                                                    NavigateUrl="Type_Contrat.aspx">
                                                    <Image IconID="businessobjects_bo_contract_svg_dark_32x32" Height="32px" Width="32px" />
                                                </dx:NavBarItem>
                                               

                                            </Items>
                                        </dx:NavBarGroup>
                                    </Groups>

                                    <LoadingPanelImage Url="~/App_Themes/Glass/Web/Loading.gif"></LoadingPanelImage>

                                </dx:ASPxNavBar>


                            </dx:SplitterContentControl>
                        </ContentCollection>
                    </dx:SplitterPane>
                    <dx:SplitterPane Name="ContentUrlPane" ScrollBars="Auto" ContentUrlIFrameName="contentUrlPane" ContentUrl="Gender.aspx">
                        <ContentCollection>
                            <dx:SplitterContentControl ID="splContentCtrlSettings" runat="server">
                            </dx:SplitterContentControl>
                        </ContentCollection>
                    </dx:SplitterPane>
                </Panes>
            </dx:ASPxSplitter>
        </div>
    </form>
</body>
</html>
