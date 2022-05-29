<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMasterPage.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        .style1
        {
            height: 32px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="new_released_section" align="left">
<h1 style="width:634px">Latest Designs</h1>
            	<div class="new_released_box">
                <img src="images/image01(140x140).jpg" alt="image" />
                    <h3>Design No. 1</h3> 
                    <h4>Stitch:</h4>  
                    <h4>Price: </h4> 
              <div class="rantsection">
                        <img class="star" src="images/yellowstar.gif" alt="star" />
                        <img class="star" src="images/yellowstar.gif" alt="star" />
                        <img class="star" src="images/yellowstar.gif" alt="star" />
                        <img class="star" src="images/yellowstar.gif" alt="star" />
                        <img class="star" src="images/whitestar.gif" alt="star" />
                    </div>
                    <div class="more_button"><a href="#">More</a></div>
				</div>
                <div class="new_released_box">
                <img src="images/13.jpe" alt="image" />
                    <h3>Design No. 2</h3> 
                    <h4>Stitch: </h4>  
                    <h4>Price: </h4> 
                    <div class="rantsection">
                        <img class="star" src="images/yellowstar.gif" alt="star" />
                        <img class="star" src="images/yellowstar.gif" alt="star" />
                        <img class="star" src="images/yellowstar.gif" alt="star" />
                        <img class="star" src="images/whitestar.gif" alt="star" />
                        <img class="star" src="images/whitestar.gif" alt="star" />
                    </div>
                    <div class="more_button"><a href="#">More</a></div>
				</div>
                <div class="new_released_box">
                <img src="images/image03(140x140).jpg" alt="image" />
                    <h3>Design No. 3</h3> 
                    <h4>Stitch:</h4>  
                    <h4>Price: </h4> 
                    <div class="rantsection">
                        <img class="star" src="images/yellowstar.gif" alt="star" />
                        <img class="star" src="images/yellowstar.gif" alt="star" />
                        <img class="star" src="images/yellowstar.gif" alt="star" />
                        <img class="star" src="images/whitestar.gif" alt="star" />
                        <img class="star" src="images/whitestar.gif" alt="star" />
                    </div>
                    <div class="more_button"><a href="#">More</a></div>
                </div>
                </div>

     <div class="templatemo_right_panel_fullwidth" align=left>
                <div id="news_section">
                    <h1 style="width:286px">Fabric Sample</h1>
                    <div class="news_box">
                        <img src="images/1.jpg" alt="image" height=120px width=120px />
                        <h3>Fabric No. 1</h3> 
                        <h4>Fabric Type:</h4>
                        <h4>Price: </h4> 
                        <p>Maecenas vulputate, arcu id fermentum eleifend, tortor enim tincidunt mauris, fringilla tincidunt purus urna vel risus. <a href="templatemo.com" target="_parent">more...</a>
                        </p>
                    </div>
                    <div class="news_box">
                        <img src="images/2.jpg" alt="image" height=120px width=120px />
                        <h3>Fabric No. 2</h3> 
                        <h4>Fabric Type:</h4>
                        <h4>Price: </h4> 
                        <p> Fusce vulputate tellus ac felis. Praesent mauris. Quisque gravida faucibus ligula. Aliquam magna. Phasellus id felis. <a href="templatemo.com" target="_parent">more...</a>
                        </p>
                    </div>
                    <div class="more_button" style="margin-left:15px;"><a href="ViewFabric.aspx">View All</a></div>
                </div> <!-- end of news -->
                
                <div id="topdownload_section">
                    <h1 style="width:286px">Thread Sample</h1>
                    <div class="news_box">
                        <img src="images/011.jpg" alt="image" height=120px width=120px />
                        <h3>Thread No. 1</h3> 
                        <h4>Thread Type:</h4>
                        <h4>Price: </h4> 
                        <p>Maecenas vulputate, arcu id fermentum eleifend, tortor enim tincidunt mauris, fringilla tincidunt purus urna vel risus. <a href="templatemo.com" target="_parent">more...</a>
                        </p>
                    </div>
                    <div class="news_box">
                        <img src="images/022.jpg" alt="image" height=120px width=120px />
                        <h3>Thread No. 2</h3> 
                        <h4>Thread Type:</h4>
                        <h4>Price: </h4> 
                        <p> Fusce vulputate tellus ac felis. Praesent mauris. Quisque gravida faucibus ligula. Aliquam magna. Phasellus id felis. <a href="templatemo.com" target="_parent">more...</a>
                        </p>
                    </div>  
                    <div class="more_button" style="margin-left:15px;"><a href="#">View All</a></div>
                </div> 
			</div>             
</asp:Content>

