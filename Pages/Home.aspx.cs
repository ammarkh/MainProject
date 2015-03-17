using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbl.Text = "userName is : " + (string)Session["userName"] + ",  email is :" + (string)Session["Email"] + ",  role is :" + (string)Session["roldId"] + ", UserId is : " + (int)Session["userId"];
    }
    protected void btnPanal_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserControlPanel.aspx");
    }
}