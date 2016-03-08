using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL_Project;
using System.Configuration;
using A3ClassLibrary;

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
                if (Request.QueryString["CategoryID"] == null)
                {
                    
               loadProducts();
                    //Add();
                }
                else
                {
                    LoadCats();
                }

            }



        }
        /* TODO:
            - 3 MARKS: grab CategoryID from QueryString and Populate the products based on the CategoryID
        */
        private void LoadCats()
        {

            int? CategoryID = Convert.ToInt32(Request.QueryString["CategoryID"]); //TODO: how do you stop it from bombing, if it's NOT a number? Or if CategoryID in the query string is missing.. 
            dlProducts.DataSource = Product.GetProductsByCategoryID(CategoryID);
            dlProducts.DataBind();
        }
        private void loadProducts()
        {
            DAL myd = new DAL(ConfigurationManager.ConnectionStrings["dbA3ConnStr"].ConnectionString);
            dlProducts.DataSource = myd.ExecuteProcedure("spGetProductByID");
            dlProducts.DataBind();
        }
        //private void Add()
        //{
        //    int OrderID = 0;
        //    int CustomerID = 0;
        //    DAL myd = new DAL(ConfigurationManager.ConnectionStrings["dbA3ConnStr"].ConnectionString);
        //    myd.AddParam("OrderID",OrderID);
        //    myd.AddParam("CustomerID",CustomerID);
        //    myd.ExecuteProcedure("spInsertOrder");
        //}

        protected void dlProducts_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int productID = Convert.ToInt32(e.CommandArgument);
            SessionCart.Instance.AddToCart(productID, 1);
            Response.Redirect("CartPage.aspx");
        }

    }
}