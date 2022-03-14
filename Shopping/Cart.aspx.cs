using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;
using System.Threading;

namespace Shopping
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProductcart();
            }
        }

        private void BindProductcart()
        {
            if (Request.Cookies["CartPID"] != null)
            {
                DataTable dt = new DataTable();
                string CookieData = Request.Cookies["CartPID"].Value.Split('=')[1];
                string[] CookieDataArray = CookieData.Split(',');
                if (CookieDataArray.Length > 0)
                {
                    h4NoItems.InnerText = "My Cart(" + CookieDataArray + ")items)";
                    DataTable dt = new DataTable();
                    Int64 CartTotal = 0;
                    Int64 Total = 0;
                    for (int i = 0; i < CookieDataArray.Length; i++)
                    {
                        string PID = CookieDataArray[i].ToString().Split('-')[0];
                        string sizeID = CookieDataArray[i].ToString().Split('-')[1];
                        SqlConnection con = new SqlConnection("Data Source = DESKTOP-5ARN2QG\\SQLEXPRESS01; Initial Catalog = PandaCart; Integrated Security = True");

                        {
                            using (SqlCommand cmd = new SqlCommand("select A.* , getSizeName(" + sizeID + ") as SizeNamee,"
                                + sizeID + " as SizeIDD,SizeData.Name, SizeData,Extention from Products A cross apply(select top1,B.Name,Extention from ProductImages B where B.PID=A.PID) SizeDAta Where A.PID = '" + PID + "'", con))
                            {
                                cmd.CommandType = CommandType.Text;
                                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                                {

                                    sda.Fill(dt);


                                }

                            }
                        }
                        CartTotal += Convert.ToInt64(dt.Rows[i]["PPprice"]);
                        Total += Convert.ToInt64(dt.Rows[i]["PSelPrice"]);
                    }
                }
                
            }
            
        }

        protected void btnRemoveCart_Click(object sender, EventArgs e)
        {
            string CookiePID = Request.Cookies["CartPID"].Values.Split('=')[1];

            Button btn = (Button)(sender);
            string PIDSIZE = btn.CommandArgument;
            List<String> CookiePIDList = CookiePID.Split(',').Select(i => i.Trim()).Where(i => i != string.Empty).ToList();
            CookiePIDList.Remove(PIDSIZE);
            string CookiePIDUpdated = String.Join(",", CookiePIDList.ToArray());
            if (CookiePIDUpdated == "")
            {
                HttpCookie CartPRoducts = Request.Cookies["CArtPID"];
                CartPRoducts.Values["CartPID"] = null;
                CartPRoducts.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(CartProducts);
            }
            else
            {
                HttpCookie CartPRoducts = Request.Cookies["CArtPID"];
                CartPRoducts.Values["CartPID"] = CookiePIDUpdated; ;
                CartPRoducts.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(CartProducts);
            }
        }

        protected void btnBuy_Click(object sender, EventArgs e)
        {
            if (Session["USERNAME"] != null)
            {
                Response.Redirect("~/Payment.aspx");
            }
            else
            {
                Response.Redirect("~/SignIn.aspx?rurl=cart");
            }
        }

        protected override void InitializeCulture()
        {
            CultureInfo ci = new CultureInfo("en-IN");
            ci.NumberFormat.CurrencySymbol = "Rs.";
            Thread.CurrentThread.CurrentCulture = ci;
            base.InitializeCulture();
        }
    }
}




