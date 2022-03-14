<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="Shopping.SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SignIn</title>

     <meta charset ="utf-8" >
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <link href="css/Custom.css" rel="stylesheet" />
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <style type="text/css">
        .auto-style1 {
            width: 822px;
            height: 565px;
            position : absolute;
            top: 27px;
            bottom: -54px;
            left: 38px;
            right: 425px;
            margin : auto;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
         <div>
             <div>
            <div class ="navbar navbar-default navbar-fixed-top" role ="navigation">
                <div class ="container">
                    <div class="navbar-header">
                        <button type ="button" class = "navbar-toggle" data-toggle ="collapse" data-target = ".navbar-collapse">
                            <span class ="sr-only"> Toggle navigation </span>
                            <span class ="icon-bar"></span>
                            <span class ="icon-bar"></span>
                            <span class ="icon-bar"></span>

                        </button>
                        <a class ="navbar-brand" href="Default.aspx">
                            <span><img src="Icons/Panda-icon.png" alt =" Panda Cart" height ="35"/></span> Panda Cart</a>
                    </div>
                    <div class ="navbar-collapse collapse ">
                        <ul class ="nav navbar-nav navbar-right">
                            <li><a href ="Default.aspx" >Home</a> </li>
                             <li><a href ="#" >About</a> </li>
                              <li><a href ="#" >Contact Us</a> </li>                               
                            <li class ="dropdown">
                                <a href ="#" class ="dropdown-toggle" data-toggle="dropdown">Products<b class="caret"></b></a>
                                <ul class ="dropdown-menu">
                                    <li class ="dropdown-header">Men</li> 
                                    <li role ="separator" class ="divider"></li>
                                    <li> <a href ="#">Shirts</a></li>
                                    <li> <a href ="#">Pants</a></li>
                                    <li> <a href ="#">Denims</a></li>
                                    <li role ="separator" class ="divider"></li>
                                    <li class ="dropdown-header">Watches</li>
                                    <li role ="separator" class ="divider"></li>
                                    <li> <a href ="#">Classic</a></li>
                                    <li> <a href ="#">Sport</a></li>
                                    <li> <a href ="#">Digital</a></li>
                                    <li role ="separator" class ="divider"></li>
                                    <li class ="dropdown-header">Mobiles</li>
                                    <li role ="separator" class ="divider"></li>
                                    <li> <a href ="#">Iphone</a></li>
                                    <li> <a href ="#">Motorola</a></li>
                                    <li> <a href ="#">Nokia</a></li>
                                     <li role ="separator" class ="divider"></li>
                                    <li class ="dropdown-header">Shoes</li>
                                    <li role ="separator" class ="divider"></li>
                                    <li> <a href ="#">Adidas</a></li>
                                    <li> <a href ="#">Nike</a></li>
                                    <li> <a href ="#">Sparx</a></li>
                                </ul>
                            </li>
                            <li><a href= "SignUp.aspx">SignUp</a> </li>
                            <li class ="active"><a href= "SignIn.aspx">SignIn</a> </li>
                        </ul>
                   </div>
                </div>
              </div>
             </div>
            </div>
        <!--SignIn Form Starts-->
             <div class ="auto-style1">
                 <div class ="form-horizontal">
                     <h2>Login</h2>
                     <hr />
                   <div class ="form-group">
                    <asp:Label ID="Label1" CssClass ="col-md-2 control-label" runat="server" Text="UserId"></asp:Label>
                      <div class ="col-md-5">

                         <asp:TextBox ID="txtUsername" CssClass ="form-control" runat="server"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserId" runat="server" CssClass="txt-danger" ErrorMessage="Please Enter UserId" ControlToValidate="txtUsername" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                 </div>

                     <div class ="form-group">
                    <asp:Label ID="Label2" CssClass ="col-md-2 control-label" runat="server" Text="Password"></asp:Label>
                          

                      <div class ="col-md-5">

                         <asp:TextBox ID="txtPass" CssClass ="form-control" runat="server" TextMode="Password"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="txt-danger" ErrorMessage="Please Enter Password" ControlToValidate="txtPass" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                 </div>
                     <div class ="form-group">

                      <div class ="col-md-6">
                          <asp:CheckBox ID="CheckBox1" runat="server" />
                          <asp:Label ID="Label3" CssClass ="control-label" runat="server" Text="Remember Me"></asp:Label>
                    </div>
                 </div>

                     <div class ="form-group">
                      <div class =" col-md-2"></div>
                      <div class ="col-md-6">
                         
                       <asp:Button ID="btnLogin" CssClass="btn btn-success" runat="server" Text="Login&raquo;" OnClick="btnLogin_Click" />
                          <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SignUp.aspx">Sign Up</asp:HyperLink>
                    </div>
                 </div>
                     <!--Forgot Password-->
                     <div class ="form-group">
                      <div class =" col-md-2"></div>
                      <div class ="col-md-6">
                          <asp:HyperLink ID="HyForgotPass" runat="server" NavigateUrl="~/ForgotPassword.aspx">Forgot Password</asp:HyperLink>
                    </div>
                       
                 </div>
                     <!-- Forgot password Ends-->




                     <div class ="form-group">
                      <div class =" col-md-2"></div>
                      <div class ="col-md-6">
                            <asp:Label ID="lblError" CssClass="txt-danger" runat="server"></asp:Label>
                    </div>
                       
                 </div>
                     
               </div>
              </div>
         <!--SignIn Form End-->

          <!--Fotter Content Start--->
       <footer class="footer-pos">
          <div class ="container">
            <p class ="pull-right"><a href ="#">Back to top</a></p>
              <p>&copy; Karthik Subramanyam Iyer &middot; <a href ="Default.aspx">Home</a>&middot; <a href ="#">About</a>&middot; <a href ="#">Contact</a>&middot; <a href ="#">Products</a></p>
       
            </div>
            
        </footer>

       <!--Fotter Content End--->

    </form>
</body>
</html>
