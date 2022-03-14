using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shopping
{
    public partial class UserHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                btnlogout.Visible = true;
                lblSuccess.Text = "Login Seccess , Welcome" + Session["Username"].ToString();
            }
            else
            {
                btnlogout.Visible = false;
                Response.Redirect("~/SignIn.aspx");
            }
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            //Session.Abandon();
            Session["Username"] = null;
            Response.Redirect("~/Default.aspx");

        }
    }
}