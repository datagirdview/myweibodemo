   <%@ Page Language="C#" AutoEventWireup="true" CodeFile="weibo.aspx.cs" Inherits="weibo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="css/bootstrap.css" rel="stylesheet" media="screen" />
     <link href="css/landing-page.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="background-color:#e8e8e8;">


    <nav class="navbar navbar-default navbar-fixed-top" style="background-color: #56b8ff" role="navigation">
        <div class="navbar-header"> <a class="navbar-brand" style="margin-left: 120px; color: white;"" href="#">自制DEMO</a></div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="login.aspx"  style="margin-right: 120px; color: white;""><span class="glyphicon glyphicon-log-out"></span>退出 </a></li>
        </ul>
    </nav>



    <div class="mymain">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

         <div id="mybackgroundimg" runat="server" style="background:url(image/vncckgzd6bi-sandis-helvigs.jpg);width:100%;height:500px;margin-top:70px;text-align:match-parent;padding-top:200px">
             <div style="width:100%;text-align:center;">
                 <asp:Image id="myheadimg" runat="server" class="img-circle" style="background-image:url(image/head.png);border-radius: 50%; height: 100px; width: 100px;margin:0 auto;background-size:contain;" />
             </div>
             <div style="margin-top:20px;width:100%;text-align:center;">
                 <asp:Label ID="Label1" runat="server" Text="Label"  Font-Size="25pt" ForeColor="White"></asp:Label>
             </div>
            <div style="margin-top:20px;width:100%;">
                <ul class="nav nav-pills" style="width:331px; margin-left: 0px;text-align:center;margin:0 auto">
                    <li style="float:left;background-color:#56b8ff;border-radius:10%;margin-right:10px;">
                        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/All_NGZ_User.aspx" Style="color: white;font-family:DengXian" Class="mycustombutton">未关注</asp:LinkButton></li>
                    <li style="float:left;background-color:#56b8ff;border-radius:10%;margin-right:10px;">
                        <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/All_GZ_User.aspx" Style="color: white;" Class="mycustombutton">已关注</asp:LinkButton></li>
                    <li style="float:left;background-color:#56b8ff;border-radius:10%;margin-right:10px;">
                        <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/All_BGZ.aspx" Style="color: white" Class="mycustombutton">被关注</asp:LinkButton></li>
                    <li style="float:left;background-color:#56b8ff;border-radius:10%">
                        <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/myWeiBo.aspx" Style="color: white" Class="mycustombutton">已发博</asp:LinkButton></li>
                </ul>
            </div>
                      
        </div>

        <div style="float: right; width: 28%;">

            <div class="panel panel-primary" style="margin-top: 10px; border: 0px solid #56b8ff;">
                <div class="panel-body" style="width: 100%; text-align: center; padding: 0px">

                    <asp:Label ID="Label2" runat="server" Text="关注的用户" class="list-group-item" Style="background-color: #56b8ff; color: white"></asp:Label>
                    <asp:DataList ID="DataList1" runat="server" Style="width: 100%; text-align: center">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" class="list-group-item" runat="server" Text='<%#Eval("target_userN")%>' NavigateUrl='<%#Eval("target_userN","weibo_user.aspx?id={0}") %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:DataList>

                </div>
            </div>

            <div class="panel panel-primary" style="border: 0px solid #56b8ff;">
                <div class="panel-body" style="width: 100%; text-align: center; padding: 0px">

                    <asp:Label ID="Label3" runat="server" Text="点赞最多" class="list-group-item" Style="background-color: #56b8ff; color: white"></asp:Label>
                    <asp:DataList ID="DataList5" runat="server" Style="width: 100%; text-align: center">
                        <ItemTemplate>

                            <asp:LinkButton ID="HyperLink2" class="list-group-item" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"wContent").ToString().Substring(0,5)+numZ%>'>
                   
                            </asp:LinkButton>


                        </ItemTemplate>
                    </asp:DataList>

                </div>
            </div>
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server"  UpdateMode="Conditional" ChildrenAsTriggers="true">
                        <ContentTemplate>
        
