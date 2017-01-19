using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class All_NGZ_User : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {

            MyADOCS myADO1 = new MyADOCS();
            SqlParameter[] myParam = { new SqlParameter("@userN", SqlDbType.VarChar) };
            DataTable mytb1 = new DataTable();
            myParam[0].Value = Session.Contents["loginN"].ToString();
            mytb1 = myADO1.GetTablePRO("sel_user_Not_guanzhu", ref myParam);
            GridView1.DataSource = mytb1;
            GridView1.DataBind();
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "btn_GZ")
        {
            MyADOCS myADO1 = new MyADOCS();
            SqlParameter[] myParam = { new SqlParameter("@from_fan_userN", SqlDbType.VarChar), new SqlParameter("@target_userN", SqlDbType.VarChar) };
            myParam[0].Value = Session.Contents["loginN"].ToString();
            myParam[1].Value = e.CommandArgument.ToString();
            myADO1.ExecuteNonQueryPro("update_user_to_guanzhu", ref myParam);
           // Response.Redirect("All_NGZ_User.aspx");

        }
    }

}