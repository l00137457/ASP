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
    public partial class Part : System.Web.UI.Page
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
            SPAREPART product = new SPAREPART(); 

            try
            {
                TextBox tbx = (e.Item.FindControl("tbxSpareID")) as TextBox;
                if (tbx != null)
                     product.Spare_ID= tbx.Text;
                tbx = (e.Item.FindControl("tbxDate")) as TextBox;
                if (tbx != null)
                    product.Purchase_date = Convert.ToDateTime(tbx.Text);
                tbx = (e.Item.FindControl("tbxName")) as TextBox;
                if (tbx != null)
                    product.Name = tbx.Text;
                tbx = (e.Item.FindControl("tbxCost")) as TextBox;
                if (tbx != null)
                    product.Unit_cost = Convert.ToDecimal(tbx.Text);
                tbx = (e.Item.FindControl("tbxSlow")) as TextBox;
                if (tbx != null)
                    product.Type_slow_part = tbx.Text;
                tbx = (e.Item.FindControl("tbxFast")) as TextBox;
                if (tbx != null)
                    product.Type_fast_part = tbx.Text;
                tbx = (e.Item.FindControl("tbxLife")) as TextBox;
                if (tbx != null)
                    product.Exp_lifeTime =Convert.ToInt16(tbx.Text);
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
            SPAREPART product = new SPAREPART();
            try
            {
                Label lbl = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxSpareID")) as Label;
                if (lbl != null)
                    product.Spare_ID = lbl.Text;
                TextBox tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxDate")) as TextBox;
                if (tbx != null)
                    product.Purchase_date = Convert.ToDateTime(tbx.Text);
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxName")) as TextBox;
                if (tbx != null)
                    product.Name = tbx.Text;
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxCost")) as TextBox;
                if (tbx != null)
                    product.Unit_cost = Convert.ToDecimal(tbx.Text);
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxSlow")) as TextBox;
                if (tbx != null)
                    product.Type_slow_part = tbx.Text;
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxFast")) as TextBox;
                if (tbx != null)
                    product.Type_fast_part = tbx.Text;
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxLife")) as TextBox;
                if (tbx != null)
                    product.Exp_lifeTime = Convert.ToInt16(tbx.Text);
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
            SPAREPART product = new SPAREPART();
            try
            {

                Label lbl = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxSpareID")) as Label;
                if (lbl != null)
                    product.Spare_ID = lbl.Text;
                TextBox tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxDate")) as TextBox;
                if (tbx != null)
                    product.Purchase_date = Convert.ToDateTime(tbx.Text);
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxName")) as TextBox;
                if (tbx != null)
                    product.Name = tbx.Text;
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxCost")) as TextBox;
                if (tbx != null)
                    product.Unit_cost = Convert.ToDecimal(tbx.Text);
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxSlow")) as TextBox;
                if (tbx != null)
                    product.Type_slow_part = tbx.Text;
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxFast")) as TextBox;
                if (tbx != null)
                    product.Type_fast_part = tbx.Text;
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxLife")) as TextBox;                
                if (tbx != null)
                    product.Exp_lifeTime = Convert.ToInt16(tbx.Text);
            }
            catch (HttpException)
            { }

            UpdateProductRecord(product, "Delete");
            ResetProductView();
        }

      
        private DataTable GetProducts()
        {
            Part product = new Part();

            object[] obj = new object[7];
            DataTable dt = new DataTable();
            dt.Columns.Add("Spare ID");
            dt.Columns.Add("Purchase Date");
            dt.Columns.Add("Name");
            dt.Columns.Add("Unit Cost");
            dt.Columns.Add("Slow Part");
            dt.Columns.Add("Fast Type");
            dt.Columns.Add("Expected Life Time");
            foreach (var equip in db.SPAREPARTs)
            {
                obj[0] = equip.Spare_ID;
                obj[1] = equip.Purchase_date;
                obj[2] = equip.Name;
                obj[3] = equip.Unit_cost;
                obj[4] = equip.Type_slow_part;
                obj[5] = equip.Type_fast_part;
                obj[5] = equip.Exp_lifeTime;
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

        public void UpdateProductRecord(SPAREPART product, string entityState)
        {
            if (entityState == "Add")
            {
                if (product.Spare_ID == null)
                {
                    product.Spare_ID = "";
                }
                if (product.Purchase_date == null)
                {
                    product.Purchase_date = Convert.ToDateTime( "");
                }
                if (product.Name == null)
                {
                    product.Name = " ";
                }
                if (product.Unit_cost == Convert.ToDecimal(""))
                {
                    product.Unit_cost = Convert.ToDecimal("");
                }
                if (product.Type_slow_part == null)
                {
                    product.Type_fast_part = "";
                }


                db.Entry(product).State = System.Data.Entity.EntityState.Added;
            }
            if (entityState == "Modify")
            {
                foreach (var productitem in db.SPAREPARTs.Where(t => t.Spare_ID == product.Spare_ID))
                {
                    productitem.Purchase_date = product.Purchase_date;
                    productitem.Name = product.Name;
                    productitem.Unit_cost = product.Unit_cost;
                    productitem.Type_slow_part = product.Type_slow_part;
                    productitem.Type_fast_part = product.Type_fast_part;
                    productitem.Exp_lifeTime = product.Exp_lifeTime;

                }
                db.Configuration.AutoDetectChangesEnabled = true;
                db.Configuration.ValidateOnSaveEnabled = true;
            }
            if (entityState == "Delete")
            {
                db.SPAREPARTs.RemoveRange(
                db.SPAREPARTs.Where(t => t.Spare_ID == product.Spare_ID));
            }
            db.SaveChanges();
        }
    
    }
}