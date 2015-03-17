using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Pages_LogIn_signUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["UserInfo"] != null)
        {
            HttpCookie userInfoCookie = Request.Cookies["UserInfo"];
            tboxUsername.Text = userInfoCookie["UserName"];
            tboxPassword.Text = userInfoCookie["PassWord"];
        }
    }

    protected void signinbtn_Click(object sender, EventArgs e)
    {
        UserHelper Userhelper = new UserHelper();
        bool found = Userhelper.CheckUserNameAndPassWord(tboxUsername.Text, tboxPassword.Text);
        if (found)
        {
            if (cboxRememper.Checked)
            {
                HttpCookie UserInfoCookie = new HttpCookie("UserInfo");
                UserInfoCookie["UserName"] = tboxUsername.Text;
                UserInfoCookie["PassWord"] = tboxPassword.Text;
                UserInfoCookie.Expires = DateTime.Now.AddYears(1);
                Response.Cookies.Add(UserInfoCookie);
            }
            string[] EmailAndRole = Userhelper.GetEmailAndRoleType(tboxUsername.Text);
            Session["userName"] = tboxUsername.Text;
            Session["Email"] = EmailAndRole[0];
            Session["roldId"] = EmailAndRole[1];
            DataSet InfodataSet = Userhelper.GetUserInfoByUsername(tboxUsername.Text);
            Session["userId"] = InfodataSet.Tables[0].Rows[0][0];
            Response.Redirect("Home.aspx");
        }
        else
        {
            lblError.Text = "invild UserName Or Password";
            lblError.Visible = true;
        }
    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        UserHelper UserHelper = new UserHelper();
        string Result = UserHelper.CheckUserNameAndEmail(tboxuserNameSignUp.Text, tboxEmail.Text);
        if (Result == "Done")
        {
            Session["userName"] = tboxuserNameSignUp.Text;
            Session["Email"] = tboxEmail.Text;
            Session["passWord"] = tboxPasswordSignUp.Text;
            Session["roldId"] = "2";
            Response.Redirect("CompleteSignUp.aspx");
        }
        else
        {
            lblErrorSignUp.Text = Result;
            lblErrorSignUp.Visible = true;
        }
    }
}