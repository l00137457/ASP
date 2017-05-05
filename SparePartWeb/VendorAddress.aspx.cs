using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace SparePartWeb
{
    public partial class VendorAddress : System.Web.UI.Page
    {
        Spare_Part_SystemEntities db = new Spare_Part_SystemEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                try
                {

                    var fname = ((TextBox)PreviousPage.FindControl("cboDatabaseChoice"));
                }
                catch (NullReferenceException)
                {

                }
                lstAllProducts.DataSource = GetProducts();
                lstAllProducts.DataBind();
            }
        }



        protected void lstAllProducts_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            Address product = new Address();
            
            try
            {             
                TextBox tbx = (e.Item.FindControl("tbxName")) as TextBox;
                if (tbx != null)
                    product.Vendor_name = tbx.Text;
                tbx = (e.Item.FindControl("tbxAddr1")) as TextBox;
                if (tbx != null)
                    product.Ven_address_addr1 = tbx.Text;
                tbx = (e.Item.FindControl("tbxAddr2")) as TextBox;
                if (tbx != null)
                    product.Ven_address_addr2 = tbx.Text;
                tbx = (e.Item.FindControl("tbxCity")) as TextBox;
                if (tbx != null)
                    product.Ven_address_city = tbx.Text;
                tbx = (e.Item.FindControl("tbxCounty")) as TextBox;
                if (tbx != null)
                    product.Ven_address_county = tbx.Text;
                tbx = (e.Item.FindControl("tbxPostcode")) as TextBox;
                if (tbx != null)
                    product.Ven_address_postcode = tbx.Text;

            }
            catch (HttpException)
            { }
            UpdateProductRecord(product, "Add");
            ResetProductView();
        }    

        protected void lstAllProducts_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            lstAllProducts.EditIndex = e.NewEditIndex;
            lstAllProducts.DataSource = GetProducts();
            lstAllProducts.DataBind();
        }

        protected void lstAllProducts_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            Address product = new Address();
            try
            {
                Label lbl = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxName")) as Label;
                if (lbl != null)
                    product.Vendor_name = lbl.Text;
                TextBox tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxAddr1")) as TextBox;
                if (tbx != null)
                    product.Ven_address_addr1 = tbx.Text;
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxAddr2")) as TextBox;
                if (tbx != null)
                    product.Ven_address_addr2 = tbx.Text;
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxCity")) as TextBox;
                if (tbx != null)
                    product.Ven_address_city = tbx.Text;
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxCounty")) as TextBox;
                if (tbx != null)
                    product.Ven_address_county = tbx.Text;
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxPostcode")) as TextBox;
                if (tbx != null)
                    product.Ven_address_postcode = tbx.Text;
            }
            catch (HttpException)
            {

            }
            UpdateProductRecord(product, "Modify");
            ResetProductView();
        }

        protected void lstAllProducts_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            ResetProductView();
        }

        protected void lstAllProducts_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            Address product = new Address();
            try
            {

                Label lbl = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxName")) as Label;
                if (lbl != null)
                    product.Vendor_name = lbl.Text;
                TextBox tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxAddr1")) as TextBox;
                if (tbx != null)
                    product.Ven_address_addr1 = tbx.Text;
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxAddr2")) as TextBox;
                if (tbx != null)
                    product.Ven_address_addr2 = tbx.Text;
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxCity")) as TextBox;
                if (tbx != null)
                    product.Ven_address_city = tbx.Text;
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxCounty")) as TextBox;
                if (tbx != null)
                    product.Ven_address_county = tbx.Text;
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxPostcode")) as TextBox;
                if (tbx != null)
                    product.Ven_address_postcode = tbx.Text;
              
            }
            catch (HttpException)
            { }

            UpdateProductRecord(product, "Delete");
            ResetProductView();
        }


        private DataTable GetProducts()
        {
            Address p = new Address();
            object[] obj = new object[6];
            DataTable dt = new DataTable();
            dt.Columns.Add("Vendor Name");
            dt.Columns.Add("Vendor Address 1");
            dt.Columns.Add("Vendor Address 2");
            dt.Columns.Add("Vendor City");
            dt.Columns.Add("Vendor County");
            dt.Columns.Add("Vendor Postcode");           
            foreach (var equip in db.Addresses)
            {
                obj[0] = equip.Vendor_name;
                obj[1] = equip.Ven_address_addr1;
                obj[2] = equip.Ven_address_addr2;
                obj[3] = equip.Ven_address_city;
                obj[4] = equip.Ven_address_county;
                obj[5] = equip.Ven_address_postcode;               
                dt.Rows.Add(obj);
            }
            return dt;
        }

        private void ResetProductView()
        {
            lstAllProducts.EditIndex = -1;
            lstAllProducts.DataSource = GetProducts();
            lstAllProducts.DataBind();
        }

        public void UpdateProductRecord(Address product, string entityState)
        {
            if (entityState == "Add")
            {
                if (product.Vendor_name == null)
                {
                    product.Ven_address_addr1 = "";
                }
                if (product.Ven_address_addr2 == null)
                {
                    product.Ven_address_addr2 = "";
                }
                if (product.Ven_address_city == null)
                {
                    product.Ven_address_city = " ";
                }
                if (product.Ven_address_county == null)
                {
                    product.Ven_address_county = "";
                }
                if (product.Ven_address_postcode == null)
                {
                    product.Ven_address_postcode = "";
                }
               

                db.Entry(product).State = System.Data.Entity.EntityState.Added;
            }
            if (entityState == "Modify")
            {
                foreach (var productitem in db.Addresses.Where(t => t.Vendor_name == product.Vendor_name))
                {
                    productitem.Ven_address_addr1 = product.Ven_address_addr1;
                    productitem.Ven_address_addr2 = product.Ven_address_addr2;
                    productitem.Ven_address_city = product.Ven_address_city;
                    productitem.Ven_address_county = product.Ven_address_county;
                    productitem.Ven_address_postcode = product.Ven_address_postcode;
                    
                }
                db.Configuration.AutoDetectChangesEnabled = true;
                db.Configuration.ValidateOnSaveEnabled = true;
            }
            if (entityState == "Delete")
            {
                db.Addresses.RemoveRange(
                db.Addresses.Where(t => t.Vendor_name == product.Vendor_name));
            }
            db.SaveChanges();
        }
    }
}