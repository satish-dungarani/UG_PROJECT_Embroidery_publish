<%@ Page Title="" Language="C#" MasterPageFile="~/PurchaseMasterPage.master" AutoEventWireup="true" CodeFile="PlaceOrder.aspx.cs" Inherits="PlaceOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <h1 align="left">Place Order For Embroider Work</h1>
    <div>
        <asp:FormView ID="FormView1" runat="server">
            <ItemTemplate>

                <table cellspacing="10" style="font-size:15px;" align="left">
            <colgroup>
                <col width="200px" />
                <col width="250px" />
            </colgroup>
                    <tr align="left">
                        <th>
                            Pattern 
                        </th>
                        <td>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#bind("pimgpath") %>' Width=150px Height=150px />
                            
                        </td>
                        
                    </tr>
                    <tr align="left">
                        <th>
                            Fabric
                        </th>
                        <td>
                            <asp:Image ID="Image2" runat="server" Width="150px" Height="150px" />
                            
                        </td>
                        
                    </tr>

                    <tr align="left">
                        <th>
                            Used Thread Color
                        </th>
                        <td>
                            
                            <asp:Label ID="tclr_lbl" runat="server" Text='<%#bind("color") %>'></asp:Label>
                        </td>
                        
                    </tr>


                    </table>
            </ItemTemplate>
        </asp:FormView>

                <table cellspacing="10" style="font-size:15px;" align="left">
            <colgroup>
                <col width="200px" />
                <col width="250px" />
            </colgroup>
                    <tr align="left">
                        <th>
                            Fabric Quentity
                        </th>
                        <td>
                            <asp:TextBox ID="fq_txt" runat="server" 
                               ></asp:TextBox>
                            
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fq_txt" ErrorMessage="Please Enter your Fabric Quantity for work." Display="Dynamic" ValidationGroup="po"></asp:RequiredFieldValidator>                      
                        </td>
                    </tr>
                      <tr align="left">
                        <th>
                            Thread Type
                        </th>
                        <td>
                            <asp:DropDownList ID="ttyp_ddl" runat="server" CssClass="tb" 
                                AutoPostBack="True" onselectedindexchanged="ttyp_ddl_SelectedIndexChanged">
                                <asp:ListItem>-----Select-----</asp:ListItem>
                        <asp:ListItem>Normal</asp:ListItem>
                        <asp:ListItem>With Jari</asp:ListItem>
                        <asp:ListItem>Without Jari</asp:ListItem>
                        
                    </asp:DropDownList>
                            
                        </td>
                        
                    </tr>
                    
                    <tr align="left">
                        <th>
                            Order Date
                        </th>
                        <td>
                            
                            <asp:Label ID="od_lbl" runat="server" ></asp:Label>
                        </td>
                        
                    </tr>
                    <tr align="left">
                        <th>
                            Amout Payable
                        </th>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="ap_lbl" runat="server" ></asp:Label>    
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ttyp_ddl" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                            
                        </td>
                        
                    </tr>

                </table>
        <br />
        
        
    </div>
    <br />
    <br />
    <div>
        <br />
        <asp:ImageButton ID="con_img" runat="server" ImageUrl="~/images/con_btn.png" onclick="con_img_Click" ValidationGroup="po" 
                               />
    </div>
    <br />
    <br />
</asp:Content>

