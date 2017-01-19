using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class weibo_user : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Page.IsPostBack == false)
        {
            string a = Request["id"];
            MyADOCS myADO3 = new MyADOCS();
            SqlParameter[] myParam2 = { new SqlParameter("@id_User", SqlDbType.VarChar) };
            DataTable mytb3 = new DataTable();
            myParam2[0].Value = a;
            mytb3 = myADO3.GetTablePRO("sel_myWeiBo", ref myParam2);
            DataList3.DataSource = mytb3;
            DataList3.DataBind();
        }
    }
    protected void DataList3_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        //DataList dataList = (DataList)e.Item.FindControl("DataList4");
        DataList datalist = e.Item.FindControl("DataList4") as DataList;
        //DataRowView myRowView = (DataRowView)e.Item.DataItem;
        DataRowView myRowView = e.Item.DataItem as DataRowView;
        int mainID = Convert.ToInt32(myRowView["ID"]);
        SqlParameter[] myParam = { new SqlParameter("@id_WeiBo", SqlDbType.BigInt) };
        if (mainID > 0)
        {
            MyADOCS myADO1 = new MyADOCS();
            DataTable mytb1 = new DataTable();
            myParam[0].Value = mainID;
            mytb1 = myADO1.GetTablePRO("sel_P", ref myParam);
            if (mytb1 != null)
            {
                datalist.DataSource = mytb1;
                datalist.DataBind();
            }
        }
    }
}