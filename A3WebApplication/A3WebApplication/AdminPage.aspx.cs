using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL_Project;
using System.Data;
using System.Configuration;

namespace A3WebApplication
{
    public partial class AdminPage : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
            }
        }

        private void LoadProducts()
        {
            DAL myd = new DAL(ConfigurationManager.ConnectionStrings["dbA3ConnStr"].ConnectionString);
            gvAdminProducts.DataSource = myd.ExecuteProcedure("spGetProductByID");
            gvAdminProducts.DataBind();
        }

        protected void gvAdminProducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DAL myd = new DAL(ConfigurationManager.ConnectionStrings["dbA3ConnStr"].ConnectionString);
            if (gvAdminProducts.SelectedDataKey != null)
            {
                string ProductID = gvAdminProducts.SelectedValue.ToString();
                myd.AddParam("ProductID", ProductID);
                myd.ExecuteProcedure("spDeleteProduct");   // this is where the problem of not being able to delete is
                gvAdminProducts.DataBind();
                LoadProducts();
            }
            else
            {
                    
            }

            //gvAdminProducts.SelectedIndex = Convert.ToInt32(e.CommandArguement.ToString());
            //string ID = gvAdminProducts.SelectedValue.ToString();

        }

        protected void gvAdminProducts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //gvAdminProducts.SelectedIndex = Convert.ToInt32(e.CommandArgument.ToString());
            //string ProductID = gvAdminProducts.SelectedValue.ToString();
            //switch (e.CommandName)
            //{
            //    case "delete":
            //        DeleteProducts(ProductID);
            //        LoadProducts();
            //        break;
            //    default:
            //        break;
            //}
        }

        private void DeleteProducts(string ProductID)
        {
            DAL myd = new DAL(ConfigurationManager.ConnectionStrings["dbA3ConnStr"].ConnectionString);
            myd.AddParam("ProductID", ProductID);
            myd.ExecuteProcedure("spDeleteProduct");
            LoadProducts();
        }
    }
}