<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ProductionDetail.aspx.cs" Inherits="ProductionDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderadmin" Runat="Server">


    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

<div id="new_released_section" align="left">
<h1 align="left">Production Entry</h1>
            	<div class="new_released_box">

        <table cellspacing="10" style="font-size:15px; width: 632px;" align="left">
            <colgroup>
                <col width="200px" />
                <col width="250px" />
            </colgroup>

                <tr align="left">
                    <th>
                        Order ID
                    </th>
                    <td>
                        <asp:DropDownList ID="oid_ddl" runat="server" Height="18px" Width="165px" 
                            onselectedindexchanged="oid_ddl_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        User Name
                    </th>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="un_txt" runat="server" Width="165px"></asp:TextBox>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger  ControlID="oid_ddl" EventName="SelectedIndexChanged"/>
                        </Triggers>
                        </asp:UpdatePanel>
                        
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        Fabric Quantity
                    </th>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="fq_txt" runat="server" Width="165px"></asp:TextBox>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger  ControlID="oid_ddl" EventName="SelectedIndexChanged"/>
                        </Triggers>
                        </asp:UpdatePanel>
                        
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        No. Of Thread Color used
                    </th>
                    <td>
                        <asp:DropDownList ID="ntc_ddl" runat="server" Height="16px" Width="165px" 
                            AutoPostBack="True" onselectedindexchanged="ntc_ddl_SelectedIndexChanged">
                            <asp:ListItem>-----Select-----</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            
                        </asp:DropDownList>

                        <div>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                                
                                <asp:DropDownList ID="ddl1" runat="server" >
                            </asp:DropDownList>
                            <asp:TextBox ID="TextBox1" runat="server" Text="0"></asp:TextBox>
                            <br />
                            <asp:DropDownList ID="ddl2" runat="server"  >
                            </asp:DropDownList>
                            <asp:TextBox ID="TextBox2" runat="server" Text="0"></asp:TextBox>
                            <br />
                            <asp:DropDownList ID="ddl3" runat="server" >
                            </asp:DropDownList>
                            <asp:TextBox ID="TextBox3" runat="server" Text="0"></asp:TextBox>
                            <br />
                            <asp:DropDownList ID="ddl4" runat="server" >
                            </asp:DropDownList>
                            <asp:TextBox ID="TextBox4" runat="server" Text="0"></asp:TextBox>
                            <br />
                            <asp:DropDownList ID="ddl5" runat="server" > 
                            </asp:DropDownList>
                            <asp:TextBox ID="TextBox5" runat="server" Text="0"></asp:TextBox>

                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger  ControlID="ntc_ddl" EventName="SelectedIndexChanged"/>
                        </Triggers>
                        </asp:UpdatePanel>
                            
                            <br />
                           

                            </div>

                    </td>
                    </tr>
                    
                <tr align="left">
                    <th>
                        Starting Date
                    </th>
                    <td>
                        <asp:TextBox ID="sd_txt" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        Complete Date
                    </th>
                    <td>
                        <asp:TextBox ID="cd_txt" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr align="left">
                    <th>
                        Status
                    </th>
                    <td>
                        <asp:RadioButtonList ID="sts_rbl" runat="server">
                            <asp:ListItem Selected="True">Complete</asp:ListItem>
                            <asp:ListItem>Progress</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Button ID="sub_btn" runat="server" Text="Submit" onclick="sub_btn_Click" />
                    </td>
                    <td>
                        <asp:Button ID="rst_btn" runat="server" Text="Reset" />
                    </td>
                </tr>

             </table>
          </div>
                </div>


             <div class="templatemo_right_panel_fullwidth" align="left">
                <div id="news_section">
                    <h1 align="left">View Production Status</h1>
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
                        CommandArgument='<%#bind("prid") %>' oncommand="viewlnk_Command">View</asp:LinkButton>
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

              <asp:TemplateField HeaderText="Production ID">
                <ItemTemplate>
                    <asp:Label ID="prid_lbl" Text='<%#bind("prid") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Order ID">
                <ItemTemplate>
                    <asp:Label ID="oid_lbl" Text='<%#bind("oid") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              

              <asp:TemplateField HeaderText="Thread Color">
                <ItemTemplate>
                    <asp:Label ID="tc_lbl" Text='<%#bind("tclr") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Thread Quantity">
                <ItemTemplate>
                    <asp:Label ID="tq_lbl" Text='<%#bind("thqnt") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Start Date">
                <ItemTemplate>
                    <asp:Label ID="sd_lbl" Text='<%#bind("sdate") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <asp:Label ID="sts_lbl" Text='<%#bind("status") %>' runat="server" />
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

