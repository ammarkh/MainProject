using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for UserHelper
/// </summary>
public class UserHelper
{
    Helper MyHelper = new Helper();
    public DataSet SelectAllUsers()
    {
        MyHelper.OpenConnection();
        return MyHelper.ExcuteSelectQuery("select * from [USERS]");
    }
    public bool CheckUserNameAndPassWord(string UserName, string Password)
    {
        MyHelper.OpenConnection();
        DataSet Ds = this.SelectAllUsers();
        bool found = false;
        for (int i = 0; i < Ds.Tables[0].Rows.Count; i++)
        {
            if (UserName == Ds.Tables[0].Rows[i][4].ToString() && Password == Ds.Tables[0].Rows[i][6].ToString())
            {
                found = true;
            }
        }
        return found;
    }
    public string[] GetEmailAndRoleType(string UserName)
    {
        MyHelper.OpenConnection();
        DataSet ds = this.SelectAllUsers();
        string[] EmailAndRole = new string[2];
        int roleId=0;
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            if (UserName == ds.Tables[0].Rows[i][4].ToString())
            {
                EmailAndRole[0] = ds.Tables[0].Rows[i][5].ToString();
                roleId =(int)ds.Tables[0].Rows[i][1];
            }
        }
        MyHelper.OpenConnection();
        DataSet ds1 = MyHelper.ExcuteSelectQuery("select DESCRIPTION from ROLES where ROLE_ID='" + roleId + "'");
        EmailAndRole[1] = ds1.Tables[0].Rows[0][0].ToString();
        return EmailAndRole;
    }
    public DataSet GetUserInfoByUsername(string UserName)
    {
        MyHelper.OpenConnection();
        return MyHelper.ExcuteSelectQuery("select * from [USERS] where USERNAME='" + UserName + "'");
    }
    public String CheckUserNameAndEmail(string UserName, string Email)
    {
        MyHelper.OpenConnection();
        string Result = "";
        DataSet Ds = this.SelectAllUsers();
        bool foundUserName = false;
        bool foundEmail = false;
        for (int i = 0; i < Ds.Tables[0].Rows.Count; i++)
        {
            if (UserName == Ds.Tables[0].Rows[i][4].ToString())
                foundUserName = true;
            if (Email == Ds.Tables[0].Rows[i][5].ToString())
                foundEmail = true;
        }
        if (foundUserName == true && foundEmail == true)
        {
            Result = "UserName And Email is Already Exists..";
        }
        else if (foundUserName == false && foundEmail == true)
        {
            Result = "Email is Already Exists..";
        }
        else if (foundUserName == true && foundEmail == false)
        {
            Result = "UserName is Already Exists..";
        }
        else
        {
            Result = "Done";
        }
        return Result;
    }
    public bool CheckPhoneNumberByUsername(string PhoneNumber)
    {
        bool Found= false;
        DataSet ds = SelectAllUsers();
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            if (PhoneNumber == ds.Tables[0].Rows[i][9].ToString())
                Found = true;
        return Found;
    }
    public string AddNewUser(USER MyUser)
    {
        MyHelper.OpenConnection();
        return MyHelper.ExcuteNonQuary("insert into [USERS] (ROLE_ID,FIRST_NAME,LAST_NAME,USERNAME,EMAIL,PASSWORD,ACCOUNT_TYPE_ID,CELLPHONE,GENDER) values('" + MyUser.ROLE_ID + "','" + MyUser.FIRST_NAME + "','" + MyUser.LAST_NAME + "','" + MyUser.USERNAME + "','" + MyUser.EMAIL + "','" + MyUser.PASSWORD + "','" + MyUser.ACCOUNT_TYPE_ID + "','" + MyUser.CELLPHONE + "','" + MyUser.GENDER + "')");
    }
    public string EditPersonalInfo(USER myUser, int UserId)
    {
        MyHelper.OpenConnection();
        return MyHelper.ExcuteNonQuary("update [USERS] set FIRST_NAME='" + myUser.FIRST_NAME + "',LAST_NAME='" + myUser.LAST_NAME + "' where USER_ID='" + UserId + "' ");
    }
    public string EditEmail(USER myUser, int UserId)
    {
        MyHelper.OpenConnection();
        return MyHelper.ExcuteNonQuary("update [USERS] set EMAIL='" + myUser.EMAIL + "' where USER_ID='" + UserId + "' ");
    }
    public string EditCellPhone(USER myUser, int UserId)
    {
        MyHelper.OpenConnection();
        return MyHelper.ExcuteNonQuary("update [USERS] set CELLPHONE='" + myUser.CELLPHONE + "' where USER_ID='" + UserId + "' ");
    }
    public string EditPassword(USER myUser, int UserId)
    {
        MyHelper.OpenConnection();
        return MyHelper.ExcuteNonQuary("update [USERS] set PASSWORD='" + myUser.PASSWORD + "' where USER_ID='" + UserId + "' ");
    }

}