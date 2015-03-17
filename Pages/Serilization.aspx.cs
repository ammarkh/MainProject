using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Data.SqlClient;
using System.Runtime.Serialization.Json;

public partial class Pages_Serilization : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        #region FailedTests
        //SqlConnection connection = new SqlConnection(@"server=Joseph\SQLEXPRESS;database=3alyamen;integrated security=true;");
        //connection.Open();
        //SqlCommand command = new SqlCommand("select * from [MARKERS] where 1");
        //SqlDataAdapter adapter = new SqlDataAdapter("select * from [MARKERS] where 1", connection);
        //DataTable dt = new DataTable();
        //adapter.Fill(dt);
        //connection.Close();
        //MarkerHelper mh = new MarkerHelper();
        //DataSet ds = mh.SelectAllMarker();
        ////List<Addresses> AddressList = new List<Addresses>();
        //try
        //{
        //    List<Addresses> AddressList = new List<Addresses>();
        //    foreach (DataRow dr in ds.Tables[0].Rows)
        //    {
        //        Addresses address = new Addresses();
        //        address.content = (string)dr["DESCRIPTION"];
        //        address.lat = (double)dr["LAT"];
        //        address.lng = (double)dr["LNG"];
        //        AddressList.Add(address);
        //    }
        //    string jsonString = JsonConvert.SerializeObject(AddressList);
        //    ScriptManager.RegisterArrayDeclaration(Page, "markers", jsonString);
        //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), Guid.NewGuid().ToString(), "GoogleMap();", true);
        //}
        //MarkerHelper mh = new MarkerHelper();
        //DataSet ds = mh.SelectAllMarker();
        //rptMarkers.DataSource = ds;
        //rptMarkers.DataBind();
        #endregion
    }
    public static string ConvertDataTabletoString()
    {
        SqlConnection connection = new SqlConnection(@"server=Joseph\SQLEXPRESS;database=TestDB;integrated security=true");
        connection.Open();
        DataTable dt = new DataTable();
        SqlDataAdapter adapter = new SqlDataAdapter("select title=city,lat=latitude,lng=longitude,Desciption from [markers]", connection);
        adapter.Fill(dt);
        System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
        Dictionary<string, object> row;
        foreach (DataRow dr in dt.Rows)
        {
            row = new Dictionary<string, object>();
            foreach (DataColumn col in dt.Columns)
            {
                row.Add(col.ColumnName, dr[col]);
            }
            rows.Add(row);
        }
        return serializer.Serialize(rows);
    }

}