<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function validate() {
            var pw = document.getElementById('<%=tbpwd.ClientID %>');
            var val=/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@#!%*?&])[A-Za-z\d$@$!%*?&]{8,}$/;
            if (val.test(pw.value) == false) {
                
                alert("Password must contain: Minimum 8 characters atleast 1 Upper & Lower Case Alphabet,1 Number & 1 Special Char.");
            }
            
            
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <h1>
        Login Form here</h1>
    <table cellspacing="10">
        <colgroup>
            <col width="200px" />
            <col width="200px" />
        </colgroup>

        <tr>
            <td align="right">
                <asp:Label ID="Label1" runat="server" Text="User Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tbuname" runat="server" CssClass="tb"></asp:TextBox>
            </td>
            <td rowspan="3">
            
            </td>
        </tr>
        <tr>
            <td align="right">
                Password
            </td>
            <td>
                <asp:TextBox ID="tbpwd" runat="server" CssClass="tb" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClientClick="validate();"
                    CssClass="btn" Width="100px" onclick="btnsubmit_Click" />
            </td>
           
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:LinkButton ID="fp_lnk" runat="server" onclick="fp_lnk_Click">I Can't Access my Account.</asp:LinkButton>
            </td>
           
        </tr>
    </table>
        
</asp:Content>

