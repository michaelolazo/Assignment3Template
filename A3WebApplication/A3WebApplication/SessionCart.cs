using A3ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace A3WebApplication
{
    // Example use of this class to add an item to the cart:
    // SessionCart.Instance.AddToCart(1,1);
    public class SessionCart
    {
        // This variable will only exist once per customer (per session) 
        // The real cart functions are in ShoppingCart class
        public static readonly ShoppingCart Instance;
        // The static constructor is called as soon as the class is loaded into memory
        static SessionCart()
        {
            HttpContext.Current.Session["ShoppingCart"] = HttpContext.Current.Session["ShoppingCart"] ?? new ShoppingCart();
            Instance = (ShoppingCart)HttpContext.Current.Session["ShoppingCart"];
        }

        public static void AbandonCart()
        {
            Instance.Cart.Clear();
        }

    }
}