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
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                Security.Login(tbUsername.Text,tbPassword.Text);  // the security class runs the login method which takes the two strings > username password
                if (Security.IsCustomerAdmin())   // since this is a bool returns true and cheks if customer is admin if it checks out it goes to admin page
                {
                    Response.Redirect("AdminPage.aspx");  // the redirect if customer is able to log into the page as admin 
                }
                else  // this checks if custoemr is an admin and if customer is already logged in if returned true redirects to the categories page
                {
                    Response.Redirect("CategoriesPage.aspx");
                }
            }
            catch (Exception ex)
            {
                lblMessage.Visible = true;
                lblMessage.Text = "wrong information, try again pls";   // no matter what to log in this always comes up

            }
            
        }

    }
}