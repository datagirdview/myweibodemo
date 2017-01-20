<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myWeiBo.aspx.cs" Inherits="myWeiBo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="css/bootstrap.css" rel="stylesheet" media="screen" />
     <link href="css/landing-page.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="js/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <title></title>
</head>
<body>

        <nav class="navbar navbar-default navbar-fixed-top" style="background-color: #56b8ff" role="navigation">
        <div class="navbar-header"> <a class="navbar-brand" style="margin-left: 120px; color: white;"" href="#">我的微博</a></div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="weibo.aspx"  style="color: white;"><span class="glyphicon glyphicon-home"></span>首页 </a></li>
            <li><a href="login.aspx"  style="color: white;margin-right:120px"><span class="glyphicon glyphicon-log-out"></span>退出 </a></li>
        </ul>
    </nav>


    <form id="form1" runat="server" >
        <div class="mymain"> 
          <asp:ScriptManager ID="ScriptManager1" runat="server" > </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <div style="margin-top: 50px;">
                        <div style="text-align:center">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/weibo.aspx">返回微博首页</asp:HyperLink>
                            </div>
                        <br />


                        <div style=" width: 70%;margin:0 auto">
                            <div class="list-group" >

                                <br />
                                <asp:DataList ID="DataList3" runat="server" style="background-color:#e8e8e8" Width="100%" OnItemDataBound="DataList3_ItemDataBound" OnItemCommand="DataList3_ItemCommand" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" ForeColor="Black">
                                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />

                                    <ItemTemplate>

                                        <div class="list-group-item" style="padding-left: 150px; padding-right: 150px; margin-bottom: 10px;width:100%">
                                            <asp:Label ID="lbl_user" runat="server" Style="font-size: 12pt" Text='<%#DataBinder.Eval(Container.DataItem,"id_User").ToString()%>'></asp:Label>

                                            <asp:Label ID="lbl_date" runat="server" Style="font-size: 7pt" Text='<%#DataBinder.Eval(Container.DataItem,"wDate").ToString()%>'></asp:Label>
                                            <br />
                                            <br />
                                            &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                                            <asp:Label ID="lbl_wContent" runat="server" Style="font-size: 15pt" Text='<%#DataBinder.Eval(Container.DataItem,"wContent").ToString()%>'></asp:Label>
                                            
                                         <asp:Button ID="Button2" class="btn btn-default"  Text="删除"  style="float:right;background-color: #56b8ff; color: white" runat="server" CommandName="SC" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ID").ToString()%>' />

                                            <br />


                                            <asp:Image ID="Image2" runat="server" />




                                        
                                        <br />

                                        <asp:DataList ID="DataList4" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" style="margin:0 auto">
                                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                            <ItemTemplate>
                                                <asp:Label ID="Label7" runat="server" Height="21px" Text='<%# DataBinder.Eval(Container.DataItem,"from_UserN").ToString() +"："+ DataBinder.Eval(Container.DataItem,"pContent").ToString() %>' Width="360px"></asp:Label>
                                            </ItemTemplate>
                                            <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                        </asp:DataList>
                                        </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
 </div>
    </form>

</body>
</html>