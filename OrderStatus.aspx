<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="OrderStatus.aspx.cs" Inherits="OrderStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderadmin" Runat="Server">
<h1 align="left">Order Status</h1>
<div align="center">
    <asp:FormView ID="FormView1" runat="server" 
        onmodechanging="FormView1_ModeChanging" 
        onitemupdating="FormView1_ItemUpdating">
        <ItemTemplate>
            <table border=1>
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
                <tr align="left">
                    
                    <td colspan=2>
                        <asp:LinkButton ID="editlnk" runat="server" CommandName="edit">Edit</asp:LinkButton>
                    </td>
                </tr>
            </table>

        </ItemTemplate>

        <EditItemTemplate>
        <table border=1>
                <tr>
                    <th>
                    Order ID 
                    </th>
                    <td>
                        <asp:Label ID="oid1_lbl" runat="server" Text='<%#bind("oid") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <th>
                    Order Date 
                    </th>
                    <td>
                        <asp:Label ID="ode_lbl" runat="server" Text='<%#bind("odate") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <th>
                    Delivery Date 
                    </th>
                    <td>
                        <asp:TextBox ID="dd_txt" runat="server" Text='<%#bind("ddate") %>'></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <th>
                    Delivery Charge 
                    </th>
                    <td>
                        <asp:Label ID="dce_lbl" runat="server" Text='<%#bind("dcharge") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <th>
                    Amount Payable
                    </th>
                    <td>
                        <asp:Label ID="ape_lbl" runat="server" Text='<%#bind("amount") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <th>
                    Order Status
                    </th>
                    <td>
                        <asp:RadioButtonList ID="os_rbl" runat="server" 
                            SelectedValue='<%# bind("status") %>'>
                            <asp:ListItem>Pending</asp:ListItem>
                            
                            <asp:ListItem>Progress</asp:ListItem>
                          
                            <asp:ListItem>Complate</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    
                    <td colspan=2>
                        <asp:LinkButton ID="updlnk" runat="server" CommandName="update">Update</asp:LinkButton>
                        <asp:LinkButton ID="cnllnk" runat="server" CommandName="cancel">Cancel</asp:LinkButton>
                    </td>
                </tr>
            </table>

        </EditItemTemplate>
    </asp:FormView>

</div>
<br />
    <div align="center">
        <asp:ImageButton ID="ImageButton1" runat="server" 
            ImageUrl="~/images/button_back1.png" onclick="ImageButton1_Click" />
    </div>
</asp:Content>

