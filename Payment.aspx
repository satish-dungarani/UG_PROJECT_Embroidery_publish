<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Payment" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="templatemo_style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="engine1/style.css" />
    <script type="text/javascript" src="engine1/jquery.js"></script>
    
<script language="javascript" type="text/javascript">
// <![CDATA[

function btnPay_onclick() {

}

// ]]>
</script>
</head>
<body>
    <form id="form1" runat="server">

    <div id="templatemo_container">
        <div id="templatemo_header">
            <div id="templatemo_title">
                <div id="templatemo_sitetitle">
                    Embroidery<span></span></div>
            </div>
            <div id="templatemo_login">
                <form method="get" action="#">
                
                </form>
            </div>
        </div>
        <div id="wowslider-container1">
            <div class="ws_images">
                <ul>
                    <li>
                        <img src="data1/images/1.jpg" alt="1" title="1" id="wows1_0" /></li>
                    <li>
                        <img src="data1/images/2.jpg" alt="2" title="2" id="wows1_1" /></li>
                    <li>
                        <img src="data1/images/3.jpg" alt="3" title="3" id="wows1_2" /></li>
                    <li>
                        <img src="data1/images/4.jpg" alt="4" title="4" id="wows1_3" /></li>
                </ul>
            </div>
            <div class="ws_bullets">
                <div>
                    <a href="#" title="1">
                        <img src="data1/tooltips/1.jpg" alt="1" />1</a> <a href="#" title="2">
                            <img src="data1/tooltips/2.jpg" alt="2" />2</a> <a href="#" title="3">
                                <img src="data1/tooltips/3.jpg" alt="3" />3</a> <a href="#" title="4">
                                    <img src="data1/tooltips/4.jpg" alt="4" />4</a>
                </div>
            </div>
            <a class="wsl" href="http://wowslider.com">jQuery Slider Scroll by WOWSlider.com v3.1</a>
            <div class="ws_shadow">
            </div>
        </div>
        <script type="text/javascript" src="engine1/wowslider.js"></script>
        <script type="text/javascript" src="engine1/script.js"></script>
        <div id="templatemo_menu">
            <ul>
                <li><a href="Home.aspx" class="current"> <asp:Image ID="Image1" runat="server" ImageUrl="~/images/home.ico" Height=15 Width=15 /> Home</a></li>
                <li><a href="Change_password.aspx">Change Password</a></li>
                <li><a href="PurchaseProfile.aspx">Profile</a></li>
                <li><a href="ViewPattern.aspx">View Product</a></li>
                <li><a href="ViewStatus.aspx">Order Status</a></li>
                
                <li>
                    <asp:LinkButton ID="lo_link" runat="server" oncommand="lo_link_Command">Logout</asp:LinkButton></li>
            </ul>
        </div>
        <div id="templatemo_content">
            <div id="templatemo_left_column">
                <h2>
                    </h2>
                <%--<div class="left_col_box">
                    <form method="get" action="#">
                    <table>
                        <tr>
                            <td>
                                User Name
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Password
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                        <td></td>
                            <td>
                                <asp:Button ID="Button1" runat="server" Text="Login" CssClass="btn" />
                            </td>
                        </tr>
                    </table>
                    
                        
                    </form>
                </div>
                <h2>
                    Blog Entries</h2>--%>
                <%--<div class="left_col_box">
                    <div class="blog_box">
                        <h3>
                            <a href="#">Curabitur quis velit quis tortor</a></h3>
                        Suspendisse vitae neque eget ante tristique vestibulum. Pellentesque vitae magna.<br />
                        Posted by <a href="#"><span>Admin</span></a> in <a href="#"><span>Videos</span></a><br />
                        14 December 2048
                    </div>
                    <div class="blog_box">
                        <h3>
                            <a href="#">Duis vitae velit sed dui</a></h3>
                        Pellentesque vitae magna. Suspendisse vitae neque eget ante tristique vestibulum.<br />
                        Posted by <a href="#"><span>Admin</span></a> in <a href="#"><span>Audios</span></a><br />
                        20 December 2048
                    </div>
                    <div class="blog_box">
                        <h3>
                            <a href="#">Donec mollis aliquet ligula</a></h3>
                        Suspendisse vitae neque eget ante tristique vestibulum.<br />
                        Posted by <a href="#"><span>Admin</span></a> in <a href="#"><span>Samples</span></a><br />
                        22 December 2048
                    </div>
                    <div class="blog_box">
                        <a href="http://validator.w3.org/check?uri=referer">
                            <img style="border: 0; width: 88px; height: 31px" src="http://www.w3.org/Icons/valid-xhtml10"
                                alt="Valid XHTML 1.0 Transitional" width="88" height="31" vspace="8" border="0" /></a>
                        <a href="http://jigsaw.w3.org/css-validator/check/referer">
                            <img style="border: 0; width: 88px; height: 31px" src="http://jigsaw.w3.org/css-validator/images/vcss-blue"
                                alt="Valid CSS!" vspace="8" border="0" /></a>
                    </div>
                    <div class="more_button">
                        <a href="#">View All</a></div>
                </div>--%>
            </div>
           
            <div id="templatemo_right_column">




            <h1>Payment Detail</h1>

   <div style="color: white; margin: 30px 0 0 60px; font-family: Arial;" align="left">
  <br />

    <form action="<%= ConfigurationManager.AppSettings["PayPalSubmitUrl"] %>" method="post">
    <input type="hidden" name="cmd" value="_xclick" />
    <input type="hidden" name="business" value="<%= ConfigurationManager.AppSettings["PayPalUsername"] %>" />
    <table>
    <tr align="left">
    <th>Your Name :</th>
    <td>
    <input type="text" runat="server" name="Your Name :" id="fname" />
    </td>
    </tr>
    <tr align="left">
    <th>Your Email ID :</th>
    <td>
    <input type="text" runat="server" name="Your Email ID :" id="email" />
    </td>
    </tr>
    <tr align="left">
    <th>Your Phone No. :</th>
    <td>
    <input type="text" runat="server" name="Your Phone No. :" id="phone" />
    </td>
    </tr >
    <tr align="left">
        <th>Amount :</th>
        <td>
    <input type="text" runat="server" id="amount" name="amount" />
    </td>
    </tr>
    
    </table>
    <input type="hidden" name="return" value="http://localhost:55289/Embroidery/OrderBillDetail.aspx" />
    <input type="hidden" name="custom" value="Registration started: <%= DateTime.Now.ToString() %>" />
    <br />
    <div align="left">
    <!--<input type="submit" value="Pay Now"/>-->
        <asp:Button ID="pay_btn" runat="server" Text="Pay Now" 
           />
    </div>
   
    </form>
    
</div>



<br />
<br />
</div>
        </div>
         <br /><br />
        <div id="templatemo_footer">
            <a href="#">Home</a> | <a href="#">Registration</a> | <a href="#">Login</a> | <a href="#">
                Produtes</a> | <a href="#">About Us</a> | <a href="#">Contact</a><br />
            Copyright © 2013-2014 | <a href="" target="_parent">Developed</a> by DG Private LTD.<a href="" target="_parent">
            </a>
        </div>
    </div>

    </form>
</body>
</html>
