<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Employee_Reg.aspx.cs" Inherits="Employee_Reg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <style type="text/css">
        .style2
     {
         width: 153px;
     }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderadmin" Runat="Server">



<div id="new_released_section" align="left">
<h1 align="left">Employee Registration</h1>
            	<div class="new_released_box">
                <table cellspacing="10" style="font-size:15px; width: 633px;" align="left">
            <colgroup>
                <col width="200px" />
                <col width="250px" />
            </colgroup>
            <tr>
                <th align="left" class="style2">
                    Employee Name
                </th>
                <td>
                    <asp:TextBox ID="ename_txt" runat="server" CssClass="tb"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="vun" runat="server" 
                        ErrorMessage="User Name Must Require." ControlToValidate="ename_txt" 
                        ValidationGroup="er"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th align="left" class="style2">
                    Gender
                </th>
                <td>
                    <asp:RadioButtonList ID="gen_rbl" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <th align="left" class="style2">
                    Date Of Birth   
                </th>
                <td>
                    <asp:TextBox ID="dob_txt" runat="server" CssClass="tb" ></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="vpw" runat="server" 
                        ErrorMessage="Please Enter date of birth of employee." 
                        ControlToValidate="dob_txt" ValidationGroup="er"></asp:RequiredFieldValidator>
                </td>
            </tr>
            
            <tr>
                <th align="left" class="style2">
                    Age
                </th>
                <td>
                    <asp:TextBox ID="age_txt" runat="server" CssClass="tb"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="vfn" runat="server" 
                        ErrorMessage="Please Enter Age of employee" ControlToValidate="age_txt" 
                        ValidationGroup="er"></asp:RequiredFieldValidator>
                </td>
            </tr>
            
            <tr>
                <th align="left" class="style2">
                    State
                </th>
                <td>
                    <asp:DropDownList ID="state_ddl" runat="server" CssClass="tb">
                        <asp:ListItem>Gujarata</asp:ListItem>
                        <asp:ListItem>Utar Pradesh</asp:ListItem>
                        <asp:ListItem>Madhya Pradesh</asp:ListItem>
                        <asp:ListItem>Delhi</asp:ListItem>
                        <asp:ListItem>Bangal</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <th align="left" class="style2">
                    City
                </th>
                <td>
                    <asp:DropDownList ID="city_ddl" runat="server" CssClass="tb">
                        <asp:ListItem>Ahmedabad</asp:ListItem>
                        <asp:ListItem>Baroda</asp:ListItem>
                        <asp:ListItem>Navsari</asp:ListItem>
                        <asp:ListItem>Surat</asp:ListItem>
                        <asp:ListItem>Valsad</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <th align="left" class="style2">
                    Address
                </th>
                <td>
                    <asp:TextBox ID="addr_txt" runat="server" TextMode="MultiLine" CssClass="mtb"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="vadr" runat="server" 
                        ErrorMessage="Please Enter your original Address." 
                        ControlToValidate="addr_txt" ValidationGroup="er"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th align="left" class="style2">
                    Contact Number
                </th>
                <td>
                    <asp:TextBox ID="mn_txt" runat="server" CssClass="tb"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RegularExpressionValidator ID="vcn" runat="server" 
                        ErrorMessage="Please Enter 10 Digit Contect Number." 
                        ControlToValidate="mn_txt" 
                        ValidationExpression="^[0-9]{10}$" Display="Dynamic" ValidationGroup="er"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Please Enter Contect Number." ControlToValidate="mn_txt" 
                        Display="Dynamic" ValidationGroup="er"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th align="left" class="style2">
                    Email Id
                </th>
                <td>
                    <asp:TextBox ID="email_txt" runat="server" CssClass="tb"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RegularExpressionValidator ID="vem" runat="server" 
                        ErrorMessage="Please Enter valid E-Mail Address." ControlToValidate="email_txt" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ValidationGroup="er"></asp:RegularExpressionValidator>
                </td>
            </tr>

            <tr>
                <th align="left" class="style2">
                    Basic Salary
                </th>
                <td>
                    <asp:TextBox ID="bs_txt" runat="server" CssClass="tb"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="Please Enter employee basic salary." ControlToValidate="bs_txt" 
                        Display="Dynamic" ValidationGroup="er"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ErrorMessage="Please Enter valid salary and salary/month." 
                        ControlToValidate="bs_txt" 
                        ValidationExpression="^[0-9]{5}$" Display="Dynamic" ValidationGroup="er"></asp:RegularExpressionValidator>
                </td>
            </tr>

            <tr>
                <th align="left" class="style2">
                    Image Upload
                </th>
                <td>
                    <asp:FileUpload ID="img_up" runat="server" />
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Please Upload Employee image." ControlToValidate="img_up" 
                        ValidationGroup="er"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="left" class="style2">
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn"
                        Width="100px" onclick="submit_btn" ValidationGroup="er"  />
                </td>
                <td align="left">
                    <asp:Button ID="view_btn" runat="server" Text="View" CssClass="btn" 
                        Width="100px"  />
                </td>
            </tr>
        </table>
                </div>
                </div>


     <div class="templatemo_right_panel_fullwidth" align="left">
                <div id="news_section">
                    <h1 align="left">View Employee Details</h1>
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
                    <asp:LinkButton ID="view_lnk" runat="server" oncommand="view_lnk_Command" CommandArgument='<%#bind("eid") %>'>View</asp:LinkButton>
                    <asp:LinkButton ID="sal_lnk" runat="server" oncommand="sal_lnk_Command" 
                        CommandArgument='<%#bind("eid") %>' >Salary</asp:LinkButton>
                </ItemTemplate>
                
              </asp:TemplateField>
              <asp:TemplateField>
                   <HeaderTemplate>
                    <asp:CheckBox ID="multi" runat="server" oncheckedchanged="multi_CheckedChanged"></asp:CheckBox>
                  </HeaderTemplate>
                  <ItemTemplate>
                      <asp:CheckBox ID="single" runat="server" />
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Employee ID">
                <ItemTemplate>
                    <asp:Label ID="empid_lbl" Text='<%#bind("eid") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Employee Name">
                <ItemTemplate>
                    <asp:Label ID="ename_lbl" Text='<%#bind("ename") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="City">
                <ItemTemplate>
                    <asp:Label ID="ct_lbl" Text='<%#bind("city") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Contect Number">
                <ItemTemplate>
                    <asp:Label ID="cn_lbl" Text='<%#bind("cnno") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image ID="emp_img" runat="server" ImageUrl='<%#bind("imgpath") %>' Width=100px Height=100px/>
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

