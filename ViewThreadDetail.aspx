<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewThreadDetail.aspx.cs" Inherits="ViewThreadDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderadmin" Runat="Server">

<h1 align="left"> View Thread Detail </h1>

<div align="center">
    <asp:FormView ID="FormView1" runat="server" 
        onitemupdating="FormView1_ItemUpdating1" 
        onmodechanging="FormView1_ModeChanging1" Width="644px">
    
        <ItemTemplate>
        
                <table cellpadding=5 cellspacing=3 border=1 align="center">

                <tr align="center">
                    
                    <td colspan="2" align="center">
                        <asp:Image ID="thd_img" runat="server" ImageUrl='<%#bind("imgpath") %>' Width=150px Height=150px BorderWidth=2 BorderColor=Black/>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        Thread ID : 
                    </th>
                    <td>
                        <asp:Label ID="tid_lbl" Text='<%#bind("thid") %>' runat="server" />
                    </td>
                    
               </tr>
                <tr align="left">
                    <th>
                        Thread Name :
                    </th>
                    <td>
                        <asp:Label ID="tname_lbl" Text='<%#bind("thname") %>' runat="server" />
                    </td>   
                    
               </tr>
                <tr align="left"> 
                    <th>
                        Available Quentity :
                    </th>
                    <td>
                        <asp:Label ID="aq_lbl" Text='<%#bind("thaq") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Used Thread :
                    </th>
                    <td>
                        <asp:Label ID="ut_lbl" Text='<%#bind("thuq") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Total Quentity :
                    </th>
                    <td>
                        <asp:Label ID="tq_lbl" Text='<%#bind("thtq") %>' runat="server" />
                    </td>
                    
                </tr>

                <tr align="left">
                    <th>
                        Thread Type :
                    </th>
                    <td>
                        <asp:Label ID="tht_lbl" Text='<%#bind("thtype") %>' runat="server" />
                    </td>
                    
                </tr>

                <tr align="left">
                    <th>
                        Color :
                    </th>
                    <td>
                        <asp:Label ID="clr_lbl" Text='<%#bind("color") %>' runat="server" />
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
                        <asp:FileUpload ID="thdimg_up" runat="server" />
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        Thread ID :
                    </th>
                    <td>
                        <asp:Label ID="thdid_lbl" Text='<%#bind("thid") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Thread Name :
                    </th>
                    <td>
                        <asp:TextBox ID="thdname_txt" Text='<%#bind("thname") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Available Quentity :
                    </th>
                    <td>
                         <asp:TextBox ID="aq_txt" Text='<%#bind("thaq") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Used Thread :
                    </th>
                    <td>
                        <asp:TextBox ID="ut_txt" Text='<%#bind("thuq") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                       Total Quentity :
                    </th>
                    <td>
                        <asp:TextBox ID="tq_txt" Text='<%#bind("thtq") %>' runat="server" />
                    </td>
                    
                </tr>

                <tr align="left">
                    <th>
                        Thread Type :
                    </th>
                    <td>
                         <asp:DropDownList ID="ttyp_ddl" runat="server" CssClass="tb">
                        <asp:ListItem>Normal</asp:ListItem>
                        <asp:ListItem>With Jari</asp:ListItem>
                        <asp:ListItem>Without Jari</asp:ListItem>
                        
                    </asp:DropDownList>
                    </td>
                    
                </tr>
                
                <tr align="left">
                    <th>
                        Color :
                    </th>
                    <td>
                        <asp:TextBox ID="clr_txt" Text='<%#bind("color") %>' runat="server" TextMode="MultiLine" />
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

