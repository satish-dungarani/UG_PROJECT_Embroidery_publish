<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="SupplyDetail.aspx.cs" Inherits="SupplyDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderadmin" Runat="Server">

<h1 align="left"> View Supply Detail </h1>

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
                        Supply ID
                    </th>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text='<%#bind("spid") %>'></asp:Label>
                    </td>
                </tr>
               <tr align="left">
                    <th>
                        Supplier Name
                    </th>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text='<%#bind("spname") %>'></asp:Label>
                            
                    </td>
                </tr>
                
                <tr align="left">
                    <th>
                        Supply Type
                    </th>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text='<%#bind("sptyp") %>'></asp:Label>

                        
                    </td>
                </tr>
                        
                <tr align="left">
                    <th>
                        Order Id
                    </th>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text='<%#bind("oid") %>'></asp:Label>

                        
                    </td>
                </tr>

                <tr align="left">
                    <th>
                        Vehical Name
                    </th>
                    <td>
                        <asp:Label ID="vn_lbl" runat="server" Text='<%#bind("vname") %>'></asp:Label>
                    </td>
                </tr>

                <tr align="left">
                    <th>
                        Vehical Type
                    </th>
                    <td>
                        <asp:Label ID="vt_lbl" runat="server" Text='<%#bind("vtype") %>'></asp:Label>
                    </td>
                </tr>

                <tr align="left">
                    <th>
                        Vehical Number
                    </th>
                    <td>
                        <asp:Label ID="vno_lbl" runat="server" Text='<%#bind("vno") %>'></asp:Label>
                    </td>
                </tr>

                <tr align="left">
                    <th>
                        Supply Date
                    </th>
                    <td>
                        <asp:Label ID="sd_lbl" runat="server" Text='<%#bind("spdate") %>'></asp:Label>
                    </td>
                </tr>

                <tr align="left">
                    <th>
                        Amount
                    </th>
                    <td>
                        <asp:Label ID="amo_lbl" runat="server" Text='<%#bind("spamo") %>'></asp:Label>
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
            <tr>
                <td align="left">
                    Supplier Name
                </td>
                <td>
                    <asp:TextBox ID="spname" runat="server" Text='<%#bind("Spname") %>' CssClass="tb"></asp:TextBox>
                </td>
                
            </tr>

            <tr>
                <td align="left">
                   Supply Type
                </td>
                <td align="left">
                    <asp:RadioButtonList ID="styp" runat="server" 
                        
                        SelectedValue='<%# bind("sptyp") %>'>
                    <asp:ListItem>Sale</asp:ListItem>
                    <asp:ListItem>Purchase</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                
            </tr>

            <tr>
                <td align="left">
                    Order Id
                </td>
                <td align="left">
                    <asp:TextBox ID="oid_txt" runat="server" Text='<%#bind("oid") %>' CssClass="tb"></asp:TextBox>
                            
                </td>
                
            </tr>
            
            <tr>
                <td align="left">
                    Vehical Name
                </td>
                <td>
                    <asp:TextBox ID="vname" runat="server" Text='<%#bind("vname") %>' CssClass="tb" ></asp:TextBox>
                </td>
                
            </tr>

            <tr>
                <td align="left">
                    Vehical Type
                </td>
                <td align="left">
                    <asp:DropDownList ID="vtyp" runat="server" CssClass="tb">
                        <asp:ListItem>-----Select-----</asp:ListItem>
                        <asp:ListItem>3 wheels</asp:ListItem>
                        <asp:ListItem>4 wheels</asp:ListItem>
                        <asp:ListItem>6 wheels</asp:ListItem>
                    </asp:DropDownList>
                </td>
                
            </tr>

            <tr>
                <td align="left">
                    Vehical No
                </td>
                <td>
                    <asp:TextBox ID="vno" runat="server" CssClass="tb" Text='<%#bind("vno") %>' TextMode="MultiLine"></asp:TextBox>
                </td>
                
            </tr>

            <tr>
                <td align="left">
                    Supply Date
                </td>
                <td>
                    <asp:TextBox ID="spdate" runat="server" Text='<%#bind("spdate") %>' CssClass="tb"></asp:TextBox>
                </td>
                
            </tr>


            

            <tr>
                <td align="left">
                    Amount
                </td>
                <td>
                    <asp:TextBox ID="amo" runat="server" Text='<%#bind("spamo") %>' CssClass="tb"></asp:TextBox>
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

