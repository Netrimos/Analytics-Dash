using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace AEBNDashboard
{
    public class DashElements
    {
        private Globals GlobalData = new Globals();
        
        public string dashDate { get; set; }
        public string dashDateWithDay { get; set; }
        public string dashDateRaw { get; set; }
        public string salesLineGraph { get; set; }
        public string consumptionLineGraph { get; set; }
        public string salesHtml { get; set; }
        public string mainHtml { get; set; }
        public string newHtml { get; set; }
        public string newClientsHtml { get; set; }
        public string consumptionHmtl { get; set; }
        public DataSet rawDataSet { get; set; }

        public DashElements(string sproc, DateTime date, double kpiHigh, double kpiLow)
        {
            DataSet ds = getDashElementDataset(sproc, date);
            
            string column, section, outerSection;
            string previousSalesCount,  salesCount;
            string previousCount, metricCount;
            string salesDollars, previousSalesDollars;
            string metricDefinition, metricLabel;
            int previousCountValue, previousSalesDollarsValue, previousSalesCountValue;
rawDataSet = ds;
            salesHtml = "";
            if (sproc != "")
            {
                //if (ds.Tables[0].Rows.Count > 0)
                //{
                    foreach (DataTable t in ds.Tables)
                    {

                        switch (t.Rows[0]["ds"].ToString())
                        {
                            #region Switch for Graph
                            case "Timeline":
                                break;

                            case "Graph":
                                //salesLineGraph = t.Rows[0]["Trending"].ToString();
                                //consumptionLineGraph = t.Rows[1]["Trending"].ToString();


                                /*Sales Line*/
                                column = "";
                                section = "";

                                section += divWrap(t.Rows[0]["ActivityDate"].ToString(), "", "date");
                                section += divWrap(t.Rows[0]["Label"].ToString(), "", "title");
                                section += divWrap("Sales", "", "hoverLabel");
                                section += divWrap("#b9d2ef,#e6e9ed", "", "colors");
                                string[] dataForDateArraySales;
                                string[] dataForDateArrayConsumption;
                                string dataToDateArraySales = "";
                                string dataToDateArrayConsumption = "";

                                DateTime lineDate = new DateTime();
                                lineDate = Convert.ToDateTime(t.Rows[0]["ActivityDate"]);//.AddDays(-20);
                                TimeSpan ts;
                                int timestamp;



                                dataForDateArraySales = t.Rows[0]["Trending"].ToString().Split(',');
                                dataForDateArrayConsumption = t.Rows[1]["Trending"].ToString().Split(',');
                                lineDate = lineDate.AddDays(-dataForDateArraySales.Length);
                                for (int i = 0; i < dataForDateArraySales.Length; i++)
                                {
                                    lineDate = lineDate.AddDays(1);
                                    //Make UNIX TIME//////////
                                    ts = (lineDate - new DateTime(1970, 1, 1).ToUniversalTime());
                                    timestamp = (int)ts.TotalSeconds;

                                    //DK WHY I HAD TO ADD 000 to the UNIX TIME, but it works (it was a pain to figure this one out)
                                    dataToDateArrayConsumption += "[" + timestamp + "000 , " + dataForDateArraySales[i].ToString() + "] ,";
                                    dataToDateArraySales += "[" + timestamp + "000 , " + dataForDateArrayConsumption[i].ToString() + "] ,";
                                }
                                dataToDateArraySales = dataToDateArraySales.TrimEnd(',');
                                dataToDateArrayConsumption = dataToDateArrayConsumption.TrimEnd(',');

                                section += divWrap("[" + dataToDateArraySales + "]", "", "data");
                                section += divWrap("[" + dataToDateArrayConsumption + "]", "", "data2");

                                salesLineGraph = "<div class=\"renderStockLineGraph\" id=\"salesGraph\" style=\"height: 380px; margin: 0 auto; overflow:hidden;display:none;\">" + section + "</div>";


                                /*Consumption Line*/
                                /*column = "";
                                section = "";

                                section += divWrap(t.Rows[1]["ActivityDate"].ToString(), "", "date");
                                section += divWrap(t.Rows[1]["Label"].ToString(), "", "title");
                                section += divWrap("Consumption", "", "hoverLabel");
                                section += divWrap("#b9d2ef,#e6e9ed", "", "colors");
                                section += divWrap("[" + t.Rows[1]["Trending"].ToString() + "]", "", "data");

                                consumptionLineGraph = "<div class=\"renderScalingLineGraph\" id=\"consumptionGraph\" style=\"height: 160px; margin: 0 auto; overflow:hidden;\">" + section + "</div>";
                                */
                                break;
                            #endregion
                            #region Switch for GraphOLD
                            case "GraphOLD":
                                //salesLineGraph = t.Rows[0]["Trending"].ToString();
                                //consumptionLineGraph = t.Rows[1]["Trending"].ToString();


                                /*Sales Line*/
                                column = "";
                                section = "";

                                section += divWrap(t.Rows[0]["ActivityDate"].ToString(), "", "date");
                                section += divWrap(t.Rows[0]["Label"].ToString(), "", "title");
                                section += divWrap("Sales", "", "hoverLabel");
                                section += divWrap("#b9d2ef,#e6e9ed", "", "colors");
                                section += divWrap("[" + t.Rows[0]["Trending"].ToString() + "]", "", "data");

                                salesLineGraph = "<div class=\"renderScalingLineGraph\" id=\"salesGraph\" style=\"height: 240px; margin: 0 auto; overflow:hidden;\">" + section + "</div>";


                                /*Consumption Line*/
                                column = "";
                                section = "";

                                section += divWrap(t.Rows[1]["ActivityDate"].ToString(), "", "date");
                                section += divWrap(t.Rows[1]["Label"].ToString(), "", "title");
                                section += divWrap("Consumption", "", "hoverLabel");
                                section += divWrap("#b9d2ef,#e6e9ed", "", "colors");
                                section += divWrap("[" + t.Rows[1]["Trending"].ToString() + "]", "", "data");

                                consumptionLineGraph = "<div class=\"renderScalingLineGraph\" id=\"consumptionGraph\" style=\"height: 180px; margin: 0 auto; overflow:hidden;\">" + section + "</div>";

                                break;
                            #endregion
                            #region Switch for Gauges
                            case "Gauge":
                                int numberOfGauges = t.Rows.Count;
                                newClientsHtml = "";
                                if (numberOfGauges > 5) numberOfGauges = 5;
                                string columnSize = "";
                                switch (numberOfGauges)
                                {
                                    case 1: columnSize = "100%"; break;
                                    case 2: columnSize = "50%"; break;
                                    case 3: columnSize = "33%"; break;
                                    case 4: columnSize = "25%"; break;
                                    case 5: columnSize = "20%"; break;
                                }
                                int idNumber = 682; //random number for html ID
                                foreach (DataRow r in t.Rows)
                                {
                                    section = "";
                                    double avg = Convert.ToDouble(r["AvgCount"]);
                                    double avgLow = avg * .80;
                                    //string metricCount = r["MetricCount"].ToString().Replace(",","");
                                    int dataValue = Convert.ToInt32(r["MetricCount"].ToString().Replace(",", ""));
                                    int prevDataValue = Convert.ToInt32(r["PreviousCount"]);
                                    int highest = Convert.ToInt32(r["MaxCount"]);

                                    string gaugeRange = "0," + avgLow.ToString() + "," + avg.ToString() + "," + highest;
                                    string title = r["MetricLabel"].ToString();
                                    string percentage = r["MetricCountDifference"].ToString();
                                    section += divWrap(gaugeRange, "", "fourRanges");
                                    section += divWrap("#C02316,none,green", "", "threeRangeColor");//#CO2316
                                    section += divWrap(title, "", "title");
                                    section += divWrap(percentage, "", "percentage");
                                    section += divWrap("[" + dataValue + "]", "", "data");
                                    section = "<div class=\"renderMediumGauge\" id=\"a" + idNumber.ToString() + "\" style=\"float:left;width:" + columnSize + ";\">" + section + "</div>";

                                    idNumber += 4;
                                    newClientsHtml += section;
                                }
                                /*
                                <div style="float:left;width:20%;">
                                    <!-- First Two Gauge Graphs -->
                                    <div class="renderMediumGauge" id="a760876" style="margin: 0 auto; overflow:hidden;">
                                        <div class="fourRanges">0,8,15,20</div>
                                        <div class="threeRangeColor">#C02316,none,green</div>
                                        <div class="title">RTi Signups</div>
                                        <div class="percentage">-4%</div>
                                        <div class="data">[12]</div>
                                    </div>
                                </div>
                                 */
                                break;
                            #endregion
                            #region Switch for Main
                            case "Main":
                                salesDollars = t.Rows[0]["SalesDollars"].ToString();
                                previousSalesDollars = t.Rows[0]["PreviousSalesDollars"].ToString();
                                previousSalesDollarsValue = Convert.ToInt32(t.Rows[0]["PreviousSalesDollarsValue"]);

                                // DateTime dr = new DateTime( Convert.ToInt32(t.Rows[0]["ActivityDate"].ToString()), new DateTimeKind("Utc"));
                                // dashDateWithDay = dr.DayOfWeek.ToString() + " " + t.Rows[0]["ActivityDate"].ToString();
                                dashDate = t.Rows[0]["ActivityDate"].ToString();
                                dashDateRaw = Convert.ToDateTime(t.Rows[0]["ActivityDate"]).DayOfWeek.ToString() + " - " + dashDate.Substring(0, dashDate.IndexOf(' '));

                                //dashDate = dashDate.Substring(0, dashDate.IndexOf(' '));  /*dayOfweek.DayOfWeek + " - " +*/
                                outerSection = "";
                                column = "";
                                section = "";
                                outerSection += divWrap(t.Rows[0]["MetricLabel"].ToString(), "", "title");
                                column += divWrap(t.Rows[0]["SalesDollars"].ToString(), "", "value");
                                column += divWrap(t.Rows[0]["AvgSalesDollars"].ToString() + " AVG", "", "avg");
                                section += divWrap(column, "", "data");

                                column = "";
                                column += divWrap(returnDirectionArrow(previousSalesDollarsValue, salesDollars.ToString(), kpiHigh, kpiLow), "", "");
                                column += divWrap(previousSalesDollars.ToString(), "", "count");
                                column += divWrap(t.Rows[0]["SalesDollarsDifference"].ToString(), "", "percent");
                                section += divWrap(column, "", returnDirectionCSS(previousSalesDollarsValue, salesDollars.ToString(), kpiHigh, kpiLow));

                                section = divWrap(section, "", "");
                                outerSection += section;

                                mainHtml += divWrap(outerSection, "", "moduleMain");
                                mainHtml += "<div class=\"clr\" ></div>";
                                break;

                            #endregion
                            #region Switch for Purchases
                            case "Purchases":
                                //bool isFirstDollorRow = true;
                                foreach (DataRow r in t.Rows)
                                {
                                    column = "";
                                    section = "";
                                    outerSection = "";
                                    salesCount = r["SalesCount"].ToString();
                                    salesDollars = r["SalesDollars"].ToString();
                                    previousSalesCount = r["PreviousSalesCount"].ToString();
                                    previousSalesDollars = r["PreviousSalesDollars"].ToString();
                                    previousSalesDollarsValue = Convert.ToInt32(r["PreviousSalesDollarsValue"]);
                                    previousSalesCountValue = Convert.ToInt32(r["PreviousSalesCountValue"]);
                                    if ("" != r["DetailReportLink"].ToString()) metricLabel = aWrap(r["MetricLabel"].ToString(), r["DetailReportLink"].ToString());
                                    else metricLabel = r["MetricLabel"].ToString();

                                    #region first row of item is used with a different style
                                    //if (isFirstDollorRow)
                                    //{ 
                                    //    //dashDate is the global date for the page

                                    //    dashDate = r["ActivityDate"].ToString();
                                    //    //DateTime dayOfweek = new DateTime(Convert.ToInt32(r["ActivityDate"]), DateTimeKind.Utc);
                                    //    dashDateRaw = dashDate;
                                    //    dashDate = dashDate.Substring(0, dashDate.IndexOf(' '));  /*dayOfweek.DayOfWeek + " - " +*/ 
                                    //    outerSection = "";
                                    //    column = "";
                                    //    section = "";
                                    //    outerSection += divWrap(metricLabel, "", "title");
                                    //    column += divWrap(r["SalesDollars"].ToString(), "", "value");
                                    //    column += divWrap(r["AvgSalesDollars"].ToString() + " AVG", "", "avg");
                                    //    section += divWrap(column, "", "data");
                                    //    //section += divWrap(r["TrendingSalesDollars"].ToString(), "", "sparkline");

                                    //    column = "";
                                    //    column += divWrap(returnDirectionArrow(previousSalesDollarsValue, salesDollars.ToString(), kpiHigh, kpiLow), "", "");
                                    //    column += divWrap(previousSalesDollars.ToString(), "", "count");
                                    //    column += divWrap(r["SalesDollarsDifference"].ToString(), "", "percent");
                                    //    section += divWrap(column, "", returnDirectionCSS(previousSalesDollarsValue, salesDollars.ToString(), kpiHigh, kpiLow));

                                    //    section = divWrap(section, "", "");
                                    //    outerSection += section;

                                    //    salesHtml += divWrap(outerSection, "", "moduleMain");
                                    //    salesHtml += "<div class=\"clr\" ></div>";

                                    //    isFirstDollorRow = false;
                                    //}

                                    #endregion
                                    # region items in rows other than the first row
                                    //else
                                    //{

                                    outerSection = divWrap(metricLabel, "", "title");
                                    column += divWrap(returnDirectionArrow(previousSalesCountValue, salesCount.ToString(), kpiHigh, kpiLow), "", "");
                                    column += divWrap(previousSalesCount.ToString(), "", "count");
                                    column += divWrap(r["SalesCountDifference"].ToString(), "", "percent");
                                    section += divWrap(column, "", returnDirectionCSS(previousSalesCountValue, salesCount.ToString(), kpiHigh, kpiLow));

                                    column = "";
                                    column += divWrap(r["SalesCount"].ToString(), "", "value");
                                    column += divWrap(r["AvgSalesCount"].ToString() + " AVG", "", "avg");
                                    section += divWrap(column, "", "data");
                                    section += divWrap(r["TrendingSalesCount"].ToString(), "", "sparkline");
                                    section = divWrap(section, "", "moduleElement");
                                    outerSection += section;

                                    column = "";
                                    section = "";
                                    column += divWrap(returnDirectionArrow(previousSalesDollarsValue, salesDollars, kpiHigh, kpiLow), "", "");
                                    column += divWrap(previousSalesDollars.ToString(), "", "count");
                                    column += divWrap(r["SalesDollarsDifference"].ToString(), "", "percent");
                                    section += divWrap(column, "", returnDirectionCSS(previousSalesDollarsValue, salesDollars, kpiHigh, kpiLow));

                                    column = "";
                                    column += divWrap(r["SalesDollars"].ToString(), "", "value");
                                    column += divWrap(r["AvgSalesDollars"].ToString() + " AVG", "", "avg");
                                    section += divWrap(column, "", "data");
                                    section += divWrap(r["TrendingSalesDollars"].ToString(), "", "sparkline");
                                    section = divWrap(section, "", "moduleElement");
                                    outerSection += section;

                                    salesHtml += divWrap(outerSection, "", "moduleA");
                                    salesHtml += "<div class=\"clr\" ></div>";
                                }
                                    #endregion
                                //}
                                break;
                            #endregion
                            #region Switch for Consumption
                            case "Count":
                                foreach (DataRow r in t.Rows)
                                {
                                    column = "";
                                    section = "";
                                    outerSection = "";
                                    previousCount = r["PreviousCount"].ToString();
                                    metricCount = r["MetricCount"].ToString();
                                    previousCountValue = Convert.ToInt32(r["PreviousCountValue"]);
                                    if ("" != r["DetailReportLink"].ToString()) metricLabel = aWrap(r["MetricLabel"].ToString(), r["DetailReportLink"].ToString());
                                    else metricLabel = r["MetricLabel"].ToString();

                                    outerSection = divWrap(metricLabel, "", "title");
                                    column += divWrap(returnDirectionArrow(previousCountValue, metricCount.ToString(), kpiHigh, kpiLow), "", "");
                                    column += divWrap(previousCount.ToString(), "", "count");
                                    //column += divWrap(r["SalesCountDifference"].ToString(), "", "percent");
                                    section += divWrap(column, "", returnDirectionCSS(previousCountValue, metricCount.ToString(), kpiHigh, kpiLow));

                                    column = "";
                                    column += divWrap(r["MetricCount"].ToString(), "", "value");
                                    column += divWrap(r["AvgCount"].ToString() + " AVG", "", "avg");
                                    section += divWrap(column, "", "data");
                                    section += divWrap(r["TrendingCount"].ToString(), "", "sparkline");
                                    section = divWrap(section, "", "");
                                    outerSection += section;

                                    consumptionHmtl += divWrap(outerSection, "", "moduleB");
                                    //salesHtml += "<div class=\"clr\" ></div>";
                                }
                                break;
                            #endregion
                            #region Switch for Gauge2??
                            case "Gauge2":
                                foreach (DataRow r in t.Rows)
                                {
                                    column = "";
                                    section = "";
                                    outerSection = "";
                                    previousCount = r["PreviousCount"].ToString();
                                    metricCount = r["MetricCount"].ToString();
                                    previousCountValue = Convert.ToInt32(r["PreviousCountValue"]);
                                    if ("" != r["DetailReportLink"].ToString()) metricLabel = aWrap(r["MetricLabel"].ToString(), r["DetailReportLink"].ToString());
                                    else metricLabel = r["MetricLabel"].ToString();


                                    outerSection = divWrap(metricLabel, "", "title");
                                    column += divWrap(returnDirectionArrow(previousCountValue, metricCount.ToString(), kpiHigh, kpiLow), "", "");
                                    column += divWrap(previousCount.ToString(), "", "count");
                                    //column += divWrap(r["SalesCountDifference"].ToString(), "", "percent");
                                    section += divWrap(column, "", returnDirectionCSS(previousCountValue, metricCount.ToString(), kpiHigh, kpiLow));

                                    column = "";
                                    column += divWrap(r["MetricCount"].ToString(), "", "value");
                                    column += divWrap(r["AvgCount"].ToString() + " AVG", "", "avg");
                                    section += divWrap(column, "", "data");
                                    section += divWrap(r["TrendingCount"].ToString(), "", "sparkline");
                                    section = divWrap(section, "", "");
                                    outerSection += section;

                                    //consumptionHmtl += divWrap(outerSection, "", "moduleB");
                                    //salesHtml += "<div class=\"clr\" ></div>";
                                }

                                break;
                            #endregion
                        }
                    }
                //}
                //else { }
            }

        }
        #region SQL Connection 
        private static SqlConnection rptConn = new SqlConnection("Data Source=74.81.187.221,6970;Initial Catalog=Report;User ID=Report;Password=numb3rs");
        public static DataSet getDashElementDataset(string sproc, DateTime dt)
        {
            SqlConnection conn = rptConn;
            SqlCommand cmd = new SqlCommand(sproc, conn);
            if (dt > Convert.ToDateTime("01/01/2010") && dt < DateTime.Now.AddMinutes(-5))
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
        #endregion
        private string returnDirectionArrow(int prevValue, string value, double variantHigh, double variantLow){

            value = value.Replace("$", "");
            value = value.Replace(",", "");
            int valueInt = Convert.ToInt32(value);
            variantHigh = prevValue * (1 + variantHigh); //offsetting the difference ex Add 5% of $3000 = $3150
            variantLow = prevValue * (1 - variantLow); //offsetting the difference ex Subtract 5% of $3000 = $2850

            if (variantHigh < valueInt) return "<img src=\"/up2.png\" />";
            else if (variantLow > valueInt) return "<img src=\"/down2.png\" />";
            else return "<img src=\"/neutral2.png\" />";
            //if (prevValue > 0) return "<img src=\"up2.png\" />";
            //else return "<img src=\"down2.png\" />";
            //return "<img src=\"up2.png\" />";
        }
        private string returnDirectionCSS(int prevValue, string value, double variantHigh, double variantLow)
        {
            value = value.Replace("$", "");
            value = value.Replace(",", "");
            int valueInt = Convert.ToInt32(value);
            variantHigh = prevValue * (1 + variantHigh); //offsetting the difference ex Add 5% of $3000 = $3150
            variantLow = prevValue * (1 - variantLow); //offsetting the difference ex Subtract 5% of $3000 = $2850
            
            if (variantHigh < valueInt) return "directionUp";
            else if (variantLow > valueInt) return "directionDown";
            else return "directionNone";
            //return "directionNone";
        }
        private static string divWrap(string data, string idName, string className) {
            if (idName != "") idName = " id=\"" + idName + "\" ";
            if (className != "") className = " class=\"" + className + "\" ";            
            return "<div"+idName+className+">"+data+"</div>\n";
        }
        private static string aWrap(string label, string link) {
            return "<a href=\""+link+"\">"+label+"</a>";
        }
    }
}