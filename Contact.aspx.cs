using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static DevExpress.DataProcessing.InMemoryDataProcessor.AddSurrogateOperationAlgorithm;
using static DevExpress.Pdf.Native.BouncyCastle.Asn1.X509.Target;

public partial class Contact : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["error"] == "1")
            {
                lblError.Text = "Matricule ou mot de passe incorrects";
                lblError.Visible = true;
            }
        }
    }

    protected void btnValidation_Click(object sender, EventArgs e)
    {
        DataLayerExperienceDataContext Layer = new DataLayerExperienceDataContext();



        var req = (from p in Layer.Usersession
                   where p.Login == Textlogin.Text & p.Password == Textmdp.Text
                   select p).ToList();


        if ((req.Count > 0))
        {
            Page.Session["matricule"] = req[0].Login;
            Page.Session["UtilisateurSession"] = req[0].Nom_Prenom;
            Page.Session["ID_Role"] = req[0].ID_Role;
            Page.Session["RessourcesId"] = req[0].ID;

            Page.Response.Redirect("Default.aspx?ModuleID=10");
        }
        else
        {
            Response.Redirect("Contact.aspx?error=1");

            //Page.Response.Redirect("Contact.aspx");
        }
    }

    protected void btnOublier_Click(object sender, EventArgs e)
    {

    }



    protected void CallbackContact_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        var login = txtLogin.Text.Trim();
        var sessionKey = "EmailSentTimeFor_" + login;

        if (string.IsNullOrEmpty(login))
        {
            CallbackContact.JSProperties["cp_Insert"] = "LoginEmpty";
            return;
        }

        if (e.Parameter == "GenerateCode")
        {
            if (Session[sessionKey] != null)
            {
                DateTime lastSent = (DateTime)Session[sessionKey];
                if ((DateTime.Now - lastSent).TotalMinutes < 1) // less than 1 minute since last send
                {
                    CallbackContact.JSProperties["cp_Insert"] = "AlreadySentRecently";
                    return;
                }
            }

            txtCode.Text = GenerateVerificationCode();
            var CodeValidation = txtCode.Text;
            SendValidation(login, CodeValidation);

            Session[sessionKey] = DateTime.Now;

            CallbackContact.JSProperties["cp_Insert"] = "Insert"; // Code generated and sent
        }
        else if (e.Parameter == "ValidateCode")
        {
            var CodeValidation = txtCode.Text;
            var VerifCode = txtCodeValidation.Text;

            if (VerifCode == CodeValidation)
            {
                string newPassword = GenerateNewPassword(12);
                txtNEWPWDD.Text = newPassword;

                // TODO: Send the new password by email or other secure means
                DataLayerExperienceDataContext layers = new DataLayerExperienceDataContext();

                layers.UpdateUserPassword(
                   login, newPassword
                );

                SendNewPassword(login, newPassword);



                CallbackContact.JSProperties["cp_Insert"] = "NewPwdDONE";
                CallbackContact.JSProperties["cp_NewPwdValue"] = newPassword;
            }
            else
            {
                CallbackContact.JSProperties["cp_Insert"] = "CodeInvalid";
            }
        }
    }

    public static void SendNewPassword(string login, string newPassword)
    {
        try
        {
            var fromAddress = new System.Net.Mail.MailAddress("stagecontacte@gmail.com");
            var fromPassword = "sadmvhruniohasrh";

            DataLayerExperienceDataContext layer = new DataLayerExperienceDataContext();
            var user = (from x in layer.Usersession
                        where x.Login == login
                        select x).SingleOrDefault();

            if (user == null || string.IsNullOrEmpty(user.Email))
            {
                // User not found or email missing
                return;
            }

            var toAddress = new System.Net.Mail.MailAddress(user.Email);
            string subject = "Votre nouveau mot de passe";
            string userName = user.Nom_Prenom;

            var bodyUser = new HtmlString(string.Format(
                "<table style=\"font-family: Tahoma; width: 100%; max-width: 600px; margin: auto; border-collapse: collapse; border: 1px solid #ddd;\">" +
                "    <tbody>" +
                "        <tr>" +
                "            <td style=\"width: 30%; background-color: #990000; color: #FFFFFF; text-align: center; font-size: 20px; padding: 10px;\">" +
                "                EPPM" +
                "            </td>" +
                "            <td style=\"width: 70%; background-color: #006699; color: #FFFFFF; text-align: center; font-size: 20px; padding: 10px;\">" +
                "                Nouveau mot de passe" +
                "            </td>" +
                "        </tr>" +
                "        <tr>" +
                "            <td colspan=\"2\" style=\"padding: 20px; font-size: 14px; color: #333;\">" +
                "                <p style=\"margin: 0;\"><strong>Bonjour {0},</strong></p>" +
                "                <p style=\"margin: 10px 0;\">" +
                "                    Votre nouveau mot de passe temporaire est :" +
                "                </p>" +
                "                <div style=\"background-color: #f9f9f9; border: 1px solid #ddd; border-radius: 5px; padding: 15px; margin: 10px 0; text-align: center;\">" +
                "                    <p style=\"margin: 5px 0; font-size: 24px; font-weight: bold; color: #007700;\">{1}</p>" +
                "                </div>" +
                "                <p style=\"margin: 10px 0;\">" +
                "                    Merci de vous connecter et de changer ce mot de passe dès que possible pour garantir la sécurité de votre compte." +
                "                </p>" +
                "                <p style=\"margin: 20px 0 0;\">Cordialement,</p>" +
                "                <p style=\"margin: 5px 0; font-weight: bold;\">L'équipe EPPM</p>" +
                "                <p style=\"margin: 5px 0;\">" +
                "                    <a href=\"http://localhost:90/Contact\" style=\"color: #006699; text-decoration: none; font-weight: bold;\">EPPM</a>" +
                "                </p>" +
                "            </td>" +
                "        </tr>" +
                "    </tbody>" +
                "</table>",
                userName, newPassword));

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
            {
                smtp.Send(message);
            }
        }
        catch (Exception ex)
        {
            // Log or handle exception as needed
        }
    }

    //2protected void CallbackContact_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    //{
    //    var login = txtLogin.Text;
    //    var sessionKey = "EmailSentTimeFor_" + login;
    //    var step = e.Parameter; // to distinguish the steps

    //    if (step == "GenerateCode")
    //    {
    //        // Throttle sending email code
    //        if (Session[sessionKey] != null)
    //        {
    //            DateTime lastSent = (DateTime)Session[sessionKey];
    //            if ((DateTime.Now - lastSent).TotalMinutes < 1)
    //            {
    //                CallbackContact.JSProperties["cp_Insert"] = "AlreadySentRecently";
    //                return;
    //            }
    //        }
    //        var code = GenerateVerificationCode();
    //        txtCode.Text = code;
    //        // TODO: Send code by email here: SendValidation(login, code);
    //        //SendValidation(login, code);


    //        Session[sessionKey] = DateTime.Now;
    //        Session["VerificationCodeFor_" + login] = code; // store code to verify later

    //        CallbackContact.JSProperties["cp_Insert"] = "Insert";
    //    }
    //    else if (step == "ValidateCode")
    //    {
    //        var inputCode = txtCodeValidation.Text;
    //        var storedCode = Session["VerificationCodeFor_" + login] as string;

    //        if (inputCode == storedCode)
    //        {
    //            string newPassword = GenerateNewPassword(12);
    //            txtNEWPWDD.Text = newPassword;

    //            // TODO: Save new password to DB & send it by email or show to user

    //            CallbackContact.JSProperties["cp_Insert"] = "NewPwdDONE";
    //        }
    //        else
    //        {
    //            CallbackContact.JSProperties["cp_Insert"] = "CodeInvalid";
    //        }
    //    }
    //}


    private string GenerateNewPassword(int length = 12)
    {
        const string validChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+";
        var password = new char[length];
        using (var rng = RandomNumberGenerator.Create())
        {
            byte[] uintBuffer = new byte[sizeof(uint)];

            for (int i = 0; i < length; i++)
            {
                rng.GetBytes(uintBuffer);
                uint num = BitConverter.ToUInt32(uintBuffer, 0);
                password[i] = validChars[(int)(num % (uint)validChars.Length)];
            }
        }
        return new string(password);
    }


    private string GenerateVerificationCode()
    {
        const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        var random = new Random();
        return new string(Enumerable.Repeat(chars, 6)
            .Select(s => s[random.Next(s.Length)]).ToArray());
    }

    public static void SendValidation(string login, string validationCode)
    {
        try
        {
            var fromAddress = new System.Net.Mail.MailAddress("stagecontacte@gmail.com");
            var fromPassword = "sadmvhruniohasrh";

            DataLayerExperienceDataContext layer = new DataLayerExperienceDataContext();
            var user = (from x in layer.Usersession
                        where x.Login == login
                        select x).SingleOrDefault();

            if (user == null || string.IsNullOrEmpty(user.Email))
            {
                // Utilisateur introuvable ou email manquant
                return;
            }

            var toAddress = new System.Net.Mail.MailAddress(user.Email);
            string subject = "Code de validation EPPM";
            string userName = user.Nom_Prenom;

            var bodyUser = new HtmlString(string.Format(
                "<table style=\"font-family: Tahoma; width: 100%; max-width: 600px; margin: auto; border-collapse: collapse; border: 1px solid #ddd;\">" +
                "    <tbody>" +
                "        <tr>" +
                "            <td style=\"width: 30%; background-color: #990000; color: #FFFFFF; text-align: center; font-size: 20px; padding: 10px;\">" +
                "                EPPM" +
                "            </td>" +
                "            <td style=\"width: 70%; background-color: #006699; color: #FFFFFF; text-align: center; font-size: 20px; padding: 10px;\">" +
                "                Code de validation" +
                "            </td>" +
                "        </tr>" +
                "        <tr>" +
                "            <td colspan=\"2\" style=\"padding: 20px; font-size: 14px; color: #333;\">" +
                "                <p style=\"margin: 0;\"><strong>Bonjour {0},</strong></p>" +
                "                <p style=\"margin: 10px 0;\">" +
                "                    Voici votre code de validation pour accéder à votre compte :" +
                "                </p>" +
                "                <div style=\"background-color: #f9f9f9; border: 1px solid #ddd; border-radius: 5px; padding: 15px; margin: 10px 0; text-align: center;\">" +
                "                    <p style=\"margin: 5px 0; font-size: 24px; font-weight: bold; color: #007700;\">{1}</p>" +
                "                </div>" +
                "                <p style=\"margin: 10px 0;\">" +
                "                    Ce code est valable pour une seule utilisation. Ne le partagez pas avec d'autres personnes." +
                "                </p>" +
                "                <p style=\"margin: 20px 0 0;\">Cordialement,</p>" +
                "                <p style=\"margin: 5px 0; font-weight: bold;\">L'équipe EPPM</p>" +
                "                <p style=\"margin: 5px 0;\">" +
                "                    <a href=\"http://localhost:90/Contact\" style=\"color: #006699; text-decoration: none; font-weight: bold;\">EPPM</a>" +
                "                </p>" +
                "            </td>" +
                "        </tr>" +
                "    </tbody>" +
                "</table>",
                userName, validationCode));

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
            {
                smtp.Send(message);
            }
        }
        catch (Exception ex)
        {
            // Log or handle exception as needed
        }
    }


}