using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using SparePartWeb.Models;
using SparePartWeb;

namespace SparePartWeb.Account
{
    public partial class Register : Page
    {
        Spare_Part_SystemEntities db = new Spare_Part_SystemEntities();
        protected void CreateNewUser_Click(object sender, EventArgs e)
        {

            User user = new User();
            var username = tbxUsername.Text;
            var password = tbxPassword.Text;
            var forename = tbxForename.Text;
            var surname = tbxSurname.Text;

            user.Username = username;
            user.Password = password;
            //user.Username = username;
            user.Forename = forename;
            user.Surname = surname;

            //Create the username automatically - optional
            // var forenameFirstLetter = tbxForename.Text.Substring(0, 1).ToLower();
            //var username = forenameFirstLetter + surname;
            bool exists = CheckIfExists(user);
            if (!exists)
            {
                bool updated = UpdateUserRecord(user, "Add");
                if (updated)
                {
                    IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                    var accessLevel = user.AccessLevel;
                    switch (accessLevel)
                    {
                        //Display an employee menu
                        case 1:
                            ((SiteMaster)this.Master).UserNameVisibility = true;
                            ((SiteMaster)this.Master).UserNameLabel = user.Username.ToString();
                            ((SiteMaster)this.Master).currentuser = user;
                            ((SiteMaster)this.Master).MenuVisibility = true;
                            ((SiteMaster)this.Master).EquipmentVisibility = true;
                            break;

                        case 2:
                            //Display a manager menu
                            ((SiteMaster)this.Master).UserNameVisibility = true;
                            ((SiteMaster)this.Master).UserNameLabel = user.Username.ToString();
                            ((SiteMaster)this.Master).currentuser = user;
                            ((SiteMaster)this.Master).MenuVisibility = true;
                            ((SiteMaster)this.Master).VendorsVisibility = true;
                            ((SiteMaster)this.Master).EquipmentVisibility = true;
                            ((SiteMaster)this.Master).StatisticsVisibility = true;
                            ((SiteMaster)this.Master).SearchVisibility = true;
                            break;

                        case 3:
                            // Display an administrator menu
                            ((SiteMaster)this.Master).UserNameVisibility = true;
                            ((SiteMaster)this.Master).UserNameLabel = user.Username.ToString();
                            ((SiteMaster)this.Master).currentuser = user;
                            ((SiteMaster)this.Master).MenuVisibility = true;
                            ((SiteMaster)this.Master).UpdatesVisibility = true;
                            break;
                    }
                }
                else
                {
                    ErrorMessage.Text = "Problem saving record to database";
                }
            }
            else
            {
                ErrorMessage.Text = "The user already exists.";
            }
        }

        private bool CheckIfExists(User user)
        {
            bool exists = false;
            try
            {
                foreach (var _user in db.Users.Where(t => t.Username == user.Username))
                {
                    exists = true;
                }
            }
            catch (Exception ex)
            {
                ErrorMessage.Text = "Problem checking if the user exists " + ex.InnerException;
            }
            return exists;
        }

        public bool UpdateUserRecord(User user, string entityState)
        {
            bool updated = false;
            try
            {
                if (entityState == "Add")
                {
                    if (user.Username != null && user.Password != null)
                    {
                        //Remove this line if using auto-increment in the database
                       // user.UserID = Guid.NewGuid().ToString();
                        db.Entry(user).State = System.Data.Entity.EntityState.Added;
                    }
                }
                if (entityState == "Modify")
                {
                    foreach (var _user in db.Users.Where(t => t.UserID == user.UserID))
                    {
                        _user.Username = user.Username;
                        _user.Password = user.Password;
                        _user.Forename = user.Forename;
                        _user.Surname = user.Surname;
                    }
                    db.Configuration.AutoDetectChangesEnabled = true;
                    db.Configuration.ValidateOnSaveEnabled = true;
                }
                if (entityState == "Delete")
                {
                    db.Users.RemoveRange(
                    db.Users.Where(t => t.UserID == user.UserID));
                }
                int saved = db.SaveChanges();
                if (saved > 0)
                {
                    updated = true;
                }
            }
            catch (Exception ex)
            {
                ErrorMessage.Text = "Problem saving record to database" + ex.InnerException;
            }
            return updated;
        }
    }
}