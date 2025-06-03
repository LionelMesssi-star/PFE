using DevExpress.Web;
using DevExpress.XtraCharts.Native;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.ServiceModel;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;

public partial class Ressource : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

     
    protected void GridCl_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
    {
        var choix = e.Parameters;

        var PeriodesDate = System.DateTime.Now.Date.ToString("yyyyMMdd");
        var PeriodesHeur = System.DateTime.Now.ToString("hhmmss");
        var IdUser = Convert.ToInt32(GridCl.GetRowValues(GridCl.FocusedRowIndex, "ID"));
        var Userlogin = GridCl.GetRowValues(GridCl.FocusedRowIndex, "Login").ToString();


        String password = "Eppm" + PeriodesDate + PeriodesHeur;
        // txtConfirmedPwd.Text;
        GridCl.JSProperties["cp_Update"] = "";

        if (choix == "Password")
        {


            DataLayerExperienceDataContext layer = new DataLayerExperienceDataContext();
            layer.updateUsersession1(IdUser, password);
            SendEmailChangPasswrd(Userlogin, password);
            GridCl.JSProperties["cp_Update"] = "UpdatePassword";
        }
        if (choix == "NewUser")
        {
            DataLayerExperienceDataContext layer = new DataLayerExperienceDataContext();


            var NomEtPrenom = txtNomPrenom.Text;
            var Email = txtEmail.Text;
            var Password = "Eppm" + PeriodesDate + PeriodesHeur;
            var Timenow = System.DateTime.Now.ToString("hhmmss");
            var Matricule = Page.Session["matricule"].ToString();


            var Logine = txtLogin.Text;

            var ID_Role = Convert.ToInt32(cmbRole.Value);
            var Role = cmbRole.Text;




            layer.insertUsersession(NomEtPrenom,  Logine, Email, Password, ID_Role);

            SendEmailNewUserNotification(Matricule, NomEtPrenom, Logine, Email, "", Role, "****");
            SendEmailNewUser(Matricule, NomEtPrenom, Logine, Email, "", Role, Password);
            

        }


        GridCl.DataBind();
    }


    public static void SendEmailChangPasswrd(string Matricule, string Passwrd)
    {
        try
        {
            var fromAddress = new System.Net.Mail.MailAddress("stagecontacte@gmail.com");
            var fromPassword = "sadmvhruniohasrh";



            DataLayerExperienceDataContext Layers = new DataLayerExperienceDataContext();
            var PD = (from x in Layers.Usersession
                      where x.Login == Matricule
                      select x).SingleOrDefault();

            var toAddress = new System.Net.Mail.MailAddress(PD.Email);

            string subject = "Alerte de sécurité";
            String Nom = PD.Nom_Prenom;


            var bodyUser = new HtmlString(string.Format("<table border='0' cellspacing='0' cellpadding='0' style='color: #222222; font-size: small; text-decoration-color: initial; max-width: 600px;'><tbody><tr><td><table bgcolor='#4184F3' width='100%' border='0' cellspacing='0' cellpadding='0' style='min-width: 332px; max-width: 600px; border-width: 1px 1px 0px; border-top-style: solid; border-right-style: solid; border-left-style: solid; border-top-color: #e0e0e0; border-right-color: #e0e0e0; border-left-color: #e0e0e0; border-bottom-color: initial; border-top-left-radius: 3px; border-top-right-radius: 3px;'><tbody><tr><td height='72px' colspan='3'>&nbsp;</td></tr><tr><td width='32px'>&nbsp;</td><td style='font-family: Roboto-Regular, Helvetica, Arial, sans-serif; font-size: 24px; color: #ffffff; line-height: 1.25;'>Code de validation Site Bilan Social</td><td width='32px'>&nbsp;</td></tr><tr><td height='18px' colspan='3'>&nbsp;</td></tr></tbody></table></td></tr><tr><td><table bgcolor='#FAFAFA' width='100%' border='0' cellspacing='0' cellpadding='0' style='min-width: 332px; max-width: 600px; border-width: 0px 1px 1px; border-right-style: solid; border-left-style: solid; border-right-color: #f0f0f0; border-left-color: #f0f0f0; border-bottom-style: solid; border-bottom-color: #c0c0c0; border-top-color: initial; border-bottom-left-radius: 3px; border-bottom-right-radius: 3px; width: 621px; height: 275px;'><tbody><tr><td width='32px' rowspan='3'>&nbsp;</td><td>&nbsp;</td><td width='32px' rowspan='3'>&nbsp;</td></tr><tr><td><span style='color: #500050;'></span><p>Cher utilisateur de site Bilan Social,</p><p>Nous avons reçu une demande d'accès à votre compte {0}&nbsp; envoyée avec&nbsp; administrateur de system . Votre code de validation Site Bilan Social est&nbsp;:</p><div style='text-align: center;'><p dir='ltr'><strong style='text-align: center; font-size: 24px;'>&nbsp;{1}&nbsp;</strong></p></div><span style='color: #500050;'></span><p>Si vous n'avez pas demandé à recevoir ce code, il est possible qu'un tiers essaie d'accéder au compte administrateur system .&nbsp;<strong>Ne transférez ce code à aucune autre personne.</strong></p><p>Cordialement,</p><p>L'équipe Comptes RH</p></td></tr></tbody></table></td></tr></tbody></table><br />", Nom, Passwrd));
            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,

                DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new System.Net.NetworkCredential(fromAddress.Address, fromPassword)
            };

            using (var message = new System.Net.Mail.MailMessage(fromAddress, toAddress)
            {
                Subject = subject,
                Body = bodyUser.ToString(),
                IsBodyHtml = true

            })

                smtp.Send(message);


        }
        catch (Exception ex)
        {

        }

    }

    public static void SendEmailNewUserNotification(string Matricule, string NomEtPrenom, string Login, string Email, string Telephone, string Role, string Passwrd)
    {
        try
        {
            var fromAddress = new System.Net.Mail.MailAddress("stagecontacte@gmail.com");
            var fromPassword = "sadmvhruniohasrh";

            DataLayerExperienceDataContext Layers = new DataLayerExperienceDataContext();
            var PD = (from x in Layers.Usersession
                      where x.Login == Matricule
                      select x).SingleOrDefault();

            var toAddress = new System.Net.Mail.MailAddress(PD.Email);

            string subject = "Nouveau compte " + NomEtPrenom;


            // var Nom = "";
            var NomNewUser = NomEtPrenom;
            var NomCreatePar = PD.Nom_Prenom;


            var bodyUser = new HtmlString(string.Format("<table style='font-family: Tahoma; width: 1568px; height: 386px;'><tbody><tr><td style='background-color: #990000; color: #ffffff; text-decoration: blink; font-size: large; font-family: Arial; text-align: center; font-weight: bold;'>EPPM</td><td style='background-color: #006699; color: #ffffff; font-size: large; font-family: Arial;'>&nbsp;Service intranet</td></tr><tr><td>&nbsp;</td><td style='font-size: 12px;'><div>Bonjour {0},</div><div> Nouveau compte a été crée avec succès par {0}.</div><p>Details employé:</p><table style='font-size: small; width: 339.844px; height: 136px;'><tbody><tr><td><span id='LblNometPrenomVal'>Nom et prénom&nbsp; :</span></td><td width='200px'>{1}<br /></td></tr><tr style='height:20px;'><td><span id='LbMatricule'>Login&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; :</span></td><td width='200px'>{2}<br /></td></tr><tr style='height: 20px;'><td><span id='LbSociété'>E-mail&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;:</span></td><td width='200px'>{3}<br /></td></tr><tr style='height: 20px;'><td><span id='LbUnité'>Téléphone&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;:</span></td><td width='200px'>{4}<br /></td></tr><tr style='height: 20px;'><td>Rôle&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :</td><td width='200px'>{5}<br /></td></tr><tr><td>Mot de passe&nbsp; &nbsp; &nbsp;:<br /></td><td width='200px'>{6}</td></tr></tbody></table><p><span style='font-size: 13px;'>Cliquez sur le lien suivant:&nbsp;</span><a href='http://localhost/'target='_blank' style='font-size: 13px;'>Gestion des Bilan Social</a><span style='font-size: 13px;'>&nbsp;pour la visualiser.</span><br />Merci</p><p><span style='font-size: 11px; font-weight: bold;'>Service Intranet,</span></p>    <div style='font-size: 11px;font-weight: bold;'><a href='http://www.eppm.com.tn/'>EPPM</a></div></td></tr><tr><td>&nbsp;</td><td style='font-weight: bold;'>&nbsp;</td></tr></tbody></table>", NomCreatePar, NomNewUser, Login, Email, Telephone, Role, Passwrd));
            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,

                DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new System.Net.NetworkCredential(fromAddress.Address, fromPassword)
            };

            using (var message = new System.Net.Mail.MailMessage(fromAddress, toAddress)
            {
                Subject = subject,
                Body = bodyUser.ToString(),
                IsBodyHtml = true

            })

                smtp.Send(message);


        }
        catch (Exception ex)
        {


        }

    }

    public static void SendEmailNewUser(string Matricule, string NomEtPrenom, string Login, string Email, string Telephone, string Id_Rôle, string Passwrd)
    {
        try
        {
            var fromAddress = new System.Net.Mail.MailAddress("stagecontacte@gmail.com");
            var fromPassword = "sadmvhruniohasrh";



            DataLayerExperienceDataContext Layers = new DataLayerExperienceDataContext();
            var PD = (from x in Layers.Usersession
                      where x.Login == Matricule
                      select x).SingleOrDefault();
            var toAddress = new System.Net.Mail.MailAddress(Email);

            string subject = "Nouveau compte";

            var NomNewUser = NomEtPrenom;
            var NomCreatePar = PD.Nom_Prenom; ;


            var bodyUser = new HtmlString(string.Format("<table style='font-family: Tahoma; width: 1754px; height: 386px;'><tbody><tr><td style='background-color: #990000; color: #ffffff; text-decoration: blink; font-size: large; font-family: Arial; text-align: center; font-weight: bold;'>EPPM</td><td style='background-color: #006699; color: #ffffff; font-size: large; font-family: Arial;'>&nbsp;Service intranet</td></tr><tr><td>&nbsp;</td><td style='font-size: 12px;'><p>&nbsp;<br />Bonjour<strong>&nbsp;{0},</strong><br />&nbsp;<br />Votre compte a été crée avec succès par {1}.<br /><br />Details employé:</p><table style='font-size: small; width: 339.844px; height: 136px;'><tbody><tr><td><span id='LblNometPrenomVal'>Nom et prénom&nbsp; :</span></td><td width='200px'>{0}<br /></td></tr><tr style='height:20px;'><td><span id='LbMatricule'>Login&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; :</span></td><td width='200px'>{2}<br /></td></tr><tr style='height: 20px;'><td><span id='LbSociété'>E-mail&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;:</span></td><td width='200px'>{3}<br /></td></tr><tr style='height: 20px;'><td><span id='LbUnité'>Téléphone&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;:</span></td><td width='200px'>{4}<br /></td></tr><tr style='height: 20px;'><td>Rôle&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; :</td><td width='200px'>{5}<br /></td></tr><tr><td>Mot de passe&nbsp; &nbsp; &nbsp;:<br /></td><td width='200px'>{6}</td></tr></tbody></table><p><span style='font-size: 13px;'>Cliquez sur le lien suivant:&nbsp;</span><a href='http://localhost/Contact' target='_blank' style='font-size: 13px;'>Gestion des A</a><span style='font-size: 13px;'>&nbsp;pour la visualiser.</span><br />Merci</p><p><span style='font-size: 11px; font-weight: bold;'>Service Intranet,</span></p>    <div style='font-size: 11px; font-weight: bold;'><a href='http://www.eppm.com.tn/'>EPPM</a></div></td></tr><tr><td>&nbsp;</td><td style='font-weight: bold;'>&nbsp;</td></tr></tbody></table>", NomNewUser, NomCreatePar, Login, Email, Telephone, Id_Rôle, Passwrd));
            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,

                DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new System.Net.NetworkCredential(fromAddress.Address, fromPassword)
            };

            using (var message = new System.Net.Mail.MailMessage(fromAddress, toAddress)
            {
                Subject = subject,
                Body = bodyUser.ToString(),
                IsBodyHtml = true

            })

                smtp.Send(message);


        }
        catch (Exception ex)
        {


        }

    }
}






