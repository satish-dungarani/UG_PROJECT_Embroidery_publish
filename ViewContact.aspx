<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewContact.aspx.cs" Inherits="ViewContact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderadmin" Runat="Server">
    <h1 align="left">View Contact</h1>
<div>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
          AllowPaging="True" 
          onpageindexchanging="GridView1_PageIndexChanging" 
          PageSize="5" Width="630px" 
                            >
          <Columns>
              <asp:TemplateField HeaderText="Reply Link">
                <ItemTemplate>
                    <asp:LinkButton ID="rpylnk" runat="server" 
                        CommandArgument='<%#bind("cid") %>' oncommand="rpylnk_Command" >Reply</asp:LinkButton>
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Contact ID">
                <ItemTemplate>
                    <asp:Label ID="cid_lbl" Text='<%#bind("cid") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Customer Name">
                <ItemTemplate>
                    <asp:Label ID="nm_lbl" Text='<%#bind("name") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Email ID">
                <ItemTemplate>
                    <asp:Label ID="em_lbl" Text='<%#bind("email") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Phone No">
                <ItemTemplate>
                    <asp:Label ID="pn_lbl" Text='<%#bind("phno") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

          </Columns>

      </asp:GridView>
      </div>
      <br />
        <br />
</asp:Content>

