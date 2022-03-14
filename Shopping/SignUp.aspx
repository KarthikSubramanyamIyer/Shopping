<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Shopping.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SignUP</title>
     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <link href="css/Custom.css" rel="stylesheet" />
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
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
                           <li class ="active"><a href= "SignUp.aspx">SignUp</a> </li>
                            <li><a href= "SignIn.aspx">SignIn</a> </li>
                        </ul>
                    </div>

                </div>


            </div>

        </div>

        <!--SignUp Page-->
        <div class = "center-page">

            <label class ="col-xs-11">UserId:</label>
            <div class ="col-xs-11"> 
            <asp:TextBox ID="txtUname" runat="server" Class="form-control" placeholder="Enter User Id"></asp:TextBox>
            </div>

            <label class ="col-xs-11">Name:</label>
            <div class ="col-xs-11"> 
            <asp:TextBox ID="txtName" runat="server" Class="form-control" placeholder="Enter Your Name"></asp:TextBox>
            </div>

            <label class ="col-xs-11">Password:</label>
            <div class ="col-xs-11"> 
            <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Class="form-control" placeholder="Enter Your password"></asp:TextBox>
            </div>

            <label class ="col-xs-11">ConfirmPassword:</label>
            <div class ="col-xs-11"> 
            <asp:TextBox ID="txtCpass" runat="server" TextMode="Password" Class="form-control" placeholder="Enter Your Confirm Password"></asp:TextBox>
            </div>

            <label class ="col-xs-11">MobileNo:</label>
            <div class ="col-xs-11"> 
            <asp:TextBox ID="txtMno" runat="server" Class="form-control" placeholder="Enter Your MobileNo"></asp:TextBox>
            </div>

            <label class ="col-xs-11">Address:</label>
            <div class ="col-xs-11"> 
            <asp:TextBox ID="txtAdd" runat="server" Class="form-control" placeholder="Enter Your Address"></asp:TextBox>
            </div>

            <label class ="col-xs-11">Pincode:</label>
            <div class ="col-xs-11"> 
            <asp:TextBox ID="txtPin" runat="server" Class="form-control" placeholder="Enter Your Pincode"></asp:TextBox>
            </div>

            <label class ="col-xs-11">Email:</label>
            <div class ="col-xs-11"> 
            <asp:TextBox ID="txtEmail" runat="server" Class="form-control" placeholder="Enter Your Email"></asp:TextBox>
            </div>
             <label class ="col-xs-11"></label>
            <div class ="col-xs-11"> 
                <asp:Button ID="txtsignup" class="btn  btn-success" runat="server" Text="SignUp" BackColor="#33CC33" ForeColor="White" OnClick="txtsignup_Click"> </asp:Button>
                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            </div>

            </div>

        <!--Signup Page End-->

         <!--Fotter Content Start--->
        <%--<hr />
        <br />
        <br />
        <footer class ="footer-pos">
           <div class ="container">
              <p class ="pull-right"><a href ="#">Back to top</a></p>
                <p>&copy; Karthik Subramanyam Iyer &middot; <a href ="Default.aspx">Home</a>&middot; <a href ="#">About</a>&middot; <a href ="#">Contact</a>&middot; <a href ="#">Products</a></p>
            </div>
            
        </footer>--%>
         <!--Fotter Content End--->

    </form>
</body>
</html>
