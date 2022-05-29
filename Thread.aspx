<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Thread.aspx.cs" Inherits="Thread" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            height: 32px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderadmin" Runat="Server">

<div id="new_released_section" align="left">
<h1 align="left">Thread Entry</h1>
            	<div class="new_released_box">
        <table cellspacing="10" style="font-size:15px; width: 630px;" align="left">
            <colgroup>
                <col width="200px" />
                <col width="250px" />
            </colgroup>
            <%--<tr>
                <td align="left">
                    Thread Id
                </td>
                <td>
                    <asp:TextBox ID="tbtid" runat="server" CssClass="tb"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="vun" runat="server" 
                        ErrorMessage="Please Enter Thread Id." ControlToValidate="tbtid" 
                        ValidationGroup="thr"></asp:RequiredFieldValidator>
                </td>
            </tr>--%>

            <tr>
                <td align="left">
                    Thread Name
                </td>
                <td>
                    <asp:TextBox ID="tbtname" runat="server" CssClass="tb" ></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="vpw" runat="server" 
                        ErrorMessage="Please Enter Thread Name." ControlToValidate="tbtname" 
                        ValidationGroup="thr"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td align="left">
                    Available Thread
                </td>
                <td>
                    <asp:TextBox ID="tbaq" runat="server" CssClass=tb></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Please Enter Thread Quentity Available." 
                        ControlToValidate="tbaq" ValidationGroup="thr"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td align="left">
                    Used Thread
                </td>
                <td>
                    <asp:TextBox ID="tbut" runat="server" CssClass="tb"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="vfn" runat="server" 
                        ErrorMessage="Please Enter Number of Thread Used." 
                        ControlToValidate="tbut" ValidationGroup="thr"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td align="left">
                    Total Quantity
                </td>
                <td>
                    <asp:TextBox ID="tbtq" runat="server" CssClass="tb"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="vln" runat="server" 
                        ErrorMessage="Please Enter Total Quentity Of Thread." 
                        ControlToValidate="tbtq" ValidationGroup="thr"></asp:RequiredFieldValidator>
                </td>
            </tr>


            <tr>
                <td align="left">
                    Thread Type
                </td>
                <td>
                     <asp:DropDownList ID="ttyp_ddl" runat="server" CssClass="tb">
                        <asp:ListItem>Normal</asp:ListItem>
                        <asp:ListItem>With Jari</asp:ListItem>
                        <asp:ListItem>Without Jari</asp:ListItem>
                        
                    </asp:DropDownList>
                </td>
                <td align="left">
                    <%--<asp:RequiredFieldValidator ID="vadr" runat="server" 
                        ErrorMessage="Please Enter Type of Thread." 
                        ControlToValidate="tbtyp" ValidationGroup="thr"></asp:RequiredFieldValidator>--%>
                </td>
            </tr>

            <tr>
                <td align="left">
                    Color
                </td>
                <td>
                    <asp:TextBox ID="tbclr" runat="server" CssClass="tb"></asp:TextBox>
                </td>
                <td align="left">
                   
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Please Enter Color of Thread." ControlToValidate="tbclr" ValidationGroup="thr" 
                        ></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td align="left">
                    Price
                </td>
                <td>
                    <asp:TextBox ID="tbpr" runat="server" CssClass="tb"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="Please Enter Price of Thread." ControlToValidate="tbpr" ValidationGroup="thr" 
                        ></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="left">
                    Image
                </td>
                <td align="left">
                    <asp:FileUpload ID="imgup" runat="server" />                  
                    
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="Please Enter Upload Image of Pattern." ControlToValidate="imgup" ValidationGroup="ptn" 
                        ></asp:RequiredFieldValidator>
                </td>
            </tr>
            
            <tr>
                <td align="left">
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn"
                        Width="100px" onclick="btnsubmit_Click" ValidationGroup="thr" />
                </td>
                <td align="left">
                    <asp:Button ID="btnreset" runat="server" Text="Reset" CssClass="btn" Width="100px" />
                </td>
            </tr>
        </table>
        </div>
                </div>

        <div class="templatemo_right_panel_fullwidth" align="left">
                <div id="news_section">
                    <h1 align="left">View Thread Details</h1>
                    <div class="news_box">
                    <br />
                       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
          AllowPaging="True" 
          onpageindexchanging="GridView1_PageIndexChanging" 
          PageSize="5" Width="630px" AutoGenerateDeleteButton="True" 
                            onrowdeleting="GridView1_RowDeleting">
          <Columns>
              <asp:TemplateField HeaderText="View Link">
                <ItemTemplate>
                    <asp:LinkButton ID="viewlnk" runat="server" 
                        CommandArgument='<%#bind("thid") %>' oncommand="viewlnk_Command">View</asp:LinkButton>
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
              <asp:TemplateField HeaderText="Thread ID">
                <ItemTemplate>
                    <asp:Label ID="tid_lbl" Text='<%#bind("thid") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Thread Name">
                <ItemTemplate>
                    <asp:Label ID="tname_lbl" Text='<%#bind("thname") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Total Quentity">
                <ItemTemplate>
                    <asp:Label ID="ttq_lbl" Text='<%#bind("thtq") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Thread Type">
                <ItemTemplate>
                    <asp:Label ID="typ_lbl" Text='<%#bind("thtype") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Price">
                <ItemTemplate>
                    <asp:Label ID="prc_lbl" Text='<%#bind("price") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image ID="thd_img" runat="server" ImageUrl='<%#bind("imgpath") %>' Width=100px Height=100px/>
                </ItemTemplate>
              </asp:TemplateField>
             
         
          </Columns>

      </asp:GridView>
                </div> 
                
                
                </div> 
			</div>      
 
    <br />
    <br />
</asp:Content>

