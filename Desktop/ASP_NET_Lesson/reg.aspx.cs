using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class reg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        MyADOCS myADO = new MyADOCS();
        SqlParameter[] myParam = { new SqlParameter("@un", SqlDbType.VarChar), new SqlParameter("@up", SqlDbType.VarChar) };
        myParam[0].Value = newuser.Text;
        myParam[1].Value = password1.Text;
        myADO.ExecuteNonQueryPro("insert_user",ref myParam);
        Response.Redirect("login.aspx?word=成功注册一个新用户");
    }
}