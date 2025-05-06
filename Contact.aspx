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






    </script>

    <div style="width: 100%; margin-top: 50px;">
        
        <div class="card card-container">
           <table>
               <tr>
                    <td height="80px" colspan="2"></td>
                </tr>
           </table>
             <table width="100%" align="center" style="flex-grow: 1; flex-shrink: 1; border:groove;  height: 1px;">
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
                        <div style="font-size: 20px;font-family: Exo;color:#292929;">
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

                        <dx:ASPxTextBox ID="Textlogin" ClientInstanceName="Textlogin" runat="server" NullText="Nom d'utilisateur" 
                            Height="40px" Width="400px">
                           
                        </dx:ASPxTextBox>

                    </td>
                </tr>

                <tr>
                    <td height="20px" colspan="2"></td>
                </tr>
                

               
               
                <tr>
                    <td colspan="2" align="center">
                        <dx:ASPxTextBox ID="Textmdp" ClientInstanceName="Textmdp" Password="true" runat="server" NullText="Mot de passe"
                            Height="40px" Width="400px" >
                         
                        </dx:ASPxTextBox>
                       
                       
                    </td>

                </tr>
                

                <tr>
                    <td height="20px" colspan="2"></td>
                </tr>
                <tr>
                    <td align="center" colspan="2"     border-radius="6px" >
                        <dx:ASPxButton ID="btnOK" ClientInstanceName="btnOK" Text="Connexion"   Font-Bold="True"     BackColor="#187cc2" runat="server"  Theme="Metropolis" OnClick="btnValidation_Click"
                            AutoPostBack="false" Width="400px"  Height="50px" ValidationGroup="softic" Font-Overline="False" Font-Size="Large" >
                            
                        </dx:ASPxButton>



                    </td>
                </tr>

                <tr>
                    <td height="100px" colspan="2"></td>
                </tr>

                <tr>
                    <td align="center" colspan="2">

                        



                    </td>

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

    

  
                         
                                
            
      


</asp:Content>
