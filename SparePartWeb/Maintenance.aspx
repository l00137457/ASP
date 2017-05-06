<%@ Page Title="Maintenance" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Maintenance.aspx.cs" Inherits="SparePartWeb.Maintenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <div class="jumbotron">
        <h1>Maintenance</h1>
    </div>
    <br />
    <br />

    <br />
    <div class="mycolour">
    <div class="lead">
        <asp:ListView ID="lstAllProducts" runat="server"
            OnItemEditing="lstAllProducts_ItemEditing"
            OnItemUpdating="lstAllProducts_ItemUpdating" 
            OnItemCanceling="lstAllProducts_ItemCanceling" 
            OnItemDeleting="lstAllProducts_ItemDeleting" 
            InsertItemPosition="LastItem" 
            OnItemInserting="lstAllProducts_ItemInserting" ItemType="SparePartWeb.Maintenance_1">           
            <LayoutTemplate>
                <table id="Table1" runat="server">
                    <tr id="Tr1" runat="server">
                        <td id="Td1" runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1">
                                <tr id="Tr2" runat="server">
                                    <th id="Th1" runat="server" border="1"></th>
                                    <th id="Th2" runat="server">Maintenance ID</th>
                                    <th id="Th3" runat="server">Maintenance Name</th>
                                    <th id="Th4" runat="server">Shutdown Type</th>
                                    <th id="Th5" runat="server">Breakdown Type</th>
                                    <th id="Th6" runat="server">Total Man Hrs</th>                                                                                                
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr id="Tr3" runat="server">
                        <td id="Td2" runat="server" style=""></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete"
                            Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                    <asp:Label ID="lblMainID" runat="server" Text='<%#:Item.Main_ID%>' />
                    </td>                    
                        <asp:TextBox ID="tbxName" runat="server" Text='<%#: Item.Main_name %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxShutDwn" runat="server" Text='<%#: Item.Type_shutdown%>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxBreakDwn" runat="server" Text='<%#: Item.Type_breakdown %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxTotalHrs" runat="server" Text='<%#: Item.Total_man_hrs %>' />
                    </td>                                       
            </ItemTemplate>
            <EditItemTemplate>
                <tr>
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update"
                            Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel"
                            Text="Cancel" />
                    </td>
                    <td>
                    <asp:Label ID="lblMainID" runat="server" Text='<%#:Item.Main_ID%>' />
                    </td>                    
                        <asp:TextBox ID="tbxName" runat="server" Text='<%# BindItem.Main_name %>' />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxName"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage=" max of 30 letters" 
                            type="String" operator="DataTypeCheck" ControlToValidate="tbxName"/>
                        <asp:RegularExpressionValidator  runat="server" ErrorMessage="Alphanumeric value required(1-30)" 
                            ValidationExpression="[\w]{1,30}" ControlToValidate="tbxName"/>                   
                    </td>
                    <td>
                        <asp:TextBox ID="tbxShutDwn" runat="server" Text='<%# BindItem.Type_shutdown%>' />
                         <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxShutDwn"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage=" max of 3 letters" 
                            type="String" operator="DataTypeCheck" ControlToValidate="tbxShutDwn"/>
                        <asp:RegularExpressionValidator  runat="server" ErrorMessage="enter (yes) or leave it empty," 
                            ValidationExpression="/^yes$/" ControlToValidate="tbxShutDwn"/>                   
                    </td>
                    <td>
                        <asp:TextBox ID="tbxBreakDwn" runat="server" Text='<%# BindItem.Type_breakdown %>' />
                         <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxBreakDwn"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage=" max of 3 letters" 
                            type="String" operator="DataTypeCheck" ControlToValidate="tbxBreakDwn"/>
                        <asp:RegularExpressionValidator  runat="server" ErrorMessage="enter (yes) or leave it empty," 
                            ValidationExpression="/^yes$/" ControlToValidate="tbxBreakDwn"/>
                    </td>
                    <td>
                        <asp:TextBox ID="tbxTotalHrs" runat="server" Text='<%# BindItem.Total_man_hrs %>' />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxTotalHrs"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage="enter money" 
                            type="Currency" operator="DataTypeCheck" ControlToValidate="tbxTotalHrs"/>
                    </td>                                       
                    
                </tr>
            </EditItemTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert"
                            Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel"
                            Text="Clear" />
                    </td>                 
                    <td>                    
                        <asp:TextBox ID="tbxName" runat="server" Text='<%# BindItem.Main_name %>' />
                         <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxName"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage=" max of 30 letters" 
                            type="String" operator="DataTypeCheck" ControlToValidate="tbxName"/>
                        <asp:RegularExpressionValidator  runat="server" ErrorMessage="Alphanumeric value required(1-30)" 
                            ValidationExpression="[\w]{1,30}" ControlToValidate="tbxName"/>                   
                    </td>
                    <td>
                        <asp:TextBox ID="tbxShutDwn" runat="server" Text='<%# BindItem.Type_shutdown%>' />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxName"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage=" max of 3 letters" 
                            type="String" operator="DataTypeCheck" ControlToValidate="tbxShutDwn"/>
                        <asp:RegularExpressionValidator  runat="server" ErrorMessage="enter (yes) or leave it empty," 
                            ValidationExpression="/^yes$/" ControlToValidate="tbxShutDwn"/>   
                    </td>
                    <td>
                        <asp:TextBox ID="tbxBreakDwn" runat="server" Text='<%# BindItem.Type_breakdown %>' />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxBreakDwn"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage=" max of 3 letters" 
                            type="String" operator="DataTypeCheck" ControlToValidate="tbxBreakDwn"/>
                        <asp:RegularExpressionValidator  runat="server" ErrorMessage="enter (yes) or leave it empty," 
                            ValidationExpression="/^yes$/" ControlToValidate="tbxBreakDwn"/>
                    </td>
                    <td>
                        <asp:TextBox ID="tbxTotalHrs" runat="server" Text='<%# BindItem.Total_man_hrs %>' />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxTotalHrs"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage="enter money" 
                            type="Currency" operator="DataTypeCheck" ControlToValidate="tbxTotalHrs"/>
                    </td>                                       
                </tr>
            </InsertItemTemplate>
        </asp:ListView>
    </div>
  </div>
</asp:Content>
