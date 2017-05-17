using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _1525586_CO5027_ASG
{
    public partial class manageProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            HttpContext.Current.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            Server.Transfer("login.aspx", true);
        }

        protected void ProductFormView_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            ProductGridView.DataBind();
        }

        protected void ProductFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            ProductGridView.DataBind();
        }

        protected void ProductFormView_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            ProductGridView.DataBind();
        }

        protected void SaveLinkButton_Click(object sender, EventArgs e)
        {
            FileUpload file = (FileUpload)ProductFormView.FindControl("FileUploadImage") as FileUpload;
            if (file.HasFile)
            {
                file.SaveAs(Server.MapPath("~/ProductImages/" + file.FileName));
                Label saveProduct = (Label)ProductFormView.FindControl("ImageUrlLabel") as Label;
                saveProduct.Text = "~/ProductImages/" + file.FileName;
            }
        }
    }
}