using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _1525586_CO5027_ASG
{
    public partial class contactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            SmtpClient smtpClient = new SmtpClient();
            smtpClient.EnableSsl = true;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Host = "smtp.gmail.com";
            smtpClient.Port = 587;
            System.Net.NetworkCredential credentials =
                new System.Net.NetworkCredential("lcbchester1525586@gmail.com", "Dart2015");

            smtpClient.Credentials = credentials;

            MailMessage msg = new MailMessage("lcbchester1525586@gmail.com", txtEmail.Text);
            msg.Subject = "Dear " + txtName.Text + ", thank you for your feedback!";
            msg.Body =  "Dear " + txtName.Text + "( " + txtEmail.Text + " )" + ". This is to notify you that we have received your message from our website: [" + txtSubject.Text + "], Message details: " + txtMessage.Text;
            smtpClient.Send(msg);
           
            try
            {
                smtpClient.Send(msg);
                litResult.Text =
                    "<p>Success, mail sent using SMTP with secure connection and credentials</p>";
                txtName.Text = string.Empty;
                txtEmail.Text = string.Empty;
                txtSubject.Text = string.Empty;
                txtMessage.Text = string.Empty;
            }
            catch (Exception ex)
            {
                //display the full error to the user
                litResult.Text =
                    "<p>Send failed: " + ex.Message + ":" + ex.InnerException + "</p>";
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            btnReset.CausesValidation = false;
            txtName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtSubject.Text = string.Empty;
            txtMessage.Text = string.Empty;
        }
    }
}