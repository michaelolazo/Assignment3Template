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
            // TODO: must use the Security Class to login and to check for access level (admin or not)
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // int AcessLevel;
            DAL myd = new DAL(ConfigurationManager.ConnectionStrings["dbA3ConnStr"].ConnectionString);
            myd.AddParam("@UserName", tbUsername.Text);
            myd.AddParam("@Password", tbPassword.Text);
            DataSet ds = myd.ExecuteProcedure("spLogin");
           // lblMessage.Text = "Welcome to our Village";
            if ()
            {

            }
            //if (ds.Tables[0].Rows.Count != 1)
            //{
            //    lblMessage.Text = "welcome to our village admin michael";
            //}
            //else if (ds.Tables[0].Rows.Count == 1)
            //{
            //    lblMessage.Text = "welcome to our village";
            //}
            //lblMessage.Text = "arent qualified";
        }
    }
}