<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Fabric.aspx.cs" Inherits="Fabric" %>

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
<h1 align="left">Fabric Entry</h1>
            	<div class="new_released_box">
        <table cellspacing="10" style="font-size:15px; width: 632px;" align="left">
            <colgroup>
                <col width="200px" />
                <col width="250px" />
            </colgroup>
            <%--<tr>
                <td align="left">
                    Fabric Id
                </td>
                <td>
                    <asp:TextBox ID="tbfid" runat="server" CssClass="tb"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="vun" runat="server" 
                        ErrorMessage="Please Enter Fabric Id." ControlToValidate="tbfid" 
                        ValidationGroup="fab"></asp:RequiredFieldValidator>
                </td>
            </tr>--%>

            <tr>
                <th align="left">
                    Fabric Name
                </th>
                <td>
                    <asp:TextBox ID="tbfname" runat="server" CssClass="tb" ></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="vpw" runat="server" 
                        ErrorMessage="Please Enter Fabric Name." ControlToValidate="tbfname" 
                        ValidationGroup="fab"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <th align="left">
                    Available Fabric
                </th>
                <td>
                    <asp:TextBox ID="tbqt" runat="server" CssClass=tb></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Please Enter Fabric Quentity Available." 
                        ControlToValidate="tbqt" ValidationGroup="fab"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <th align="left">
                    Used Fabric
                </th>
                <td>
                    <asp:TextBox ID="tbused" runat="server" CssClass="tb"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="vfn" runat="server" 
                        ErrorMessage="Please Enter Number of Fabric Used." 
                        ControlToValidate="tbused" ValidationGroup="fab"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <th align="left">
                    Total Quantity
                </th>
                <td>
                    <asp:TextBox ID="tbtl" runat="server" CssClass="tb"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="vln" runat="server" 
                        ErrorMessage="Please Enter Total Quentity Of Fabric." 
                        ControlToValidate="tbtl" ValidationGroup="fab"></asp:RequiredFieldValidator>
                </td>
            </tr>


            <tr>
                <th align="left">
                    Fabric Type
                </th>
                <td>
                    <asp:DropDownList ID="ddltype" runat="server" CssClass="tb">
                        <asp:ListItem>Brass </asp:ListItem>
                        <asp:ListItem>Brocade</asp:ListItem>
                        <asp:ListItem>Chanderi</asp:ListItem>
                        <asp:ListItem>Chiffon</asp:ListItem>
                        <asp:ListItem>Cotton</asp:ListItem>
                        <asp:ListItem>Crepe</asp:ListItem>
                        <asp:ListItem>Georgette</asp:ListItem>
                        <asp:ListItem>Jacquard</asp:ListItem>
                        <asp:ListItem>Net</asp:ListItem>
                        <asp:ListItem>Nylon</asp:ListItem>
                        <asp:ListItem>Organza</asp:ListItem>
                        <asp:ListItem>Polycotton</asp:ListItem>
                        <asp:ListItem>Satin</asp:ListItem>
                        <asp:ListItem>Silk</asp:ListItem>
                        <asp:ListItem>Synthetic</asp:ListItem>
                        <asp:ListItem>Tissue</asp:ListItem>
                        <asp:ListItem>Viscose</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td align="left">
                    
                </td>
            </tr>

            <tr>
                <th align="left">
                    Fabric Brand
                </th>
                <td>
                    <asp:DropDownList ID="ddlbrand" runat="server" CssClass="tb">
                        <asp:ListItem>Fabdeal</asp:ListItem>
                        <asp:ListItem>Diva Fashion</asp:ListItem>
                        <asp:ListItem>Ishin</asp:ListItem>
                        <asp:ListItem>Prafful</asp:ListItem>
                        <asp:ListItem>Tanish</asp:ListItem>
                        <asp:ListItem>Triveni</asp:ListItem>
                        <asp:ListItem>Rajguru Rise</asp:ListItem>
                        <asp:ListItem>Vishl</asp:ListItem>
                        <asp:ListItem>Bhavi</asp:ListItem>
                        <asp:ListItem>Saree Swarg</asp:ListItem>
                        <asp:ListItem>Hiba</asp:ListItem>
                        <asp:ListItem>Fashionic</asp:ListItem>
                        <asp:ListItem>Vivaa</asp:ListItem>
                        <asp:ListItem>Valeska</asp:ListItem>
                        <asp:ListItem>Samyakk</asp:ListItem>
                        <asp:ListItem>Soch</asp:ListItem>
                        <asp:ListItem>Adaa</asp:ListItem>
                        <asp:ListItem>Anamika</asp:ListItem>
                        <asp:ListItem>Carah</asp:ListItem>
                        <asp:ListItem>Hawai</asp:ListItem>
                        <asp:ListItem>Vivid India</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td align="left">
                    
                </td>
            </tr>

            <tr>
                <th align="left">
                    Color
                </th>
                <td>
                    <asp:DropDownList ID="tbclr" runat="server" CssClass="tb">
                        <asp:ListItem>Black</asp:ListItem>
                        <asp:ListItem>Pink</asp:ListItem>
                        <asp:ListItem>White</asp:ListItem>
                        <asp:ListItem>Red</asp:ListItem>
                        <asp:ListItem>Blue</asp:ListItem>
                        <asp:ListItem>Yellow</asp:ListItem>
                        <asp:ListItem>Purpole</asp:ListItem>
                        <asp:ListItem>Green</asp:ListItem>
                        <asp:ListItem>Multicolor</asp:ListItem>
                        <asp:ListItem>Beige</asp:ListItem>
                        <asp:ListItem>Dark Blue</asp:ListItem>
                        <asp:ListItem>Maroon</asp:ListItem>
                        <asp:ListItem>Orange</asp:ListItem>
                        <asp:ListItem>Gold</asp:ListItem>
                        <asp:ListItem>Gray</asp:ListItem>
                        <asp:ListItem>Dark Green</asp:ListItem>
                        <asp:ListItem>Light Blue</asp:ListItem>
                        <asp:ListItem>Brown</asp:ListItem>
                        <asp:ListItem>Light Green</asp:ListItem>
                        <asp:ListItem>Silver</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td align="left">
                   
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Please Enter Color of Fabric." ControlToValidate="tbclr" ValidationGroup="fab" 
                        ></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <th align="left">
                    Price
                </th>
                <td>
                    <asp:TextBox ID="tbpr" runat="server" CssClass="tb"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="Please Enter Price of Fabric." ControlToValidate="tbpr" ValidationGroup="fab" 
                        ></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <th align="left">
                    Image
                </th>
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
                        Width="100px" onclick="btnsubmit_Click" ValidationGroup="fab" />
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
                    <h1 align="left">View Fabric Details</h1>
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
                        CommandArgument='<%#bind("fbid") %>' oncommand="viewlnk_Command">View</asp:LinkButton>
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
              <asp:TemplateField HeaderText="Fabric ID">
                <ItemTemplate>
                    <asp:Label ID="fbid_lbl" Text='<%#bind("fbid") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Fabric Name">
                <ItemTemplate>
                    <asp:Label ID="fbname_lbl" Text='<%#bind("fbname") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Fabric Type">
                <ItemTemplate>
                    <asp:Label ID="fbt_lbl" Text='<%#bind("fbtype") %>' runat="server" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Price">
                <ItemTemplate>
                    <asp:Label ID="fbp_lbl" Text='<%#bind("fbprice") %>' runat="server" />
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

