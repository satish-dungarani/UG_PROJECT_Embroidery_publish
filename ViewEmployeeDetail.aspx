<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewEmployeeDetail.aspx.cs" Inherits="ViewEmployeeDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderadmin" Runat="Server">
<h1 align="left"> View Employee Detail </h1>

<div align="center">
    <asp:FormView ID="FormView1" runat="server" 
        onmodechanging="FormView1_ModeChanging" 
        onitemupdating="FormView1_ItemUpdating">
        <ItemTemplate>
        
                <table cellpadding=5 cellspacing=3 border=1>

                <tr>
                    
                    <td colspan="2" align="center">
                        <asp:Image ID="emp_img" runat="server" ImageUrl='<%#bind("imgpath") %>' Width=100px Height=150px BorderWidth=2 BorderColor=Black/>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        Employee ID : 
                    </th>
                    <td>
                        <asp:Label ID="empid_lbl" Text='<%#bind("eid") %>' runat="server" />
                    </td>
                    
               </tr>
                <tr align="left">
                    <th>
                        Employee Name :
                    </th>
                    <td>
                        <asp:Label ID="empname_lbl" Text='<%#bind("ename") %>' runat="server" />
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
                        Date of Birth :
                    </th>
                    <td>
                        <asp:Label ID="dob_lbl" Text='<%#bind("dob") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Age :
                    </th>
                    <td>
                        <asp:Label ID="age_lbl" Text='<%#bind("age") %>' runat="server" />
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
                        City :
                    </th>
                    <td>
                        <asp:Label ID="ct_lbl" Text='<%#bind("city") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Address :
                    </th>
                    <td>
                        <asp:Label ID="addr_lbl" Text='<%#bind("addr") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Conntect Number :
                    </th>
                    <td>
                        <asp:Label ID="cno_lbl" Text='<%#bind("cnno") %>' runat="server" />
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
                    <th>
                        Basic Salary :
                    </th>
                    <td>
                        <asp:Label ID="bs_lbl" Text='<%#bind("salary") %>' runat="server" />
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
                        Image Upload :
                    </th>
                    <td >
                        <asp:FileUpload ID="empimg_up" runat="server" />
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        Employee ID :
                    </th>
                    <td>
                        <asp:Label ID="Label1" Text='<%#bind("eid") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Employee Name :
                    </th>
                    <td>
                        <asp:TextBox ID="empname_txt" Text='<%#bind("ename") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Gender :
                    </th>
                    <td>
                        <asp:RadioButtonList ID="empgen_rbl" runat="server" 
                        RepeatDirection="Horizontal" SelectedValue='<%# bind("gender") %>'>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Date of Birth :
                    </th>
                    <td>
                        <asp:TextBox ID="empdob_txt" Text='<%#bind("dob") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Age :
                    </th>
                    <td>
                        <asp:TextBox ID="empage_txt" Text='<%#bind("age") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        State :
                    </th>
                    <td>
                         <asp:DropDownList ID="empst_ddl" runat="server" CssClass="tb">
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
                        City :
                    </th>
                    <td>
                        <asp:DropDownList ID="empct_ddl" runat="server" CssClass="tb">
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
                        Address :
                    </th>
                    <td>
                        <asp:TextBox ID="empaddr_txt" Text='<%#bind("addr") %>' runat="server" TextMode="MultiLine" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        Conntect Number :
                    </th>
                    <td>
                        <asp:TextBox ID="empcn_txt" Text='<%#bind("cnno") %>' runat="server" />
                    </td>
                    
                </tr>
                <tr align="left">
                    <th>
                        E-Mail ID :
                    </th>
                    <td>
                        <asp:TextBox ID="empmail_txt" Text='<%#bind("email") %>' runat="server" />
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        Basic Salary :
                    </th>
                    <td>
                        <asp:TextBox ID="bs_txt" Text='<%#bind("salary") %>' runat="server" />
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
    </div>
    <br />
    <div align="center">
        <asp:ImageButton ID="ImageButton1" runat="server" 
            ImageUrl="~/images/button_back1.png" onclick="ImageButton1_Click" />
    </div>
</asp:Content>

