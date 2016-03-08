using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL_Project;
using A3ClassLibrary;
using System.Configuration;

namespace A3WebApplication
{
    public partial class CartPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadStuffs();
            }
        }

        private void loadStuffs()
        {
            gvCart.DataSource = SessionCart.Instance.Cart;
            dlCartFam.DataSource = SessionCart.Instance.Cart;
            dlCartFam.DataBind();
            gvCart.DataBind();

        }

        protected void gvCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            
            //gvCart.RowDeleting
            loadStuffs();
        }

        protected void gvCart_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCart.EditIndex = e.NewEditIndex;
            loadStuffs();   
        }

        protected void gvCart_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void gvCart_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //gvCart.EditIndex = -1;
            loadStuffs();
        }

        protected void gvCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            gvCart.SelectedIndex = Convert.ToInt32(e.CommandArgument);
            int ProductID = Convert.ToInt32(gvCart.SelectedValue);
            int Quantity = 0;
            switch (e.CommandName)
            {
                case "Delete":
                    SessionCart.Instance.RemoveCartItem(ProductID);
                    //(ProductID);
                    break;
                case "Update":
                    SessionCart.Instance.UpdateCartItem(ProductID, Quantity);
                    //(ProductID);
                    break;
                default:
                    break;
            }
            gvCart.DataBind();
            dlCartFam.DataBind();
        }

        protected void btnClearCart_Click(object sender, EventArgs e)
        {
            SessionCart.AbandonCart();
            dlCartFam.DataBind();
            gvCart.DataBind();
        }
    }
}