using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace AEBNDashboard
{
    public class DashboardItems
    {
        //DashboadA define:
        //DashboardB define:
        //DashboardC define:

        //Depricated... use class DashElements()
        public string DashboardA(string label, string sparkline, string average, string lastWeekValue, string thisValue){
            var html = "";
            var row1 = "";
            var row2 = "";
            html += divWrap(label, "", "label");
            row1 += divWrap(sparkline, "", "sparkline");
            row1 += divWrap("AVG " + average, "", "average");
            html+= divWrap(row1, "", "row1");
            row2 += divWrap(lastWeekValue, "", "lastWeekValue");
            row2 += divWrap(thisValue, "", "thisValue");
            html+= divWrap(row2, "", "row2");            
            return divWrap(html, "", "dashboardA");
        }
        public string DashboardB(){
            return "";
        }
        public string DashboardC(){
            return "";
        }

        //private SqlConnection reportConnection = new SqlConnection("Data Source=74.81.187.140,6971;Initial Catalog=Report;User ID=Report;Password=numb3rs");
        private static SqlConnection rptConn = new SqlConnection("Data Source=74.81.187.140,6971;Initial Catalog=Report;User ID=Report;Password=numb3rs");

        public static DataSet getDashElementDataset(string sproc, DateTime dt)
        {
            SqlConnection conn = rptConn;
            SqlCommand cmd = new SqlCommand(sproc, conn);
            if (dt > Convert.ToDateTime("01/01/2012"))
            {
                SqlParameter param1 = new SqlParameter("@ipActivityDate", SqlDbType.DateTime);
                param1.Value = dt;
                cmd.Parameters.Add(param1);

            }
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            conn.Open();
            DataSet ds = new DataSet();
            try
            {
                da.Fill(ds);
            }
            catch { }
            conn.Close();
            return ds;
        }
        
        //Depricated... use class DashElements()
        private DataSet dashRTdataset;
        //Depricated... use class DashElements()
        public string buildRTdashHTML(DateTime dateTime) {
            dashRTdataset = getDashElementDataset("rpt.spDashboardMetricsRT", dateTime);
            string html = "";
            # region for Loop
            foreach (DataTable t in dashRTdataset.Tables){
                string innerHtml = "";
                string row1 = "";
                string row2 = "";
                switch (t.Rows[0]["ds"].ToString()){
                    case "Dollars":
                        foreach (DataRow r in t.Rows){
                            innerHtml = "";
                            row1 = "";
                            row2 = "";
                            innerHtml += divWrap(r["MetricLabel"].ToString(), "", "label");
                            row1 += divWrap(r["TrendingSalesDollars"].ToString(), "", "sparkline");
                            row1 += divWrap("AVG " + r["AvgSalesDollars"].ToString(), "", "average");
                            innerHtml += divWrap(row1, "", "row1");
                            row2 += divWrap(r["PreviousSalesDollars"].ToString(), "", "lastWeekValue");
                            row2 += divWrap(r["SalesDollars"].ToString(), "", "thisValue");
                            innerHtml += divWrap(row2, "", "row2");
                            html += divWrap(innerHtml, "", "dashboardDollars");
                        }
                    break;
                    case "Count":
                        foreach (DataRow r in t.Rows){
                            innerHtml = "";
                            row1 = "";
                            row2 = "";
                            //string innerHtml = "";
                            //innerHtml += "date" + r["ActivityDate"].ToString();
                            //string row1 = "";
                            //string row2 = "";
                            innerHtml += divWrap(r["MetricLabel"].ToString(), "", "label");
                            row1 += divWrap(r["TrendingCount"].ToString(), "", "sparkline");
                            row1 += divWrap("AVG " + r["AvgCount"].ToString(), "", "average");
                            innerHtml += divWrap(row1, "", "row1");
                            row2 += divWrap(r["PreviousCount"].ToString(), "", "lastWeekValue");
                            row2 += divWrap(r["MetricCount"].ToString(), "", "thisValue");
                            innerHtml += divWrap(row2, "", "row2");
                            html += divWrap(innerHtml, "", "dashboardCount");
                        }
                    break;
                    case "Graph":
                            innerHtml = "";  
                        /*foreach (DataRow r in t.Rows){
                            var innerHtml = "";
                            innerHtml += divWrap(r["Label"].ToString(), "", "mainLineGraphLabel");
                            innerHtml += divWrap(r["Trending"].ToString(), "", "mainLineGraph");
                            html += divWrap(innerHtml, "", "dashboardGraph");
                         }*/
                        //consumptionLineGraph
                        innerHtml += divWrap(t.Rows[0]["Label"].ToString(), "", "salesLineLabel");
                        innerHtml += divWrap(t.Rows[0]["Trending"].ToString(), "", "salesLineGraph");
                        html += innerHtml;
                        innerHtml = "";
                        innerHtml += divWrap(t.Rows[1]["Label"].ToString(), "", "consumptionLineLabel");
                        innerHtml += divWrap(t.Rows[1]["Trending"].ToString(), "", "consumptionLineGraph");
                        html += innerHtml;
                        
                    break;
                }
            }
            return html;
            # endregion
        }
        public void generateDashElements(DateTime date) {
           
            

                    /* <div class="moduleA">
                        <div class="title">RealTouch Device</div>
                        <div style="float:left;width:50%;">
                            <div class="directionDown">
                                <div><img src="down2.png" /></div>
                                <div class="count">2345</div>
                                <div class="percent">23%</div>
                            </div>
                            <div class="data">
                                <div class="value">$659</div>
                                <div class="avg">AVG 509</div>
                            </div>
                            <div class="sparkline">85.90,441.70,145.85,174.80,489.80,215.75,45.95,585.75,124.80,125.90,380.75,0.00,105.90,509.75,119.85,190.75,239.90,0.00,219.75,79.90,79.90,195.80,39.95,79.90,84.85,295.80,565.75,319.80,325.85,545.65,451.70</div>
                        </div>
                        <div style="float:left;width:50%;">
                            <div class="directionUp">
                                <div><img src="up2.png" /></div>
                                <div class="count">23</div>
                                <div class="percent">45%</div>
                            </div>
                            <div class="data">
                                <div class="value">1,659</div>
                                <div class="avg">AVG 5,109</div>
                            </div>
                            <div class="sparkline">2,6,7,3,6,8,8,5,3,2,2,5,6,7,8,5,5,34,3,6,7,8</div>
                        </div>
                    </div>
         */
        }

        /*ing salesLineGraph = "";
        public string consumptionLineGraph = "";
        public string salesHtml = "";
        public string newHtml = "";
        public string consumptionHmtl = "";
         */
        



        
        private static string divWrap(string data, string idName, string className) {
            if (idName != "") idName = " id=\"" + idName + "\" ";
            if (className != "") className = " class=\"" + className + "\" ";            
            return "<div"+idName+className+">"+data+"</div>\n";
        }
    }
}