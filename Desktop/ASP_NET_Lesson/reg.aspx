<%@ Page Language="C#" AutoEventWireup="true" CodeFile="reg.aspx.cs" Inherits="reg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" media="screen" />
    <link href="css/main.css" rel="stylesheet" media="screen" />
</head>
<body style="background-image:url(image/back3.jpg);background-repeat:no-repeat">
    <div class="container" style="margin-top:150px">
    <form id="form1" class="form-signup" runat="server">
         <h2 class="form-signup-heading text-center" style="color:white"><strong>注册</strong></h2>
        <asp:TextBox name="newuser" runat="server" id="newuser" type="text" class="form-control" placeholder="请输入用户名"></asp:TextBox>
        <asp:TextBox name="password1" runat="server" id="password1" type="password" class="form-control" placeholder="请输入密码"></asp:TextBox>
        <asp:Button name="Submit" runat="server" id="submit" class="btn btn-lg btn-primary btn-block" Text="注册微博" type="submit" OnClick="Button1_Click"></asp:Button>

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
