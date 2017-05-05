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
    public partial class Maintenance : System.Web.UI.Page
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
            Maintenance_1 product = new Maintenance_1();

            try
            {
                TextBox tbx = (e.Item.FindControl("tbxName")) as TextBox;
                if (tbx != null)
                    product.Main_name = tbx.Text;
                tbx = (e.Item.FindControl("tbxShutDwn")) as TextBox;
                if (tbx != null)
                    product.Type_shutdown = tbx.Text;
                tbx = (e.Item.FindControl("tbxBreakDwn")) as TextBox;
                if (tbx != null)
                    product.Type_breakdown = tbx.Text;
                tbx = (e.Item.FindControl("tbxTotalHrs")) as TextBox;
                if (tbx != null)
                    product.Total_man_hrs = Convert.ToInt16(tbx.Text);
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
            Maintenance_1 product = new Maintenance_1();
            try
            {
                Label lbl = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxMainID")) as Label;
                if (lbl != null)
                    product.Main_ID = Convert.ToInt16(lbl.Text);
                TextBox tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxName")) as TextBox;
                if (tbx != null)
                    product.Main_name = tbx.Text;
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxShutDwn")) as TextBox;
                if (tbx != null)
                    product.Type_shutdown = tbx.Text;
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxBreakDwn")) as TextBox;
                if (tbx != null)
                    product.Type_breakdown = tbx.Text;
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxTotalHrs")) as TextBox;
                if (tbx != null)
                    product.Total_man_hrs = Convert.ToInt16(tbx.Text);
             
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
            Maintenance_1 product = new Maintenance_1();
            try
            {

                Label lbl = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxMainID")) as Label;
                if (lbl != null)
                    product.Main_ID = Convert.ToInt16(lbl.Text);
                TextBox tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxName")) as TextBox;
                if (tbx != null)
                    product.Main_name = tbx.Text;
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxShutDwn")) as TextBox;
                if (tbx != null)
                    product.Type_shutdown = tbx.Text;
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxBreakDwn")) as TextBox;
                if (tbx != null)
                    product.Type_breakdown = tbx.Text;
                tbx = (lstAllProducts.Items[e.ItemIndex].FindControl("tbxTotalHrs")) as TextBox;
                if (tbx != null)
                    product.Total_man_hrs = Convert.ToInt16(tbx.Text);
            }
            catch (HttpException)
            { }

            UpdateProductRecord(product, "Delete");
            ResetProductView();
        }

    
        private DataTable GetProducts()
        {
            Part product = new Part();

            object[] obj = new object[5];
            DataTable dt = new DataTable();
            dt.Columns.Add("Maintenance ID");
            dt.Columns.Add("Maintenance Name");
            dt.Columns.Add("Shutdown Type");
            dt.Columns.Add("Breakdown Type");
            dt.Columns.Add("Total Man Hrs");
          
            foreach (var equip in db.Maintenance_1)
            {
                obj[0] = equip.Main_ID;
                obj[1] = equip.Main_name;
                obj[2] = equip.Type_shutdown;
                obj[3] = equip.Type_breakdown;
                obj[4] = equip.Total_man_hrs;
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

        public void UpdateProductRecord(Maintenance_1 product, string entityState)
        {
            if (entityState == "Add")
            {
              
                if (product.Main_name == null)
                {
                    product.Main_name ="" ;
                }
                if (product.Type_shutdown == null)
                {
                    product.Type_shutdown = " ";
                }
                if (product.Type_breakdown == "")
                {
                    product.Type_breakdown = "";
                }
                if (product.Total_man_hrs == null)
                {
                    product.Total_man_hrs = Convert.ToInt16("");
                }


                db.Entry(product).State = System.Data.Entity.EntityState.Added;
            }
            if (entityState == "Modify")
            {
                foreach (var productitem in db.Maintenance_1.Where(t => t.Main_ID == product.Main_ID))
                {
                    productitem.Main_name = product.Main_name;
                    productitem.Type_shutdown = product.Type_shutdown;
                    productitem.Type_breakdown = product.Type_breakdown;
                    productitem.Total_man_hrs = product.Total_man_hrs;                    
                }
                db.Configuration.AutoDetectChangesEnabled = true;
                db.Configuration.ValidateOnSaveEnabled = true;
            }
            if (entityState == "Delete")
            {
                db.Maintenance_1.RemoveRange(
                db.Maintenance_1.Where(t => t.Main_ID == product.Main_ID));
            }
            db.SaveChanges();
        }

    }
}