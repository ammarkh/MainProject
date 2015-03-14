using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_UserControlPanel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //for Show Control Panal Href
            if (Request.QueryString["index"] != null)
            {
                int Index = int.Parse(Request.QueryString["index"]);
                MultiUserPanal.ActiveViewIndex = Index;
            }
        }
    }
}