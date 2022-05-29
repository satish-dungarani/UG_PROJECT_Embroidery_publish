<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Supplier.aspx.cs" Inherits="Supplier" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderadmin" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

<div id="new_released_section" align="left">
<h1 align="left">Supply Entry</h1>
            	<div class="new_released_box">
        <table cellspacing="10" style="font-size:15px; width: 631px;" align="left">
            <colgroup>
                <col width="200px" />
                <col width="250px" />
            </colgroup>

            <tr>
                <td align="left">
                    Supplier Name
                </td>
                <td>
                    <asp:TextBox ID="spname" runat="server" CssClass="tb"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="vun" runat="server" 
                        ErrorMessage="Please Enter Name of Supplier." ControlToValidate="spname" 
                        ValidationGroup="ptn"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td align="left">
                   Supply Type
                </td>
                <td>
                    <asp:RadioButtonList ID="styp" runat="server" 
                        onselectedindexchanged="styp_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Selected=True>Sale</asp:ListItem>
                    <asp:ListItem>Purchase</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="vadr" runat="server" 
                        ErrorMessage="Please Enter type of Supply." 
                        ControlToValidate="styp" ValidationGroup="ptn"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td align="left">
                    Order Id
                </td>
                <td align="left">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="oid_ddl" runat="server" CssClass="tb" Enabled="False">
                    </asp:DropDownList>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger  ControlID="styp" EventName="SelectedIndexChanged"/>
                        </Triggers>
                    </asp:UpdatePanel>
                    
                </td>
                <td align="left">
                    
                </td>
            </tr>
            
            <tr>
                <td align="left">
                    Vehical Name
                </td>
                <td>
                    <asp:TextBox ID="vname" runat="server" CssClass="tb" ></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="vpw" runat="server" 
                        ErrorMessage="Please Enter Name of Vehical." ControlToValidate="vname" 
                        ValidationGroup="ptn"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td align="left">
                    Vehical Type
                </td>
                <td align="left">
                    <asp:DropDownList ID="vtyp" runat="server" CssClass="tb">
                        <asp:ListItem>-----Select-----</asp:ListItem>
                        <asp:ListItem>3 wheels</asp:ListItem>
                        <asp:ListItem>4 wheels</asp:ListItem>
                        <asp:ListItem>6 wheels</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Please Enter type Of Vehical." 
                        ControlToValidate="vtyp" ValidationGroup="ptn"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td align="left">
                    Vehical No
                </td>
                <td>
                    <asp:TextBox ID="vno" runat="server" CssClass="tb" TextMode="MultiLine"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="vfn" runat="server" 
                        ErrorMessage="Please Enter vehical number." 
                        ControlToValidate="vno" ValidationGroup="ptn"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td align="left">
                    Supply Date
                </td>
                <td>
                    <asp:TextBox ID="spdate" runat="server" CssClass="tb"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="vln" runat="server" 
                        ErrorMessage="Please Enter Supply date." 
                        ControlToValidate="spdate" ValidationGroup="ptn"></asp:RequiredFieldValidator>
                </td>
            </tr>


            

            <tr>
                <td align="left">
                    Amount
                </td>
                <td>
                    <asp:TextBox ID="amo" runat="server" CssClass="tb"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="Please Enter amount of supply." ControlToValidate="amo" ValidationGroup="ptn" 
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
                    <h1 align="left">View Supply Details</h1>
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
                        CommandArgument='<%#bind("spid") %>' oncommand="viewlnk_Command">View</asp:LinkButton>
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

              <asp:TemplateField HeaderText="Supplier Name">
                <ItemTemplate>
                    <asp:Label ID="sid_lbl" Text='<%#bind("spid") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Supplier Name">
                <ItemTemplate>
                    <asp:Label ID="spn_lbl" Text='<%#bind("spname") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="supply Type">
                <ItemTemplate>
                    <asp:Label ID="spt_lbl" Text='<%#bind("sptyp") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Vehical Number">
                <ItemTemplate>
                    <asp:Label ID="vno_lbl" Text='<%#bind("vno") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Supply Date">
                <ItemTemplate>
                    <asp:Label ID="sd_lbl" Text='<%#bind("Spdate") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Amount">
                <ItemTemplate>
                    <asp:Label ID="amo_lbl" Text='<%#bind("spamo") %>' runat="server" />
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

