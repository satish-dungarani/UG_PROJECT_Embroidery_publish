<%@ Page Title="" Language="C#" MasterPageFile="~/PurchaseMasterPage.master" AutoEventWireup="true" CodeFile="Change_password.aspx.cs" Inherits="Change_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Change Password</h1>
<div>
    <asp:FormView ID="FormView1" runat="server">
        <ItemTemplate>
            <table cellspacing="10">
            <colgroup>
            <col width="200px" />
            <col width="200px" />
        </colgroup>
                <tr align="left">
                    <th>User Name :</th>
                    <td style="font-size:medium;" >
                        <asp:Label ID="un_lbl" runat="server" Text='<%#bind("uname") %>'></asp:Label></td>
                </tr>
                
                </table>
        </ItemTemplate>
    </asp:FormView>
    <table cellspacing="10">
    <colgroup>
            <col width="200px" />
            <col width="200px" />
        </colgroup>
                <tr align="left">
                    <th>Old Password :</th>
                    <td style="font-size:medium;">
                        <asp:TextBox ID="op_txt" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                       <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Password Must be Require." ControlToValidate="op_txt" ValidationGroup="reg" Display="Dynamic"></asp:RequiredFieldValidator>

                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ErrorMessage="Password must contain: Minimum 8 characters atleast 1 Upper & Lower Case Alphabet,1 Number & 1 Special Char." 
                        ControlToValidate="op_txt" ValidationGroup="cp" 
                        ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}" Display="Dynamic"></asp:RegularExpressionValidator>
                        </td>
                </tr>
                <tr align="left">
                    <th>New Password :</th>
                    <td>
                        <asp:TextBox ID="np_txt" runat="server" TextMode="Password"></asp:TextBox></td>
                        <td>
                            <asp:RequiredFieldValidator ID="vpw" runat="server" 
                        ErrorMessage="Password Must be Require." ControlToValidate="np_txt" ValidationGroup="reg" Display="Dynamic"></asp:RequiredFieldValidator>

                        <asp:RegularExpressionValidator ID="repw" runat="server" 
                        ErrorMessage="Password must contain: Minimum 8 characters atleast 1 Upper & Lower Case Alphabet,1 Number & 1 Special Char." 
                        ControlToValidate="np_txt" ValidationGroup="cp" 
                        ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}" Display="Dynamic"></asp:RegularExpressionValidator>
                        </td>
                </tr>
                <tr align="left">
                    <th>Confirm Password :</th>
                    <td>
                        <asp:TextBox ID="cp_txt" runat="server" TextMode="Password"></asp:TextBox></td>
                        <td>
                            <asp:CompareValidator ID="vcp" runat="server" 
                        ErrorMessage="Your Conform Password is not match with your original password." 
                        ControlToCompare="np_txt" ControlToValidate="cp_txt" ValidationGroup="reg"></asp:CompareValidator>
                        </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:Button ID="sm_btn" runat="server" Text="Submit" onclick="sm_btn_Click1" />
                    </td>
                </tr>
           </table> 
</div>
</asp:Content>

