using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI.WebControls;
using JSON_MDS;

namespace AEBNDashboard
{
    public partial class pocModelRanking : System.Web.UI.Page
    {
    DataTable table = new DataTable();
    Dataset2JSON ds2j = new Dataset2JSON();
    public string JSON = "";
    DataSet ds = new DataSet("bob1");
	
	
        protected void Page_Load(object sender, EventArgs e)
        {
            table.Columns.Add("Model", typeof(string));
            table.Columns.Add("Days_in_System", typeof(decimal));
            table.Columns.Add("Session_Count", typeof(decimal));
            table.Columns.Add("Unique_Clients", typeof(decimal));
            table.Columns.Add("Pos_FB", typeof(decimal));
            table.Columns.Add("Neg_FB", typeof(decimal));
            table.Columns.Add("Num_of_Devices", typeof(decimal));
            table.Columns.Add("Date_Price", typeof(decimal));
            table.Columns.Add("Est_Dev_$", typeof(decimal));
            table.Columns.Add("Avg_Date_$", typeof(decimal));
	        
            table.Rows.Add("SweetMila",181,199,84,163,1,3,19520,597,98.09045226);
            table.Rows.Add("Savannah Steele",237,209,107,131,0,0,14785,0,70.74162679);
            table.Rows.Add("Jacq Amaretta",15,46,36,36,0,4,2235,796,48.58695652);
            table.Rows.Add("Lisbella",239,252,126,127,0,0,14464,0,57.3968254);
            table.Rows.Add("Janica",183,139,75,98,1,0,11130,0,80.07194245);
            table.Rows.Add("ShannonSparkx",236,332,147,220,0,0,13520,0,40.72289157);
            table.Rows.Add("Rachel Morales",237,398,170,168,0,0,12506,0,31.42211055);
            table.Rows.Add("PrincessSi",189,210,101,157,0,1,9452,199,45.00952381);
            table.Rows.Add("Kitty Wilde",238,60,34,20,0,0,6715,0,111.9166667);
            table.Rows.Add("Shyla Sweet",155,123,78,92,0,9,7595,1791,61.74796748);
            table.Rows.Add("JaylaDiamond",4,10,7,9,0,1,420,199,42);
            table.Rows.Add("RoboDoll",161,57,37,49,1,49,4128,9751,72.42105263);
            table.Rows.Add("Odessa DeSade",135,32,18,25,0,0,3610,0,112.8125);
            table.Rows.Add("KenzieKarter",100,65,46,46,1,1,4750,199,73.07692308);
            table.Rows.Add("Dawn Willow",214,39,28,18,0,5,4320,995,110.7692308);
            table.Rows.Add("CammiCams",134,67,42,44,3,41,3880,8159,57.91044776);
            table.Rows.Add("SexySuzzie",18,11,8,11,0,0,890,0,80.90909091);
            table.Rows.Add("melaniesweets",221,155,102,84,0,0,6920,0,44.64516129);
            table.Rows.Add("Wicked Kinky",235,265,96,163,0,0,7478,0,28.21886792);
            table.Rows.Add("Nadia",239,71,33,51,0,0,4880,0,68.73239437);
            table.Rows.Add("Madyson",237,58,31,4,0,0,4532,0,78.13793103);
            table.Rows.Add("Emery",239,84,52,39,1,0,5060,0,60.23809524);
            table.Rows.Add("April",193,152,103,65,1,0,5770,0,37.96052632);
            table.Rows.Add("Felicia Firefly",237,19,13,8,0,0,1745,0,91.84210526);
            table.Rows.Add("CandiAdickt",239,73,46,26,0,0,4208,0,57.64383562);
            table.Rows.Add("Quin B",237,65,43,12,0,0,3965,0,61);
            table.Rows.Add("Saphire",224,84,51,30,0,0,4240,0,50.47619048);
            table.Rows.Add("victoriagivens",138,77,54,53,0,0,3260,0,42.33766234);
            table.Rows.Add("Jinxypie",212,53,33,20,0,1,3025,199,57.0754717);
            table.Rows.Add("Daisy Destin",239,20,18,0,0,1,1565,199,78.25);
            table.Rows.Add("ScarletLove",185,56,39,26,2,0,2980,0,53.21428571);
            table.Rows.Add("Claudia Marie",70,15,11,7,0,3,980,597,65.33333333);
            table.Rows.Add("NicoLotus",114,55,30,40,0,0,2380,0,43.27272727);
            table.Rows.Add("HollyStJohn",231,34,24,14,0,0,2080,0,61.17647059);
            table.Rows.Add("PixieRotic",174,14,12,8,0,0,1020,0,72.85714286);
            table.Rows.Add("Preslye",161,10,6,7,0,0,746,0,74.6);
            table.Rows.Add("Lucky Starr",142,28,21,21,0,0,1595,0,56.96428571);
            table.Rows.Add("Holly",186,29,23,7,0,0,1720,0,59.31034483);
            table.Rows.Add("AlexStormCam",218,9,6,0,0,0,646,0,71.77777778);
            table.Rows.Add("RavenMonroe",219,32,19,9,0,0,1750,0,54.6875);
            table.Rows.Add("Nisha",196,70,43,36,2,0,2620,0,37.42857143);
            table.Rows.Add("Catie Candy",225,60,36,4,0,0,2509,0,41.81666667);
            table.Rows.Add("SexyWinter",236,30,23,0,0,0,1609,0,53.63333333);
            table.Rows.Add("HandywifeXXX",204,43,31,32,0,0,1845,0,42.90697674);
            table.Rows.Add("Mandy Minx",224,19,13,3,0,4,930,796,48.94736842);
            table.Rows.Add("LilithStorm",181,9,8,5,0,0,505,0,56.11111111);
            table.Rows.Add("Tacy Plush",182,9,6,6,0,1,495,199,55);
            table.Rows.Add("VioletOctober",168,11,9,5,0,0,590,0,53.63636364);
            table.Rows.Add("DebbieUK",239,35,26,17,0,0,1395,0,39.85714286);
            table.Rows.Add("Sinistress",220,30,15,16,0,0,1156,0,38.53333333);
            table.Rows.Add("Nicohlas Nash",225,15,4,0,0,0,660,0,44);
            table.Rows.Add("Demonika",227,24,12,5,0,0,945,0,39.375);
            table.Rows.Add("Sexxy_Bunny",136,6,5,5,0,6,210,1194,35);
            table.Rows.Add("OmarLatino",186,6,2,1,0,0,240,0,40);
            table.Rows.Add("GinaRpgGeek",237,59,40,5,0,0,1377,0,23.33898305);
            table.Rows.Add("Clara Bright",183,16,13,12,0,0,500,0,31.25);
            table.Rows.Add("AmberLynnBach",176,3,3,1,0,0,90,0,30);
            table.Rows.Add("mochaccino",100,12,4,9,0,0,260,0,21.66666667);
            table.Rows.Add("domino",61,5,4,1,0,0,110,0,22);

            ds.Tables.Add(table); 

            JSON = ds2j.serializeJSON("bob2", ds);

            JSON = JSON.Replace("\n", String.Empty);
            JSON = JSON.Replace("\r", String.Empty);
            JSON = JSON.Replace("\t", String.Empty);

            //Response.Write(JSON);

            //Row Labels,Days In System,Session Count,Unique Clients,Pos FB,Neg FB,Device# ,Date Price,Est Device $,Avg Date$;
        }
    }
}