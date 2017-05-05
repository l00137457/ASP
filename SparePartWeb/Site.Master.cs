using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace SparePartWeb
{
    public partial class SiteMaster : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        public bool MenuVisibility
        {
            get { return mnuReports.Visible; }
            set { this.mnuReports.Visible = value; }
        }

        public bool SearchVisibility
        {
            get { return mnuSearch.Visible; }
            set { this.mnuSearch.Visible = value; }
        }

        public bool UserNameVisibility
        {
            get { return lblUsername.Visible; }
            set { this.lblUsername.Visible = value; }
        }

        public bool VendorsVisibility
        {
            get { return mnuVendors.Visible; }
            set { this.mnuVendors.Visible = value; }
        }

        public bool EquipmentVisibility
        {
            get { return mmuEquipment.Visible; }
            set { this.mmuEquipment.Visible = value; }
        }

        public bool StatisticsVisibility
        {
            get { return mnuStatistics.Visible; }
            set { this.mnuStatistics.Visible = value; }
        }

        public bool UpdatesVisibility
        {
            get { return mmuUpdates.Visible; }
            set { this.mmuUpdates.Visible = value; }
        }

        public string UserNameLabel
        {
            get { return lblUsername.Text; }
            set { this.lblUsername.Text = value; }
        }
        public bool WelcomeVisibility
        {
            get { return mnuWelcome.Visible; }
            set { this.mnuWelcome.Visible = value; }
        }

        public User currentuser;

        protected void Page_Init(object sender, EventArgs e)
        {
            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;

        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (currentuser != null)
            {
                lblUsername.Text = currentuser.Username;
            }

        }

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        }
    }

}