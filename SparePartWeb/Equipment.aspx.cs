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
    public partial class Equipment : System.Web.UI.Page
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
            Equipment_1 product = new Equipment_1();
            try
            {
                Label lbl = (e.Item.FindControl("lblEquipID")) as Label;
                if (lbl != null)
                    product.Equip_ID = lbl.Text;
                TextBox tbx = (e.Item.FindControl("tbxEquipName")) as TextBox;
                if (tbx != null)
                    product.Equip_name = tbx.Text;
                tbx = (e.Item.FindControl("tbxEquipLocation")) as TextBox;
                if (tbx != null)
                    product.Equip_location = tbx.Text;
                tbx = (e.Item.FindControl("tbxPurchaseD")) as TextBox;
                if (tbx != null)
                    product.Purchase_date = Convert.ToDateTime(tbx.Text);
                tbx = (e.Item.FindControl("tbxExpL")) as TextBox;
                if (tbx != null)
                    product.Exp_lifetime = Convert.ToInt16(tbx.Text);
                tbx = (e.Item.FindControl("tbxAvg")) as TextBox;
                if (tbx != null)
                    product.Avg_man_hrs_shutdown = Convert.ToInt16(tbx.Text);
                tbx = (e.Item.FindControl("tbxPurchaseP")) as TextBox;
                if (tbx != null)
                    product.Purchase_price = Convert.ToDecimal(tbx.Text);
                tbx = (e.Item.FindControl("tbxEst")) as TextBox;
                if (tbx != null)
                    product.Est_cost_brkdown = Convert.ToDecimal(tbx.Text);
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
            Equipment_1 product = new Equipment_1();
            try
            {               
                Label lbl = (lstAllProducts.Items[e.ItemIndex].FindControl("lblEquipID")) as Label;
                if (lbl != null)
                    product.Equip_ID = lbl.Text;
                TextBox tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxEquipName")) as TextBox;
                if (tbx != null)
                    product.Equip_name = tbx.Text;
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxEquipLocation")) as TextBox;
                if (tbx != null)
                    product.Equip_location = tbx.Text;
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxPurchaseD")) as TextBox;
                if (tbx != null)
                    product.Purchase_date = Convert.ToDateTime(tbx.Text);
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxExpL")) as TextBox;
                if (tbx != null)
                    product.Exp_lifetime = Convert.ToInt16(tbx.Text);
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxAvg")) as TextBox;
                if (tbx != null)
                    product.Avg_man_hrs_shutdown = Convert.ToInt16(tbx.Text);
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxPurchaseP")) as TextBox;
                if (tbx != null)
                    product.Purchase_price = Convert.ToDecimal(tbx.Text);
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxEst")) as TextBox;
                if (tbx != null)
                    product.Est_cost_brkdown = Convert.ToDecimal(tbx.Text);
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
            Equipment_1 product = new Equipment_1();
            try
            {

                Label lbl = (lstAllProducts.Items[e.ItemIndex].FindControl("lblEquipID")) as Label;
                if (lbl != null)
                    product.Equip_ID = lbl.Text;
                TextBox tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxEquipName")) as TextBox;
                if (tbx != null)
                    product.Equip_name = tbx.Text;
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxEquipLocation")) as TextBox;
                if (tbx != null)
                    product.Equip_location = tbx.Text;
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxPurchaseD")) as TextBox;
                if (tbx != null)
                    product.Purchase_date = Convert.ToDateTime(tbx.Text);
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxExpL")) as TextBox;
                if (tbx != null)
                    product.Exp_lifetime = Convert.ToInt16(tbx.Text);
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxAvg")) as TextBox;
                if (tbx != null)
                    product.Avg_man_hrs_shutdown = Convert.ToInt16(tbx.Text);
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxPurchaseP")) as TextBox;
                if (tbx != null)
                    product.Purchase_price = Convert.ToDecimal(tbx.Text);
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxEst")) as TextBox;
                if (tbx != null)
                    product.Est_cost_brkdown = Convert.ToDecimal(tbx.Text);
            }
            catch (HttpException) { }

            UpdateProductRecord(product, "Delete");
            ResetProductView();
        }
                         

        private DataTable GetProducts()
        {
            Equipment_1 p = new Equipment_1();
            object[] obj = new object[8];
            DataTable dt = new DataTable();
            dt.Columns.Add("Equip ID");
            dt.Columns.Add("Equip Name");
            dt.Columns.Add("Equip Location");
            dt.Columns.Add("Purchase Date");
            dt.Columns.Add("Expected Lifetime");
            dt.Columns.Add("Avg Man Hrs Shutdown");
            dt.Columns.Add("Purchase Price");
            dt.Columns.Add("Est Cost Breakdown");            
            foreach (var equip in db.Equipment_1)
            {
                obj[0] = equip.Equip_ID;
                obj[1] = equip.Equip_name;
                obj[2] = equip.Equip_location;
                obj[3] = equip.Purchase_date;
                obj[4] = equip.Exp_lifetime;
                obj[5] = equip.Avg_man_hrs_shutdown;
                obj[6] = equip.Purchase_price;
                obj[7] = equip.Est_cost_brkdown;
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

        public void UpdateProductRecord(Equipment_1 product, string entityState)
        {
            if (entityState == "Add")
            {
                if (product.Equip_ID == null)
                {
                    product.Equip_ID = " ";
                }
                if (product.Equip_name == null)
                {
                    product.Equip_name = " ";
                }
                if (product.Equip_location == null)
                {
                    product.Equip_location = " ";
                }
                if (product.Purchase_date == null)
                {
                    product.Purchase_date = Convert.ToDateTime("");
                }
                if (product.Exp_lifetime ==Convert.ToInt16(null))
                {
                    product.Exp_lifetime = Convert.ToInt16("");
                }
                if (product.Avg_man_hrs_shutdown ==Convert.ToInt16(null))
                {
                    product.Avg_man_hrs_shutdown = Convert.ToInt16("");
                }
                if (product.Purchase_price == Convert.ToDecimal(null))
                {
                    product.Purchase_price = Convert.ToDecimal("");
                }
                if (product.Est_cost_brkdown ==Convert.ToDecimal(null))
                {
                    product.Est_cost_brkdown = Convert.ToDecimal("");
                }

                db.Entry(product).State = System.Data.Entity.EntityState.Added;
            }
            if (entityState == "Modify")
            {
                foreach (var productitem in db.Equipment_1.Where(t => t.Equip_ID == product.Equip_ID))
                {
                    productitem.Equip_name = product.Equip_name;
                    productitem.Equip_location = product.Equip_location;
                    productitem.Purchase_date = product.Purchase_date;
                    productitem.Exp_lifetime = product.Exp_lifetime;
                    productitem.Avg_man_hrs_shutdown = product.Avg_man_hrs_shutdown;
                    productitem.Purchase_price = product.Purchase_price;
                    productitem.Est_cost_brkdown = product.Est_cost_brkdown;                    
                }
                db.Configuration.AutoDetectChangesEnabled = true;
                db.Configuration.ValidateOnSaveEnabled = true;
            }
            if (entityState == "Delete")
            {
                db.Equipment_1.RemoveRange(
                db.Equipment_1.Where(t => t.Equip_ID == product.Equip_ID));
            }
            db.SaveChanges();
        }

    }
}