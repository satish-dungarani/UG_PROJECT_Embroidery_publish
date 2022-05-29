<%@ Page Title="" Language="C#" MasterPageFile="~/PurchaseMasterPage.master" AutoEventWireup="true" CodeFile="DeliveryAddress.aspx.cs" Inherits="DeliveryAddress" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>Delivery Address Conformation...</h1>
<div>
    <asp:FormView ID="FormView1" runat="server" Width="567px" 
        onmodechanging="FormView1_ModeChanging" Height="355px" 
        onitemupdating="FormView1_ItemUpdating">
        <ItemTemplate>
            <table align="left" style="width: 234px; height: 297px; font-size:larger">
                <tr align="left">
                    <th style="width:100px">Name  </th>
                    <td>
                        <asp:Label ID="un_lbl" runat="server" Text='<%#bind("fname") %>'></asp:Label></td>
                </tr>
                <tr align="left">
                    <th style="width:100px">Pincode </th>
                    <td>
                        <asp:Label ID="pc_lbl" runat="server" Text='<%#bind("pincode") %>'></asp:Label></td>
                </tr>
                <tr align="left">
                    <th style="width:100px">Address </th>
                    <td>
                        <asp:Label ID="addr_lbl" runat="server" Text='<%#bind("address") %>'></asp:Label></td>
                </tr>
                <tr align="left">
                    <th style="width:100px">LandMark </th>
                    <td>
                        <asp:Label ID="lm_lbl" runat="server" Text='<%#bind("landmark") %>'></asp:Label></td>
                </tr>
                <tr align="left">
                    <th style="width:100px">City </th>
                    <td>
                        <asp:Label ID="ct_lbl" runat="server" Text='<%#bind("city") %>'></asp:Label></td>
                </tr>
                <tr align="left">
                    <th style="width:100px">State </th>
                    <td>
                        <asp:Label ID="st_lbl" runat="server" Text='<%#bind("state") %>'></asp:Label></td>
                </tr>
                <tr align="left">
                    <th style="width:100px">Country </th>
                    <td>
                        <asp:Label ID="cnt_lbl" runat="server" Text='<%#bind("country") %>'></asp:Label></td>
                </tr>
                <tr align="left">
                    <th style="width:100px">Phone No. </th>
                    <td>
                        <asp:Label ID="ph_lbl" runat="server" Text='<%#bind("phone") %>'></asp:Label></td>
                </tr>

                <tr align="left">
                    <td>
                        <asp:LinkButton ID="editlnk" runat="server" CommandName="edit">Edit</asp:LinkButton>
                     
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="right">
                        <asp:ImageButton ID="con_img" runat="server" 
        ImageUrl="~/images/save_btn.png"  CommandArgument='<%#bind("oid")%>' oncommand="con_img_Command" 
                               />
                    </td>
            </table>
        </ItemTemplate>

        <EditItemTemplate>

                <table align="left" style="width: 234px; height: 297px; font-size:larger">

                
                <tr align="left">
                    <th style="width:150px">
                        Name 
                    </th>
                    <td>
                        <asp:Label ID="fn_lbl" Text='<%#bind("fname") %>' runat="server" />
                    </td>
                    
                </tr>
                
                <tr align="left">
                    <th style="width:150px">
                        Pincode 
                    </th>
                    <td>
                        <asp:TextBox ID="pin_txt" Text='<%#bind("pincode") %>' runat="server" />
                    </td>
                    
                </tr>
                
                <tr align="left">
                    <th style="width:150px">
                        Address 
                    </th>
                    <td>
                        <asp:TextBox ID="addr_txt" Text='<%#bind("address") %>' runat="server" TextMode="MultiLine" />
                    </td>
                    
                </tr>

                <tr align="left">
                    <th style="width:150px">
                        Landmark 
                    </th>
                    <td>
                        <asp:TextBox ID="lm_txt" Text='<%#bind("landmark") %>' runat="server"  />
                    </td>
                    
                </tr>

                <tr align="left">
                    <th style="width:150px">
                        City 
                    </th>
                    <td>
                        <asp:DropDownList ID="ct_ddl" runat="server" CssClass="tb">
                        <asp:ListItem>Ahmedabad</asp:ListItem>
                        <asp:ListItem>Baroda</asp:ListItem>
                        <asp:ListItem>Navsari</asp:ListItem>
                        <asp:ListItem>Surat</asp:ListItem>
                        <asp:ListItem>Valsad</asp:ListItem>
                    </asp:DropDownList>
                    </td>
                    
                </tr>

                <tr align="left">
                    <th style="width:150px">
                        State 
                    </th>
                    <td>
                         <asp:DropDownList ID="st_ddl" runat="server" CssClass="tb">
                        <asp:ListItem>Gujarata</asp:ListItem>
                        <asp:ListItem>Utar Pradesh</asp:ListItem>
                        <asp:ListItem>Madhya Pradesh</asp:ListItem>
                        <asp:ListItem>Delhi</asp:ListItem>
                        <asp:ListItem>Bangal</asp:ListItem>
                    </asp:DropDownList>
                    </td>
                    
                </tr>

                 <tr align="left">
                    <th style="width:150px">
                        Country 
                    </th>
                    <td>
                        <asp:Label ID="cnt_lbl" Text='<%#bind("country") %>' runat="server" />
                    </td>
                    
                </tr>
                
                <tr align="left">
                    <th style="width:150px">
                        Phone Number 
                    </th>
                    <td>
                        <asp:TextBox ID="pn_txt" Text='<%#bind("phone") %>' runat="server" />
                    </td>
                    
                </tr>

                <tr align="left">
                    <td colspan="2">
                        <asp:LinkButton ID="updatelnk" runat="server" CommandName="update">Update</asp:LinkButton>
                        <asp:LinkButton ID="cancellnk" runat="server" CommandName="cancel">Cancel</asp:LinkButton>
                    </td>
                </tr>

                
                </tr>
                </table>

        </EditItemTemplate>

    </asp:FormView>

    <br />
        
        
</div>
</asp:Content>

