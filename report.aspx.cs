using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Sql;

namespace AEBNDashboard
{
    public partial class report : System.Web.UI.Page
    {
        Globals GlobalData = new Globals();
        //DashboardItems dbi = new DashboardItems();
        //DashElements de = new DashElements("rpt.spDashboardMetricsRT", new DateTime());
        DateTime dt;
        public string date = "";
        public string metricData = "";


        public string reportDate = "";
        public string reportDateRaw = "";
        public string salesLineGraph = "";
        public string consumptionLineGraph = "";
        public string salesHtml = "";
        public string newClientsHtml = "";
        public string consumptionHmtl = "";
        public string prev90LineGraph = "";
        public string kpiHighOffset = "";
        public string kpiLowOffset = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime requestedDate = new DateTime(); 
            if (!string.IsNullOrEmpty(Request.QueryString["d"]))
            {
                try { requestedDate = Convert.ToDateTime(Request.QueryString["d"]); }
                catch { }
            }

            DashElements de = new DashElements("rpt.spDashboardMetricsRT", requestedDate, .20 , .20);
            reportDate = de.dashDate;
            reportDateRaw = de.dashDateRaw;
            salesLineGraph = de.salesLineGraph;
            salesHtml = de.salesHtml;
            newClientsHtml = de.newClientsHtml;
            consumptionHmtl = de.consumptionHmtl;
            consumptionLineGraph = de.consumptionLineGraph;
            //prev90LineGraph = de.prev90LineGraph;

            kpiHighOffset = GlobalData.kpiHighOffset.ToString();
            kpiLowOffset = GlobalData.kpiLowOffset.ToString();
            
            //metricData = dbi.buildRTdashHTML(new DateTime());
# region Old Code
            /*
            DataSet ds = new DataSet();
            ds = GlobalData.getDashElements("rpt.spDashboardMetricsRT", dt);
            
            foreach (DataTable t in ds.Tables)
            {
                switch (t.Rows[0]["ds"].ToString())
                {
                    case "Dollars":
                        foreach (DataRow r in t.Rows)
                        {
                            date = r["ActivityDate"].ToString();
                            date = date.Substring(0, date.IndexOf(' '));
                            metricData += dbi.DashboardA(
                                r["MetricLabel"].ToString(),
                                r["TrendingSalesDollars"].ToString(),
                                r["AvgSalesDollars"].ToString(),
                                r["PreviousSalesDollars"].ToString(),
                                r["SalesDollars"].ToString());
                        }
                        break;
                    case "Count":
                        foreach (DataRow r in t.Rows)
                        {
                            date = r["ActivityDate"].ToString();
                            date = date.Substring(0, date.IndexOf(' '));
                            metricData += dbi.DashboardA(
                                r["MetricLabel"].ToString(),
                                r["TrendingCount"].ToString(),
                                r["AvgCount"].ToString(),
                                r["PreviousCount"].ToString(),
                                r["MetricCount"].ToString());
                        }
                        break;
                    
                    case "Graph":
                        foreach (DataRow r in t.Rows)
                        {
                            metricData += r["Trending"].ToString() + "\n\n";
                            
                        }
                        break;
                }


            }
             * */

# endregion
        }
    }
}