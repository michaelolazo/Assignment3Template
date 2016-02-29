using DAL_Project;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace A3ClassLibrary
{
    // 4 BONUS MARKS TOTAL
    public class Customer
    {
        public int CustomerID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string PhoneNumber { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public bool IsAdmin { get; set; }

        public static Customer Login(string userName, string password)
        {
            Customer result = null;

            DAL d = new DAL(ConfigurationManager.ConnectionStrings["dbA3ConnStr"].ConnectionString);
            d.AddParam("UserName", userName);
            d.AddParam("Password", password);
            DataSet ds = d.ExecuteProcedure("spLogin");

            iif (ds.Tables[0].Rows.Count == 1)
            {
                DataRow r = ds.Tables[0].Rows[0];
                result = new Customer();
                result.CustomerID = int.Parse(r["CustomerID"].ToString());
                result.FirstName = r["FirstName"].ToString();
                result.LastName = r["LastName"].ToString();
                result.Address = r["Address"].ToString();
                result.City = r["City"].ToString();
                result.PhoneNumber = r["PhoneNumber"].ToString();
                result.UserName = r["UserName"].ToString();
                result.IsAdmin = (bool)r["AccessLevel"];
            }
            return result;
        }
        public void RegisterCustomer()
        {
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["dbA3ConnStr"].ConnectionString);
            d.AddParam("FirstName", FirstName);
            d.AddParam("LastName", LastName);
            d.AddParam("Address", Address);
            d.AddParam("City", City);
            d.AddParam("PhoneNumber", PhoneNumber);
            d.AddParam("UserName", UserName);
            d.AddParam("Password", Password);
            d.AddParam("AccessLevel", IsAdmin);
            DataSet ds = d.ExecuteProcedure("spInsertCustomer");
            this.CustomerID = Convert.ToInt32(ds.Tables[0].Rows[0]["NewCustomerID"].ToString());
        }
        public List<Customer> GetCustomers()
        {
            List<Customer> result = new List<Customer>();

            DAL d = new DAL(ConfigurationManager.ConnectionStrings["dbA3ConnStr"].ConnectionString);
            DataSet ds = d.ExecuteProcedure("spGetCustomers");

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                Customer c = new Customer();
                c.CustomerID = int.Parse(row["CustomerID"].ToString());
                c.FirstName = row["FirstName"].ToString();
                c.LastName = row["LastName"].ToString();
                c.Address = row["Address"].ToString();
                c.City = row["City"].ToString();
                c.PhoneNumber = row["PhoneNumber"].ToString();
                c.UserName = row["UserName"].ToString();
                c.IsAdmin = (bool)row["AccessLevel"];
                
                result.Add(c);
            }
            return result;
        }

        // TODO: 
        // BONUS 1 MARK: write method which impliments spGetCustomerByID
        // BONUS 1 MARK: write method which impliments spInsertCustomer
        // BONUS 1 MARK: write method which impliments spDeleteCustomer
        // BONUS 1 MARK: write method which impliments spUpdateCustomer
    }
}
