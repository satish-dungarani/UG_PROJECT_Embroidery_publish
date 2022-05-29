<%@ Page Title="" Language="C#" MasterPageFile="~/PurchaseMasterPage.master" AutoEventWireup="true" CodeFile="Review.aspx.cs" Inherits="Review" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<h1>Write a Embroidery Review</h1>
<div>
    <table cellspacing="10" style="font-size:15px; width: 631px;" align="left">
            <colgroup>
                <col width="250px" />
                <col width="250px" />
            </colgroup>
          

            <tr align="left">
                <td >
                    Review Title :
                </td>
                <td>
                    <asp:TextBox ID="rt_txt" runat="server" CssClass="tb" ></asp:TextBox>
                </td>
                
            </tr>

            <tr align="left">
                <td >
                    Your Review :
                </td>
                <td>
                    <asp:TextBox ID="rvw_txt" runat="server" CssClass="tb" TextMode="MultiLine" Height="150px"></asp:TextBox>
                </td>
                
            </tr>

            <tr align="left">
                <td >
                    Your Rating :
                </td>
                <td>
                    <asp:ImageButton ID="img1" runat="server" ImageUrl="~/images/whitestar.gif" 
                        onclick="img1_Click" Width="25px" />
              
                    <asp:ImageButton ID="img2" runat="server" ImageUrl="~/images/whitestar.gif" 
                        onclick="img2_Click" Width="25px" />
                    <asp:ImageButton ID="img3" runat="server" ImageUrl="~/images/whitestar.gif" 
                        onclick="img3_Click" Width="25px" />
                    <asp:ImageButton ID="img4" runat="server" ImageUrl="~/images/whitestar.gif" 
                        onclick="img4_Click" Width="25px" />
                    <asp:ImageButton ID="img5" runat="server" ImageUrl="~/images/whitestar.gif" 
                        onclick="img5_Click" Width="25px" />
                </td>
                
            </tr>

            <tr align="left">
                <td >
                    Name :
                </td>
                <td>
                    <asp:Label ID="nm_lbl" runat="server" CssClass="tb" Width="250px"></asp:Label>
                </td>
                
            </tr>
            <tr >
                <td colspan="2" align="center">
                    <asp:Button ID="Sbm_btn" runat="server" Text="Submit" CssClass="btn"  
                        Width="100px" onclick="Sbm_btn_Click"/>
                </td>
            </tr>

            
        </table>
        <br />
        <br />
</div>

</asp:Content>

