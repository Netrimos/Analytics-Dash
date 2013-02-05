using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AEBNDashboard
{
    public partial class pocNavandDateFunctionality : System.Web.UI.Page
    {
        public string thisDate { set; get;}
        public string thisPage { set; get; }
        public string greatestDashDate { set; get; }

        protected void Page_Load(object sender, EventArgs e)
        {
            
            DateTime requestedDate = DateTime.Now;
            greatestDashDate = requestedDate.AddDays(-1).ToString();

            if (!string.IsNullOrEmpty(Request.QueryString["d"])){
                try{
                    requestedDate = Convert.ToDateTime(Request.QueryString["d"]);
                    thisDate = requestedDate.ToShortDateString();
                }
                catch { thisDate = requestedDate.AddDays(-1).ToString(); }
            }
            else thisDate = requestedDate.AddDays(-1).ToString();

            if (!string.IsNullOrEmpty(Request.QueryString["p"])) thisPage = Request.QueryString["p"];
            else thisPage = "realtouch";

        }
    }
}