<div class="panel panel-primary" style="margin-top:10px;width:70%;float:left;border: 0px solid #56b8ff;">
    <div class="panel-body">

    
        <div class="form-group" style="padding:10px;">
     <asp:Label ID="Label4" runat="server" Text="说一说现在的心情吧！" Width="160px"></asp:Label>
        <br />
            <br />
     <asp:TextBox ID="TextBox1" class="form-control" runat="server" Height="69px" MaxLength="140" TextMode="MultiLine" Width="100%"></asp:TextBox>
                <br />
                <asp:FileUpload ID="FileUpload1" runat="server" class="glyphicon glyphicon-picture"  style="float:left" />
            <div style="width: 332px;float:right;margin-right:0px">    
            <asp:Image ID="Image1" runat="server" Height="16px"  style="float:left" />
                <asp:Button ID="btn_IMG" runat="server" style="float:left;margin-right:5px" OnClick="btn_IMG_Click" Text="上传" class="btn btn-defult" Width="148px" Height="33px" />
                <asp:Button ID="btn_W" runat="server" Height="33px" OnClick="Button1_Click" class="btn btn-defult" Text="发表微博" Width="148px" style="float:left;background-color:#56b8ff;color:white"  />
                </div>
    </div>
        </div>
</div>

        

       <!-- <asp:DataList ID="DataList2" runat="server">
            <ItemTemplate>
                <asp:HyperLink ID="HyperLink2" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"wContent").ToString() + DataBinder.Eval(Container.DataItem,"id_User").ToString()%>' NavigateUrl='<%#"weibo_Content.aspx?ID="+DataBinder.Eval(Container.DataItem,"ID")+"&id_User="+DataBinder.Eval(Container.DataItem,"id_User")%>'></asp:HyperLink>
            </ItemTemplate>
        </asp:DataList>-->

        


        <div style="float: left; width: 70%;">
            <div class="list-group">
                <asp:Label ID="Label6" runat="server" Text="最新微博" Style="float: left; width: 100%; background-color: #56b8ff; color: white" class="list-group-item"></asp:Label>



                <br />
                      
                        <asp:DataList ID="DataList3" runat="server" Width="100%" Height="106px" OnItemCommand="DataList3_ItemCommand" OnItemDataBound="DataList3_ItemDataBound" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" ForeColor="Black">
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />

                            <ItemTemplate>

                                <div class="list-group-item" style="padding-left: 150px; padding-right: 150px; margin-bottom: 10px">
                                    <asp:Label ID="lbl_user" runat="server" Style="font-size: 12pt" Text='<%#DataBinder.Eval(Container.DataItem,"id_User").ToString()%>'></asp:Label>

                                    <asp:Label ID="lbl_date" runat="server" Style="font-size: 7pt" Text='<%#DataBinder.Eval(Container.DataItem,"wDate").ToString()%>'></asp:Label>
                                    <br />
                                    <br />
                                    &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<asp:Label ID="lbl_wContent" runat="server" Style="font-size: 15pt" Text='<%#DataBinder.Eval(Container.DataItem,"wContent").ToString()%>'></asp:Label>
                                    <br />


                                    <asp:Image ID="Image2" runat="server" />
                                    <br />

                                            <div class="row">
                                                <div class="input-group">
                                                    <asp:TextBox ID="txt_P" runat="server" class="form-control"></asp:TextBox>
                                                    <span class="input-group-btn">
                                                        <asp:Button ID="Button1" Text="评论" class="btn btn-default" Style="background-color: #56b8ff; color: white" runat="server" CommandName="PL" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ID").ToString()%>' />
                                                        <asp:Button ID="Button2" class="btn btn-default" runat="server" CommandName="DZ" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ID").ToString()%>' />
                                                    </span>
                                                </div>
                                            </div>
                                            <br />

                                            <asp:DataList ID="DataList4" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Label7" runat="server" Height="21px" Text='<%# DataBinder.Eval(Container.DataItem,"from_UserN").ToString() +"："+ DataBinder.Eval(Container.DataItem,"pContent").ToString() %>' Width="360px"></asp:Label>
                                                </ItemTemplate>
                                                <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                            </asp:DataList>
                                        
                                </div>
                            </ItemTemplate>

                            <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        </asp:DataList>              
                               </div>
        </div>
              </ContentTemplate>
                          <Triggers>
                              <asp:AsyncPostBackTrigger ControlID="btn_W" />
                          </Triggers>
                                    </asp:UpdatePanel>

    </form>
        </div>


     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery-2.2.4.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <!-- The AJAX login script -->
    <script src="js/login.js"></script>
</body>
</html>
