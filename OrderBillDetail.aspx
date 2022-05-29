<%@ Page Title="" Language="C#" MasterPageFile="~/PurchaseMasterPage.master" AutoEventWireup="true" CodeFile="OrderBillDetail.aspx.cs" Inherits="OrderBillDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>Order Bill Detail</h1>
<div>
    <asp:FormView ID="FormView1" runat="server">
        <ItemTemplate>
           <table cellspacing="10" style="font-size:15px" align="left">
            <colgroup>
                <col width="200px" />
                <col />
            </colgroup>
                <tr align="left">
                    <th>
                        Order ID :
                    </th>
                    <td>
                        <asp:Label ID="oid_lbl" runat="server" Text='<%#bind("oid") %>'></asp:Label>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        User Name :
                    </th>
                    <td>
                        <asp:Label ID="fn_lbl" runat="server" Text='<%#bind("fname") %>'></asp:Label>
                        <asp:Label ID="ln_lbl" runat="server" Text='<%#bind("lname") %>'></asp:Label>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        Pattern ID :
                    </th>
                    <td>
                        <asp:Label ID="pid_lbl" runat="server" Text='<%#bind("pid") %>'></asp:Label>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        Fabric ID :
                    </th>
                    <td>
                        <asp:Label ID="fid_lbl" runat="server" Text='<%#bind("fid") %>'></asp:Label>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        Thread Type :
                    </th>
                    <td>
                        <asp:Label ID="tt_lbl" runat="server" Text='<%#bind("thtype") %>'></asp:Label>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        Fabric Quantity :
                    </th>
                    <td>
                        <asp:Label ID="fq_lbl" runat="server" Text='<%#bind("fbqnt") %>'></asp:Label>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        Delivery Charge :
                    </th>
                    <td>
                        <asp:Label ID="dc_lbl" runat="server" Text='<%#bind("dcharge") %>'></asp:Label>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        Diposit Amount :
                    </th>
                    <td>
                        <asp:Label ID="da_lbl" runat="server" Text='<%#bind("diposit") %>'></asp:Label>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        Payable Amount :
                    </th>
                    <td>
                        <asp:Label ID="pa_lbl" runat="server" Text='<%#bind("amount") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Generate Bill" 
                            onclick="Button1_Click" />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
</div>
</asp:Content>

