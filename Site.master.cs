using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : MasterPage
{
 
  

 
    protected void Page_Load(object sender, EventArgs e)
    {
        //If Request.QueryString("dc") IsNot Nothing Then
        //    Session("user_name") = ""
        //    Response.Redirect("Connexion.aspx")
        //Else
        //    Session("user_name") = CInt(Session("user_name"))
        //End If

        //if (Request.QueryString("dc") != null)
        //{
        //}



        if (Request.QueryString["dc"] == "")
        {

            Session["user_name"] = "";
            Response.Redirect("Contact.aspx");
        }
        else
        {

            Session["user_name"] = Convert.ToInt32(Session["user_name"]);

        }                           

        }


    }

   
