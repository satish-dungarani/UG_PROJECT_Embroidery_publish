<%@ Page Title="" Language="C#" MasterPageFile="~/ProductMasterPage.master" AutoEventWireup="true" CodeFile="ViewFabric.aspx.cs" Inherits="ViewFabric" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<style type="text/css">
        .style1
        {
            height: 32px;
        }
    </style>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <h2 align="center">PRICE</h2>
                <div class="left_col_box" align="left">
                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="CheckBoxList1_SelectedIndexChanged">
                        <asp:ListItem Value="1-499">Rs. 499 And Below </asp:ListItem>
                        <asp:ListItem Value="500-799">Rs. 500-Rs. 799 </asp:ListItem>
                        <asp:ListItem Value="800-999">Rs. 800-Rs. 999 </asp:ListItem>
                        <asp:ListItem Value="1000-1499">Rs. 1000-Rs. 1499 </asp:ListItem>
                        <asp:ListItem Value="1500-100000">Rs. 1500 And Above </asp:ListItem>
                    </asp:CheckBoxList>
                </div>
                <h2 align="center">
                    FABRIC</h2>
                <div class="left_col_box" align="left" 
        style="overflow-x:hidden; overflow-y:scroll; height: 175px;">
                    <asp:CheckBoxList ID="CheckBoxList2" runat="server" Width="173px" 
                        AutoPostBack="True" 
                        onselectedindexchanged="CheckBoxList2_SelectedIndexChanged" >
                        <asp:ListItem Text="Brass">Brass </asp:ListItem>
                        <asp:ListItem Text="Brocade">Brocade</asp:ListItem>
                        <asp:ListItem Text="Chanderi">Chanderi</asp:ListItem>
                        <asp:ListItem Text="Chiffon">Chiffon</asp:ListItem>
                        <asp:ListItem Text="Cotton">Cotton</asp:ListItem>
                        <asp:ListItem Text="Crepe">Crepe</asp:ListItem>
                        <asp:ListItem Text="Georgette">Georgette</asp:ListItem>
                        <asp:ListItem Text="Jacquard">Jacquard</asp:ListItem>
                        <asp:ListItem Text="Net">Net</asp:ListItem>
                        <asp:ListItem Text="Nylon">Nylon</asp:ListItem>
                        <asp:ListItem Text="Organza">Organza</asp:ListItem>
                        <asp:ListItem Text="Polycotton">Polycotton</asp:ListItem>
                        <asp:ListItem Text="Satin">Satin</asp:ListItem>
                        <asp:ListItem Text="Silk">Silk</asp:ListItem>
                        <asp:ListItem Text="Synthetic">Synthetic</asp:ListItem>
                        <asp:ListItem Text="Tissue">Tissue</asp:ListItem>
                        <asp:ListItem Text="Viscose">Viscose</asp:ListItem>
                    </asp:CheckBoxList>
                </div>
                <h2 align="center">
                    BRANDS</h2>
                <div class="left_col_box" align="left" 
        style="overflow-x:hidden; overflow-y:scroll; height: 175px;">
                    <asp:CheckBoxList ID="CheckBoxList3" runat="server" Width="173px" 
                        AutoPostBack="True" 
                        onselectedindexchanged="CheckBoxList3_SelectedIndexChanged" >
                        <asp:ListItem Text="Fabdeal">Fabdeal</asp:ListItem>
                        <asp:ListItem Text="Diva Fashion">Diva Fashion</asp:ListItem>
                        <asp:ListItem Text="Ishin">Ishin</asp:ListItem>
                        <asp:ListItem Text="Prafful">Prafful</asp:ListItem>
                        <asp:ListItem Text="Tanish">Tanish</asp:ListItem>
                        <asp:ListItem Text="Triveni">Triveni</asp:ListItem>
                        <asp:ListItem Text="Rajguru Rise">Rajguru Rise</asp:ListItem>
                        <asp:ListItem Text="Vishl">Vishl</asp:ListItem>
                        <asp:ListItem Text="Bhavi">Bhavi</asp:ListItem>
                        <asp:ListItem Text="Saree Swarg">Saree Swarg</asp:ListItem>
                        <asp:ListItem Text="Hiba">Hiba</asp:ListItem>
                        <asp:ListItem Text="Fashionic">Fashionic</asp:ListItem>
                        <asp:ListItem Text="Vivaa">Vivaa</asp:ListItem>
                        <asp:ListItem Text="Valeska">Valeska</asp:ListItem>
                        <asp:ListItem Text="Samyakk">Samyakk</asp:ListItem>
                        <asp:ListItem Text="Soch">Soch</asp:ListItem>
                        <asp:ListItem Text="Adaa">Adaa</asp:ListItem>
                        <asp:ListItem Text="Anamika">Anamika</asp:ListItem>
                        <asp:ListItem Text="Carah">Carah</asp:ListItem>
                        <asp:ListItem Text="Hawai">Hawai</asp:ListItem>
                        <asp:ListItem Text="Vivid India">Vivid India</asp:ListItem>
                    </asp:CheckBoxList>
                </div>
                <h2 align="center">
                    COLORS</h2>
                <div class="left_col_box" align="left" 
        style="overflow-x:hidden; overflow-y:scroll; height: 175px;">
                    <asp:CheckBoxList ID="CheckBoxList4" runat="server" Width="173px" 
                        AutoPostBack="True" 
                        onselectedindexchanged="CheckBoxList4_SelectedIndexChanged" >
                        <asp:ListItem Text="Black">Black</asp:ListItem>
                        <asp:ListItem Text="Pink">Pink</asp:ListItem>
                        <asp:ListItem Text="White">White</asp:ListItem>
                        <asp:ListItem Text="Red">Red</asp:ListItem>
                        <asp:ListItem Text="Blue">Blue</asp:ListItem>
                        <asp:ListItem Text="Yellow">Yellow</asp:ListItem>
                        <asp:ListItem Text="Purpole">Purpole</asp:ListItem>
                        <asp:ListItem Text="Green">Green</asp:ListItem>
                        <asp:ListItem Text="Multicolor">Multicolor</asp:ListItem>
                        <asp:ListItem Text="Beige">Beige</asp:ListItem>
                        <asp:ListItem Text="Dark Blue">Dark Blue</asp:ListItem>
                        <asp:ListItem Text="Maroon">Maroon</asp:ListItem>
                        <asp:ListItem Text="Orange">Orange</asp:ListItem>
                        <asp:ListItem Text="Gold">Gold</asp:ListItem>
                        <asp:ListItem Text="Gray">Gray</asp:ListItem>
                        <asp:ListItem Text="Dark Green">Dark Green</asp:ListItem>
                        <asp:ListItem Text="Light Blue">Light Blue</asp:ListItem>
                        <asp:ListItem Text="Brown">Brown</asp:ListItem>
                        <asp:ListItem Text="Light Green">Light Green</asp:ListItem>
                        <asp:ListItem Text="Silver">Silver</asp:ListItem>
                    </asp:CheckBoxList>
                </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<h1 align="left">List Of Fabric</h1>

