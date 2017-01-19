<%@ Page Language="C#" AutoEventWireup="true" CodeFile="All_GZ_User.aspx.cs" Inherits="All_GZ_User" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="css/bootstrap.css" rel="stylesheet" media="screen" />
     <link href="css/landing-page.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

</head>
<body>
   
    <nav class="navbar navbar-default navbar-fixed-top" style="background-color: #56b8ff" role="navigation">
        <div class="navbar-header"> <a class="navbar-brand" style="margin-left: 120px; color: white;"" href="#">已关注的微博用户列表</a></div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="weibo.aspx"  style="color: white;"><span class="glyphicon glyphicon-home"></span>首页 </a></li>
            <li><a href="login.aspx"  style="color: white;margin-right:120px"><span class="glyphicon glyphicon-log-out"></span>退出 </a></li>
        </ul>
    </nav>
 <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
             <ContentTemplate>

      
       <div class="mymain" style="margin-top:70px;text-align:left;text-align:center">
         
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/weibo.aspx">返回微博首页</asp:HyperLink>
     <br />
        
        <asp:GridView ID="GridView1" style="margin:0 auto;" OnRowCommand="GridView1_RowCommand" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" RowStyle-Height="20px" Width="55%" Font-Size="15pt">
             
            <Columns>
                <asp:BoundField DataField="ID" />
                <asp:BoundField DataField="userN" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="btn_QGZ" runat="server" style="width:auto" CausesValidation="false" CommandName="" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"userN").ToString()%>' Text="取消关注"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>   
            <RowStyle ForeColor="#000066" Height="20px"/>
           <HeaderStyle HorizontalAlign="Center" BackColor="#56b8ff"/>
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />   
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        </asp:GridView>    

   
    </div>
    </ContentTemplate>
       
        </asp:UpdatePanel>
     </form>

</body>
</html>
