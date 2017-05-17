using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _1525586_CO5027_ASG
{
    public partial class ViewProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnMoreProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("products.aspx");
        }

        protected void btnBuyNow_Click(object sender, EventArgs e)
        {
            DropDownList DDLProductQty = (DropDownList)ProductFormView.FindControl("ProductQtyDropDownList");
            Label productPrice = (Label)ProductFormView.FindControl("lblProductPrice");
            decimal shippingPackagingCost = 5.00m;
            int productPrice1;
            int.TryParse((string)productPrice.Text, out productPrice1);
            int quantityOfProducts = int.Parse(DDLProductQty.SelectedValue);
            decimal subTotal = (quantityOfProducts * productPrice1);
            decimal totalAmount = subTotal + shippingPackagingCost;

            //Authenticate with PayPal
            var config = ConfigManager.Instance.GetProperties();
            var accessToken = new OAuthTokenCredential(config).GetAccessToken();
            //Get APIContext Object
            var apiContext = new APIContext(accessToken);

            var productStock = new Item();
            productStock.name = "Products";
            productStock.currency = "SGD";
            productStock.price = productPrice1.ToString();
            productStock.sku = "ProductCO5027"; //sku is stock keeping unit e.g. manufacturer code
            productStock.quantity = quantityOfProducts.ToString();

            var transactionDetails = new Details();
            transactionDetails.tax = "0";
            transactionDetails.shipping = shippingPackagingCost.ToString();
            transactionDetails.subtotal = subTotal.ToString("0.00");

            var transactionAmount = new Amount();
            transactionAmount.currency = "SGD";
            transactionAmount.total = totalAmount.ToString("0.00");
            transactionAmount.details = transactionDetails;

            var transaction = new Transaction();
            transaction.description = "Your order from Fleur.com.bn.";
            transaction.invoice_number = Guid.NewGuid().ToString(); // this should ideally be the id of a record storing the order
            transaction.amount = transactionAmount;
            transaction.item_list = new ItemList
            {
                items = new List<Item> { productStock }
            };

            var payer = new Payer();
            payer.payment_method = "paypal";

            var redirectUrls = new RedirectUrls();
            string strPathAndQuery = HttpContext.Current.Request.Url.PathAndQuery;
            string strUrl = HttpContext.Current.Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/");

            redirectUrls.cancel_url = strUrl + "cancel.aspx";
            redirectUrls.return_url = strUrl + "completePurchase.aspx";

            var payment = Payment.Create(apiContext, new Payment
            {
                intent = "sale",
                payer = payer,
                transactions = new List<Transaction> { transaction },
                redirect_urls = redirectUrls
            });

            Session["paymentId"] = payment.id;

            foreach (var link in payment.links)
            {
                if (link.rel.ToLower().Trim().Equals("approval_url"))
                {
                    //found the appropriate link, send the user there
                    Response.Redirect(link.href);
                }
            }
        }
    }
}