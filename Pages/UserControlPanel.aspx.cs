using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_UserControlPanel : System.Web.UI.Page
{
    MarkerHelper markerHelper = new MarkerHelper();
    GenreHelper genreHelper = new GenreHelper();
    PhoneHelper phoneHelper = new PhoneHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        hfDeterminOP.Value = "branch";
        if (!IsPostBack)
        {
            //for Show Control Panal Href
            if (Request.QueryString["index"] != null)
            {
                int Index = int.Parse(Request.QueryString["index"]);
                MultiUserPanal.ActiveViewIndex = Index;
            }
            DataSet allGenres = genreHelper.SelectAllGeners();
            ddlSelectGenre.DataSource = allGenres.Tables[0];
            ddlSelectGenre.DataTextField = "DESCRIPTION";
            ddlSelectGenre.DataValueField = "GENER_ID";
            ddlSelectGenre.DataBind();
            ddlSelectGenre.Attributes["onChange"] = "ChangeLabelText();";
        }
    }
    protected void btnSubmitMarker_Click(object sender, EventArgs e)
    {
        //Adding Marker
        if (hfSelectedID.Value.Length == 0)
        {
            MARKER markerToAdd = new MARKER();
            //markerToAdd.USER_ID = (int)Session["userId"];
            markerToAdd.USER_ID = 18;
            markerToAdd.MARKER_NAME = tboxMarkerName.Value;
            markerToAdd.LAT = Convert.ToDecimal(hfLat.Value);
            markerToAdd.LNG = Convert.ToDecimal(hfLng.Value);
            markerToAdd.DESCRIPTION = tboxDescription.Value;
            markerToAdd.TYPE = hfSelectedGenre.Value;
            markerToAdd.ADDRESS = hfAddress.Value;
            string result = markerHelper.AddMarker(markerToAdd);
            queryTest.Text = result;
        }
        //Adding Branch
        else if (hfSelectedID.Value.Length > 0)
        {
            DataSet usersMarkers = markerHelper.GetMasterByUserId(18);
            int SelectedMasterID = Convert.ToInt32(usersMarkers.Tables[0].Rows[Convert.ToInt32(hfSelectedID.Value)][0]);
            MARKER markerToAdd = new MARKER();
            //markerToAdd.USER_ID = (int)Session["userId"];
            markerToAdd.USER_ID = 18;
            markerToAdd.MASTER_ID = SelectedMasterID;
            markerToAdd.LAT = Convert.ToDecimal(hfLat.Value);
            markerToAdd.LNG = Convert.ToDecimal(hfLng.Value);
            markerToAdd.DESCRIPTION = tboxDescription.Value;
            markerToAdd.ADDRESS = hfAddress.Value;
            markerToAdd.TYPE = hfSelectedGenre.Value;
            string result = markerHelper.AddBranch(markerToAdd);
            queryTest.Text = result;
            hfSelectedID.Value = string.Empty;
        }
        //Adding Phone Number
        if (tboxPhone.Value.Length > 0)
        {

            PHONE phoneToAdd = new PHONE();
            phoneToAdd.MARKER_ID = markerHelper.GetLastInsertedMarkerID();
            phoneToAdd.PHONE_NUMBER = tboxPhone.Value;
            phoneHelper.AddPhoneNumber(phoneToAdd);
        }
    }
}