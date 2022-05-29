<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="BillDetail.aspx.cs" Inherits="BillDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderadmin" Runat="Server">

<h1 align="left">Customer Bill Detail</h1>
<div>
    <table>
        <tr>
            <th>
                <asp:Button ID="srch_btn" runat="server" Text="Search" 
                    onclick="srch_btn_Click" Height="28px" />
            </th>
            <td>
                <asp:TextBox ID="srch_txt" runat="server" Height="28px" Width="148px"></asp:TextBox>
            </td>
           <td align="left">
               <asp:RadioButtonList ID="rs" runat="server" Width="182px">
                    <asp:ListItem Selected="True">Payment ID</asp:ListItem>                   
                    <asp:ListItem>Order ID</asp:ListItem>                   
               </asp:RadioButtonList>
           </td>
        </tr>
    </table>
</div>
<br />
<div>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
          AllowPaging="True" 
          onpageindexchanging="GridView1_PageIndexChanging" 
          PageSize="5" Width="630px" 
                            >
          <Columns>
              
              <asp:TemplateField HeaderText="Bill Link">
                <ItemTemplate>
                    <asp:LinkButton ID="paylink" runat="server" 
                        CommandArgument='<%#bind("pyid") %>' 
                        oncommand="paylink_Command"  >Bill Generate</asp:LinkButton>
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Payment ID">
                <ItemTemplate>
                    <asp:Label ID="pyid_lbl" Text='<%#bind("pyid") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Order ID">
                <ItemTemplate>
                    <asp:Label ID="oid_lbl" Text='<%#bind("oid") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="User Name">
                <ItemTemplate>
                    <asp:Label ID="un_lbl" Text='<%#bind("uname") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Payment Date">
                <ItemTemplate>
                    <asp:Label ID="pd_lbl" Text='<%#bind("pydate") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Payed Amount">
                <ItemTemplate>
                    <asp:Label ID="am_lbl" Text='<%#bind("amount") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Payment Type">
                <ItemTemplate>
                    <asp:Label ID="pt_lbl" Text='<%#bind("ptype") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

          </Columns>

      </asp:GridView>
      </div>
      <br />
        <br />

</asp:Content>

