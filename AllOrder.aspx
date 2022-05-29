﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AllOrder.aspx.cs" Inherits="AllOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderadmin" Runat="Server">
<h1 align="left">View All Order</h1>
<div>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
          AllowPaging="True" 
          onpageindexchanging="GridView1_PageIndexChanging" 
          PageSize="5" Width="630px" 
                            >
          <Columns>
              <asp:TemplateField HeaderText="View Link">
                <ItemTemplate>
                    <asp:LinkButton ID="viewlnk" runat="server" 
                        CommandArgument='<%#bind("oid") %>' oncommand="viewlnk_Command">View</asp:LinkButton>
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField>
                   <HeaderTemplate>
                    <asp:CheckBox ID="multi" runat="server"></asp:CheckBox>
                  </HeaderTemplate>
                  <ItemTemplate>
                      <asp:CheckBox ID="single" runat="server" />
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

              <asp:TemplateField HeaderText="Thread Type">
                <ItemTemplate>
                    <asp:Label ID="tt_lbl" Text='<%#bind("thtype") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Fabric Quantity">
                <ItemTemplate>
                    <asp:Label ID="fbq_lbl" Text='<%#bind("fbqnt") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Order Date">
                <ItemTemplate>
                    <asp:Label ID="od_lbl" Text='<%#bind("odate") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Delivery Date">
                <ItemTemplate>
                    <asp:Label ID="dd_lbl" Text='<%#bind("ddate") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Amount Payabel">
                <ItemTemplate>
                    <asp:Label ID="amt_lbl" Text='<%#bind("amount") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <asp:Label ID="sts_lbl" Text='<%#bind("status") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Pattern Image">
                <ItemTemplate>
                    <asp:Image ID="ptn_img" runat="server" ImageUrl='<%#bind("pimgpath") %>' Width=100px Height=100px/>
                </ItemTemplate>
              </asp:TemplateField>
             
             <asp:TemplateField HeaderText="Fabric Image">
                <ItemTemplate>
                    <asp:Image ID="fab_img" runat="server" ImageUrl='<%#bind("imgpath") %>' Width=100px Height=100px/>
                </ItemTemplate>
              </asp:TemplateField>
         
          </Columns>

      </asp:GridView>
      </div>
      <br />
        <br />
</asp:Content>
