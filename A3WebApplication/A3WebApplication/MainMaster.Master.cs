using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace A3WebApplication
{
    public partial class MainMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //if (!Security.IsCustomerLoggedIn())
            //{
            //    Response.Redirect("Login.aspx");
            //}
            //else if (Security.IsCustomerLoggedIn())
            //{
            //    Response.Redirect("CategoriesPage.aspx");
            //}
            
            if (Security.IsCustomerLoggedIn())
            {
                btnLogMeOutFam.Visible = true;
            }
                
          }

        protected void btnLogMeOutFam_Click(object sender, EventArgs e)
        {
            
            Security.LogOut();
        }
        // NOTE: You will need to use the Security Class to determine if logged in or not
    }
    }
