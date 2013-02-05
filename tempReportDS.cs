using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Sql;

namespace AEBNDashboard
{
    public class tempReportDS
    {
        public DataSet getMyShit()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable("Table");

            
            dt.Columns.Add(new DataColumn("MetricLabel", typeof(string)));
            dt.Columns.Add(new DataColumn("ActivityDate", typeof(string)));
            dt.Columns.Add(new DataColumn("SalesDollars", typeof(string)));
            dt.Columns.Add(new DataColumn("PreviousSalesDollars", typeof(string)));
            dt.Columns.Add(new DataColumn("AvgSalesDollars", typeof(string)));
            dt.Columns.Add(new DataColumn("TrendingSalesDollars", typeof(string)));
            dt.Columns.Add(new DataColumn("ds", typeof(string)));
            DataRow dr = dt.NewRow();
            dr[0] = "RT Minutes";
            dr[1] = "7/27/2012 12:00:00 AM";
            dr[2] = "$799";
            dr[3] = "144";
            dr[4] = "685";
            dr[5] = "814.35,534.40,829.20,864.40,429.55,629.30,269.65,944.25,739.20,829.30,824.15,664.45,519.40,824.05,719.40,364.70,764.40,839.30,904.25,554.30,559.35,389.60,474.50,844.30,1044.15,654.45";
            dr[6] = "Dollars";
            dt.Rows.Add(dr);
            DataRow dr2 = dt.NewRow();
            dr2[0] = "Daily Adj Sales";
            dr2[1] = "7/27/2012 12:00:00 AM";
            dr2[2] = "$2,233";
            dr2[3] = "-1,029";
            dr2[4] = "3,285";
            dr2[5] = "2606.00,3628.72,3866.45,4201.19,2918.30,2799.52,3528.37,2618.20,2904.65,2645.17,3057.80,2808.55,1637.57,3958.90,2435.95,3835.62,4266.27,2822.50,3734.80,2983.97,2257.35,4824.51,5483.85,3397.63,2932.02,3262.25";
            dr[6] = "Dollars";
            dt.Rows.Add(dr2);
            
            DataRow dr3 = dt.NewRow();
            dr3[0] = "RT Accessories";
            dr3[1] = "7/27/2012 12:00:00 AM";
            dr3[2] = "$820";
            dr3[3] = "384";
            dr3[4] = "905";
            dr3[5] = "814.35,534.40,829.20,864.40,429.55,629.30,269.65,944.25,739.20,829.30,824.15,664.45,519.40,824.05,719.40,364.70,764.40,839.30,904.25,554.30,559.35,389.60,474.50,844.30,1044.15,654.45";
            dr[6] = "Dollars";
            dt.Rows.Add(dr3);
            ds.Tables.Add(dt);           
            return ds;
        }
    }
}