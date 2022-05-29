<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ContactReply.aspx.cs" Inherits="ContactReply" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderadmin" Runat="Server">

<h1 align="left">Contact Reply</h1>
<div align="center">
    
            <table cellspacing="10" style="font-size:15px; width: 631px;" align="left">
            <colgroup>
                <col width="300px" />
                <col width="250px" />
            </colgroup>
                <tr align="left">
                    <th>
                    Coustomer Name :
                    </th>
                    <td>
                        <asp:Label ID="nm_lbl" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                    Customer Email :
                    </th>
                    <td>
                        <asp:Label ID="em_lbl" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                    Phone No. :
                    </th>
                    <td>
                        <asp:Label ID="pn_lbl" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                    Subject :
                    </th>
                    <td>
                        <asp:Label ID="sb_lbl" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                    Receive Message :
                    </th>
                    <td>
                        <asp:Label ID="msg_lbl" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                    Reply Message :
                    </th>
                    <td>
                        <asp:TextBox ID="rm_txt" runat="server" CssClass="tb" TextMode="MultiLine" Height="200px"></asp:TextBox>
                    </td>
                    <td align="left">
                        <asp:RequiredFieldValidator ID="vadr" runat="server" 
                        ErrorMessage="Please Enter Message what ever you want to Reply." 
                        ControlToValidate="rm_txt" ValidationGroup="cnt" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="rp_btn" runat="server" Text="Reply Message" CssClass="btn" 
                            Width="100px" ValidationGroup="cnt" onclick="rp_btn_Click"/>
                    </td>
                </tr>
            </table>

</div>
<br />
    
    <br />
    <br />
</asp:Content>

