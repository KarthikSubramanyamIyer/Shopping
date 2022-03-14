<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Shopping.Cart" %>

<asp:Content ID ="Content3" ContentPlaceHolderID ="head" runat = "Server">
</asp:Content>
<asp:Content ID ="Content4" ContentPlaceHolderID ="ContentPlaceHolder1" runat = "Server">
    <div style ="padding-top:50px;">


        <div class="col-md-9" >
            <h4 class="proNameViewCart" runat ="server" id ="h1"></h4>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>

               
            <%--Show cart details Start--%>
            <div class ="media" style ="border:1px solid black">
                <div class ="media-left">
                    <a href ="ProductView.aspx?PID=<%# Eval("PID") %>" target ="_blank">
                        <img class ="media-object" width="100px" src="Image/ProductImage<%# Eval("PID") %>/<%# Eval("Name") %><%# Eval("Extention") %>" = "#" alt="<%# Eval("Name") %>" onerror="this.src='Images/ImageNotAvailable.jpg'"/>
                    </a>
                </div>
                    
                <div class = "media-body">
                    <h4 class ="media-headding proNameViewCart"><%# Eval("PName") %></h4>
                    <p class ="proPriceDiscountView"><%#Eval("SizeNamee") %> L</p>
                    <span class=" proPriceView"><%#Eval("PSelPrice","{0:c}") %></span>
                     <span class ="proOgPriceView"><%#Eval("PPrice","{0:00,0}") %></span>
                    <p>
                          <asp:button ID="btnRemoveCart" CssClass="RemoveButton" runat="server" text="Remove" OnClick ="btnRemoveCart_Click"/>
                    </p>
                </div>
            </div>
                     </ItemTemplate>
            </asp:Repeater>--%>
            <%--Show cart details Ends--%>

       </div>

         <div class="col-md-3">

            <%---------------%>
         <div>
                 <h5>Price Details></h5>
              <div>
                 <label>Cart Total</label>
                  <span class="pull-right priceGray" runat="server" id="span1">-1400</span>
             </div>

              <div>
                 <label>Cart Discount</label>
                  <span class="pull-right priceGreen" runat="server" id="span2">-200</span>
             </div>

         </div>
             <%---------------%>
             <div>
                  <div class ="proPriceView">
                 <label>Cart total</label>
                  <span class="pull-right priceGreen" runat="server" id ="span3">-200</span>
             </div>

                 <div>

                     <asp:button ID="Button1" CssClass="buyNowbtn" runat="server" text="Buy Now" OnClick = "btnBuy_Click"/>
                 </div>

             </div>
       </div>--%>

      
    </div>
</asp:Content>