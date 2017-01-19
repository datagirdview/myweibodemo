using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

public partial class weibo : System.Web.UI.Page
{
    public string numZ = "...";
    public string a;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            Label1.Text = Session.Contents["loginN"].ToString();
            MyADOCS myADO1 = new MyADOCS();
            SqlParameter[] myParam = { new SqlParameter("@from_fan_userN", SqlDbType.VarChar)};
            DataTable mytb1 = new DataTable();
            myParam[0].Value = Session.Contents["loginN"].ToString();
            mytb1 = myADO1.GetTablePRO("sel_tFollow_guanzhu", ref myParam);
            DataList1.DataSource = mytb1;
            DataList1.DataBind();

            MyADOCS myADO2 = new MyADOCS();
            DataTable mytb2 = new DataTable();
            mytb2 = myADO2.GetTablePROn("sel_top10_Z");
            DataList2.DataSource = mytb2;
            DataList2.DataBind();

            MyADOCS myADO3 = new MyADOCS();
            SqlParameter[] myParam2 = { new SqlParameter("@UserN", SqlDbType.VarChar) };
            DataTable mytb3 = new DataTable();
            myParam2[0].Value = Session.Contents["loginN"].ToString();
            mytb3 = myADO3.GetTablePRO("sel_tWeiBo_guanzhu", ref myParam2);
            DataList3.DataSource = mytb3;
            DataList3.DataBind();

            MyADOCS myADO4 = new MyADOCS();
            DataTable mytb4 = new DataTable();
            mytb4 = myADO4.GetTablePROn("sel_top4_Z");
            DataList5.DataSource = mytb4;
            DataList5.DataBind();

            MyADOCS myADO5 = new MyADOCS();
            SqlParameter[] myPara3 = { new SqlParameter("@userN",SqlDbType.VarChar) };
            DataTable mytb5 = new DataTable();
            myPara3[0].Value = Session.Contents["loginN"].ToString();
            mytb5 = myADO5.GetTablePRO("sel_the_head_and_back", ref myPara3);
            myheadimg.Style["background-image"]="url("+mytb5.Rows[0][0].ToString()+")";
            mybackgroundimg.Style["background"] = "url(" + mytb5.Rows[0][1].ToString() + ")";

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        MyADOCS myADO = new MyADOCS();
        SqlParameter[] myParam = { new SqlParameter("@wContent", SqlDbType.VarChar), new SqlParameter("@id_user", SqlDbType.VarChar) };

        myParam[0].Value = TextBox1.Text;
        myParam[1].Value = Session.Contents["loginN"].ToString();
        myADO.ExecuteNonQueryPro("insert_tWeiBo", ref myParam);

