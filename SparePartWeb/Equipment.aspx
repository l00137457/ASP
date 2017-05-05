<%@ Page Title="Equipment" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Equipment.aspx.cs" Inherits="SparePartWeb.Equipment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <div class="jumbotron">
        <h1>Equipment & Spare Parts</h1>
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
            OnItemInserting="lstAllProducts_ItemInserting">           
            <LayoutTemplate>
                <table id="Table1" runat="server">
                    <tr id="Tr1" runat="server">
                        <td id="Td1" runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1">
                                <tr id="Tr2" runat="server">
                                    <th id="Th1" runat="server" border="1"></th>
                                    <th id="Th2" runat="server">Equip ID</th>
                                    <th id="Th3" runat="server">Equip Name</th>
                                    <th id="Th4" runat="server">Equip Location</th>
                                    <th id="Th5" runat="server">Purchase Date</th>
                                    <th id="Th6" runat="server">Expected Lifetime</th>
                                    <th id="Th7" runat="server">Avg Man hrs Shutdown</th>
                                    <th id="Th8" runat="server">Purchase Price</th>
                                    <th id="Th9" runat="server">Est cost Breakdown</th>
                                    
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
                        <asp:Label ID="lblEquipID" runat="server" Text='<%# Eval("Equip_ID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblEquipName" runat="server" Text='<%# Eval("Equip_name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblEquipLocation" runat="server" Text='<%# Eval("Equip_location") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblPurchaseD" runat="server" Text='<%# Eval("Purchase_date") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblExpL" runat="server" Text='<%# Eval("Exp_lifetime") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblAvg" runat="server" Text='<%# Eval("Avg_man_hrs_shutdown") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblPurchaseP" runat="server" Text='<%# Eval("Purchase_price") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblEst" runat="server" Text='<%# Eval("Est_cost_brkdown") %>' />
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
                    <asp:Label ID="lblEqiupID" runat="server" Text='<%# Eval("Equip_ID") %>' />
                    </td> 
                    <td>
                        <asp:TextBox ID="tbxEquipName" runat="server" Text='<%# Bind("Equip_name") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxEquipLocation" runat="server" Text='<%# Bind("Equip_Location") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxPurchaseD" runat="server" Text='<%# Bind("Purchase_date") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxExpL" runat="server" Text='<%# Bind("Exp_lifetime") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxAvg" runat="server" Text='<%# Bind("Avg_man_hrs_shutdown") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxPurchaseP" runat="server" Text='<%# Bind("Purchase_price") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxEst" runat="server" Text='<%# Bind("Est_cost_brkdown") %>' />
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
                        <asp:TextBox ID="tbxEqiupID" runat="server" Text='<%# Bind("Equip_ID") %>'/>                    
                    </td>                    
                    <td>
                        <asp:TextBox ID="tbxEquipName" runat="server" Text='<%# Bind("Equip_name") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxEquipLocation" runat="server" Text='<%# Bind("Equip_Location") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxPurchaseD" runat="server" Text='<%# Bind("Purchase_date") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxExpL" runat="server" Text='<%# Bind("Exp_lifetime") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxAvg" runat="server" Text='<%# Bind("Avg_man_hrs_shutdown") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxPurchaseP" runat="server" Text='<%# Bind("Purchase_price") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxEst" runat="server" Text='<%# Bind("Est_cost_brkdown") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
        </asp:ListView>
    </div>
            
</asp:Content>
