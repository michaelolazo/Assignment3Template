using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL_Project;
using System.Configuration;

namespace A3WebApplication
{
    public partial class CategoriesPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategory();
            }
        }

        private void LoadCategory()
        {
            DAL myd = new DAL(ConfigurationManager.ConnectionStrings["dbA3ConnStr"].ConnectionString);
            dlCategories.DataSource = myd.ExecuteProcedure("spGetCategoryByID");
            dlCategories.DataBind();

        }

        protected void dlCategories_ItemCommand(object source, DataListCommandEventArgs e)
        {

        }
    }
}