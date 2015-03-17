using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class PhoneHelper
{
    Helper helper;
    public PhoneHelper()
    {
        helper = new Helper();
    }

    public string AddPhoneNumber(PHONE toAdd)
    {
        helper.OpenConnection();
        return helper.ExcuteNonQuary("insert into [PHONES] (MARKER_ID,PHONE_NUMBER) values(" + toAdd.MARKER_ID + ",'" + toAdd.PHONE_NUMBER + "')");
    }
}