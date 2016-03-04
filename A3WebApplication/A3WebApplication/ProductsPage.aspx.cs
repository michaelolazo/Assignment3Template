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
    public partial class ProductsPage : System.Web.UI.Page
    {
        // 5 MARKS TOTAL
        // 1 BONUS MARK TOTAL
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //string CategoryID = Request.QueryString["CategoryID"];
                loadProducts();
            }

            /* TODO:
                - 3 MARKS: grab CategoryID from QueryString and Populate the products based on the CategoryID
            */

        }
        private void loadProducts()
        {
            DAL myd = new DAL(ConfigurationManager.ConnectionStrings["dbA3ConnStr"].ConnectionString);
            dlProducts.DataSource = myd.ExecuteProcedure("spGetProductByID");
            dlProducts.DataBind();
        }

        protected void dlProducts_ItemCommand(object source, DataListCommandEventArgs e)
        {
            /* TODO: 
                - 1 MARK:  get the right ProductID based on which product was clicked
                - BONUS 1 MARK:  get the quantity from the drop down if you made one
                - 1 MARK: Use the SessionCart's Instance to add a new Cart Item to the ShoppingCart and redirect to the CartPage
            */
        }
    }
}