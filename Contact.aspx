<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <link href="Theme/Register.css" rel="stylesheet" />

    <style>
        .dnnPrimaryAction {
            border-width: 1px;
            border-style: solid;
            border-color: #187cc2;
            border-radius: 6px;
            background-color: #187cc2;
            color: #ffffff !important;
        }

        .TdRegister {
            width: 2%;
        }

        .card-container.card {
            max-width: 50%;
            min-width: 500px;
        }

        .card-containerFor.card {
            max-width: 100%;
            min-width: 300px;
        }


        .img-shell {
            height: 100%;
        }

        @media only screen and (max-width: 479px) and (max-width: 990px) {
            .img-shell {
                height: 50%;
            }
        }


        @media only screen and (min-width: 991px) and (max-width: 1399px) {
            .img-shell {
                height: 100%;
            }
        }

        @media only screen and (min-width: 1400px) {
            .img-shell {
                height: 100%;
            }

            .card-container.card {
                max-width: 600px;
                min-width: 300px;
            }
        }

        .caption {
            vertical-align: middle;
            width: 100px;
        }

        .editor {
            vertical-align: middle;
            width: 100%;
            margin-bottom: 5%;
        }

        [class^="dxeCaption"] {
            font-weight: normal;
            color: rgba(164, 164, 164, 0.9);
        }
    </style>


    <script type="text/javascript">


        function callchange() {
            if (ASPxClientEdit.ValidateGroup('softic'))
                CallbackChangePass.PerformCallback();
        }

        function ValidationChangePassCallback(s, e) {
            var errPoin = s.cp_Inser;

            if (errPoin == 'add') {

                labelError.SetText('Password changed.');
                popupValidation.Show();


            }
            if (errPoin == 'Error') {
                labelError.SetText('Password change failed. Please re-enter your values and try again.');
                popupValidation.Show();

            }
        }

        function ValidationForcedPassw(s, e) {
            CallbackDate.PerformCallback();
        }
        function ValidationOldPassw(s, e) {
            CallbackDateOLD.PerformCallback();
        }
        function ValidationminPassw(s, e) {
            // CallbackMin.PerformCallback();

            if (PasswordTextbox.GetText() == txtOldPassword.GetText()) {
                e.isValid = false;
                e.errorText = "please choose a password that you haven't used before";
                //PasswordTextbox.SetIsValid(false);
                //PasswordTextbox.SetErrorText("please choose a password that you haven't used before");
            }

            else {
                //PasswordTextbox.SetIsValid(true);
                // e.isValid = true;
            }
        }

        function ValidationCallback(s, e) {
            var str = e.result;

            if (str != " ") {

                txtSession.SetIsValid(false);
                txtSession.SetErrorText(str);
            }

            else {
                txtSession.SetIsValid(true);
            }

        }

        function ValidationOLDCallback(s, e) {


            var str = e.result;

            //alert(str);

            if (str == "false") {

                txtOldPassword.SetIsValid(false);
                txtOldPassword.SetErrorText('Please verify your password  !!');
            }

            else {
                txtOldPassword.SetIsValid(true);
            }

        }
        function ValidationminLCallback(s, e) {


            var str = e.result;

            if (str == "Error") {

                PasswordTextbox.SetIsValid(false);
                PasswordTextbox.SetErrorText("please choose a password that you haven't used before");
            }

            else {
                PasswordTextbox.SetIsValid(true);
            }

        }


        function ValidationOublier() {
            PopupOublieretape.Show();
        }


        function fermerPopupOublierdeuxiemeetape() {
            PopupOublierDeuxiemeEtape.Hide();
        }

        function fermerPopupOublieretape1() {
            PopupOublieretape.Hide();
        }

        function FermerPopupNewPwd() {
            PopupNewPwd.Hide();
        }


        function CallabGenerCode() {
            CallbackContact.PerformCallback("GenerateCode");
            PopupOublierDeuxiemeEtape.Show();

        }

        function ValidationCode() {
            CallbackContact.PerformCallback("ValidateCode");
            // Do NOT show PopupNewPwd here — wait for server response
        }
        function EndCallContact(s, e) {
            var result = s.cp_Insert;

            switch (result) {
                case "LoginEmpty":
                    alert("Veuillez entrer votre login.");
                    break;

                case "AlreadySentRecently":
                    alert("Un code vient d'être envoyé, veuillez patienter une minute.");
                    break;

                case "Insert":
                    PopupOublieretape.Hide();
                    PopupOublierDeuxiemeEtape.Show();
                    break;

                case "NewPwdDONE":
                    var newPwd = s.cp_NewPwdValue;
                    txtNEWPWDD.SetText(newPwd);
                    PopupOublierDeuxiemeEtape.Hide();
                    PopupNewPwd.Show();
                    break;

                case "CodeInvalid":
                    alert("Code de validation invalide, veuillez réessayer.");
                    break;

                default:
                    break;
            }
        }






    </script>

    <div style="width: 100%; margin-top: 50px;">








        <div class="card card-container">
            <table>
                <tr>
                    <td height="80px" colspan="2"></td>
                </tr>
            </table>
            <table width="100%" align="center" style="flex-grow: 1; flex-shrink: 1; border: groove; height: 1px;">
                <tr>
                    <td height="30px" colspan="2"></td>
                </tr>
                <tr>
                    <td align="center" colspan="2">

                        <dx:ASPxImage runat="server" ID="imgPass" ClientInstanceName="imgPass" Width="150px" Height="150px" ImageUrl="~/image/secure.png">
                        </dx:ASPxImage>

                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <div style="font-size: 20px; font-family: Exo; color: #292929;">
                            Identification
                        </div>
                    </td>

                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <div style="color: rgba(var(--f52,153,153,153),1); font-size: 14px; line-height: 18px; margin: -3px 0 -4px;">
                        </div>
                    </td>

                </tr>
                <tr>
                    <td height="30px" colspan="2"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">

                        <dx:ASPxTextBox ID="Textlogin" ClientInstanceName="Textlogin" runat="server" NullText="Matricule"
                            Height="45px" Width="400px" Font-Bold="false" Theme="iOS">
                            <ValidationSettings ErrorTextPosition="Bottom" ErrorDisplayMode="Text" Display="Static" SetFocusOnError="true" ValidationGroup="softic">
                                <RequiredField IsRequired="True" ErrorText="*Veuillez entrer votre matricule" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>

                    </td>
                </tr>

                <tr>
                    <td height="5px" colspan="2"></td>
                </tr>




                <tr>
                    <td colspan="2" align="center">
                        <dx:ASPxTextBox ID="Textmdp" ClientInstanceName="Textmdp" Password="true" runat="server" NullText="Mot de passe"
                            Height="45px" Width="400px" Font-Bold="false" Theme="iOS">
                            <ValidationSettings ErrorTextPosition="Bottom" ErrorDisplayMode="Text" Display="Static" SetFocusOnError="true" ValidationGroup="softic">
                                <RequiredField IsRequired="True" ErrorText="*Veuillez entrer votre mot de passe" />
                            </ValidationSettings>

                        </dx:ASPxTextBox>


                    </td>

                </tr>


                <tr>
                    <td height="20px" colspan="2"></td>
                </tr>
                <tr>
                    <td align="center" colspan="2" border-radius="6px">
                        <dx:ASPxButton ID="btnOK" ClientInstanceName="btnOK" Text="Connexion" Font-Bold="True" ForeColor="black" BackColor="#187cc2" runat="server" Theme="material" OnClick="btnValidation_Click"
                            AutoPostBack="false" Width="400px" Height="50px" ValidationGroup="softic" Font-Overline="False" Font-Size="Large">
                        </dx:ASPxButton>


                    </td>

                </tr>


                <tr>
                    <td align="center" colspan="2" border-radius="6px">

                        <dx:ASPxLabel ID="lblError" ClientInstanceName="lblError" runat="server" Font-Bold="True" ForeColor="red">
                        </dx:ASPxLabel>

                    </td>
                </tr>

                <tr>
                    <td height="50px" colspan="2"></td>
                </tr>
                <tr>
                    <td align="center" colspan="2" border-radius="6px">
                        <a href="javascript:void(0);" onclick="ValidationOublier()">Mot de passe oublié ? </a>


                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2"></td>

                </tr>
                <tr>
                    <td height="10px" colspan="2"></td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Label ID="Msg" ForeColor="maroon" runat="server" />

                    </td>
                </tr>

            </table>
        </div>
    </div>

    <dx:ASPxPopupControl ID="PopupOublieretape" ClientInstanceName="PopupOublieretape" ShowCloseButton="true" ShowHeader="true"
        HeaderText="Mot de passe oublié" Width="450px" PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter" runat="server" Theme="Metropolis">
        <ContentCollection>
            <dx:PopupControlContentControl>
                <div style="display: flex; flex-direction: column; align-items: center; gap: 15px;">
                    <dx:ASPxLabel ID="lblInfo" runat="server" Text="Veuillez entrer votre login:" Theme="Metropolis" Font-Size="Large" CssClass="header-label"></dx:ASPxLabel>

                    <dx:ASPxTextBox ID="txtLogin" ClientInstanceName="txtLogin" runat="server" Caption="Matricule" Theme="Metropolis" Height="20px" Width="100%">
                        <ValidationSettings RequiredField-IsRequired="true" Display="Dynamic" ErrorText="Entrez votre mot de passe!" ValidationGroup="eppm" ErrorDisplayMode="Text" />
                    </dx:ASPxTextBox>

                    <div style="display: flex; gap: 10px; justify-content: center;">

                        <dx:ASPxButton ID="btnFermer" runat="server" Width="120px" ClientInstanceName="btnFermer" Text="Fermer" Theme="Metropolis">
                            <ClientSideEvents Click="fermerPopupOublieretape1" />
                        </dx:ASPxButton>
                        <dx:ASPxButton ID="btnNext" ClientInstanceName="btnNext" runat="server" Text="Suivant" Theme="Metropolis" Width="120px" Height="40px" AutoPostBack="false">
                            <ClientSideEvents Click="CallabGenerCode" />
                            <Image IconID="outlookinspired_icon_pagenext_svg_16x16"></Image>

                        </dx:ASPxButton>
                    </div>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxPopupControl ID="PopupNewPwd" ClientInstanceName="PopupNewPwd" ShowCloseButton="true" ShowHeader="false"
        HeaderText="Demander un code de validation" Width="450px" PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter" runat="server" Theme="Metropolis">
        <ContentCollection>
            <dx:PopupControlContentControl>
                <div style="display: flex; flex-direction: column; align-items: center; gap: 15px;">
                    <dx:ASPxLabel ID="lblInfooo" runat="server" Text="Un nouveau mot de passe a été envoyé à votre email" Theme="Metropolis" Font-Size="Large" CssClass="header-label"></dx:ASPxLabel>

                    <dx:ASPxLabel ID="txtLoginnn" ClientInstanceName="txtLoginnn" runat="server"  Theme="Metropolis" Width="100%">
                    </dx:ASPxLabel>

                    <div style="display: flex; gap: 10px; justify-content: center;">

                        <dx:ASPxButton ID="ASPxButton1" ClientInstanceName="btnOK" runat="server" Text="OK" Width="120px" Height="40px" Theme="MetropolisBlue" AutoPostBack="false" >
                            <ClientSideEvents Click="FermerPopupNewPwd" />
                            <Image IconID="outlookinspired_markcomplete_svg_16x16"></Image>

                        </dx:ASPxButton>
                    </div>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxPopupControl ID="PopupOublierDeuxiemeEtape" ClientInstanceName="PopupOublierDeuxiemeEtape" ShowCloseButton="true" ShowHeader="false"
        HeaderText="Demander un code de validation" Width="450px" PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter" runat="server" Theme="Metropolis">
        <ContentCollection>
            <dx:PopupControlContentControl>
                <div style="display: flex; flex-direction: column; align-items: center; gap: 15px;">
                    <dx:ASPxLabel ID="lblInfoo" runat="server" Text="Veuillez entrer le code envoyé sur votre email:" Theme="Metropolis" Font-Size="Large" CssClass="header-label"></dx:ASPxLabel>

                    <dx:ASPxTextBox ID="txtCodeValidation" ClientInstanceName="txtCodeValidation" runat="server" Caption="Code envoyé" Theme="Metropolis" Width="100%">
                        <ValidationSettings RequiredField-IsRequired="true"  />
                    </dx:ASPxTextBox>

                    <div style="display: flex; gap: 10px; justify-content: center;">

                        <dx:ASPxButton ID="btnFermerr" runat="server" Width="120px" ClientInstanceName="btnFermer" Text="Fermer" Theme="Metropolis">
                            <ClientSideEvents Click="fermerPopupOublierdeuxiemeetape" />
                        </dx:ASPxButton>
                        <dx:ASPxButton ID="btnNextt" ClientInstanceName="btnNext" runat="server" Text="Suivant" Theme="Metropolis" Width="120px" Height="40px" AutoPostBack="false">
                            <ClientSideEvents Click="ValidationCode" />
                            <Image IconID="outlookinspired_icon_pagenext_svg_16x16"></Image>

                        </dx:ASPxButton>
                    </div>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>


    <dx:ASPxCallbackPanel ID="CallbackContact" runat="server" OnCallback="CallbackContact_Callback" ClientInstanceName="CallbackContact" Width="100%">
        <ClientSideEvents EndCallback="EndCallContact" />
        <PanelCollection>
            <dx:PanelContent ID="PanelContent3" runat="server">
                <dx:ASPxTextBox ID="txtCode" ClientInstanceName="txtCode" runat="server" Width="100%" Visible="false" ></dx:ASPxTextBox>
                <dx:ASPxTextBox ID="txtNEWPWDD" ClientInstanceName="txtNEWPWDD" runat="server" Width="100%" Visible="false" ></dx:ASPxTextBox>

            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>





</asp:Content>

