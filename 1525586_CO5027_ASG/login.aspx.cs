using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

namespace _1525586_CO5027_ASG
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            //create a dbcontext that specified the connection string
            var identityDBContext = new IdentityDbContext("IdentityConnectionString");
            //create user store and user manager
            var userStore = new UserStore<IdentityUser>(identityDBContext);
            var manager = new UserManager<IdentityUser>(userStore);

            var roleStore = new RoleStore<IdentityRole>(identityDBContext);
            var roleManager = new RoleManager<IdentityRole>(roleStore);
            IdentityRole registeredcustomerRole = new IdentityRole("registeredcustomer");
            roleManager.Create(registeredcustomerRole);

            //create user
            var user = new IdentityUser() { UserName = txtRegEmail.Text, Email = txtRegEmail.Text };
            manager.Create(user, txtRegPassword.Text);

            manager.AddToRole(user.Id, "registeredcustomer");
            IdentityResult result = manager.Update(user);
            if (result.Succeeded)
            {
                //todo: Either authenticate the user (log them in) or redirect them to the login page to log in themselves
                litRegisterError.Text = "Successfully registered.";
                txtRegEmail.Text = "";
                txtRegPassword.Text = "";
                txtRegConfirmPassword.Text = "";
            }
            else
            {
                litRegisterError.Text = "An error has occurred: " + result.Errors.FirstOrDefault();
                txtRegEmail.Text = "";
                txtRegPassword.Text = "";
                txtRegConfirmPassword.Text = "";
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //create a dbcontext that specified the connection string
            var identityDBContext = new IdentityDbContext("IdentityConnectionString");
            //create user store and user manager
            var userStore = new UserStore<IdentityUser>(identityDBContext);
            var userManager = new UserManager<IdentityUser>(userStore);
            var user = userManager.Find(txtLoginEmail.Text, txtLoginPassword.Text);

            var roleStore = new RoleStore<IdentityRole>(identityDBContext);
            var roleManager = new RoleManager<IdentityRole>(roleStore);

            if (user != null)
            {
                if (userManager.IsInRole(user.Id, "administrator"))
                {
                    LogUserIn(userManager, user);
                    Server.Transfer("manageproduct.aspx", true);
                }
                else if (userManager.IsInRole(user.Id, "registeredcustomer"))
                {
                    LogUserIn(userManager, user);
                    Server.Transfer("default.aspx", true);
                }
                else
                {
                    Server.Transfer("default.aspx", true);
                }
            }
            else
            {
                litLoginError.Text = "Invalid username or password";
                txtLoginEmail.Text = "";
                txtLoginPassword.Text = "";
            }

            //var identityDbContext = new IdentityDbContext("IdentityConnectionString");
            //var userStore = new UserStore<IdentityUser>(identityDbContext);
            //var userManager = new UserManager<IdentityUser>(userStore);
            //var user = userManager.Find(txtLoginEmail.Text, txtLoginPassword.Text);


            ////if (user != null)
            ////{
            ////    LogUserIn(userManager, user);
            ////    Server.Transfer("manageProduct_update.aspx", true);
            ////}
            ////else
            ////{
            ////    litLoginError.Text = "Invalid username or password";
            ////    txtLoginEmail.Text = "";
            ////    txtLoginPassword.Text = "";
            ////}
        }

        private void LogUserIn(UserManager<IdentityUser> usermanager, IdentityUser user)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            var userIdentity = usermanager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
            authenticationManager.SignIn(new Microsoft.Owin.Security.AuthenticationProperties() { }, userIdentity);
            //Note: user is automatically redirected if trying to access another page
        }
    }
}