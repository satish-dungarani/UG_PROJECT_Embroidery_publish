<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMasterPage.master" AutoEventWireup="true" CodeFile="Forgetpassword.aspx.cs" Inherits="Forgetpassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>
        Forget Password</h1>
    <table cellspacing="10">
        <colgroup>
            <col width="200px" />
            <col width="200px" />
        </colgroup>
        <tr align="left">
            <th style="font-size:1.5em">
                User Name
            </th>
            <td>
                <asp:TextBox ID="un_txt" runat="server" CssClass="tb"></asp:TextBox>
            </td>
        </tr>
            
        <tr align="left">
            <th style="font-size:1.5em">
                Enter Phone No :    
            </th>
            <td>
                <asp:TextBox ID="ph_txt" runat="server" CssClass="tb"></asp:TextBox>
            </td>
        </tr>
        <tr align="left">
            <th style="font-size:1.5em">
                Enter Email :    
            </th>
            <td>
                <asp:TextBox ID="em_txt" runat="server" CssClass="tb"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClientClick="validate();"
                    CssClass="btn" Width="100px" onclick="btnsubmit_Click" />
            </td>
           
        </tr>
        
    </table>
    <br />
    <br />
</asp:Content>

