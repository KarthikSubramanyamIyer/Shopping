using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Shopping
{
    public partial class AddSize : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBrand();
                BindMainCategory();
                BindGender();
                BindrptrSize();



            }
        }

        private void BindrptrSize()
        {
            SqlConnection con = new SqlConnection("Data Source = DESKTOP-5ARN2QG\\SQLEXPRESS01; Initial Catalog = PandaCart; Integrated Security = True");
            {
                using (SqlCommand cmd = new SqlCommand("select A.*,B.*,C.*,D.*,E.* from Sizes A inner join Category B on B.CatID =a.CategoryID  inner join Brands C on C.BrandID =A.BrandID inner join SubCategory D on D.SubCatID =A.SubCategoryID inner join Gender E on E.GenderID =A.GenderID ", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrSize.DataSource = dt;
                        rptrSize.DataBind();
                    }
                }
            }
        }



        private void BindMainCategory()
        {
            SqlConnection con = new SqlConnection("Data Source = DESKTOP-5ARN2QG\\SQLEXPRESS01; Initial Catalog = PandaCart; Integrated Security = True");
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from Category", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlCategory.DataSource = dt;
                    ddlCategory.DataTextField = "CatName";
                    ddlCategory.DataValueField = "CatID";
                    ddlCategory.DataBind();
                    ddlCategory.Items.Insert(0, new ListItem("-Select-", "0"));

                }
            }
        }

        private void BindBrand()
        {
            SqlConnection con = new SqlConnection("Data Source = DESKTOP-5ARN2QG\\SQLEXPRESS01; Initial Catalog = PandaCart; Integrated Security = True");
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from Brands", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlBrand.DataSource = dt;
                    ddlBrand.DataTextField = "Name";
                    ddlBrand.DataValueField = "BrandID";
                    ddlBrand.DataBind();
                    ddlBrand.Items.Insert(0, new ListItem("-Select-", "0"));

                }
            }
        }

        private void BindGender()
        {

            SqlConnection con = new SqlConnection("Data Source = DESKTOP-5ARN2QG\\SQLEXPRESS01; Initial Catalog = PandaCart; Integrated Security = True");
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from Gender with(nolock)", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlGender.DataSource = dt;
                    ddlGender.DataTextField = "GenderName";
                    ddlGender.DataValueField = "GenderID";
                    ddlGender.DataBind();
                    ddlGender.Items.Insert(0, new ListItem("-Select-", "0"));

                }
            }
        }
        protected void btnAddSize_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source = DESKTOP-5ARN2QG\\SQLEXPRESS01; Initial Catalog = PandaCart; Integrated Security = True");
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into Sizes(SizeName,BrandID,CategoryID,SubCategoryID,GenderID) Values('" + txtSize.Text + "','" + ddlBrand.SelectedItem.Value + "','" + ddlCategory.SelectedItem.Value + "','" + ddlSubCategory.SelectedItem.Value + "','" + ddlGender.SelectedItem.Value + "')", con);
                cmd.ExecuteNonQuery();

                Response.Write("<script> alert('Size Added Successfully ');  </script>");
                txtSize.Text = string.Empty;

                con.Close();
                ddlBrand.ClearSelection();
                ddlBrand.Items.FindByValue("0").Selected = true;

                ddlCategory.ClearSelection();
                ddlCategory.Items.FindByValue("0").Selected = true;

                ddlSubCategory.ClearSelection();
                ddlSubCategory.Items.FindByValue("0").Selected = true;

                ddlGender.ClearSelection();
                ddlGender.Items.FindByValue("0").Selected = true;

            }
            BindrptrSize();
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            int MainCategoryID = Convert.ToInt32(ddlCategory.SelectedItem.Value);

            SqlConnection con = new SqlConnection("Data Source = DESKTOP-5ARN2QG\\SQLEXPRESS01; Initial Catalog = PandaCart; Integrated Security = True");
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from SubCategory where MainCatID='" + ddlCategory.SelectedItem.Value + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlSubCategory.DataSource = dt;
                    ddlSubCategory.DataTextField = "SubCatName";
                    ddlSubCategory.DataValueField = "SubCatID";
                    ddlSubCategory.DataBind();
                    ddlSubCategory.Items.Insert(0, new ListItem("-Select-", "0"));

                }
            }
        }
    }
}