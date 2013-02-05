using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace AEBNDashboard
{
    public class Globals
    {
        public string navHTML { get; set; }
        public double kpiHighOffset { get; set; }
        public double kpiLowOffset { get; set; }
        public DataSet myDs { get; set; }
        public Globals(){
            kpiHighOffset = .15;
            kpiLowOffset = .15;

            navHTML = "";
            foreach (Pages page in menuElements){
                navHTML += "<li><span onclick=clickNav(\"" + page.name + "\")>" + page.label + "</span></li>";
            }
            navHTML = "<ul>" + navHTML + "<li></li></ul>";
        }
        /*
        private SqlConnection rptConn = new SqlConnection("Data Source=74.81.187.140,6971;Initial Catalog=Report;User ID=Report;Password=numb3rs");
        public DataSet getDashElementDataset(string sproc, DateTime dt)
        {
            SqlConnection conn = rptConn;
            SqlCommand cmd = new SqlCommand(sproc, conn);
            if (dt > Convert.ToDateTime("01/01/2012") && dt < DateTime.Now.AddMinutes(-5))
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
                da.Fill(myDs);
                //da.Fill(ds);
            }
            catch { }
            conn.Close();
            return ds;
        }
        */
        public Pages[] menuElements = new Pages[2]{
        //new Pages("main","AEBN Dashboard","rpt.spDashboardMetrics"),
        new Pages("video","Video Dashboard","rpt.spDashboardMetricsVOD"),
        new Pages("realtouch","RealTouch Dashboard","rpt.spDashboardMetricsRT")
        };

    }
    public class Pages{
        public string name { get; set; }
        public string label { get; set; }
        public string sproc { get; set; } 
        public Pages(string newName, string newLabel, string newSproc) {
            name = newName;
            label = newLabel;
            sproc = newSproc;
        }
    }
}