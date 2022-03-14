using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Net.Mail;
using System.Net;

namespace Shopping
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnResetPass_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source = DESKTOP-5ARN2QG\\SQLEXPRESS01; Initial Catalog = PandaCart; Integrated Security = True");
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from Users where Email =@Email", con);
                cmd.Parameters.AddWithValue("@Email", txtEmailId.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    String myGUID = Guid.NewGuid().ToString();
                    int UserId = Convert.ToInt32(dt.Rows[0][0]);
                    SqlCommand cmd1 = new SqlCommand("Insert into ForgotPass(Id,Userid,RequestDateTime) values('" + myGUID + "','" + UserId + "',GETDATE())", con);
                    cmd1.ExecuteNonQuery();

                    //Send reset link via Email

                    String ToEmailAddress = dt.Rows[0][7].ToString();
                    String UserName = dt.Rows[0][1].ToString();
                    String EmailBody ="Hi ," +UserName+ ",<br/><br/> Click The Link Below to Reset Your Password<br/><br/> https://localhost:44326/RecoverPassword.aspx?UserId ="+myGUID;

                    MailMessage PasswordRecMail = new MailMessage("Your Email", ToEmailAddress);//Enter  Mail Id Here from where the message has to be sent
                    PasswordRecMail.Body = EmailBody;
                    PasswordRecMail.IsBodyHtml = true;
                    PasswordRecMail.Subject = "Reset PassWord";

                    //SmtpClient SMTP = new SmtpClient("smtp.gmail.com",587);
                    //SMTP.Credentials = new NetworkCredential()
                    //{
                    //    UserName = "YourEmail@Example.com",//Personal Mail Id
                    //    Password = "YourPassword"//Personal Password

                    //};
                    //SMTP.EnableSsl = true;
                    //SMTP.Send(PasswordRecMail);

                    using (SmtpClient Client = new SmtpClient())
                    {
                        Client.EnableSsl = true;
                        Client.UseDefaultCredentials = false;
                        Client.Credentials = new NetworkCredential("Youremail", "sdfsdi@12345");
                        Client.Host = "smtp.gmail.com";
                        Client.Port = 587;
                        Client.DeliveryMethod = SmtpDeliveryMethod.Network;

                    }

                    ////------------

                    lblResetPassMsg.Text = "Reset Link sent ! Check Your Email For Reseting Password";
                    lblResetPassMsg.ForeColor = System.Drawing.Color.Green;
                    txtEmailId.Text = string.Empty;
                }
                else
                {
                    lblResetPassMsg.Text = "Oops This Email Does Not Exist .... plz Try again";
                    lblResetPassMsg.ForeColor = System.Drawing.Color.Red;
                    txtEmailId.Text = string.Empty;
                    txtEmailId.Focus();
                }
            }
        }
    }
}
