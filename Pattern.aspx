<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Pattern.aspx.cs" Inherits="Pattern" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderadmin" Runat="Server">

<div id="new_released_section" align="left">
<h1 align="left">Pattern Entry</h1>
            	<div class="new_released_box">
        <table cellspacing="10" style="font-size:15px; width: 631px;" align="left">
            <colgroup>
                <col width="200px" />
                <col width="250px" />
            </colgroup>
           <%-- <tr>
                <td align="left">
                    Pattern Id
                </td>
                <td>
                    <asp:TextBox ID="tbpid" runat="server" CssClass="tb"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="vun" runat="server" 
                        ErrorMessage="Please Enter Pattern Id." ControlToValidate="tbpid" 
                        ValidationGroup="ptn"></asp:RequiredFieldValidator>
                </td>
            </tr>--%>

            <tr>
                <td align="left">
                    Pattern Name
                </td>
                <td>
                    <asp:TextBox ID="tbpname" runat="server" CssClass="tb" ></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="vpw" runat="server" 
                        ErrorMessage="Please Enter Pattern Name." ControlToValidate="tbpname" 
                        ValidationGroup="ptn"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td align="left">
                    Stitches
                </td>
                <td>
                    <asp:TextBox ID="tbstc" runat="server" CssClass=tb></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Please Enter Stitches in Number." 
                        ControlToValidate="tbstc" ValidationGroup="ptn"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td align="left">
                    Color
                </td>
                <td>
                    <asp:TextBox ID="tbclr" runat="server" CssClass="tb" TextMode="MultiLine"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="vfn" runat="server" 
                        ErrorMessage="Please Enter Color Used in Pattern." 
                        ControlToValidate="tbclr" ValidationGroup="ptn"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td align="left">
                    Pattern Height
                </td>
                <td>
                    <asp:TextBox ID="tbht" runat="server" CssClass="tb"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="vln" runat="server" 
                        ErrorMessage="Please Enter Height of Pattern." 
                        ControlToValidate="tbht" ValidationGroup="ptn"></asp:RequiredFieldValidator>
                </td>
            </tr>


            <tr>
                <td align="left">
                   Pattern Width
                </td>
                <td>
                    <asp:TextBox ID="tbwd" runat="server"  CssClass="tb"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="vadr" runat="server" 
                        ErrorMessage="Please Enter Width of Pattern." 
                        ControlToValidate="tbwd" ValidationGroup="ptn"></asp:RequiredFieldValidator>
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
                        ErrorMessage="Please Enter Price of Pattern." ControlToValidate="tbpr" ValidationGroup="ptn" 
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Please Enter Upload Image of Pattern." ControlToValidate="imgup" ValidationGroup="ptn" 
                        ></asp:RequiredFieldValidator>
                </td>
            </tr>

            
            <tr>
                <td align="left">
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn"
                        Width="100px" onclick="btnsubmit_Click" ValidationGroup="ptn" />
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
                    <h1 align="left">View Pattern Details</h1>
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
                        CommandArgument='<%#bind("pid") %>' oncommand="viewlnk_Command">View</asp:LinkButton>
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
              <asp:TemplateField HeaderText="Pattern ID">
                <ItemTemplate>
                    <asp:Label ID="pid_lbl" Text='<%#bind("pid") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Pattern Name">
                <ItemTemplate>
                    <asp:Label ID="pname_lbl" Text='<%#bind("pname") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Stitches">
                <ItemTemplate>
                    <asp:Label ID="stc_lbl" Text='<%#bind("stitches") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Price">
                <ItemTemplate>
                    <asp:Label ID="prc_lbl" Text='<%#bind("price") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image ID="ptn_img" runat="server" ImageUrl='<%#bind("pimgpath") %>' Width=100px Height=100px/>
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