<div>
    <table>
        <tr>
            <th>
                <asp:Button ID="srch_btn" runat="server" Text="Search" 
                    onclick="srch_btn_Click" />
            </th>
            <td>
                <asp:TextBox ID="srch_txt" runat="server" Height="19px" Width="345px"></asp:TextBox>
            </td>
            <th class="style2">
                Sort By :
            </th>
            <td>
                <asp:DropDownList ID="srt_ddl" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="srt_ddl_SelectedIndexChanged">
                    <asp:ListItem>-----Select Value-----</asp:ListItem>
                    <asp:ListItem>Low to High Price</asp:ListItem>
                    <asp:ListItem>High to Low Price</asp:ListItem>
                    <asp:ListItem>Sort by Fabric Name</asp:ListItem>
                    <asp:ListItem>Sort by Fabric Type</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
    </table>
</div>
<br />

<div>

    <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" 
        RepeatDirection="Horizontal">
        <ItemTemplate>
            <table width="165px">
                <tr>
                    
                    <td align="left" colspan=2>
                        <asp:LinkButton ID="img_lnk" runat="server" 
                            CommandArgument='<%#bind("fbid") %>' oncommand="img_lnk_Command"><asp:Image ID="Image1" runat="server" ImageUrl='<%#bind("imgpath") %>' Width=140 Height=140/></asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td align="left">Name : </td>
                    <td align="left">
                    <a href="#">
                        <asp:Label ID="Label1" runat="server" Text='<%#bind("fbname") %>'></asp:Label></a>
                    </td>
                </tr>
                <tr>
                    <td align="left">Type : </td>
                    <td align="left">
                    <a href="#">
                        <asp:Label ID="Label2" runat="server" Text='<%#bind("fbtype") %>'></asp:Label></a>
                    </td>
                </tr>
                <tr>
                    <td align="left">Price : </td>
                    <td align="left">
                    <a href="#">
                        <asp:Label ID="Label3" runat="server" Text='<%#bind("fbprice") %>'></asp:Label></a>
                    </td>
                </tr>
                <tr>
                    <td align="left">
                    </td>
                </tr>
             </table>
        </ItemTemplate>
    </asp:DataList>
   
</div>
</asp:Content>


