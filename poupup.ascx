<%@ Control Language="C#" AutoEventWireup="true" CodeFile="poupup.ascx.cs" Inherits="poupup" %>
<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<dx:ASPxPopupControl ID="popupWind" runat="server"  
    CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" HeaderText="Document"
     ClientInstanceName="popupWind" PopupHorizontalAlign="WindowCenter" CloseAction="CloseButton" PopupVerticalAlign="WindowCenter"
    Modal="true" EnableClientSideAPI="True" AllowDragging="True" EnableHierarchyRecreation="True"  ShowHeader="true" ShowCloseButton="true" ShowMaximizeButton="true" ShowPinButton="true"
     SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" Theme="Metropolis" ScrollBars="auto" MaxHeight="700px" RightToLeft="True">    
    <HeaderStyle>
    <Paddings PaddingLeft="10px" PaddingRight="6px" PaddingTop="1px" />
    
    </HeaderStyle>

    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl1" BackColor="#EDF3F4" runat="server">                
        </dx:PopupControlContentControl>
    </ContentCollection>
    <LoadingPanelImage Url="~/App_Themes/Glass/Web/Loading.gif">
    </LoadingPanelImage>
    <ClientSideEvents Closing="function(s, e) {
    popupWind.SetContentUrl('');
}"  />
</dx:ASPxPopupControl>