<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SparePartWeb.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3><%: Title %></h3>

     <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <h4>Use a local account to log in.</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="tbxUsername" CssClass="col-md-2 control-label">User name</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="tbxUsername" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxUsername"
                                CssClass="text-danger" ErrorMessage="The username field is required." />
                            <asp:CompareValidator runat="server" ErrorMessage="Forename max of 20 letters. " 
                                type="String" operator="DataTypeCheck" ControlToValidate="tbxUsername"/>
                            <asp:RegularExpressionValidator  runat="server" ControlToValidate="tbxUsername" 
                                ErrorMessage="Alphanumeric value required(6-30). " ValidationExpression="[\w]{6,30}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="tbxPassword" CssClass="col-md-2 control-label">Password</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="tbxPassword" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxPassword" 
                                CssClass="text-danger" ErrorMessage="The password field is required." />                                                           
                            <asp:CompareValidator runat="server" ErrorMessage="max of 30 characters." 
                                type="String" operator="DataTypeCheck" ControlToValidate="tbxPassword"/>
                            <asp:RegularExpressionValidator  runat="server" ErrorMessage="Alphanumeric value required(6-30). " 
                                ValidationExpression="[\w]{6,30}" ControlToValidate="tbxPassword"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="tbxAccesslevel" CssClass="col-md-2 control-label">Access Level</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="tbxAccesslevel" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxAccesslevel"
                                CssClass="text-danger" ErrorMessage="Access Level is Invalid." />
                            <asp:CompareValidator runat="server" ErrorMessage="Accesslevel (1-3). " 
                                type="Integer" operator="DataTypeCheck" ControlToValidate ="tbxAccesslevel"/>
                            <asp:RangeValidator type="Integer" runat="server" MinimumValue="1" MaximumValue="3" 
                                ErrorMessage="Enter your access level(1-3). " ControlToValidate="tbxAccesslevel"/>
                        </div>
                    </div>
                   
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="LogIn_Click" Text="Log in" CssClass="btn btn-default" />
                        </div>
                    </div>
                </div>
                <p>
                    <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Register as a new user</asp:HyperLink>
                </p>
                <p>
                    <%-- Enable this once you have account confirmation enabled for password reset functionality
                    <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">Forgot your password?</asp:HyperLink>
                    --%>
                </p>
            </section>
        </div>

        <div class="col-md-4">
            <section id="socialLoginForm">
                <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
            </section>
        </div>
    </div>
</asp:Content>
