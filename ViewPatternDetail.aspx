<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewPatternDetail.aspx.cs" Inherits="ViewPatternDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderadmin" Runat="Server">

<h1 align="left"> View Pattern Detail </h1>

<div align="center">
    <asp:FormView ID="FormView1" runat="server" 
        onitemupdating="FormView1_ItemUpdating1" 
        onmodechanging="FormView1_ModeChanging1" Width="644px">
    
        <ItemTemplate>
        
                <table cellpadding=5 cellspacing=3 border=1 align="center">

                <tr align="center">
                    
                    <td colspan="2" align="center">
                        <asp:Image ID="ptn_img" runat="server" ImageUrl='<%#bind("pimgpath") %>' Width=150px Height=150px BorderWidth=2 BorderColor=Black/>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        Pattern ID : 
                    </th>
                    <td>
                        <asp:Label ID="pid_lbl" Text='<%#bind("pid") %>' runat="server" />
                    </td>
                    
               </tr>
                <tr align="left">
                    <th>
                        Pattern Name :
                    </th>
                    <td>
                        <asp:Label ID="pname_lbl" Text='<%#bind("pname") %>' runat="server" />
                    </td>   
                    
               </tr>
                <tr align="left"> 
                    <th>
                        Stitches :
                    </th>
                    <td>
                        <asp:Label ID="stc_lbl" Text='<%#bind("stitches") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Colors :
                    </th>
                    <td>
                        <asp:Label ID="clr_lbl" Text='<%#bind("color") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Height :
                    </th>
                    <td>
                        <asp:Label ID="hgt_lbl" Text='<%#bind("height") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Width :
                    </th>
                    <td>
                        <asp:Label ID="wdt_lbl" Text='<%#bind("width") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Price :
                    </th>
                    <td>
                        <asp:Label ID="prc_lbl" Text='<%#bind("price") %>' runat="server" />
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
                        <asp:FileUpload ID="ptnimg_up" runat="server" />
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        Pattern ID :
                    </th>
                    <td>
                        <asp:Label ID="ptnid_lbl" Text='<%#bind("pid") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Pattern Name :
                    </th>
                    <td>
                        <asp:TextBox ID="ptnname_txt" Text='<%#bind("pname") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Stitches :
                    </th>
                    <td>
                         <asp:TextBox ID="stc_txt" Text='<%#bind("stitches") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Colors :
                    </th>
                    <td>
                        <asp:TextBox ID="clr_txt" Text='<%#bind("color") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                       Height :
                    </th>
                    <td>
                        <asp:TextBox ID="hgt_txt" Text='<%#bind("height") %>' runat="server" />
                    </td>
                    
                </tr>
                
                <tr align="left">
                    <th>
                        Width :
                    </th>
                    <td>
                        <asp:TextBox ID="wdt_txt" Text='<%#bind("width") %>' runat="server" TextMode="MultiLine" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Price :
                    </th>
                    <td>
                        <asp:TextBox ID="prc_txt" Text='<%#bind("price") %>' runat="server" />
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

