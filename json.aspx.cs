using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace AEBNDashboard
{
    public partial class json : System.Web.UI.Page
    {
        Dataset2JSON d2j = new Dataset2JSON();
        DashElements de = new DashElements("rpt.spDashboardMetricsRT", DateTime.Now.AddDays(-1),-20,-20);
        public string jsonStuff { get; set; }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            jsonStuff = d2j.serializeJSON("RT", de.rawDataSet);
        }
    }
}