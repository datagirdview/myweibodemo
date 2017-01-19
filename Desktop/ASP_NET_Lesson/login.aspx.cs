using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
   //         message.html = "<div class=\"alert alert-danger alert-dismissable\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>Please enter a username and a password</div>";
            Label3.Text = Request.QueryString["word"];
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        MyADOCS myADO = new MyADOCS();
        SqlParameter[] myParam = { new SqlParameter("@un", SqlDbType.VarChar), new SqlParameter("@up", SqlDbType.VarChar) };
        DataTable mytb = new DataTable();
        myParam[0].Value = myusername.Text.Trim();
        myParam[1].Value = mypassword.Text.Trim();
        mytb=myADO.GetTablePRO("sel_userN_userP", ref myParam);
        if (mytb.Rows.Count > 0)
        {
            Session.Contents["loginN"] = myusername.Text.Trim();
            Response.Redirect("weibo.aspx");
        }
        else
        {
            Response.Redirect("Login.aspx?word=登录失败，请重新输入用户名和密码");
        }
    }

    protected void btnSignup_Click(object sender, EventArgs e)
    {
        Response.Redirect("reg.aspx");
    }
}