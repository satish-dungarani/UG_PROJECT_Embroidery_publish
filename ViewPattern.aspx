<%@ Page Title="" Language="C#" MasterPageFile="~/ProductMasterPage.master" AutoEventWireup="true" CodeFile="ViewPattern.aspx.cs" Inherits="ViewPattern" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<style type="text/css">
        .style2
    {
        width: 67px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <h2 align="center">PRICE</h2>
                <div class="left_col_box" align="left">
                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="CheckBoxList1_SelectedIndexChanged">
                        <asp:ListItem Value="1-99">Rs. 99 And Below </asp:ListItem>
                        <asp:ListItem Value="100-199">Rs. 100-Rs. 199 </asp:ListItem>
                        <asp:ListItem Value="200-299">Rs. 200-Rs. 299 </asp:ListItem>
                        <asp:ListItem Value="300-499">Rs. 300-Rs. 499 </asp:ListItem>
                        <asp:ListItem Value="500-999">Rs. 500 And Above </asp:ListItem>
                    </asp:CheckBoxList>
                </div>
                <h2 align="center">
                    STITCHES</h2>
                <div class="left_col_box" align="left" >
                    <asp:CheckBoxList ID="CheckBoxList2" runat="server" Width="173px" 
                        AutoPostBack="True" 
                        onselectedindexchanged="CheckBoxList2_SelectedIndexChanged" >
                        <asp:ListItem Value="1-499">499 And Below</asp:ListItem>
                        <asp:ListItem Value="500-999">500-999</asp:ListItem>
                        <asp:ListItem Value="1000-1999">1000-1999</asp:ListItem>
                        <asp:ListItem Value="2000-2999">2000-2999</asp:ListItem>
                        <asp:ListItem Value="3000-3999">3000-3999</asp:ListItem>
                        <asp:ListItem Value="4000-4999">4000-4999</asp:ListItem>
                        <asp:ListItem Value="5000-99999">5000 And Above</asp:ListItem>
                    </asp:CheckBoxList>
                </div>
                <h2 align="center">
                    HEIGHT</h2>
                <div class="left_col_box" align="left" >
                    <asp:CheckBoxList ID="CheckBoxList3" runat="server" Width="173px" 
                        AutoPostBack="True" 
                        onselectedindexchanged="CheckBoxList3_SelectedIndexChanged" >
                        <asp:ListItem Value="1-49">49 cm And Below</asp:ListItem>
                        <asp:ListItem Value="50-99">50-99 cm</asp:ListItem>
                        <asp:ListItem Value="100-299">100-299 cm</asp:ListItem>
                        <asp:ListItem Value="300-499">300-499 cm</asp:ListItem>
                        <asp:ListItem Value="500-10000">500 cm And Above</asp:ListItem>
                    </asp:CheckBoxList>
                </div>
                <h2 align="center">
                    WIDTH</h2>
                <div class="left_col_box" align="left" >
                    <asp:CheckBoxList ID="CheckBoxList4" runat="server" Width="173px" 
                        AutoPostBack="True" 
                        onselectedindexchanged="CheckBoxList4_SelectedIndexChanged" >
                        <asp:ListItem Value="1-49">49 cm And Below</asp:ListItem>
                        <asp:ListItem Value="50-99">50-99 cm</asp:ListItem>
                        <asp:ListItem Value="100-299">100-299 cm</asp:ListItem>
                        <asp:ListItem Value="300-499">300-499 cm</asp:ListItem>
                        <asp:ListItem Value="500-10000">500 cm And Above</asp:ListItem>
                    </asp:CheckBoxList>
                </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1 align="left">Patterns Of Embroidery</h1>
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
                    <asp:ListItem>Low to High Price</asp:ListItem>
                    <asp:ListItem>High to Low Price</asp:ListItem>
                    <asp:ListItem>Sort by Pattern Name</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
    </table>
</div>
<br />
<div>

    <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" 
        RepeatDirection="Horizontal" >
        <ItemTemplate>
            <table width="165px">
                <tr>
                    
                    <td align="left" colspan=2>
                        <asp:LinkButton ID="img_lnk" runat="server" 
                            CommandArgument='<%#bind("pid") %>' oncommand="img_lnk_Command"><asp:Image ID="Image1" runat="server" ImageUrl='<%#bind("pimgpath") %>' Width=140 Height=140/></asp:LinkButton>
                    </td>
                </tr>
               
                <tr>
                    <th align="left">Pattern Name : </th>
                    <td align="left">
                    <a href="#">
                        <asp:Label ID="pn_lbl" runat="server" Text='<%#bind("pname") %>'></asp:Label></a>
                    </td>
                </tr>
                <tr>
                    <th align="left">No. Of Stitches : </th>
                    <td align="left">
                    <a href="#">
                        <asp:Label ID="Label2" runat="server" Text='<%#bind("stitches") %>'></asp:Label></a>
                    </td>
                </tr>
                <tr>
                    <th align="left">Price : </th>
                    <td align="left">
                    <a href="#">
                        <asp:Label ID="Label3" runat="server" Text='<%#bind("price") %>'></asp:Label></a>
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

