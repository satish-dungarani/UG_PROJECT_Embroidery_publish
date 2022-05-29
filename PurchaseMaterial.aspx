<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="PurchaseMaterial.aspx.cs" Inherits="PurchaseMaterial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <meta charset="utf-8">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#accordion").accordion();
        });
  </script>
  <script>
      $(function () {
          $("#datepicker").datepicker({
              changeMonth: true,
              changeYear: true
          });
      });
  </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderadmin" Runat="Server">

<h1 align="left">Purchase Row Material Entry</h1>

<div id="accordion">
  <h3 align="left">Thread Material Entry</h3>
  <div>
   
            <table style="width: 647px"> 
                <tr align="left">
                    <th>
                        Thread Type     
                    </th>
                    <td>
                        <asp:DropDownList ID="typ_ddl" runat="server" Height="29px" Width="165px" 
                            onselectedindexchanged="typ_ddl_SelectedIndexChanged" AutoPostBack="True">
                            <asp:ListItem>-----Select-----</asp:ListItem>
                            <asp:ListItem>Normal</asp:ListItem>
                            <asp:ListItem>With Jari</asp:ListItem>
                            <asp:ListItem>WithOut Jari</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
               <%-- <tr align="left">
                    <th>
                        Thread Name     
                    </th>
                    <td>
                        <asp:DropDownList ID="tname_ddl" runat="server" Height="23px" Width="165px">
                        </asp:DropDownList>
                    </td>
                </tr>--%>
                <tr align="left">
                    <th>
                        Color
                    </th>
                    <td>
                        <asp:DropDownList ID="clr_ddl" runat="server" Height="24px" Width="165px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        Quantity
                    </th>
                    <td>
                        <asp:TextBox ID="qnt_txt" runat="server" Width="165px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ErrorMessage="Please Enter Quantity of Thread which purchase." 
                            ValidationGroup="pur" ControlToValidate="qnt_txt"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        Purchase Date
                    </th>
                    <td>
                        <asp:TextBox ID="dt_txt" runat="server" Width="165px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ErrorMessage="Please Enter purchase Date." 
                            ValidationGroup="pur" ControlToValidate="dt_txt"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        Total Price
                    </th>
                    <td>
                        <asp:TextBox ID="prc_txt" runat="server" Width="165px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ErrorMessage="Please Enter purchase price of total thread." 
                            ValidationGroup="pur" ControlToValidate="prc_txt"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:Button ID="sub_btn" runat="server" Text="Submit" Width="75px" 
                            onclick="sub_btn_Click" />
                    </td>
                    <td>
                        <asp:Button ID="rs_btn" runat="server" Text="Reset" Width="75px" />
                    </td>
                </tr>
            </table>
      
  </div>
  <h3 align="left">Fabric Material Entry</h3>
  <div>

    <table style="width: 647px"> 
                <tr align="left">
                    <th>
                        Thread Type     
                    </th>
                    <td>
                        <asp:DropDownList ID="ft_ddl" runat="server" Height="29px" Width="165px" 
                            onselectedindexchanged="ft_ddl_SelectedIndexChanged" AutoPostBack="True">
                            <asp:ListItem>-----Select-----</asp:ListItem>
                            <asp:ListItem>Silk</asp:ListItem>
                            <asp:ListItem>Cotan</asp:ListItem>
                            <asp:ListItem>Rough</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
               <%-- <tr align="left">
                    <th>
                        Thread Name     
                    </th>
                    <td>
                        <asp:DropDownList ID="tname_ddl" runat="server" Height="23px" Width="165px">
                        </asp:DropDownList>
                    </td>
                </tr>--%>
                <tr align="left">
                    <th>
                        Color
                    </th>
                    <td>
                        <asp:DropDownList ID="fc_ddl" runat="server" Height="24px" Width="165px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        Quantity
                    </th>
                    <td>
                        <asp:TextBox ID="fq_txt" runat="server" Width="165px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ErrorMessage="Please Enter Quantity of Fabric which purchase." 
                            ValidationGroup="pur" ControlToValidate="fq_txt"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        Purchase Date
                    </th>
                    <td>
                        <asp:TextBox ID="pd_txt" runat="server" Width="165px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ErrorMessage="Please Enter purchase Date." 
                            ValidationGroup="pur" ControlToValidate="pd_txt"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        Total Price
                    </th>
                    <td>
                        <asp:TextBox ID="pp_txt" runat="server" Width="165px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                            ErrorMessage="Please Enter purchase price of total Fabric." 
                            ValidationGroup="pur" ControlToValidate="pp_txt"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:Button ID="smt_btn" runat="server" Text="Submit" Width="75px" 
                            onclick="smt_btn_Click" />
                    </td>
                    <td>
                        <asp:Button ID="rst_btn" runat="server" Text="Reset" Width="75px" />
                    </td>
                </tr>
            </table>

  </div>
  
</div>

<br />
<br />
</asp:Content>

