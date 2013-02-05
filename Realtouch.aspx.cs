using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Sql;


namespace AEBNDashboard
{   
    public partial class Realtouch : System.Web.UI.Page
    {        
        Globals GlobalData = new Globals();
        DashboardItems dbi = new DashboardItems();
        DateTime dt;
        public string date = "";
        public string metricData = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["d"])) {                
                try { 
                    dt = Convert.ToDateTime(Request.QueryString["d"]);
                    //Response.Write("properDate");
                }
                catch {
                    //Response.Write("notProperDate");                
                }
            }            
            
            DataSet ds = new DataSet();
            ds = GlobalData.getDashElements("rpt.spDashboardMetricsRT",dt);
            
            foreach (DataTable t in ds.Tables) {
                switch (t.Rows[0]["ds"].ToString())
                {
                    case "Dollars":
                        foreach (DataRow r in t.Rows){
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
                        foreach (DataRow r in t.Rows){
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
                }

                
            }
        }        
    }
}