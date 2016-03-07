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
                LoadCats();
                //LoadCats2(ID);
                //loadProducts();
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
        //private void LoadCats2(int ID)
        //{
        //    List<Product> p = new List<Product>();
        //    p = Product.GetProductsByCategoryID(ID);
        //    dlProducts.DataSource = p;
        //    dlProducts.DataKeyField = "CategoryID";
        //    dlProducts.DataBind();
        //}
        private void loadProducts()
        {
            DAL myd = new DAL(ConfigurationManager.ConnectionStrings["dbA3ConnStr"].ConnectionString);
            dlProducts.DataSource = myd.ExecuteProcedure("spGetProductByID");
            dlProducts.DataBind();
        }

        protected void dlProducts_ItemCommand(object source, DataListCommandEventArgs e)
        {
            
            int CategoryID = Convert.ToInt32(Request.QueryString["CategoryID"]);
            lblErrorMessage.Visible = true;
            lblErrorMessage.Text = "You chose this product with the CategoryID of "+ CategoryID.ToString();
            //LoadCats();
            //dlProducts.SelectedIndex = Convert.ToInt32(e.CommandArgument.ToString());

            /* TODO: 
                - 1 MARK:  get the right ProductID based on which product was clicked
                - BONUS 1 MARK:  get the quantity from the drop down if you made one
                - 1 MARK: Use the SessionCart's Instance to add a new Cart Item to the ShoppingCart and redirect to the CartPage
            */
            //Response.Redirect("ProductsPage.aspx?CategoryID=" + e.CommandArgument);
        }

    }
}