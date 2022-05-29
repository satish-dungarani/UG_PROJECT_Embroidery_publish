<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="SalaryPayment.aspx.cs" Inherits="SalaryPayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
     {
         width: 153px;
     }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderadmin" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<div id="new_released_section" align="left">
<h1 align="left">Employee Salary Payment</h1>
            	<div class="new_released_box">

                    <asp:FormView ID="FormView1" runat="server" Width="473px">

                    <ItemTemplate>

                <table cellspacing="10" style="font-size:15px;" align="left">
            <colgroup>
                <col width="200px" />
                <col width="250px" />
            </colgroup>

            <tr>
                <th align="center" colspan=2>
                    <asp:Image ID="emp_img" runat="server" ImageUrl='<%#bind("imgpath") %>' Width=150px Height=150px />
                
                </th>
            </tr>
            <tr>
                <th align="left" class="style2">
                    Employee Name
                </th>
                <td>
                    <asp:Label ID="en_lbl" runat="server" Text='<%#bind("ename") %>' ></asp:Label>
                </td>
                
            </tr>
            </table>

            </ItemTemplate>

        </asp:FormView>

            <table cellspacing="10" cellpadding="3" style="font-size:15px; width: 633px;" align="left">
            <colgroup>
                <col width="200px" />
                <col width="250px" />
            </colgroup>
            <tr>
                <th align="left" class="style2">
                    Attend Days
                </th>
                <td>
                    <asp:TextBox ID="ad_txt" runat="server" CssClass="tb" ></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Please Enter employee attend days." 
                        ControlToValidate="ad_txt" ValidationGroup="er" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Enter valid attend days in numeric formate." ValidationGroup="er" ControlToValidate="ad_txt" Display="Dynamic" ValidationExpression="^[0-9]{2}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <th align="left" class="style2">
                    Leave Days
                </th>
                <td>
                    <asp:TextBox ID="ld_txt" runat="server" CssClass="tb" AutoPostBack="True" 
                        ontextchanged="ld_txt_TextChanged" ></asp:TextBox>
                        
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="vpw" runat="server" 
                        ErrorMessage="Please Enter employee leave days." 
                        ControlToValidate="ld_txt" ValidationGroup="er" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please Enter valid leave days in numeric formate." ValidationGroup="er" ControlToValidate="ld_txt" Display="Dynamic" ValidationExpression="^[0-9]{1,2}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            
            <tr>
                <th align="left" class="style2">
                    Total Days
                </th>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="td_txt" runat="server" CssClass="tb"></asp:TextBox>    
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ld_txt" EventName="TextChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                    
                </td>
                <td align="left">
                    
                </td>
            </tr>
            
            
            <tr>
                <th align="left" class="style2">
                    Basic Salary
                </th>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="bs_txt" runat="server" CssClass="tb"></asp:TextBox>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ld_txt" EventName="TextChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
                <td align="left">
                    
                   
                </td>
            </tr>
            
            <tr>
                <th align="left" class="style2">
                    Cut Salary
                </th>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="cs_txt" runat="server" CssClass="tb"></asp:TextBox>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ld_txt" EventName="TextChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
                <td align="left">
                    
                    
                </td>
            </tr>

            <tr>
                <th align="left" class="style2">
                    Payable Salary
                </th>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="ps_txt" runat="server" CssClass="tb"></asp:TextBox>
                    </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ld_txt" EventName="TextChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
                <td align="left">
                    
                   
                </td>
            </tr>

            <tr>
                <th align="left" class="style2">
                    Payment Date
                </th>
                <td>
                    <asp:TextBox ID="pd_txt" runat="server" CssClass="tb"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="vadr" runat="server" 
                        ErrorMessage="Please Enter salary payment date." 
                        ControlToValidate="pd_txt" ValidationGroup="er"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn"
                        Width="100px" onclick="submit_btn" ValidationGroup="er"  />
           </td>
           <td>
                    <asp:Button ID="view_btn" runat="server" Text="Reset" CssClass="btn" 
                        Width="100px" onclick="view_btn_Click"  />
              </td>
            </tr>

        </table>

        
                </div>
                </div>

            


    <br />
    <br />
    <br />
  <div>
    <br />
    <table>
        <tr>
           <%-- <th>
                <asp:Button ID="src_btn" runat="server" Text="Search" />
            </th>--%>
            <%--<td>
                <asp:DropDownList ID="en_ddl" runat="server" Height="16px" 
                    onselectedindexchanged="en_ddl_SelectedIndexChanged" Width="258px" 
                    AutoPostBack="True">
                </asp:DropDownList>
            </td>--%>
            <td>
                <asp:Button ID="src_btn" runat="server" Text="Search" onclick="src_btn_Click" />
            </td>
            <td>
                <asp:TextBox ID="src_txt" runat="server" Width="247px"></asp:TextBox>
            </td>
      </tr>
      </table>
    <br />
      <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" 
          RepeatColumns="4">
        <ItemTemplate>
            <table cellspacing="3">
                <tr>
                    <th colspan="2" align="center"> 
                        <asp:LinkButton ID="img_lnk" runat="server" 
                            CommandArgument='<%#bind("eid") %>' oncommand="img_lnk_Command"><asp:Image ID="Image1" runat="server" ImageUrl='<%#bind("imgpath") %>' Width=150 Height=150/></asp:LinkButton>
                    </th>
                </tr>
                <tr>
                    <th align="left">
                        Employee Name
                    </th>
                    <td>
                        <asp:Label ID="ename_lbl" runat="server" Text='<%#bind("ename") %>'></asp:Label>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
      </asp:DataList>

      <asp:Panel ID="Panel1" runat="server">

      </asp:Panel>
  </div>

            
    <br />
</asp:Content>

