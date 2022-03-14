<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Shopping.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Panda Cart</title>
    <script src="http://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
        crossorigin="anonymous">  

    </script>

    <meta charset ="utf-8" >
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <link href="css/Custom.css" rel="stylesheet" />
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <script type="text/javascript">

        $(document).ready(function myfunction() {
            $("#btnCart").click(function myfunction() {
                window.location.href = "Cart.aspx";
            });
        });

    </script>

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
                            <li class ="active"><a href ="Default.aspx" >Home</a> </li>
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
                            <li>
                            <button id="btnCart" class="btn btn-primary navbar-btn " type="button">
                                Cart <span class="badge " id="pCount" runat="server"></span>
                            </button>
                        </li>
                        <li id="btnSignUP" runat="server"><a href="SignUp.aspx">SignUp</a> </li>
                        <li id="btnSignIN" runat="server"><a href="SignIn.aspx">SignIn</a> </li>
                            <li>
                            <asp:Button ID="btnlogout" CssClass="btn btn-default navbar-btn " runat="server"
                                Text="Sign Out" />
                        </li>
                        </ul>
                    </div>

                </div>


            </div>

            <!--Image slider--->
  <div class="container">
  <h2>Carousel Example</h2>  
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="Image Slider/shirts stack.jpg" alt="Shirts" style="width:70%;height :400px">
          <div class="carousel-caption">
           <h3>Shirts Offer</h3>
              <p>@25%off</p>
               <p><a class ="btn btn-lg btn-primary" href="#" role ="button">Buy Now</a></p>
          </div>
      </div>

      <div class="item">
        <img src="Image Slider/watch.jpg" alt="Watches" style="width:70%;height :400px">
          <div class="carousel-caption">
           <h3>Watches</h3>
              <p>@35%off</p>
              <p><a class ="btn btn-lg btn-primary" href="#" role ="button">Buy Now</a></p>
      </div>
     </div>
      <div class="item">
        <img src="Image Slider/Smart Watches.jpg" alt="Smart Watches" style="width:70%;height :400px">
          <div class="carousel-caption">
           <h3>Smart watches</h3>
              <p>@15%off</p>
              <p><a class ="btn btn-lg btn-primary" href="#" role ="button">Buy Now</a></p>
      </div>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
             <!--Image slider End--->


     </div>
        <!--Middle Content Start--->
        <hr />
         <div class = "container center">
            <div class = "row">
                <div class ="col-lg-4">
                    <img class ="img-circle "src="Watches/1.jpeg" alt ="thumb" width ="140" height ="140" />
                    <h2>Watches</h2>
                    <p> Timex Titan Fastrack..</p>
                    <p> <a class =" btn btn-default" href ="#" role ="button">View More &raquo;</a></p>

                </div>
          
                  <div class ="col-lg-4">
                    <img class ="img-circle "src="Mobile/2.jpg" alt ="thumb" width ="140" height ="140" />
                     <h2>Mobiles</h2>
                      <p> Iphone Motorola Nokia.. </p>
                       <p> <a class =" btn btn-default" href ="#" role ="button">View More &raquo;</a></p>

                </div>
                    <div class ="col-lg-4">
                     <img class ="img-circle "src="Shoes/1.jpg" alt ="thumb" width ="140" height ="140" />
                      <h2>Shoes</h2>
                       <p> Adidas Nike Sparx..</p>
                        <p> <a class =" btn btn-default" href ="#" role ="button">View More &raquo;</a></p>

                </div>

            </div>
             <div class="panel-body">
                <div class="row" style="padding-top: 50px">
                    <asp:Repeater ID="rptrProducts" runat="server">
                        <ItemTemplate>
                            <div class="col-sm-3 col-md-3">
                                <a href="ProductView.aspx?PID=<%# Eval("PID") %>" style="text-decoration: none;">
                                    <div class="thumbnail">
                                        <img src="Images/ProductImages/<%# Eval("PID") %>/<%# Eval("ImageName") %><%# Eval("Extention") %>"
                                            alt="<%# Eval("ImageName") %>" />
                                        <div class="caption">
                                            <div class="probrand">
                                                <%# Eval ("BrandName") %>
                                            </div>
                                            <div class="proName">
                                                <%# Eval ("PName") %>
                                            </div>
                                            <div class="proPrice">
                                                <span class="proOgPrice">
                                                    <%# Eval ("PPrice","{0:0,00}") %>
                                                </span>
                                                <%# Eval ("PSelPrice","{0:c}") %>
                                                <span class="proPriceDiscount">(<%# Eval("DiscAmount","{0:0,00}") %>
                                                    off) </span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>

        </div>
        
        <!--Middle Content End--->


        <!--Fotter Content Start--->
        <footer>
          <div class ="container">
            <p class ="pull-right"><a href ="#">Back to top</a></p>
              <p>&copy; Karthik Subramanyam Iyer &middot; <a href ="Default.aspx">Home</a>&middot; <a href ="#">About</a>&middot; <a href ="#">Contact</a>&middot; <a href ="#">Products</a></p>
       
            </div>
            
        </footer>

       <!--Fotter Content End--->

    </form>
</body>
</html>
