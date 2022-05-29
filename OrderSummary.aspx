<%@ Page Title="" Language="C#" MasterPageFile="~/PurchaseMasterPage.master" AutoEventWireup="true" CodeFile="OrderSummary.aspx.cs" Inherits="OrderSummary" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<h1 align="left"> Order Summary</h1>
<div>
    <asp:FormView ID="FormView1" runat="server" Width="646px">
        <ItemTemplate>
            <table border="1" width="645">
                <tr align="center" style="font-size:medium">
                    <th align="center">Product Image</th>
                    <th align="center">Item</th>
                    <th align="center">QTY</th>
                    <th align="center">Price</th>
                    <th align="center">Delivery Details</th>
                    <th align="center">Subtotal</th>
                </tr>
                <tr>
                    <td colspan=6>
                <br />
        <!--<asp:Image ID="Image2" runat="server" ImageUrl="~/images/line.png" />-->
    <br />
    </td>
    
    </tr>
                <tr align="center" style="font-size:inherit">
                
                    <td>
                        <asp:Image ID="ptn_img" runat="server" ImageUrl='<%#bind("pimgpath") %>' Width=150px Height=150px />
                    </td>
                    <td>
                        <asp:Label ID="pn_lbl" runat="server" Text='<%#bind("pname") %>'></asp:Label>
                    </td>
                    <td></td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="RS."></asp:Label>
                        <asp:Label ID="pr_lbl" runat="server" Text='<%#bind("price") %>'></asp:Label>
                    </td>
                    <td>
                        
                    </td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="RS."></asp:Label>
                        <asp:Label ID="st_lbl" runat="server" Text='<%#bind("price") %>' ></asp:Label>
                    </td>
                </tr>
      
    <br />

                <tr align="center" style="font-size:inherit">
                    <td>
                        <asp:Image ID="fab_img" runat="server" ImageUrl='<%#bind("imgpath") %>' Width=150px Height=150px />
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text='<%#bind("fbname") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="fq_lbl" runat="server" Text='<%#bind("fbqnt") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="RS."></asp:Label>
                        <asp:Label ID="Label5" runat="server" Text='<%#bind("fbprice") %>'></asp:Label>
                    </td>
                    <td style="width:100px">
                        <asp:Label ID="ld_lbl" runat="server" Text="Last Delivery Date of the product is " ></asp:Label>
                        <br />
                         <br />
                        <asp:Label ID="dc_lbl" runat="server" Text="Delivery charges of the supplier is RS. 500" ></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="RS."></asp:Label>
                        <asp:Label ID="sta_lbl" runat="server" ></asp:Label>
                    </td>
                </tr>

  
            <tr>
                <td colspan=6>
                <asp:Label ID="Label6" runat="server" Text="Sent Order Confirmation SMS alert to "></asp:Label>
                <asp:Label ID="Label7" runat="server" Text='<%#bind("phone") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:ImageButton ID="con_img" runat="server" ImageUrl="~/images/con_btn.png" onclick="con_img_Click" />            
                </td>
                <td colspan="5"> 
                    <asp:Label ID="ap_lbl" runat="server" Text="Amount Payanle RS. " Font-Size="Large"></asp:Label>
                </td>        
            </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
  
</div>
<br />
<br />
</asp:Content>

