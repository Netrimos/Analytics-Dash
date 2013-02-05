using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Principal;

namespace AEBNDashboard
{
    public partial class pocDisplayUserandParams : System.Web.UI.Page
    {
        public string name;
        public string uri;
        public string d = "";
        public string p = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string a;
            a = System.Security.Principal.WindowsIdentity.GetCurrent().Name.ToString();
            name = a;
            //string[] b = a.Split('\\');
            //name = b[1];
            uri = HttpContext.Current.Request.Url.PathAndQuery;
            // MessageBox.Show(a.ToString());
            p = Request.QueryString["p"];
            d = Request.QueryString["d"];

        }
    }
}