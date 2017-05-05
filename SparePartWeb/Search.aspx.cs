using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SparePartWeb
{
    public partial class Search : System.Web.UI.Page
    {
        test t = new test();

        public string databaseToSearch
        {
            get
            {
                return (string)ViewState["databaseToSearch"] ?? "";
            }
            set
            {
                ViewState["databaseToSearch"] = value;
            }
        }

        public partial class test
        {
            public string a;
        }

        Spare_Part_SystemEntities db = new Spare_Part_SystemEntities();

        string searchText { get; set; }


        protected void cboDatabaseChoice_SelectedIndexChanged(object sender, EventArgs e)
        {
            //var choice = "";
            var _dropdownlist = (DropDownList)sender;
            if (_dropdownlist.SelectedIndex > -1)
            {
                ListItem item = _dropdownlist.SelectedItem;
                databaseToSearch = item.Value;
                t.a = item.Value;
            }
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            if (databaseToSearch == "Equipment")
            {
                Server.Transfer("Equipment.aspx");
            }
            else if (databaseToSearch == "Vendor")
            {
                Server.Transfer("VendorAddress.aspx");
            }
            else if (databaseToSearch == "Spare Part")
            {
                Server.Transfer("SparePart.aspx");
            }
            else if (databaseToSearch == "Maintenanace")
            {
                Server.Transfer("Maintenenace.aspx");
            }
            else if (databaseToSearch == "Vendor Address")
            {
                Server.Transfer("VendorAddress.aspx");
            }
            else

                searchText = tbxSearchText.Text;
                PerformSearch(databaseToSearch, searchText);
        }

        private void PerformSearch(string databaseToSearch, string searchText)
        {
            if (databaseToSearch == "Vendor")
            {
                lstAllProducts.DataSource = GetProducts(searchText);
                if (lstAllProducts.Items.Count > 0)
                {
                    lstAllProducts.Visible = true;
                }
                lstAllProducts.DataBind();
            }
        }

        private DataTable GetProducts(string searchText)
        {
           
            Vendor p = new Vendor();
            object[] obj = new object[2];
            DataTable dt = new DataTable();
            dt.Columns.Add("Vendor ID");
            dt.Columns.Add("name");
            try
            {
                foreach (var product in db.Vendors.Where(t => t.Vendor_name == searchText))    /*|| t.Vendor_name == searchText))*/
                {
                    obj[0] = product.Vendor_ID;
                    obj[1] = product.Vendor_name;

                    dt.Rows.Add(obj);
                }
            }
            catch (Exception)
            {
               
            }
            
            return dt;
            
        }

        private void ResetProductView()
        {
            lstAllProducts.EditIndex = -1;
            lstAllProducts.DataSource = GetProducts("");
            lstAllProducts.DataBind();
        }





        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}



