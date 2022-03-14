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
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(Request.Cookies["UName"]!=null && Request.Cookies["Password"] !=null)
                {
                    txtUsername.Text = Request.Cookies["UName"].Value;
                    txtPass.Text = Request.Cookies["Password"].Value;
                    CheckBox1.Checked = true;
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source = DESKTOP-5ARN2QG\\SQLEXPRESS01; Initial Catalog = PandaCart; Integrated Security = True");
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from Users where UserId=@UserId and Password=@Password", con);
                cmd.Parameters.AddWithValue("@UserId",txtUsername.Text);

                cmd.Parameters.AddWithValue("@Password", txtPass.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if(dt.Rows.Count !=0)
                {
                    if(CheckBox1.Checked )
                    {
                        Response.Cookies["UNAME"].Value = txtUsername.Text;
                        Response.Cookies["Password"].Value = txtPass.Text;

                        Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(10);
                        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(10);

                    }
                    else
                    {
                        Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);
                    }
                    string Utype;
                    Utype = dt.Rows[0][8].ToString().Trim();

                    if(Utype == "User")
                    {
                        Session["Username"] = txtUsername.Text;
                        Response.Redirect("~/UserHome.aspx");
                    }
                    if (Utype == "Admin")
                    {
                        Session["Username"] = txtUsername.Text;
                        Response.Redirect("~/AdminHome.aspx");
                    }
                }
                else
                {
                    lblError.Text = "Invalid Username and Password";
                }
                //Response.Write("<script> alert('Login is Successfully '); </script>");
                clr();
                con.Close();
                //lblMsg.Text = "Registration Successfully done";
                //lblMsg.ForeColor = System.Drawing.Color.Green; 

            }
        }

        private void clr()
        {
            txtUsername.Text = string.Empty;
            txtPass.Text = string.Empty;
            txtUsername.Focus();
        }
    }
}