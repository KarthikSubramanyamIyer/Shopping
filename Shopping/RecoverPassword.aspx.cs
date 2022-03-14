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
    public partial class RecoverPassword : System.Web.UI.Page
    {
        string GUIDvalue;
        DataTable dt = new DataTable();
        int UId;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source = DESKTOP-5ARN2QG\\SQLEXPRESS01; Initial Catalog = PandaCart; Integrated Security = True");
            {
                con.Open();
                GUIDvalue = Request.QueryString["UserId"];

                if(GUIDvalue !=null)
                {
                    SqlCommand cmd = new SqlCommand("select*from ForogtPass where UserId=@UserId", con);
                    con.Open();
                    cmd.Parameters.AddWithValue("@UserId", GUIDvalue);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                   
                    sda.Fill(dt);
                    if(dt.Rows.Count !=0)
                    {
                        UId = Convert.ToInt32(dt.Rows[0][1]);
                    }
                    else
                    {
                        lblmsg.Text = "Your password reset Link is Expired or Invalid.. plz try agan";
                        lblmsg.ForeColor = System.Drawing.Color.Red;
                    }
                    
                }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }
            }

            if(!IsPostBack)
            {
                if(dt.Rows.Count !=0)
                {
                    txtConfirmPass.Visible = true;
                    txtNewPass.Visible = true;
                    lblNewPassword.Visible = true;
                    lblResetPassword.Visible = true;
                    btnResetPass.Visible = true;
                }
                else
                {
                    lblmsg.Text = "Your password reset Link is Expired or Invalid.. plz try agan";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }
            }


        }

        protected void btnResetPass_Click(object sender, EventArgs e)
        {
            if (txtNewPass.Text!= "" && txtConfirmPass.Text !="" && txtNewPass.Text == txtConfirmPass.Text)
            {

                SqlConnection con = new SqlConnection("Data Source = DESKTOP-5ARN2QG\\SQLEXPRESS01; Initial Catalog = PandaCart; Integrated Security = True");
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Update Users set Password=@Password where UserId=@UserId", con);
                    cmd.Parameters.AddWithValue("@Password", txtNewPass.Text);
                    cmd.Parameters.AddWithValue("@UserId", UId);
                    cmd.ExecuteNonQuery();

                    SqlCommand cmd2 = new SqlCommand("Delete from ForgotPass where UserId = @UserId ", con);
                    cmd2.ExecuteNonQuery();

                    Response.Write("<script> alert ('Password Reset Successfully done'); <script/>");
                    Response.Redirect("~/SignIn.aspx");

                }
            }
        }
    }
}