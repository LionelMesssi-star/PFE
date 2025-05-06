using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangMotsPass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CallbackChangePass_Callback(object source, DevExpress.Web.CallbackEventArgs e)
    {
        CallbackChangePass.JSProperties["cp_Inser"] = " ";
        var userName = txtSession.Text;

        // Update the password.

        //MembershipUser u = Membership.GetUser(userName);

        //try
        //{
        //    if (u.ChangePassword(u.GetPassword(), PasswordTextbox.Text))
        //    {
        //        CareDataContext Layer = new CareDataContext();
        //        Layer.UpdateTroubleLogging(userName);

        //        Msg.Text = "Password changed.";


        //        //if (Context.User.Identity.IsAuthenticated)
        //        //{
        //        //    try
        //        //    {
        //        //        Response.Redirect("~/");
        //        //    }
        //        //    catch (Exception)
        //        //    { }
        //        //}

        //        CallbackChangePass.JSProperties["cp_Inser"] = "add";

        //    }

        //    else
        //    {
        //        Msg.Text = "Password change failed. Please re-enter your values and try again.";
        //        CallbackChangePass.JSProperties["cp_Inser"] = "Error";
        //    }
        //}
        //catch (Exception ex)
        //{
        //    Msg.Text = "An exception occurred: " + Server.HtmlEncode(ex.Message) + ". Please re-enter your values and try again.";
        //    CallbackChangePass.JSProperties["cp_add"] = "add";
        //}
    }


    protected void CallbackDate_Callback(object source, DevExpress.Web.CallbackEventArgs e)
    {
        e.Result = " ";

        var typ = txtSession.Text;

        //if (typ.Contains("@"))
        //{
        //    CareDataContext Layer = new CareDataContext();

        //    var req = (from p in Layer.aspnet_Membership where p.Email.ToString() == typ.ToString() select p).ToList();

        //    if (req.Count() == 0)
        //    {
        //        e.Result = "Enter a valid e-mail address.";
        //    }
        //}
        //else
        //{
        //    MembershipUser usrInfo = Membership.GetUser(typ);

        //    if (usrInfo == null)
        //    {
        //        e.Result = "Enter a valid UserName.";
        //    }

        //}


    }


    protected void CallbackDateOLD_Callback(object source, DevExpress.Web.CallbackEventArgs e)
    {
        //if (Membership.ValidateUser(txtSession.Text, txtOldPassword.Text) == true)
        //{
        //    e.Result = "Good";
        //}
        //else
        //{
        //    e.Result = "false";

        //}
    }

    protected void CallbackMin_Callback(object source, DevExpress.Web.CallbackEventArgs e)
    {
        var sess = this.Request.QueryString["UserName"];
        var pass = PasswordTextbox.Text;




        //if (Membership.ValidateUser(txtSession.Text, pass) == true)
        //{
        //    e.Result = "Error";
        //}
        //else
        //{
        //    e.Result = "Good";

        //}








        //var passwordManager = new NetFourMembershipProvider();
        //var clearPWd = passwordManager.GetClearTextPassword(pass);
        ////   MembershipPasswordFormat.get
        //CareDataContext Layer = new CareDataContext();



    
        //var req = (from p in Layer.Get_ComparetPassword(sess, clearPWd)
        //           select p).ToList();


        //var user = Membership.GetUser(sess);
        //user.GetPassword();


        //if (req.Count() > 0)
        //{

        //     var Nbr = req[0].NBR;


        //    if ( Convert.ToInt32(Nbr) > 15)
        //    {

        //        e.Result = "accept Password";

        //    }
        //    else
        //    {
        //        e.Result = "<15";

        //    }



        //}
        //else
        //{

        //    e.Result = "accept Password";

        //}



        //else
        //{
        //   // MembershipUser usrInfo = Membership.GetUser(typ);

        //    if (usrInfo == null)
        //    {
        //        e.Result = "Enter a valid UserName.";
        //    }

        //}





    }



    //protected void cpPopup_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    //{
    //    DataLayerExperienceDataContext Layer = new DataLayerExperienceDataContext();

    //    var NPWRD = txtMotsPass.Text.ToString();
    //    var ConPWRD = txtConfirMotsPass.Text.ToString();

    //    if (NPWRD == ConPWRD)

    //    {

    //        //  Layer.BM_UpdatePassword(Session["mat"].ToString(), NPWRD.ToString()).ToString() ;
    //          cpPopup.JSProperties["cp_Ress"] = "Ajouté avec succes";

    //    }

    //    else if (NPWRD != ConPWRD)

    //    {

    //        cpPopup.JSProperties["cp_Ress"] = "Les mots de passe ne correspondent pas. Voulez-vous réessayer ?";

    //    }


    //}

    protected void btnValidation_Click(object sender, EventArgs e)
    {

    }
}