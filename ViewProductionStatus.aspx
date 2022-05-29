<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewProductionStatus.aspx.cs" Inherits="ViewProductionStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderadmin" Runat="Server">

<h1 align="left"> View Production Detail </h1>

<div align="center">
    <asp:FormView ID="FormView1" runat="server" 
       Width="644px" onmodechanging="FormView1_ModeChanging" 
        onitemupdating="FormView1_ItemUpdating">
    
        <ItemTemplate>
            
            <table cellspacing="10" style="font-size:15px; width: 632px;" align="left" border=0>
            <colgroup>
                <col width="200px" />
                <col width="250px" />
            </colgroup>
                <tr align="left">
                    <th>
                        Order ID
                    </th>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text='<%#bind("oid") %>'></asp:Label>
                    </td>
                </tr>
               <tr align="left">
                    <th>
                        User Name
                    </th>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text='<%#bind("uname") %>'></asp:Label>
                            
                    </td>
                </tr>
                
                <tr align="left">
                    <th>
                        Thread Color
                    </th>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text='<%#bind("ntclr") %>'></asp:Label>

                        
                    </td>
                </tr>
                        
                <tr align="left">
                    <th>
                        Thread Quantity
                    </th>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text='<%#bind("thqnt") %>'></asp:Label>

                        
                    </td>
                </tr>

                <tr align="left">
                    <th>
                        Starting Date
                    </th>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text='<%#bind("sdate") %>'></asp:Label>
                    </td>
                </tr>

                <tr align="left">
                    <th>
                        Complete Date
                    </th>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text='<%#bind("cdate") %>'></asp:Label>
                    </td>
                </tr>

                <tr align="left">
                    <th>
                        Status
                    </th>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text='<%#bind("status") %>'></asp:Label>
                    </td>
                </tr>

                <tr align="left">
                    <td colspan=2>
                        <asp:LinkButton ID="editlnk" runat="server" CommandName="edit"  
                            >Edit</asp:LinkButton>
                    </td>
                </tr>
                </table>

        </ItemTemplate>

        <EditItemTemplate>
            
            <table cellspacing="10" style="font-size:15px; width: 632px;" align="left" border=0>
            <colgroup>
                <col width="200px" />
                <col width="250px" />
            </colgroup>
                <tr align="left">
                    <th>
                        Production ID
                    </th>
                    <td>
                        <asp:Label ID="prid_lbl" runat="server" Text='<%#bind("prid") %>'></asp:Label>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        Order ID
                    </th>
                    <td>
                        <asp:TextBox ID="oid_txt" runat="server" Text='<%#bind("oid") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        User Name
                    </th>
                    <td>
                        
                            <asp:TextBox ID="un_txt" runat="server" Width="165px" Text='<%#bind("uname") %>'></asp:TextBox>
                        
                        
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        Fabric Quantity
                    </th>
                    <td>
                        <asp:TextBox ID="fq_txt" runat="server" Width="165px" Text='<%#bind("fbqnt") %>'></asp:TextBox>
                        
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        No. Of Thread Color used
                    </th>
                    <td>
                        <asp:DropDownList ID="ntc_ddl" runat="server" Height="16px" Width="165px" 
                            AutoPostBack="True" onselectedindexchanged="ntc_ddl_SelectedIndexChanged" >
                            <asp:ListItem>-----Select-----</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            
                        </asp:DropDownList>

                        <div>
                                
                                <asp:DropDownList ID="ddl1" runat="server" >
                            </asp:DropDownList>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            <br />
                            <asp:DropDownList ID="ddl2" runat="server" >
                            </asp:DropDownList>
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            <br />
                            <asp:DropDownList ID="ddl3" runat="server" >
                            </asp:DropDownList>
                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                            <br />
                            <asp:DropDownList ID="ddl4" runat="server" >
                            </asp:DropDownList>
                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                            <br />
                            <asp:DropDownList ID="ddl5" runat="server" > 
                            </asp:DropDownList>
                            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>

                            
                            <br />
                           

                            </div>

                    </td>
                    </tr>
                    <tr>
                    <td></td>
                    <td>
                        
                            
                   
                        
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        Starting Date
                    </th>
                    <td>
                        <asp:TextBox ID="sd_txt" runat="server" Text='<%#bind("sdate") %>'></asp:TextBox>
                    </td> 
                </tr>
                <tr align="left">
                    <th>
                        Complete Date
                    </th>
                    <td>
                        <asp:TextBox ID="cd_txt" runat="server" Text='<%#bind("cdate") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        Status
                    </th>
                    <td>
                        <asp:RadioButtonList ID="sts_rbl" runat="server" 
                            SelectedValue='<%# bind("status") %>'>
                            <asp:ListItem>Complete</asp:ListItem>
                            <asp:ListItem>Progress</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>

                 <tr align="left">
                    <td colspan=2>
                        <asp:LinkButton ID="updatelnk" runat="server" CommandName="update">Update</asp:LinkButton>
                        <asp:LinkButton ID="cancellnk" runat="server" CommandName="cancel">Cancel</asp:LinkButton>
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

<br />
<br />
</asp:Content>

