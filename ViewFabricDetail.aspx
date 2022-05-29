<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewFabricDetail.aspx.cs" Inherits="ViewFabricDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderadmin" Runat="Server">
<h1 align="left"> View Fabric Detail </h1>

<div align="center">
    <asp:FormView ID="FormView1" runat="server" 
        onitemupdating="FormView1_ItemUpdating1" 
        onmodechanging="FormView1_ModeChanging1" Width="644px">
    
        <ItemTemplate>
        
                <table cellpadding=5 cellspacing=3 border=1 align="center">

                <tr align="center">
                    
                    <td colspan="2" align="center">
                        <asp:Image ID="fab_img" runat="server" ImageUrl='<%#bind("imgpath") %>' Width=150px Height=150px BorderWidth=2 BorderColor=Black/>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        Fabric ID : 
                    </th>
                    <td>
                        <asp:Label ID="fbid_lbl" Text='<%#bind("fbid") %>' runat="server" />
                    </td>
                    
               </tr>
                <tr align="left">
                    <th>
                        Fabric Name :
                    </th>
                    <td>
                        <asp:Label ID="fbname_lbl" Text='<%#bind("fbname") %>' runat="server" />
                    </td>   
                    
               </tr>
                <tr align="left"> 
                    <th>
                        Available :
                    </th>
                    <td>
                        <asp:Label ID="ava_lbl" Text='<%#bind("fbava") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Used :
                    </th>
                    <td>
                        <asp:Label ID="use_lbl" Text='<%#bind("fbused") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Total :
                    </th>
                    <td>
                        <asp:Label ID="tt_lbl" Text='<%#bind("fbtt") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Type :
                    </th>
                    <td>
                        <asp:Label ID="typ_lbl" Text='<%#bind("fbtype") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Brand :
                    </th>
                    <td>
                        <asp:Label ID="Label1" Text='<%#bind("fbbrand") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Color :
                    </th>
                    <td>
                        <asp:Label ID="clr_lbl" Text='<%#bind("fbclr") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Price :
                    </th>
                    <td>
                        <asp:Label ID="prc_lbl" Text='<%#bind("fbprice") %>' runat="server" />
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

                <table cellspacing=5 cellpadding=3 border=1 align="center">

                <tr align="left">
                    <th>
                        Image Upload :
                    </th>
                    <td >
                        <asp:FileUpload ID="fabimg_up" runat="server" />
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        Fabric ID :
                    </th>
                    <td>
                        <asp:Label ID="fabid_lbl" Text='<%#bind("fbid") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Fabric Name :
                    </th>
                    <td>
                        <asp:TextBox ID="fabname_txt" Text='<%#bind("fbname") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Available :
                    </th>
                    <td>
                         <asp:TextBox ID="fabava_txt" Text='<%#bind("fbava") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Used :
                    </th>
                    <td>
                        <asp:TextBox ID="fabuse_txt" Text='<%#bind("fbused") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                       Total :
                    </th>
                    <td>
                        <asp:TextBox ID="fabtt_txt" Text='<%#bind("fbtt") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Type :
                    </th>
                    <td>
                         <asp:DropDownList ID="fabtyp_ddl" runat="server" CssClass="tb">
                        
                            <asp:ListItem>Brass </asp:ListItem>
                        <asp:ListItem>Brocade</asp:ListItem>
                        <asp:ListItem>Chanderi</asp:ListItem>
                        <asp:ListItem>Chiffon</asp:ListItem>
                        <asp:ListItem>Cotton</asp:ListItem>
                        <asp:ListItem>Crepe</asp:ListItem>
                        <asp:ListItem>Georgette</asp:ListItem>
                        <asp:ListItem>Jacquard</asp:ListItem>
                        <asp:ListItem>Net</asp:ListItem>
                        <asp:ListItem>Nylon</asp:ListItem>
                        <asp:ListItem>Organza</asp:ListItem>
                        <asp:ListItem>Polycotton</asp:ListItem>
                        <asp:ListItem>Satin</asp:ListItem>
                        <asp:ListItem>Silk</asp:ListItem>
                        <asp:ListItem>Synthetic</asp:ListItem>
                        <asp:ListItem>Tissue</asp:ListItem>
                        <asp:ListItem>Viscose</asp:ListItem>
                        
                    </asp:DropDownList>
                    </td>
                    
                </tr>
                <th align="left">
                    Fabric Brand
                </th>
                <td>
                    <asp:DropDownList ID="ddlbrand" runat="server" CssClass="tb">
                        <asp:ListItem>Fabdeal</asp:ListItem>
                        <asp:ListItem>Diva Fashion</asp:ListItem>
                        <asp:ListItem>Ishin</asp:ListItem>
                        <asp:ListItem>Prafful</asp:ListItem>
                        <asp:ListItem>Tanish</asp:ListItem>
                        <asp:ListItem>Triveni</asp:ListItem>
                        <asp:ListItem>Rajguru Rise</asp:ListItem>
                        <asp:ListItem>Vishl</asp:ListItem>
                        <asp:ListItem>Bhavi</asp:ListItem>
                        <asp:ListItem>Saree Swarg</asp:ListItem>
                        <asp:ListItem>Hiba</asp:ListItem>
                        <asp:ListItem>Fashionic</asp:ListItem>
                        <asp:ListItem>Vivaa</asp:ListItem>
                        <asp:ListItem>Valeska</asp:ListItem>
                        <asp:ListItem>Samyakk</asp:ListItem>
                        <asp:ListItem>Soch</asp:ListItem>
                        <asp:ListItem>Adaa</asp:ListItem>
                        <asp:ListItem>Anamika</asp:ListItem>
                        <asp:ListItem>Carah</asp:ListItem>
                        <asp:ListItem>Hawai</asp:ListItem>
                        <asp:ListItem>Vivid India</asp:ListItem>
                    </asp:DropDownList>
                </td>
                
                <tr align="left">
                    <th>
                        Color :
                    </th>
                    <td>
                        <asp:DropDownList ID="fabclr_txt" runat="server" CssClass="tb">
                        <asp:ListItem>Black</asp:ListItem>
                        <asp:ListItem>Pink</asp:ListItem>
                        <asp:ListItem>White</asp:ListItem>
                        <asp:ListItem>Red</asp:ListItem>
                        <asp:ListItem>Blue</asp:ListItem>
                        <asp:ListItem>Yellow</asp:ListItem>
                        <asp:ListItem>Purpole</asp:ListItem>
                        <asp:ListItem>Green</asp:ListItem>
                        <asp:ListItem>Multicolor</asp:ListItem>
                        <asp:ListItem>Beige</asp:ListItem>
                        <asp:ListItem>Dark Blue</asp:ListItem>
                        <asp:ListItem>Maroon</asp:ListItem>
                        <asp:ListItem>Orange</asp:ListItem>
                        <asp:ListItem>Gold</asp:ListItem>
                        <asp:ListItem>Gray</asp:ListItem>
                        <asp:ListItem>Dark Green</asp:ListItem>
                        <asp:ListItem>Light Blue</asp:ListItem>
                        <asp:ListItem>Brown</asp:ListItem>
                        <asp:ListItem>Light Green</asp:ListItem>
                        <asp:ListItem>Silver</asp:ListItem>
                    </asp:DropDownList>
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Price :
                    </th>
                    <td>
                        <asp:TextBox ID="fabprc_txt" Text='<%#bind("fbprice") %>' runat="server" />
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
</asp:Content>

