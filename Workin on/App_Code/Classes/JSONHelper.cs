using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Script.Serialization;

public static class JSONHelper
{
    static MarkerHelper mh = new MarkerHelper();

    public static string SerializeDataset(DataSet ds)
    {
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
        Dictionary<string, object> row;
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            row = new Dictionary<string, object>();
            foreach (DataColumn col in ds.Tables[0].Columns)
            {
                row.Add(col.ColumnName, dr[col]);
            }
            rows.Add(row);
        }
        return serializer.Serialize(rows);
    }

    public static string AllMarkers()
    {
        DataSet ds = mh.SelectAllMarker();
        return SerializeDataset(ds);
    }
    public static string MarkersViaUser(int userID)
    {
        return "";
    }
    public static string GetMasterMarkerByUserId(int UserId) 
    {
        return "";
    }
}