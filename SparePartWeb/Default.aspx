﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SparePartWeb._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

   <div class="jumbotron">
        <h1>The Smart card Company</h1>
        <p class="lead">Welcome to FeEngineering website. We are a multinational company that manufactures company memomry cards.</p>
        <p class="lead">Click on any of the links below to direct you to relevant information.</p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Reports</h2>
            <p>
                Click on this button to view reports available to the user.
            </p>
             <p>
                <a class="btn btn-default" href="/reports.aspx">View reports &raquo;</a>
            </p>
           
        </div>
        <div class="col-md-4">
            <h2>Update records</h2>
            <p>
                Click here to update records in the database.
            </p>
             <p>
                <a class="btn btn-default" href="/search.aspx">Update records &raquo;</a>
            </p>
           
        </div>
        <div class="col-md-4">
            <h2>View records</h2>
            <p>
                Click on this link to search for specific information in the database.
            </p>
            <p>
                <a class="btn btn-default" href="/search.aspx">Search records &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
