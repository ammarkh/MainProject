using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

public class GenreHelper
{
    Helper helper;
    public GenreHelper()
    {
        helper = new Helper();
    }

    public DataSet SelectAllGeners()
    {
        return helper.ExcuteSelectQuery("select * from [GENERS]");
    }
}