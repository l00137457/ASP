<%@ Page Title="Parts" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Part.aspx.cs" Inherits="SparePartWeb.Part" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h2><%: Title %>.</h2>
    <div class="jumbotron">
        <h1>Spare Part</h1>
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
            OnItemInserting="lstAllProducts_ItemInserting" ItemType="SparePartWeb.SPAREPART">           
            <LayoutTemplate>
                <table id="Table1" runat="server">
                    <tr id="Tr1" runat="server">
                        <td id="Td1" runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1">
                                <tr id="Tr2" runat="server">
                                    <th id="Th1" runat="server" border="1"></th>
                                    <th id="Th2" runat="server">Spare ID</th>
                                    <th id="Th3" runat="server">Purchase Date</th>
                                    <th id="Th4" runat="server">Name</th>
                                    <th id="Th5" runat="server">Unit Cost</th>
                                    <th id="Th6" runat="server">Slow Part</th>
                                    <th id="Th7" runat="server">Fast Type</th>
                                    <th id="Th8" runat="server">Expected Life Time</th>                                   
                                    
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
                        <asp:Label ID="lblSpareID" runat="server" Text='<%#:Item.Spare_ID %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblDate" runat="server" Text='<%#:Item.Purchase_date %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblName" runat="server" Text='<%#:Item.Name %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblCost" runat="server" Text='<%#:Item.Unit_cost %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblSlow" runat="server" Text='<%#:Item.Type_slow_part %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblFast" runat="server" Text='<%#:Item.Type_fast_part %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblLife" runat="server" Text='<%#:Item.Exp_lifeTime %>' />
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
                    <asp:Label ID="lblSpareID" runat="server" Text='<%#:Item.Spare_ID%>' />
                    </td> 
                    <td>
                        <asp:TextBox ID="tbxDate" runat="server" Text='<%# BindItem.Purchase_date %>' />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxDate"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage="Insert Date" 
                            type="Date" operator="DataTypeCheck" ControlToValidate="tbxDate"/>
                        <asp:RegularExpressionValidator  runat="server" ErrorMessage="enter date in yyyy/mm/dd or yyyy-mm-dd" 
                            ValidationExpression="^(19|20)\d\d[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$" 
                            ControlToValidate="tbxDate"/>  
                    </td>
                    <td>
                        <asp:TextBox ID="tbxName" runat="server" Text='<%# BindItem.Name %>' />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxName"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage=" max of 30 letters" 
                            type="String" operator="DataTypeCheck" ControlToValidate="tbxName"/>
                        <asp:RegularExpressionValidator  runat="server" ErrorMessage="Alphanumeric value required(1-30)" 
                            ValidationExpression="[\w]{1,30}" ControlToValidate="tbxName"/> 
                    </td>
                    <td>
                        <asp:TextBox ID="tbxCost" runat="server" Text='<%# BindItem.Unit_cost %>' />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxCost"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage="enter money" 
                            type="Currency" operator="DataTypeCheck" ControlToValidate="tbxCost"/>  
                    </td>
                    <td>
                        <asp:TextBox ID="tbxSlow" runat="server" Text='<%# BindItem.Type_slow_part %>' />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxSlow"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage=" max of 3 letters" 
                            type="String" operator="DataTypeCheck" ControlToValidate="tbxSlow"/>
                        <asp:RegularExpressionValidator  runat="server" ErrorMessage="enter (yes) or leave it empty," 
                            ValidationExpression="/^yes$/" ControlToValidate="tbxSlow"/>
                    </td>
                    <td>
                        <asp:TextBox ID="tbxFast" runat="server" Text='<%# BindItem.Type_fast_part %>' />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxFast"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage=" max of 3 letters" 
                            type="String" operator="DataTypeCheck" ControlToValidate="tbxFast"/>
                        <asp:RegularExpressionValidator  runat="server" ErrorMessage="enter (yes) or leave it empty," 
                            ValidationExpression="/^yes$/" ControlToValidate="tbxFast"/>
                    </td>
                    <td>
                        <asp:TextBox ID="tbxLife" runat="server" Text='<%# BindItem.Exp_lifeTime %>' />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxLife"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage="enter number" 
                            type="Integer" operator="DataTypeCheck" ControlToValidate="tbxLife"/> 
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
                        <asp:TextBox ID="tbxSpareID" runat="server" Text='<%# BindItem.Spare_ID %>'/> 
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxSpareID"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage=" max of 30 letters" 
                            type="String" operator="DataTypeCheck" ControlToValidate="tbxSpareID"/>
                        <asp:RegularExpressionValidator  runat="server" ErrorMessage="Alphanumeric value required(1-30)" 
                            ValidationExpression="[\w]{1,30}" ControlToValidate="tbxSpareID"/>                       
                    </td>                    

                    <td>
                        <asp:TextBox ID="tbxDate" runat="server" Text='<%# BindItem.Purchase_date%>' />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxDate"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage="Insert Date" 
                            type="Date" operator="DataTypeCheck" ControlToValidate="tbxDate"/>
                        <asp:RegularExpressionValidator  runat="server" ErrorMessage="enter date in yyyy/mm/dd or yyyy-mm-dd" 
                            ValidationExpression="^(19|20)\d\d[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$" 
                            ControlToValidate="tbxDate"/>  
                    </td>
                    <td>
                        <asp:TextBox ID="tbxName" runat="server" Text='<%# BindItem.Name %>' />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxName"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage=" max of 30 letters" 
                            type="String" operator="DataTypeCheck" ControlToValidate="tbxName"/>
                        <asp:RegularExpressionValidator  runat="server" ErrorMessage="Alphanumeric value required(1-30)" 
                            ValidationExpression="[\w]{1,30}" ControlToValidate="tbxName"/> 
                    </td>
                    <td>
                        <asp:TextBox ID="tbxCost" runat="server" Text='<%# BindItem.Unit_cost %>' />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxCost"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage="enter money" 
                            type="Currency" operator="DataTypeCheck" ControlToValidate="tbxCost"/>  
                    </td>
                    <td>
                        <asp:TextBox ID="tbxSlow" runat="server" Text='<%# BindItem.Type_slow_part %>' />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxSlow"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage=" max of 3 letters" 
                            type="String" operator="DataTypeCheck" ControlToValidate="tbxSlow"/>
                        <asp:RegularExpressionValidator  runat="server" ErrorMessage="enter (yes) or leave it empty," 
                            ValidationExpression="/^yes$/" ControlToValidate="tbxSlow"/>

                    </td>
                    <td>
                        <asp:TextBox ID="tbxFast" runat="server" Text='<%# BindItem.Type_fast_part %>' />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxFast"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage=" max of 3 letters" 
                            type="String" operator="DataTypeCheck" ControlToValidate="tbxFast"/>
                        <asp:RegularExpressionValidator  runat="server" ErrorMessage="enter (yes) or leave it empty," 
                            ValidationExpression="/^yes$/" ControlToValidate="tbxFast"/>
                    </td>
                    <td>
                        <asp:TextBox ID="tbxLife" runat="server" Text='<%# BindItem.Exp_lifeTime %>' />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxLife"
                            CssClass="text-danger" ErrorMessage="field is required." />
                        <asp:CompareValidator runat="server" ErrorMessage="enter number" 
                            type="Integer" operator="DataTypeCheck" ControlToValidate="tbxLife"/> 
                    </td>
                   
                </tr>
            </InsertItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>
