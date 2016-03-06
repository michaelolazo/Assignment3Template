using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL_Project;
using System.Data;
using System.Configuration;
using A3ClassLibrary;

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
            int ProductID = (int)gvAdminProducts.DataKeys[e.RowIndex].Value;
            lblMessage.Visible = true;
            lblMessage.Text = "You deleted this ID" + ProductID.ToString();
        }

        protected void gvAdminProducts_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            switch (e.CommandName)
            {
                case "DeleteProduct":
                    gvAdminProducts.SelectedIndex = Convert.ToInt32(e.CommandArgument.ToString());
                    string ProductID = gvAdminProducts.SelectedValue.ToString();
                    DeleteProduct(ProductID);
                    LoadProducts();  // can delete all but the categories
                    break;
                case "UpdateProducts":
                    gvAdminProducts.SelectedIndex = Convert.ToInt32(e.CommandArgument.ToString());
                    string ProductID2 = gvAdminProducts.SelectedValue.ToString();
                    UpdateProduct(ProductID2);
                    break;
                default:
                    break;
                    
            }
        }

        private void DeleteProduct(string ProductID)
        {
            Product Pebor = new Product();
            Pebor.ProductID = Convert.ToInt32(ProductID);
            Pebor.DeleteProduct();
            LoadProducts();
        }
        private void UpdateProduct(string ProductID)
        {
            Product Pebor = new Product();
            Pebor.ProductID = Convert.ToInt32(ProductID);
            Pebor.UpdateProduct();
            LoadProducts();
        }

        protected void gvAdminProducts_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvAdminProducts.EditIndex = e.NewEditIndex;
            LoadProducts();
        }

        protected void gvAdminProducts_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int Index = gvAdminProducts.EditIndex;
            GridViewRow row = gvAdminProducts.Rows[Index];

        }

        protected void gvAdminProducts_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvAdminProducts.EditIndex = -1;
            LoadProducts();
        }
    }
}