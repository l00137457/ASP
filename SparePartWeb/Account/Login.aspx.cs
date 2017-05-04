using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using SparePartWeb.Models;
using System.Linq;
using System.Web.UI.WebControls;


namespace SparePartWeb.Account
{
    public partial class Login : Page
    {
         Spare_Part_SystemEntities db = new Spare_Part_SystemEntities();
         User user = new User();
      

        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register";
            ((SiteMaster)this.Master).MenuVisibility = false;
            ((SiteMaster)this.Master).VendorsVisibility = false;
            ((SiteMaster)this.Master).EquipmentVisibility = false;
            ((SiteMaster)this.Master).StatisticsVisibility = false;
            ((SiteMaster)this.Master).UpdatesVisibility = false;            
            ((SiteMaster)this.Master).SearchVisibility = false;
            // Enable this once you have account confirmation enabled for password reset functionality
            //ForgotPasswordHyperLink.NavigateUrl = "Forgot";
            OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
        }
       
        protected void LogIn_Click(object sender, EventArgs e)
        {
            bool authenticated = false;
            var username = tbxUsername.Text;
            var password = tbxPassword.Text;
            foreach (var _user in db.Users.Where(t => t.Username == username && t.Password == password))
            {
                user = _user;
                authenticated = true;
                //break;
            }
            if (authenticated)
            {
                var accessLevel = user.AccessLevel;

                switch (accessLevel)
                {
                        //Display an employee menu
                    case 1:
                        ((SiteMaster)this.Master).UserNameVisibility = true;
                        ((SiteMaster)this.Master).UserNameLabel = this.user.Username.ToString();
                        ((SiteMaster)this.Master).currentuser = this.user;
                        ((SiteMaster)this.Master).MenuVisibility = true;
                        ((SiteMaster)this.Master).EquipmentVisibility = true;
                        ((SiteMaster)this.Master).SearchVisibility = true;
                        break;

                    case 2:
                        //Display a manager menu
                        ((SiteMaster)this.Master).UserNameVisibility = true;
                        ((SiteMaster)this.Master).UserNameLabel = this.user.Username.ToString();
                        ((SiteMaster)this.Master).currentuser = this.user;
                        ((SiteMaster)this.Master).MenuVisibility = true;
                        ((SiteMaster)this.Master).VendorsVisibility = true;
                        ((SiteMaster)this.Master).EquipmentVisibility = true;
                        ((SiteMaster)this.Master).StatisticsVisibility = true;              
                        ((SiteMaster)this.Master).SearchVisibility = true;
                        break;

                    case 3:
                        // Display an administrator menu
                        ((SiteMaster)this.Master).UserNameVisibility = true;
                        ((SiteMaster)this.Master).UserNameLabel = this.user.Username.ToString();
                        ((SiteMaster)this.Master).currentuser = this.user;
                        ((SiteMaster)this.Master).MenuVisibility = true;
                        ((SiteMaster)this.Master).UpdatesVisibility = true;
                        break;
                    default:
                        FailureText.Text = "Invalid Login attempt";
                        ErrorMessage.Visible = true;
                        break;                                                                                        
                }
                Label lblUser = this.Master.FindControl("lblUsername") as Label;
                lblUser.Text = user.Username.ToString();                                           
               // ((SiteMaster)this.Master).UserName = user.Username;
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);

            }
            else
            {
                FailureText.Text = "Invalid login attempt. Please check your user details and try again.";
                ErrorMessage.Visible = true;
            }
        
         }
    }
}