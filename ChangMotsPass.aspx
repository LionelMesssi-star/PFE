<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangMotsPass.aspx.cs" Inherits="ChangMotsPass" %>
<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

      <script type="text/javascript">


      function endCallMotsPass(s,e) {

          var errPoin = s.cp_Ress;

          lblErr.SetText(errPoin);
          PopupAlert.Show();
           

      }

      </script>
</head>
<body>
    <form id="form1" runat="server">
         <style>
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






    </script>

    <div style="width: 100%; margin-top: 50px;">
        <div class="card card-container">
            <table width="100%" align="center">

                <tr>
                    <td align="center" colspan="2">

                        <dx:ASPxImage runat="server" ID="imgPass" ClientInstanceName="imgPass" Width="100px" Height="100px" ImageUrl="~/image/secure.png">
                        </dx:ASPxImage>

                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <div style="font-size: 16px;">
                            <h4>Change Password</h4>
                        </div>
                    </td>

                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <div style="color: rgba(var(--f52,153,153,153),1); font-size: 14px; line-height: 18px; margin: -3px 0 -4px;">
                            Force Password Change .

                        </div>
                    </td>

                </tr>
                <tr>
                    <td height="30px" colspan="2"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">

                        <dx:ASPxTextBox ID="txtSession" ClientInstanceName="txtSession" runat="server" NullText="User Name" Enabled="false"
                            Height="40px" Width="400px">
                            <ClientSideEvents Validation="ValidationForcedPassw" />
                            <ValidationSettings Display="Dynamic" SetFocusOnError="True" ErrorTextPosition="Bottom" ValidationGroup="Care" EnableCustomValidation="true">
                                <RequiredField IsRequired="true" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>

                    </td>
                </tr>
                <tr>
                    <td height="10px" colspan="2"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">

                        <dx:ASPxTextBox ID="txtOldPassword" ClientInstanceName="txtOldPassword" runat="server" NullText="Old Password" Password="true"
                            Height="40px" Width="400px">
                            <ClientSideEvents Validation="ValidationOldPassw" />
                            <ValidationSettings Display="Static" SetFocusOnError="True" ErrorTextPosition="Bottom" ValidationGroup="Care" EnableCustomValidation="true">
                                <RequiredField IsRequired="true" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>

                    </td>
                </tr>
                <tr>
                    <td height="10px" colspan="2"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">

                        <dx:ASPxTextBox ID="PasswordTextbox" ClientInstanceName="PasswordTextbox" Password="true" runat="server" NullText="New Password"
                            Height="40px" Width="400px" >
                            <ClientSideEvents Validation="ValidationminPassw" />
                            <ValidationSettings ErrorTextPosition="Bottom" ErrorDisplayMode="Text" Display="Static" SetFocusOnError="true" ValidationGroup="softic">
                                <RequiredField IsRequired="True" ErrorText="The value is required" />
                                <RegularExpression ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&](?:([\w\d+-_*?!:;])\2?(?!\1)){8,}" ErrorText="Password does not meet the minimum criteria!!" />
                            </ValidationSettings>
                            <HelpTextSettings HorizontalAlign="Center" >
                               
                            </HelpTextSettings>
                        </dx:ASPxTextBox>

                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2" align="center" style="font-size:12px;color:darkgray">
                       <div>
                           New Password needs to contain: Min 8 caracters,<br /> Upper case, Lower case, Numeric, <br />
                           Special Caracter (%, #, etc), No Consecutive caracters.
                       </div> 
                    </td>
                </tr>
              
                <tr>
                    <td colspan="2" align="center">
                        <dx:ASPxTextBox ID="PasswordConfirmTextbox" ClientInstanceName="PasswordConfirmTextbox" Password="true" runat="server" NullText="Confirm Password"
                            Height="40px" Width="400px" >
                             <ValidationSettings ErrorTextPosition="Bottom" ErrorDisplayMode="Text" Display="Static" SetFocusOnError="true" ValidationGroup="softic">
                                <RequiredField IsRequired="True" ErrorText="The value is required" />
                                <RegularExpression ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&](?:([\w\d+-_*?!:;])\2?(?!\1)){8,}" ErrorText="Password does not meet the minimum criteria!!" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                       
                        
                    </td>
                    <td></td>

                </tr>


                <tr>
                    <td height="20px" colspan="2"></td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <dx:ASPxButton ID="btnOK" ClientInstanceName="btnOK" Text="Change Password" Font-Bold="True"     BackColor="#187cc2" runat="server"  Theme="Metropolis"
                            AutoPostBack="false" Width="400px" ValidationGroup="softic" Height="50px" Font-Overline="False" Font-Size="Large">
                            <ClientSideEvents Click="callchange" />
                        </dx:ASPxButton>



                    </td>
                </tr>

           

                <tr>
                    <td align="center">
                        <asp:Label ID="Msg" ForeColor="maroon" runat="server" />

                    </td>
                </tr>
            </table>
               <asp:RequiredFieldValidator ID="PasswordConfirmRequiredValidator" runat="server" ControlToValidate="PasswordConfirmTextbox" ForeColor="red"
                            Display="Static" ErrorMessage="Required" />
                        <asp:CompareValidator ID="PasswordConfirmCompareValidator" runat="server" ControlToValidate="PasswordConfirmTextbox" ForeColor="red" Font-Bold="false" Font-Size="8"
                            Display="Static" ControlToCompare="PasswordTextBox" 
                            ErrorMessage="Confirm password must match password." />
        </div>
    </div>

    <dx:ASPxPopupControl ID="popupValidation" runat="server" Theme="Metropolis" HeaderText="Notification" ClientInstanceName="popupValidation"
        PopupHorizontalAlign="WindowCenter" CloseAction="None" ShowCloseButton="false"
        PopupVerticalAlign="WindowCenter" Modal="True" Width="320px" Height="100px">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <table style="width: 100%">
                    <tr>
                        <td style="width: 100%; text-align: center">
                            <dx:ASPxLabel ID="labelError" runat="server" ClientInstanceName="labelError" Theme="Aqua" Width="100%">
                            </dx:ASPxLabel>
                        </td>
                    </tr>






                    <tr>
                        <td align="center">
                            <dx:ASPxButton ID="btnValidation" runat="server" AutoPostBack="False" Height="19px" Text="OK" Theme="Metropolis" Width="100px" OnClick="btnValidation_Click">
                            </dx:ASPxButton>
                        </td>
                    </tr>
                </table>
            </dx:PopupControlContentControl>
        </ContentCollection>

        <CloseButtonImage Height="17px" Width="17px" />

    </dx:ASPxPopupControl>

    <dx:ASPxCallback ID="CallbackChangePass" runat="server" ClientInstanceName="CallbackChangePass" OnCallback="CallbackChangePass_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {ValidationChangePassCallback(s, e)}" />
    </dx:ASPxCallback>
    <dx:ASPxCallback ID="CallbackDate" runat="server" ClientInstanceName="CallbackDate" OnCallback="CallbackDate_Callback">
        <ClientSideEvents CallbackComplete="ValidationCallback" />
    </dx:ASPxCallback>

    <dx:ASPxCallback ID="CallbackDateOLD" runat="server" ClientInstanceName="CallbackDateOLD" OnCallback="CallbackDateOLD_Callback">
        <ClientSideEvents CallbackComplete="ValidationOLDCallback" />
    </dx:ASPxCallback>

    <dx:ASPxCallback ID="CallbackMin" runat="server" ClientInstanceName="CallbackMin" OnCallback="CallbackMin_Callback">
        <ClientSideEvents CallbackComplete="ValidationminLCallback" />
    </dx:ASPxCallback>

   <%-- <div>
      <table widht="100%">
                        <tr>
                            <td width="180px">
                                <dx:ASPxLabel ID="LblMot" runat="server" Text="Nouveau Mot de passe">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="txtMotsPass" ClientInstanceName="txtMotsPass" Password="true" Theme="Glass" runat="server" Height="30px"
                                    Width="200px">
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                       <tr>
                           <td>
                               <br />
                           </td>
                       </tr>
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="LblCon" runat="server" Text="Confirmez le mot de passe">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="txtConfirMotsPass" ClientInstanceName="txtConfirMotsPass" Password="true"  Theme="Glass" runat="server" Width="200px" Height="30px">
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                    </table>
                    <table border="0" width="100%">
                    <tr>
                    <td>
                    <br /> <br /> <br />
                    </td>
                    </tr>
                        <tr>
                            <td align="right" width="80%">
                                <dx:ASPxButton ID="buttonOk" runat="server" Text="Ok" Width="100px" Theme="Glass"
                                    AutoPostBack="false">
                                    <ClientSideEvents Click="function(s, e) {

                                                       cpPopup.PerformCallback();

                                  }"></ClientSideEvents>
                                </dx:ASPxButton>
                            </td>
                            <td>
                                <dx:ASPxButton ID="ButtonAnnuler" runat="server" Text="Annuler" Width="100px" Theme="Glass"
                                    AutoPostBack="false">
                                    <ClientSideEvents Click="function(s, e) {
                                    
                                     parent.window.popupWind.Hide(); 
                                    
                                    }" />
                                </dx:ASPxButton>
                            </td>
                        </tr>
                    </table>
    </div>


    <dx:ASPxCallbackPanel ID="cpPopup" runat="server" ClientInstanceName="cpPopup" 
        oncallback="cpPopup_Callback"  >

       <ClientSideEvents EndCallback="endCallMotsPass" />
    </dx:ASPxCallbackPanel>

    <dx:ASPxPopupControl ID="PopupAlert" ClientInstanceName="PopupAlert"  AutoUpdatePosition="false"
            runat="server" Theme="Glass" Width="400px" HeaderText="Information"
            Modal="True"
            PopupHorizontalAlign="WindowCenter" 
            PopupVerticalAlign="WindowCenter">
            <HeaderImage Url="~/Image/Session.jpg" Width="25">
            </HeaderImage>
           
            <ContentCollection>
             <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">

             


              <table width="100%">
                                    <tr align="center">
                                    
                                    <td>
                                    <dx:ASPxLabel ID="lblErr" runat="server" ClientInstanceName="lblErr" ForeColor="Red" ></dx:ASPxLabel>
                                    </td>
                                    
                                    </tr>
                                    
                                    <tr>
                                        <td align="right">
                                            <dx:ASPxButton ID="ASPxButton14" runat="server" Text="Fermer" Width="100%" AutoPostBack="False"
                                                Theme="Glass">
                                                <ClientSideEvents Click="function(s, e) {
                                                      parent.window.popupWind.Hide();  	
                                                   }"></ClientSideEvents>
                                            </dx:ASPxButton>
                                        </td>
                                    </tr>
                                </table>
             </dx:PopupControlContentControl>

            </ContentCollection>
        </dx:ASPxPopupControl>--%>


    </form>
</body>
</html>
