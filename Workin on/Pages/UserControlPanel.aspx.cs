using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Pages_UserControlPanel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int UserID = (int)Session["userId"];
        if (!IsPostBack)
        {
            //for Show Control Panal Href
            if (Request.QueryString["index"] != null)
            {
                int Index = int.Parse(Request.QueryString["index"]);
                
                if(Index==3) // Add Advertisment
                {
                   
                   MultiUserPanal.ActiveViewIndex = Index;
                }
                else if (Index == 2) //User-Info
                {
                    UserHelper UserHelper = new UserHelper();
                    DataSet DsUserInfo = UserHelper.GetUserInfoByUsername((string)Session["userName"]);
                    tboxUserName.Text = DsUserInfo.Tables[0].Rows[0][4].ToString();
                    tboxFirstName.Text = DsUserInfo.Tables[0].Rows[0][2].ToString();
                    tboxLastName.Text = DsUserInfo.Tables[0].Rows[0][3].ToString();
                    tboxEmail.Text = DsUserInfo.Tables[0].Rows[0][5].ToString();
                    tboxCellPhone.Text = DsUserInfo.Tables[0].Rows[0][9].ToString();
                    MultiUserPanal.ActiveViewIndex = Index;
                }
                else
                    MultiUserPanal.ActiveViewIndex = Index;
            }
        }
    }

    protected void btnEditInfo_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserControlPanel.aspx?index=3");
    }
    protected void lbtnEditLastName_Click(object sender, EventArgs e)
    {
        tboxEditFirstName.Text = tboxFirstName.Text;
        tboxEditLastName.Text = tboxLastName.Text;
        divUserInformation.Visible = false;
        MultiUserInfo.ActiveViewIndex = 0;
    }
    protected void lbtnEditEmail_Click(object sender, EventArgs e)
    {
        tboxEditEmail.Text = tboxEmail.Text;
        divUserInformation.Visible = false;
        MultiUserInfo.ActiveViewIndex = 1;
    }
    protected void lbtnEditCellPhone_Click(object sender, EventArgs e)
    {
        tboxEditCellPhone.Text = tboxCellPhone.Text;
        divUserInformation.Visible = false;
        MultiUserInfo.ActiveViewIndex = 2;
    }
    protected void lbtnEditPassword_Click(object sender, EventArgs e)
    {
        divUserInformation.Visible = false;
        MultiUserInfo.ActiveViewIndex = 3;
    }
    protected void btnBackPerosnal_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserControlPanel.aspx?index=2");
    }
    protected void btnDonePersonalInfo_Click(object sender, EventArgs e)
    {
        USER myUser = new USER();
        myUser.FIRST_NAME = tboxEditFirstName.Text;
        myUser.LAST_NAME = tboxEditLastName.Text;
        UserHelper myhelper = new UserHelper();
        lblErrorPersonal.Text=myhelper.EditPersonalInfo(myUser, (int)Session["userId"]);
    }

    protected void btnDoneEmail_Click(object sender, EventArgs e)
    {
        USER myUser = new USER();
        myUser.EMAIL = tboxEditEmail.Text;
        UserHelper myhelper = new UserHelper();
        lblErrorEmail.Text = myhelper.EditEmail(myUser, (int)Session["userId"]);
    }
    protected void btnDoneCellPhone_Click(object sender, EventArgs e)
    {
        UserHelper myhelper = new UserHelper();
        bool Result=myhelper.CheckPhoneNumberByUsername(tboxEditCellPhone.Text);
        if (!Result)
        {
            USER myUser = new USER();
            myUser.CELLPHONE = tboxEditCellPhone.Text;
            lblErrorCellPhone.Text = myhelper.EditCellPhone(myUser, (int)Session["userId"]);
        }
        else
            lblErrorCellPhone.Text = "This Number Is Already Exist..";
        
    }
    protected void btnDoneEditPassword_Click(object sender, EventArgs e)
    {
        UserHelper MyHelper = new UserHelper();
        bool Result=MyHelper.CheckUserNameAndPassWord((string)Session["userName"], tboxOldPassword.Text);
        if (Result) 
        {
            USER myUser = new USER();
            myUser.PASSWORD = tboxNewPassword.Text;
           lblErrorPassword.Text=MyHelper.EditPassword(myUser, (int)Session["userId"]);
        }
        else
            lblErrorPassword.Text = "Error Password";
        
    }
}