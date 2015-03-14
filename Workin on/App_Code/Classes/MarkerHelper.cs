using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for MarkerHelper
/// </summary>
public class MarkerHelper
{
    Helper Helper_Marker;

    public MarkerHelper()
    {
        Helper_Marker = new Helper();
    }

    public DataSet SelectAllMarker()
    {
        Helper_Marker.OpenConnection();
        return Helper_Marker.ExcuteSelectQuery("select * from [MARKERS]");
    }

    public DataSet SelectAllMarkersXMLOutput()
    {
        Helper_Marker.OpenConnection();
        return Helper_Marker.ExcuteSelectQuery("Select * From [MARKERS] FOR XML RAW,elements,root(\'markers\')");
    }

    public int GetMasterId(string MarkerName)
    {
        int MasterId = -1;
        DataSet AllMarker = this.SelectAllMarker();
        for (int i = 0; i < AllMarker.Tables[0].Rows.Count; i++)
        {
            if (MarkerName == AllMarker.Tables[0].Rows[i][4].ToString())
            {
                MasterId = int.Parse(AllMarker.Tables[0].Rows[i][1].ToString());
                if (MasterId == -1)
                {
                    DataSet AllMaster = this.SelectAllMarker();
                    for (int j = 0; j < AllMaster.Tables[0].Rows.Count; j++)
                    {
                        if (MasterId < int.Parse(AllMaster.Tables[0].Rows[j][1].ToString()))
                        {
                            MasterId = int.Parse(AllMaster.Tables[0].Rows[j][1].ToString());
                        }
                    }
                    MasterId += 1;
                    Helper_Marker.OpenConnection();
                    Helper_Marker.ExcuteNonQuary("update [MARKERS]set [MASTER_ID]='" + MasterId + "' where [MARKER_NAME]='" + MarkerName + "'");
                }
                else
                {
                    return MasterId;
                }
            }
            else
            {
                MasterId = -1;
            }
        }
        return MasterId;
    }
    public void FlushMasterId(int MasterId)
    {
        Helper_Marker.OpenConnection();
        Helper_Marker.ExcuteNonQuary("update[MARKERS] set [MASTER_ID]='" + -1 + "'where [MASTER_ID]='" + MasterId + "'");
    }
    public DataSet GetMarkerInfoByMarkerName(string MarkerName)
    {
        Helper_Marker.OpenConnection();
        return Helper_Marker.ExcuteSelectQuery("select * from [MARKERS] where [MARKER_NAME]='" + MarkerName + "'");
    }
    public DataSet GetMarkerByUserId(string UserId)
    {
        Helper_Marker.OpenConnection();
        return Helper_Marker.ExcuteSelectQuery("select [MARKER_NAME]from [MARKERS] where [USER_ID]='" + UserId + "' ");
    }
    //public string AddMarker(MARKER NewMark)//this method is not finished yet;
    //{
    //    Helper_Marker.OpenConnection();
    //    return Helper_Marker.ExcuteNonQuary("insert into [MARKERS] (MASTER_ID,USER_ID,INITIALIZE_DATE,MARKER_NAME,DESCRIPTION,ADDRESS)values('" + NewMark.MASTER_ID + "','" + NewMark.USER_ID + "','" + NewMark.INITIALIZE_DATE + "','" + NewMark.MARKER_NAME + "','" + NewMark.DESCRIPTION + "','" + NewMark.ADDRESS + "')", null);
    //}
}