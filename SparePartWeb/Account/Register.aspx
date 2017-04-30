<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SparePartWeb.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
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
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="tbxSurname" CssClass="col-md-2 control-label">Surname</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tbxSurname" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxSurname"
                    CssClass="text-danger" ErrorMessage="The surname field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="tbxUsername" CssClass="col-md-2 control-label">User name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tbxUsername" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxUsername"
                    CssClass="text-danger" ErrorMessage="The username field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="tbxPassword" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tbxPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxPassword"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="tbxPassword" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateNewUser_Click" Text="Register" CssClass="btn btn-default" />
            </div>
        </div>
    </div></asp:Content>
