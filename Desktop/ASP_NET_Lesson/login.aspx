<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link href="css/bootstrap.css" rel="stylesheet" media="screen" />
<link href="css/main.css" rel="stylesheet" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="js/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <title></title>
</head>
<body style="background-image:url(image/back1.jpg);background-repeat:no-repeat">
  <div class="container" style="margin-top:150px">

      <form class="form-signin"  runat="server" name="form1" method="post">
        <h2 class="form-signin-heading text-center" style="color:white"><strong>登录</strong></h2>
        <asp:TextBox name="myusername" runat="server" id="myusername" type="text" class="form-control" placeholder="请输入用户名"></asp:TextBox>
        <asp:TextBox name="mypassword" runat="server" id="mypassword" type="password" class="form-control" placeholder="请输入密码"></asp:TextBox>
        <asp:Button name="Submit" runat="server" id="submit" class="btn btn-lg btn-primary btn-block" Text="登陆微博" type="submit" OnClick="Button1_Click"></asp:Button>
        <asp:Button runat="server" id="signup" class="btn btn-defult btn-block btn-lg" Text="一键注册" type="button" BackColor="white" OnClick="btnSignup_Click"></asp:Button>
        <asp:Label id="Label3" runat="server" ForeColor="White"></asp:Label>
      </form>

</div>


   
</body>
</html>