        MyADOCS myADO3 = new MyADOCS();
        SqlParameter[] myParam2 = { new SqlParameter("@UserN", SqlDbType.VarChar) };
        DataTable mytb3 = new DataTable();
        myParam2[0].Value = Session.Contents["loginN"].ToString();
        mytb3 = myADO3.GetTablePRO("sel_tWeiBo_guanzhu", ref myParam2);
        DataList3.DataSource = mytb3;
        DataList3.DataBind();
        TextBox txtmu = TextBox1;
        txtmu.Text = "";

    }

    protected void btn_IMG_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string myPath = System.Web.HttpContext.Current.Request.MapPath("/");
            string myFileName = DateTime.Now.ToString();
            myFileName = myFileName.Replace("/", "");
            myFileName = myFileName.Replace(":", "");
            myFileName = myFileName.Replace(" ", "");
            //Response.Write(myFileName);
            FileUpload1.SaveAs(myPath +"/image/" + myFileName +".jpg");
            Image1.ImageUrl = "image/"+myFileName + ".jpg";
            MyADOCS myADO = new MyADOCS();
            SqlParameter[] myParam = { new SqlParameter("@URL", SqlDbType.VarChar) };

            myParam[0].Value = Image1.ImageUrl.ToString();
            myADO.ExecuteNonQueryPro("insert_tIMG", ref myParam);
            btn_IMG.Text = "成功上传一副图片";
        }
    }

    protected void DataList3_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "PL") 
        { 
        TextBox tt = (TextBox)e.Item.FindControl("txt_P");
        MyADOCS myADO1 = new MyADOCS();
        SqlParameter[] myParam = { new SqlParameter("@id_WeiBo", SqlDbType.BigInt), new SqlParameter("@pContent", SqlDbType.VarChar), new SqlParameter("@from_userN", SqlDbType.VarChar) };
        DataTable mytb1 = new DataTable();
        myParam[0].Value = e.CommandArgument;
        myParam[1].Value = tt.Text;
        myParam[2].Value = Session.Contents["loginN"].ToString();
        mytb1 = myADO1.GetTablePRO("insert_tP", ref myParam);
        DataList1.DataSource = mytb1;
        DataList1.DataBind();

       
        //DataList dataList = (DataList)e.Item.FindControl("DataList4");
        DataList datalist = e.Item.FindControl("DataList4") as DataList;
        int mainID = Convert.ToInt32(e.CommandArgument);
        SqlParameter[] myParam1 = { new SqlParameter("@id_WeiBo", SqlDbType.BigInt) };
        if (mainID > 0)
        {
            MyADOCS myADO2 = new MyADOCS();
            DataTable mytb2 = new DataTable();
            myParam1[0].Value = mainID;
            mytb2 = myADO2.GetTablePRO("sel_P", ref myParam1);
            if (mytb2 != null)
            {
                datalist.DataSource = mytb2;
                datalist.DataBind();
            }
            tt.Text = "";
        }
        MyADOCS myADO3 = new MyADOCS();
        SqlParameter[] myParam2 = { new SqlParameter("@UserN", SqlDbType.VarChar) };
        DataTable mytb3 = new DataTable();
        myParam2[0].Value = Session.Contents["loginN"].ToString();
        mytb3 = myADO3.GetTablePRO("sel_tWeiBo_guanzhu", ref myParam2);
        DataList3.DataSource = mytb3;
        DataList3.DataBind();
        }
        if (e.CommandName == "DZ") {
            MyADOCS myADO1 = new MyADOCS();
            SqlParameter[] myParam = { new SqlParameter("@id_WeiBo", SqlDbType.BigInt), new SqlParameter("@from_userN", SqlDbType.VarChar) };
            DataTable mytb2 = new DataTable();
            myParam[0].Value = e.CommandArgument;
            myParam[1].Value = Session.Contents["loginN"].ToString();
            mytb2 = myADO1.GetTablePRO("insert_tZ", ref myParam);
            DataList1.DataSource = mytb2;
            DataList1.DataBind();
            //Response.Redirect("weibo.aspx");     


            DataList datalist1 = e.Item.FindControl("DataList3") as DataList;
            MyADOCS myADO2 = new MyADOCS();
            DataTable mytb3 = new DataTable();
            SqlParameter[] myParam1 = { new SqlParameter("@id_WeiBo", SqlDbType.BigInt) };
            int mainID = Convert.ToInt32(e.CommandArgument);
            myParam1[0].Value = mainID;
            mytb3 = myADO2.GetTablePRO("sel_count_zan", ref myParam1);

            Button btn = e.Item.FindControl("Button2") as Button;
            if (mytb3 != null)
            {
              if (btn != null)
                {

                    btn.Text = mytb3.Rows.Count + "个赞";
                }
                else
                {
                    btn.Text = "0个赞";
                }
            }
            DataList datalist2 = e.Item.FindControl("DataList3") as DataList;
            MyADOCS myADO3 = new MyADOCS();
            DataTable mytb4 = new DataTable();
            SqlParameter[] myParam2 = { new SqlParameter("@id_WeiBo", SqlDbType.BigInt), new SqlParameter("@from_userN", SqlDbType.VarChar) };
            myParam2[0].Value = mainID;
            myParam2[1].Value = Session.Contents["loginN"].ToString();
            mytb4 = myADO3.GetTablePRO("confirm_tZ", ref myParam2);
            Button zan = e.Item.FindControl("Button2") as Button;
            if (mytb4.Rows.Count >= 1)
            {
                zan.CssClass = "btn btn-defult disabled";
                zan.ForeColor = System.Drawing.Color.White;
                zan.BackColor = System.Drawing.Color.Gray;
            }
            MyADOCS myADO7 = new MyADOCS();
            SqlParameter[] myParam7 = { new SqlParameter("@UserN", SqlDbType.VarChar) };
            DataTable mytb7 = new DataTable();
            myParam7[0].Value = Session.Contents["loginN"].ToString();
            mytb7 = myADO7.GetTablePRO("sel_tWeiBo_guanzhu", ref myParam7);
            DataList3.DataSource = mytb7;
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
        DataList datalist1 = e.Item.FindControl("DataList3") as DataList;
        MyADOCS myADO2 = new MyADOCS();
        DataTable mytb2 = new DataTable();
        SqlParameter[] myParam1 = { new SqlParameter("@id_WeiBo", SqlDbType.BigInt) };
        myParam1[0].Value = mainID;
        mytb2 = myADO2.GetTablePRO("sel_count_zan", ref myParam1);
        //foreach (DataListItem item in DataList3.Items)
        //{
        
            Button btn =e.Item.FindControl("Button2") as Button;
            if (mytb2 != null)
            {


                if (btn != null)
                {
                    btn.Text =mytb2.Rows.Count.ToString()+"个赞";
                }



            //}
            else
           {
               btn.Text = "0个赞";
            }
        }

          DataList datalist2 = e.Item.FindControl("DataList3") as DataList;
          MyADOCS myADO3 = new MyADOCS();
          DataTable mytb3 = new DataTable();
          SqlParameter[] myParam2 = { new SqlParameter("@id_WeiBo", SqlDbType.BigInt), new SqlParameter("@from_userN", SqlDbType.VarChar) };
          myParam2[0].Value = mainID;
          myParam2[1].Value = Session.Contents["loginN"].ToString();
          mytb3 = myADO3.GetTablePRO("confirm_tZ", ref myParam2);
          Button zan = e.Item.FindControl("Button2") as Button;
          if (mytb3.Rows.Count >= 1) {
              zan.CssClass = "btn btn-defult disabled";
              zan.ForeColor = System.Drawing.Color.White;
              zan.BackColor = System.Drawing.Color.Gray;
          }
    }


}