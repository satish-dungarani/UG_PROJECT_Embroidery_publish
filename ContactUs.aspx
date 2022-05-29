<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMasterPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 align="left">
    Contact Us
</h1>
<div>
    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/contact_us (1).jpg" Width="645px" />
</div>
<br />
<br />
<div>
    <table cellspacing="10" style="font-size:15px; width: 631px;" align="left">
            <colgroup>
                <col width="300px" />
                <col width="250px" />
            </colgroup>
           

            <tr>
                <td align="left">
                    Your Name
                </td>
                <td>
                    <asp:TextBox ID="fn_txt" runat="server" CssClass="tb" Width="120px"></asp:TextBox>
                    <asp:TextBox ID="ln_txt" runat="server" CssClass="tb" Width="120px"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="vpw" runat="server" 
                        ErrorMessage="Please Enter Pattern Name." ControlToValidate="fn_txt" 
                        ValidationGroup="cnt" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="Please Enter Pattern Name." ControlToValidate="ln_txt" 
                        ValidationGroup="cnt" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td align="left">
                    Your Email
                </td>
                <td>
                    <asp:TextBox ID="em_txt" runat="server" CssClass="tb"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Please Enter your email Id." 
                        ControlToValidate="em_txt" ValidationGroup="cnt"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="vem" runat="server" 
                        ErrorMessage="Please Enter valid E-Mail Address." ControlToValidate="em_txt" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="cnt"></asp:RegularExpressionValidator>
                </td>
            </tr>

            <tr>
                <td align="left">
                    Your Phone No.
                </td>
                <td>
                    <asp:TextBox ID="pn_txt" runat="server" CssClass="tb"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RegularExpressionValidator ID="vcn" runat="server" 
                        ErrorMessage="Please Enter 10 Digit Contect Number and start from 9,8 or 7 digit." 
                        ControlToValidate="pn_txt" 
                        ValidationExpression="^[987][0-9]{9}$" Display="Dynamic" ValidationGroup="cnt"></asp:RegularExpressionValidator>
                </td>
            </tr>

            <tr>
                <td align="left">
                    Subject
                </td>
                <td>
                    <asp:TextBox ID="sb_txt" runat="server" CssClass="tb"></asp:TextBox>
                </td>
                <td align="left">
                    
                </td>
            </tr>


            <tr>
                <td align="left">
                   Message
                </td>
                <td>
                    <asp:TextBox ID="msg_txt" runat="server"  CssClass="tb" TextMode="MultiLine" Height="200px"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="vadr" runat="server" 
                        ErrorMessage="Please Enter Message what ever you want to send." 
                        ControlToValidate="msg_txt" ValidationGroup="cnt" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td align="left">
                    Send Copy to yourself
                </td>
                <td align="left">
                    <asp:CheckBox ID="cp_cb" runat="server" />
                </td>
                <td align="left">
                    
                </td>
            </tr>

            <tr>
                <td align="center" colspan="2">
                    <asp:Button ID="btnsubmit" runat="server" Text="Send Message" CssClass="btn"
                        Width="100px" onclick="btnsubmit_Click" ValidationGroup="cnt" />
                </td>
                
            </tr>
            <tr align="left">
                <td style="width:300px">
                   <b> Phone : </b>
                    +918866804728 
                </td>
                <td>
                    <b> Mail To : </b>
                    <br />
                    B-95 Nityanand Soc, 
                    Laxmikant Ashram Road, 
                    Katargam, Surat-395004
                   
                </td>
                <td>
                   <b> Email Us At : </b>
                   gangadwaladarshan@gmail.com
                </td>
            </tr>
        </table>
        
</div>
<br />
<br />
</asp:Content>

