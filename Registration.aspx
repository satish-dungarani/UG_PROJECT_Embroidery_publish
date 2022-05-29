<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMasterPage.master" AutoEventWireup="true"
    CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            height: 32px;
        }
        .style2
        {
            width: 85px;
        }
        .style3
        {
            height: 32px;
            width: 85px;
        }
        .style4
        {
            width: 259px;
        }
    </style>
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   
<h1 align=left>Registration From</h1>
        <table cellspacing="10" style="font-size:15px" align="left">
            <colgroup>
                <col width="200px" />
                <col />
            </colgroup>
            <tr>
                <td align="left" class="style2">
                    User Name :
                </td>
                <td>
                    <asp:TextBox ID="tbuname" runat="server" CssClass="tb"></asp:TextBox>
                </td>
                <td align="left" class="style4">
                    <asp:RequiredFieldValidator ID="vun" runat="server" 
                        ErrorMessage="User Name Must Require." ControlToValidate="tbuname" ValidationGroup="reg"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="left" class="style2">
                    Password :
                </td>
                <td>
                    <asp:TextBox ID="tbpwd" runat="server" CssClass="tb" TextMode="Password"></asp:TextBox>
                </td>
                <td align="left" class="style4">
                    <asp:RequiredFieldValidator ID="vpw" runat="server" 
                        ErrorMessage="Password Must be Require." ControlToValidate="tbpwd" ValidationGroup="reg" Display="Dynamic"></asp:RequiredFieldValidator>

                        <asp:RegularExpressionValidator ID="repw" runat="server" 
                        ErrorMessage="Password must contain: Minimum 8 characters atleast 1 Upper & Lower Case Alphabet,1 Number & 1 Special Char." 
                        ControlToValidate="tbpwd" ValidationGroup="reg" 
                        ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}" Display="Dynamic"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td align="left" class="style3">
                    Confirm Password :
                </td>
                <td class="style1">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="tb" TextMode="Password"></asp:TextBox>
                </td>
                <td align=left class="style4">
                    <asp:CompareValidator ID="vcp" runat="server" 
                        ErrorMessage="Your Conform Password is not match with your original password." 
                        ControlToCompare="tbpwd" ControlToValidate="TextBox1" ValidationGroup="reg"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td align=left class="style2">
                    First Name :
                </td>
                <td>
                    <asp:TextBox ID="tbfname" runat="server" CssClass="tb"></asp:TextBox>
                </td>
                <td align=left class="style4">
                    <asp:RequiredFieldValidator ID="vfn" runat="server" 
                        ErrorMessage="Please Enter your First Name." ControlToValidate="tbfname" ValidationGroup="reg"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align=left class="style2">
                    Last Name :
                </td>
                <td>
                    <asp:TextBox ID="tblname" runat="server" CssClass="tb"></asp:TextBox>
                </td>
                <td align=left class="style4">
                    <asp:RequiredFieldValidator ID="vln" runat="server" 
                        ErrorMessage="Please Enter your Last Name." ControlToValidate="tblname" ValidationGroup="reg"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align=left class="style2">
                    Gender :
                </td>
                <td>
                    <asp:RadioButtonList ID="rblgender" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="left" class="style2">
                    Pincode :
                </td>
                <td>
                    <asp:TextBox ID="tbpin" runat="server" CssClass="tb"></asp:TextBox>
                </td>
                <td align="left" class="style4">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ErrorMessage="Please Enter 6 Digit Pincode Number." 
                        ControlToValidate="tbpin" 
                        ValidationExpression="^[0-9]{6}$" Display="Dynamic" ValidationGroup="reg"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Please Enter Your Area Pincode Number." ControlToValidate="tbpin" ValidationGroup="reg" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td align=left class="style2">
                    Address :
                </td>
                <td>
                    <asp:TextBox ID="tbaddress" runat="server" TextMode="MultiLine" CssClass="mtb"></asp:TextBox>
                </td>
                <td align=left class="style4">
                    <asp:RequiredFieldValidator ID="vadr" runat="server" 
                        ErrorMessage="Please Enter your original Address." 
                        ControlToValidate="tbaddress" ValidationGroup="reg"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td align=left class="style2">
                    Landmark :
                </td>
                <td>
                    <asp:TextBox ID="tblm" runat="server" CssClass="tb"></asp:TextBox>
                </td>
                <td align=left class="style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="Please Enter name of your landmark area." ControlToValidate="tblm" ValidationGroup="reg"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td align=left class="style2">
                    City :
                </td>
                <td>
                    <asp:DropDownList ID="ddlcity" runat="server" CssClass="tb">
                        <asp:ListItem>Ahmedabad</asp:ListItem>
                        <asp:ListItem>Baroda</asp:ListItem>
                        <asp:ListItem>Navsari</asp:ListItem>
                        <asp:ListItem>Surat</asp:ListItem>
                        <asp:ListItem>Valsad</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            
            <tr>
                <td align=left class="style2">
                    State :
                </td>
                <td>
                    <asp:DropDownList ID="ddlstate" runat="server" CssClass="tb">
                        <asp:ListItem>Gujarat</asp:ListItem>
                        <asp:ListItem>Maharastra</asp:ListItem>
                        <asp:ListItem>Delhi</asp:ListItem>
                        <asp:ListItem>Bangar</asp:ListItem>
                        
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td align=left class="style2">
                    Country :
                </td>
                <td>
                    <asp:TextBox ID="tbcnt" runat="server" CssClass="tb" Text="(India) only available for india"></asp:TextBox>
                </td>
                
            </tr>

            <tr>
                <td align=left class="style2">
                    Phone Number :
                </td>
                <td>
                    <asp:TextBox ID="tbcontno" runat="server" CssClass="tb"></asp:TextBox>
                </td>
                <td align=left class="style4">
                    <asp:RegularExpressionValidator ID="vcn" runat="server" 
                        ErrorMessage="Please Enter 10 Digit Contect Number and start from 9,8 or 7 digit." 
                        ControlToValidate="tbcontno" 
                        ValidationExpression="^[987][0-9]{9}$" Display="Dynamic" ValidationGroup="reg"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Please Enter Contect Number." ControlToValidate="tbcontno" 
                        Display="Dynamic" ValidationGroup="reg"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td align=left class="style2">
                    Email :
                </td>
                <td>
                    <asp:TextBox ID="tbemail" runat="server" CssClass="tb"></asp:TextBox>
                </td>
                <td align=left class="style4">
                    <asp:RegularExpressionValidator ID="vem" runat="server" 
                        ErrorMessage="Please Enter valid E-Mail Address." ControlToValidate="tbemail" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="reg"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td align=left class="style2">
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn"
                        Width="100px" onclick="btnsubmit_Click"  ValidationGroup="reg" />
                </td>
                <td align="left">
                    <asp:Button ID="btnreset" runat="server" Text="Reset" CssClass="btn" 
                        Width="100px" onclick="btnreset_Click" />
                </td>
            </tr>
        </table>

</asp:Content>
