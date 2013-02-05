using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AEBNDashboard
{
    public partial class Default : System.Web.UI.Page
    {
        Globals GlobalData = new Globals();

        public string navHTML = "";
        public string currentPage { get; set; }
        public string currentSproc { get; set; }
        public string thisDate { get; set; }
        public string thisPage { get; set; }
        public string greatestDashDate { set; get; }
        public DashElements de;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Redirect("offline.aspx");
            
            navHTML = GlobalData.navHTML;

            DateTime requestedDate = DateTime.Now;
            greatestDashDate = requestedDate.AddDays(-1).ToString();

         //Date Querystring
            if (!string.IsNullOrEmpty(Request.QueryString["d"]))
            {
                try{
                    requestedDate = Convert.ToDateTime(Request.QueryString["d"]);
                    thisDate = requestedDate.ToShortDateString();
                }
                catch { thisDate = requestedDate.AddDays(-1).ToString(); }
            }
            else thisDate = requestedDate.AddDays(-1).ToString();

        //Page QueryString
            if (!string.IsNullOrEmpty(Request.QueryString["p"])) thisPage = Request.QueryString["p"];
            else thisPage = "realtouch";
            foreach (Pages pgs in GlobalData.menuElements) {
                if (pgs.name == thisPage)
                { 
                    currentSproc = pgs.sproc;
                    currentPage = pgs.label;
                }
            }
            

            de = new DashElements(currentSproc, requestedDate, .20, .20);

        }
        
    }
}