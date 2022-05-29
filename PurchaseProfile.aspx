<%@ Page Title="" Language="C#" MasterPageFile="~/PurchaseMasterPage.master" AutoEventWireup="true"
    CodeFile="PurchaseProfile.aspx.cs" Inherits="PurchaseProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Welcome,
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h1>
        <center style="margin-left: 40px">
        <asp:FormView ID="FormView1" runat="server" 
        onmodechanging="FormView1_ModeChanging" 
        onitemupdating="FormView1_ItemUpdating">
        <ItemTemplate>
        
                <table cellpadding=5 cellspacing=3 border=1>

                
                <tr align="left">
                    <th>
                        User Name : 
                    </th>
                    <td>
                        <asp:Label ID="un_lbl" Text='<%#bind("uname") %>' runat="server" />
                    </td>
                    
               </tr>
                <tr align="left">
                    <th>
                        First Name :
                    </th>
                    <td>
                        <asp:Label ID="fname_lbl" Text='<%#bind("fname") %>' runat="server" />
                    </td>   
                    
               </tr>

               <tr align="left">
                    <th>
                        Last Name :
                    </th>
                    <td>
                        <asp:Label ID="lname_lbl" Text='<%#bind("lname") %>' runat="server" />
                    </td>   
                    
               </tr>

                <tr align="left"> 
                    <th>
                        Gender :
                    </th>
                    <td>
                        <asp:Label ID="gen_lbl" Text='<%#bind("gender") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Pincode :
                    </th>
                    <td>
                        <asp:Label ID="pin_lbl" Text='<%#bind("pincode") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Address :
                    </th>
                    <td>
                        <asp:Label ID="add_lbl" Text='<%#bind("address") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Landmark :
                    </th>
                    <td>
                        <asp:Label ID="lm_lbl" Text='<%#bind("landmark") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        City :
                    </th>
                    <td>
                        <asp:Label ID="ct_lbl" Text='<%#bind("city") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        State :
                    </th>
                    <td>
                        <asp:Label ID="st_lbl" Text='<%#bind("state") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Country :
                    </th>
                    <td>
                        <asp:Label ID="cnt_lbl" Text='<%#bind("country") %>' runat="server" />
                    </td>
                    
                </tr>
                
                <tr align="left">
                    <th>
                        Phone Number :
                    </th>
                    <td>
                        <asp:Label ID="pn_lbl" Text='<%#bind("phone") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        E-Mail ID :
                    </th>
                    <td>
                        <asp:Label ID="email_lbl" Text='<%#bind("email") %>' runat="server" />
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

                <table cellspacing=5 cellpadding=3 border=1>

                
                <tr align="left">
                    <th>
                        User Name :
                    </th>
                    <td>
                        <asp:Label ID="un_lbl" Text='<%#bind("uname") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        First Name :
                    </th>
                    <td>
                        <asp:TextBox ID="fn_txt" Text='<%#bind("fname") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Last NAme :
                    </th>
                    <td>
                        <asp:TextBox ID="ln_txt" Text='<%#bind("lname") %>' runat="server" TextMode="MultiLine" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Gender :
                    </th>
                    <td>
                        <asp:RadioButtonList ID="gen_rbl" runat="server" 
                        RepeatDirection="Horizontal" SelectedValue='<%# bind("gender") %>'>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Pincode :
                    </th>
                    <td>
                        <asp:TextBox ID="pin_txt" Text='<%#bind("pincode") %>' runat="server" />
                    </td>
                    
                </tr>
                
                <tr align="left">
                    <th>
                        Address :
                    </th>
                    <td>
                        <asp:TextBox ID="addr_txt" Text='<%#bind("address") %>' runat="server" TextMode="MultiLine" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Landmark :
                    </th>
                    <td>
                        <asp:TextBox ID="lm_txt" Text='<%#bind("landmark") %>' runat="server"  />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        City :
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
                    <th>
                        State :
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
                    <th>
                        Country :
                    </th>
                    <td>
                        <asp:TextBox ID="cnt_txt" Text='<%#bind("country") %>' runat="server" />
                    </td>
                    
                </tr>
                
                <tr align="left">
                    <th>
                        Phone Number :
                    </th>
                    <td>
                        <asp:TextBox ID="pn_txt" Text='<%#bind("phone") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        E-Mail ID :
                    </th>
                    <td>
                        <asp:TextBox ID="mail_txt" Text='<%#bind("email") %>' runat="server" />
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:LinkButton ID="updatelnk" runat="server" CommandName="update">Update</asp:LinkButton>
                        <asp:LinkButton ID="cancellnk" runat="server" CommandName="cancel">Cancel</asp:LinkButton>
                    </td>
                </tr>
                </table>

        </EditItemTemplate>
    </asp:FormView>
    </center>
</asp:Content>
