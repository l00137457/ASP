<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SparePartWeb.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3><%: Title %>.</h3>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Create a new account</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="tbxForename" CssClass="col-md-2 control-label">Forename</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tbxForename" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxForename"
                    CssClass="text-danger" ErrorMessage="The forename field is required." />
                <asp:CompareValidator runat="server" ErrorMessage="Forename max of 20 letters" 
                    type="String" operator="DataTypeCheck" ControlToValidate="tbxForename"/>
                <asp:RegularExpressionValidator  runat="server" ErrorMessage="letter value required(6-20)" 
                    ValidationExpression="[a-zA-Z]{1,20}" ControlToValidate="tbxForename"/>

            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="tbxSurname" CssClass="col-md-2 control-label">Surname</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tbxSurname" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxSurname"
                    CssClass="text-danger" ErrorMessage="The surname field is required." />
                <asp:CompareValidator runat="server" ErrorMessage="Forename max of 20 letters" 
                    type="String" operator="DataTypeCheck" ControlToValidate="tbxSurname"/>
                <asp:RegularExpressionValidator  runat="server" ErrorMessage="letter value required(6-20)" 
                    ValidationExpression="[a-zA-Z]{1,20}" ControlToValidate="tbxSurname"/>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="tbxUsername" CssClass="col-md-2 control-label">User name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tbxUsername" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxUsername"
                    CssClass="text-danger" ErrorMessage="The username field is required." />
                <asp:CompareValidator runat="server" ErrorMessage="Forename max of 20 letters" 
                    type="String" operator="DataTypeCheck" ControlToValidate="tbxUsername"/>
                <asp:RegularExpressionValidator  runat="server" ErrorMessage="Alphanumeric value required(6-30)" 
                    ValidationExpression="[\w]{6,30}" ControlToValidate="tbxUsername"/>
                
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="tbxPassword" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tbxPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxPassword"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
                <asp:CompareValidator runat="server" ErrorMessage="max of 30 characters" 
                    type="String" operator="DataTypeCheck" ControlToValidate="tbxPassword"/>
                <asp:RegularExpressionValidator  runat="server" ErrorMessage="Alphanumeric value required(6-30)" 
                    ValidationExpression="[\w]{6,30}" ControlToValidate="tbxPassword"/>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="tbxConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tbxConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="tbxPassword" ControlToValidate="tbxConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                <asp:CompareValidator runat="server" ErrorMessage="max of 30 characters" 
                    type="String" operator="DataTypeCheck" ControlToValidate="tbxConfirmPassword"/>
                <asp:RegularExpressionValidator runat="server" ErrorMessage="Alphanumeric value required(6-30)" ControlToValidate="tbxConfirmPassword" 
                    ValidationExpression="[\w]{6,30}"/>
            </div>
        </div>
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="tbxAccesslevel" CssClass="col-md-2 control-label">Access Level</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tbxAccesslevel" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxAccesslevel"
                    CssClass="text-danger" ErrorMessage="Access Level is Invalid." />
                <asp:CompareValidator runat="server" ErrorMessage="Accesslevel (1-3)" 
                    type="Integer" operator="DataTypeCheck" ControlToValidate="tbxAccesslevel"/>
                <asp:RangeValidator type="Integer" runat="server" MinimumValue="1" MaximumValue="3" ControlToValidate="tbxAccesslevel" 
                    ErrorMessage="Enter your access level(1-3)"/>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateNewUser_Click" Text="Register" CssClass="btn btn-default" />
            </div>
        </div>
    </div></asp:Content>
