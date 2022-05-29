<%@ Page Title="" Language="C#" MasterPageFile="~/PurchaseMasterPage.master" AutoEventWireup="true" CodeFile="SinglePatternDetail.aspx.cs" Inherits="SinglePatternDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  <h1 align="left">Detail About,
        <asp:Label ID="Label1" runat="server" ></asp:Label></h1>
    <div>
        <asp:FormView ID="FormView1" runat="server" Width="645px" 
            >
            <ItemTemplate>
                <table width="645px" >
                    <tr>
                        <td rowspan=6 align="center">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#bind("pimgpath") %>' Width=200px Height=250px /></td>
                            <td align="left">
                            <br />
                                <asp:Label ID="pn_lbl" runat="server" Text='<%#bind("pname") %>' Font-Size="XX-Large"></asp:Label>
                                <br />
                            </td>
                            
                    </tr>
                    <tr align="left">
                        <td>
                        <br />
                            <asp:LinkButton ID="rvw_lnk" runat="server" Font-Size="Medium" 
                                Font-Underline="True" CommandArgument='<%#bind("pid")%>' 
                                oncommand="rvw_lnk_Command">Write a Review</asp:LinkButton>
                            <br />
                            </td>
                    </tr>
                    <tr align="left">
                        <td>
                        <br />
                            <asp:Label ID="Label2" runat="server" Text="RS." Font-Size="X-Large"></asp:Label>
                            <asp:Label ID="prc_lbl" runat="server" Text='<%#bind("price") %>' Font-Size="X-Large"></asp:Label>
                            <br />
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                        <br />
                            <asp:ImageButton ID="sel_img" runat="server" ImageUrl="~/images/sel_btn1.png" 
                               CommandArgument='<%#bind("pid") %>' oncommand="sel_img_Command" />
                            <br />
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                           <br />
                            <asp:CheckBox ID="fab_sel" runat="server" Text="For choose fabric select this box." />
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                        <br />
                            <asp:Label ID="Label4" runat="server" Text="Cash On Delivery also available."></asp:Label>
                        <br />
                            <asp:Label ID="Label3" runat="server" Text="Standard Delivery in 15 Days."></asp:Label>
                            <br />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:FormView>
    
    </div>

    <div>
    <br />
        <asp:Image ID="Image2" runat="server" ImageUrl="~/images/line.png" />
    <br />
    <br />
        <h3 style="color: #FFFFFF" align="left">GENERAL DETAIIL</h3>

        <br />
        <h4 style="color: #FFFFFF" align="left">PATTERN DETAILS</h4>
        <br />
        <asp:FormView ID="FormView2" runat="server" Width="645px">
            <ItemTemplate>
                <table width="645px"  border=1>
                    <tr align="left">
                        <td style="font-size:medium" colspan=2>
                        <br />
                            Stitches
                        </td>
                        <td >
                            <br />
                            <asp:Label ID="Label5" runat="server" Text='<%#bind("stitches") %>'></asp:Label>
                            </td>
                            
                    </tr>
                    <tr align="left">
                        <td style="font-size:medium" colspan=2>
                        <br />
                            Color Used
                        </td>
                        <td>
                        <br />
                            <asp:Label ID="Label6" runat="server" Text='<%#bind("color") %>'></asp:Label>
                            </td>
                    </tr>
                    <tr align="left">
                    <td style="font-size:medium" rowspan=2>
                        <br />
                            Size
                        </td>
                        <td style="font-size:medium">
                        <br />
                            Height
                        </td>
                        <td>
                        <br />
                            <asp:Label ID="Label7" runat="server" Text='<%#bind("height") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr align="left">
                        <td style="font-size:medium">
                        <br />
                            Width
                        </td>
                        <td>
                        <br />
                            <asp:Label ID="Label8" runat="server" Text='<%#bind("width") %>'></asp:Label>
                        </td>
                    </tr>
                    
                </table>
            </ItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>

