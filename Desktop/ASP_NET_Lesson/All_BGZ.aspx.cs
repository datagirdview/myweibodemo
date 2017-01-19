using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class All_BGZ : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            MyADOCS myADO1 = new MyADOCS();
            SqlParameter[] myParam = { new SqlParameter("@target_userN", SqlDbType.VarChar) };
            DataTable mytb1 = new DataTable();
            myParam[0].Value = Session.Contents["loginN"].ToString();
            mytb1 = myADO1.GetTablePRO("sel_user_bguanzhu", ref myParam);
            GridView1.DataSource = mytb1;
            GridView1.DataBind();
        }
    }

}