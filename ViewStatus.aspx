<%@ Page Title="" Language="C#" MasterPageFile="~/PurchaseMasterPage.master" AutoEventWireup="true" CodeFile="ViewStatus.aspx.cs" Inherits="ViewStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1 align="left">Order Status</h1>
<div align="center">
    <asp:FormView ID="FormView1" runat="server" 
        >
        <ItemTemplate>
            <table border=1>
                <tr align="center">
                    <th>
                        <asp:Image ID="ptn_img" runat="server" ImageUrl='<%#bind("pimgpath") %>' Width=100px Height=100px/>
                    </th>
                    <td>
                        <asp:Image ID="fab_img" runat="server" ImageUrl='<%#bind("imgpath") %>' Width=100px Height=100px/>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                    Order ID 
                    </th>
                    <td>
                        <asp:Label ID="oid_lbl" runat="server" Text='<%#bind("oid") %>'></asp:Label>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                    Order Date 
                    </th>
                    <td>
                        <asp:Label ID="od_lbl" runat="server" Text='<%#bind("odate") %>'></asp:Label>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                    Delivery Date 
                    </th>
                    <td>
                        <asp:Label ID="dd_lbl" runat="server" Text='<%#bind("ddate") %>'></asp:Label>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                    Delivery Charge 
                    </th>
                    <td>
                        <asp:Label ID="dc_lbl" runat="server" Text='<%#bind("dcharge") %>'></asp:Label>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                    Diposit
                    </th>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text='<%#bind("diposit") %>'></asp:Label>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                    Amount Payable
                    </th>
                    <td>
                        <asp:Label ID="ap_lbl" runat="server" Text='<%#bind("amount") %>'></asp:Label>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                    Order Status
                    </th>
                    <td>
                        <asp:Label ID="os_lbl" runat="server" Text='<%# bind("status") %>'></asp:Label>
                    </td>
                </tr>
                
            </table>

        </ItemTemplate>
        </asp:FormView>
        </div>
        <br />
        <div align="center">
        <asp:ImageButton ID="ImageButton1" runat="server" 
            ImageUrl="~/images/button_back1.png" onclick="ImageButton1_Click" />
    </div>
        <br />
        <br />
</asp:Content>

