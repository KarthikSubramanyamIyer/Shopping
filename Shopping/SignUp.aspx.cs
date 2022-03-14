using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Shopping
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtsignup_Click(object sender, EventArgs e)
        {
            if (isformvalid())
            {
                SqlConnection con = new SqlConnection("Data Source = DESKTOP-5ARN2QG\\SQLEXPRESS01; Initial Catalog = PandaCart; Integrated Security = True");
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Insert into Users(UserId,Name,Password,ConfirmPassword,MobileNo,Address,Pincode,Email,Usertype) values('" + txtUname.Text + "','" + txtName.Text + "','" + txtPass.Text + "','" + txtCpass.Text + "','" + txtMno.Text + "','" + txtAdd.Text + "','" + txtPin.Text + "','" + txtEmail.Text + "','User')", con);
                    cmd.ExecuteNonQuery();
                    Response.Write("<script> alert('Registration Successfully done'); </script>");
                    clr();
                    con.Close();
                    lblMsg.Text = "Registration Successfully done";
                    lblMsg.ForeColor = System.Drawing.Color.Green;
                   
                }
                Response.Redirect("~/SignIn.aspx");
            }
            else
            {
                Response.Write("<script> alert('Registration Failed'); </script>");
                lblMsg.Text = "All Fields are Manatory";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
        } 

        private bool isformvalid()
        {
           if(txtUname.Text =="")
           {
                Response.Write("<script> alert('User Name not Valid'); </script>");
                return false;
           }
           else if(txtPass.Text == "")
           {
                Response.Write("<script> alert('Password not Valid'); </script>");
                return false;
           }
           else if (txtCpass.Text != txtPass.Text )
           {
                Response.Write("<script> alert('Confirm Password not Valid'); </script>");
                return false;
           }
            else if (txtMno.Text == "")
            {
                Response.Write("<script> alert('MobileNo not Valid'); </script>");
                return false;
            }
            else if (txtAdd.Text == "")
            {
                Response.Write("<script> alert('Address not Valid'); </script>");
                return false;
            }
            else if (txtPin.Text == "")
            {
                Response.Write("<script> alert('Pincode not Valid'); </script>");
                return false;
            }
            else if (txtEmail.Text == "")
            {
                Response.Write("<script> alert('Email not Valid'); </script>");
                return false;
            }
           return true;
        }

        private void clr()
        {
            txtUname.Text = string.Empty;
            txtName.Text = string.Empty;
            txtPass.Text = string.Empty;
            txtCpass.Text = string.Empty;
            txtMno.Text = string.Empty;
            txtAdd.Text = string.Empty;
            txtPin.Text = string.Empty;
            txtEmail.Text = string.Empty;

        }
    }
}