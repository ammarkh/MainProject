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
    Helper Helper;

    public MarkerHelper()
    {
        Helper = new Helper();
    }

    public DataSet SelectAllMarker()
    {
        Helper.OpenConnection();
        return Helper.ExcuteSelectQuery("select * from [MARKERS]");
    }

    public DataSet SelectAllMarkersXMLOutput()
    {
        Helper.OpenConnection();
        return Helper.ExcuteSelectQuery("Select * From [MARKERS] FOR XML RAW,elements,root(\'markers\')");
    }
    public DataSet SelectAllMarkersTest()
    {
        Helper.OpenConnection();
        return Helper.ExcuteSelectQuery("select id=[MARKER_ID],master=[MASTER_ID],owner=[USER_ID],iniDate=[INITIALIZE_DATE],content=[DESCRIPTION],lat=[LAT],lng=[LNG] from [MARKERS]");
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
                    Helper.OpenConnection();
                    Helper.ExcuteNonQuary("update [MARKERS]set [MASTER_ID]='" + MasterId + "' where [MARKER_NAME]='" + MarkerName + "'");
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
        Helper.OpenConnection();
        Helper.ExcuteNonQuary("update[MARKERS] set [MASTER_ID]='" + -1 + "'where [MASTER_ID]='" + MasterId + "'");
    }
    public DataSet GetMarkerInfoByMarkerName(string MarkerName)
    {
        Helper.OpenConnection();
        return Helper.ExcuteSelectQuery("select * from [MARKERS] where [MARKER_NAME]='" + MarkerName + "'");
    }
    public DataSet GetMarkerByUserId(int UserId)
    {
        Helper.OpenConnection();
        return Helper.ExcuteSelectQuery("select * from [MARKERS] where [USER_ID]='" + UserId + "' ");
    }
    public DataSet GetMasterByUserId(int UserId)
    {
        Helper.OpenConnection();
        return Helper.ExcuteSelectQuery("select * from MARKERS where MASTER_ID=-1 and USER_ID='" + UserId + "'");
    }

    public int GetLastInsertedMarkerID()
    {
        DataSet allMarkers = SelectAllMarker();
        return Convert.ToInt32(allMarkers.Tables[0].Rows[allMarkers.Tables[0].Rows.Count - 1][0]);
    }

    public string AddMarker(MARKER toAdd)
    {
        Helper.OpenConnection();
        return Helper.ExcuteNonQuary("insert into [MARKERS] (USER_ID,MARKER_NAME,DESCRIPTION,LNG,LAT,ADDRESS) values(" + toAdd.USER_ID + ",'" + toAdd.MARKER_NAME + "','" + toAdd.DESCRIPTION + "'," + toAdd.LNG + "," + toAdd.LAT + ",'@" + toAdd.ADDRESS + "')");
    }
    public string AddBranch(MARKER toAdd)
    {
        Helper.OpenConnection();
        return Helper.ExcuteNonQuary("insert into [MARKERS] (USER_ID,MASTER_ID,MARKER_NAME,DESCRIPTION,LNG,LAT,ADDRESS) values(" + toAdd.USER_ID + "," + toAdd.MASTER_ID + ",'" + toAdd.MARKER_NAME + "','" + toAdd.DESCRIPTION + "'," + toAdd.LNG + "," + toAdd.LAT + ",'@" + toAdd.ADDRESS + "')");
    }
}