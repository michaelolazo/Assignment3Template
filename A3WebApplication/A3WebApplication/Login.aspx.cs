using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL_Project;
using System.Configuration;
using System.Data;
using A3ClassLibrary;
namespace A3WebApplication
{
    public partial class Login : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Security.IsCustomerAdmin())   // since this is a bool returns true and cheks if customer is admin if it checks out it goes to admin page
            {
                Response.Redirect("AdminPage.aspx");  // the redirect if customer is able to log into the page as admin 
            }
            else if (!Security.IsCustomerAdmin() && Security.IsCustomerLoggedIn()) // this checks if custoemr is an admin and if customer is already logged in if returned true redirects to the categories page
            {
                Response.Redirect("Categories.aspx");
            }

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                Security.Login(tbUsername.Text, tbPassword.Text);
                Response.Redirect("AdminPage.aspx");
            }
            catch (Exception)
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Welcome admin";

            }
            lblMessage.Visible = true;
            lblMessage.Text = "wrong infomartion, try again pls";
        }

    }
}