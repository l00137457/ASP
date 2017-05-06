<%@ Page Title="Vendor Address" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VendorAddress.aspx.cs" Inherits="SparePartWeb.VendorAddress" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <div class="jumbotron">
        <h1>Vendor Address</h1>
    </div>
    <br />
    <br />

    <br />
    <div class="lead">
        <asp:ListView ID="lstAllProducts" runat="server"
            OnItemEditing="lstAllProducts_ItemEditing"
            OnItemUpdating="lstAllProducts_ItemUpdating" 
            OnItemCanceling="lstAllProducts_ItemCanceling" 
            OnItemDeleting="lstAllProducts_ItemDeleting" 
            InsertItemPosition="LastItem" 
            OnItemInserting="lstAllProducts_ItemInserting" ItemType="SparePartWeb.Address">           
            <LayoutTemplate>
                <table id="Table1" runat="server">
                    <tr id="Tr1" runat="server">
                        <td id="Td1" runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1">
                                <tr id="Tr2" runat="server">
                                    <th id="Th1" runat="server" border="1"></th>
                                    <th id="Th2" runat="server">Vendor Name</th>
                                    <th id="Th3" runat="server">Vendor Address 1</th>
                                    <th id="Th4" runat="server">Vendor Address 2</th>
                                    <th id="Th5" runat="server">Vendor City</th>
                                    <th id="Th6" runat="server">Vendor County</th>
                                    <th id="Th7" runat="server">Vendor Postcode</th>                                   
                                    
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
                        <asp:Label ID="lblName" runat="server" Text='<%#:Item.Vendor_name %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblAddr1" runat="server" Text='<%#:Item.Ven_address_addr1  %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblAddr2" runat="server" Text='<%#:Item.Ven_address_addr2 %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblCity" runat="server" Text='<%#:Item.Ven_address_city %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblCounty" runat="server" Text='<%#:Item.Ven_address_county %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblCode" runat="server" Text='<%#:Item.Ven_address_postcode %>' />
                    </td>
                </tr>
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
                    <asp:Label ID="lblName" runat="server" Text='<%#:Item.Vendor_name%>' />                                               
                    </td> 
                    <td>
                        <asp:TextBox ID="tbxAddr1" runat="server" Text='<%# BindItem.Ven_address_addr1 %>' />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxAddr1"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage=" max of 50 letters" 
                            type="String" operator="DataTypeCheck" ControlToValidate="tbxAddr1"/>
                        <asp:RegularExpressionValidator  runat="server" ErrorMessage="Alphanumeric value required(1-50)" 
                            ValidationExpression="[\w]{1,50}" ControlToValidate="tbxAddr1"/>                   
                    </td>
                    <td>
                        <asp:TextBox ID="tbxAddr2" runat="server" Text='<%# BindItem.Ven_address_addr2 %>' />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxAddr2"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage=" max of 50 letters" 
                            type="String" operator="DataTypeCheck" ControlToValidate="tbxAddr2"/>
                        <asp:RegularExpressionValidator  runat="server" ErrorMessage="Alphanumeric value required(1-50)" 
                            ValidationExpression="[\w]{1,50}" ControlToValidate="tbxAddr2"/>        
                    </td>
                    <td>
                        <asp:TextBox ID="tbxCity" runat="server" Text='<%# BindItem.Ven_address_city %>' />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxCity"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage=" max of 30 letters" 
                            type="String" operator="DataTypeCheck" ControlToValidate="tbxCity"/>
                        <asp:RegularExpressionValidator  runat="server" ErrorMessage="Alphanumeric value required(1-30)" 
                            ValidationExpression="[\w]{1,30}" ControlToValidate="tbxCity"/>    
                    </td>
                    <td>
                        <asp:TextBox ID="tbxCounty" runat="server" Text='<%# BindItem.Ven_address_county %>' />
                         <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxCounty"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage="max of 30 letters" 
                            type="String" operator="DataTypeCheck" ControlToValidate="tbxCounty"/>
                        <asp:RegularExpressionValidator  runat="server" ErrorMessage="Alphanumeric value required(1-30)" 
                            ValidationExpression="[\w]{1,30}" ControlToValidate="tbxCounty"/>         
                    </td>
                    <td>
                        <asp:TextBox ID="tbxPostcode" runat="server" Text='<%# BindItem.Ven_address_postcode %>' />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxPostcode"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage="max of 9 letters" 
                            type="String" operator="DataTypeCheck" ControlToValidate="tbxPostcode"/>
                        <asp:RegularExpressionValidator  runat="server" ErrorMessage="Alphanumeric value required(1-9)" 
                            ValidationExpression="[\w]{1,9}" ControlToValidate="tbxPostcode"/>     
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
                        <asp:TextBox ID="tbxName" runat="server" Text='<%# BindItem.Vendor_name %>'/>  
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxName"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage="max of 30 letters" 
                            type="String" operator="DataTypeCheck" ControlToValidate="tbxName"/>
                        <asp:RegularExpressionValidator  runat="server" ErrorMessage="Alphanumeric value required(1-30)" 
                            ValidationExpression="[\w]{1,30}" ControlToValidate="tbxName"/>                                     
                    </td>                    
                    <td>
                        <asp:TextBox ID="tbxAddr1" runat="server" Text='<%# BindItem.Ven_address_addr1%>' />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxAddr1"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage=" max of 50 letters" 
                            type="String" operator="DataTypeCheck" ControlToValidate="tbxAddr1"/>
                        <asp:RegularExpressionValidator  runat="server" ErrorMessage="Alphanumeric value required(1-50)" 
                            ValidationExpression="[\w]{1,50}" ControlToValidate="tbxAddr1"/>                   
                    </td>
                    <td>
                        <asp:TextBox ID="tbxAddr2" runat="server" Text='<%# BindItem.Ven_address_addr2 %>' />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxAddr2"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage=" max of 50 letters" 
                            type="String" operator="DataTypeCheck" ControlToValidate="tbxAddr2"/>
                        <asp:RegularExpressionValidator  runat="server" ErrorMessage="Alphanumeric value required(1-50)" 
                            ValidationExpression="[\w]{1,50}" ControlToValidate="tbxAddr2"/>                   
                    </td>
                    <td>
                        <asp:TextBox ID="tbxCity" runat="server" Text='<%# BindItem.Ven_address_city %>' />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxCity"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage=" max of 30 letters" 
                            type="String" operator="DataTypeCheck" ControlToValidate="tbxCity"/>
                        <asp:RegularExpressionValidator  runat="server" ErrorMessage="Alphanumeric value required(1-30)" 
                            ValidationExpression="[\w]{1,30}" ControlToValidate="tbxCity"/>                   
                    </td>
                    <td>
                        <asp:TextBox ID="tbxCounty" runat="server" Text='<%# BindItem.Ven_address_county %>' />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxCounty"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage="max of 30 letters" 
                            type="String" operator="DataTypeCheck" ControlToValidate="tbxCounty"/>
                        <asp:RegularExpressionValidator  runat="server" ErrorMessage="Alphanumeric value required(1-30)" 
                            ValidationExpression="[\w]{1,30}" ControlToValidate="tbxCounty"/>                   
                    </td>
                    <td>
                        <asp:TextBox ID="tbxPostcode" runat="server" Text='<%# BindItem.Ven_address_postcode %>' />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxPostcode"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage="max of 9 letters" 
                            type="String" operator="DataTypeCheck" ControlToValidate="tbxPostcode"/>
                        <asp:RegularExpressionValidator  runat="server" ErrorMessage="Alphanumeric value required(1-9)" 
                            ValidationExpression="[\w]{1,9}" ControlToValidate="tbxPostcode"/>                   
                    </td>
                   
                </tr>
            </InsertItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>
