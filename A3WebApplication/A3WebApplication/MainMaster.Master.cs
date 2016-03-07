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
            if (Security.IsCustomerLoggedIn())
            {
                hlLoginMeInFam.Visible = true;
                hlLogMeOutFam.Visible = false;
            }
            else if (!Security.IsCustomerLoggedIn())
            {
                hlLoginMeInFam.Visible = true;
                hlLogMeOutFam.Visible = false;
            }
            // NOTE: You will need to use the Security Class to determine if logged in or not

        }
    }
}