<%@ Page Title="Report & Graphs" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReportForms.aspx.cs" Inherits="SparePartWeb.ReportForms" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
      <h1 style="text-align:center;"><%: Title %>.</h1>
    
    <p style="text-align:center;">Please choose a report below.</p>

     <div class="row">
        <div class="col-md-4">
            <h2>Spare Part Usage</h2>
            <p>
                Click here for the Spare Part Usage details page.
            </p>
            <p>
                <a class="btn btn-default" href="http://win-vpos7slarr4/Reports/report/ReportSparePartProject/MaintenanceSparepart">Spare Part Report &raquo;</a>
            </p>

            <h2>FeEngineering Equipment</h2>
            <p>
                Click here for the Company Equipment details report.
            </p>
            <p>
                <a class="btn btn-default" href="http://win-vpos7slarr4/Reports/report/ReportSparePartProject/Equipment">Equipment Report &raquo;</a>
            </p>
            <h2>Purchase details</h2>
            <p>
                Click here for the Spare Part Ordered details report.
            </p>
            <p>
                <a class="btn btn-default" href="http://win-vpos7slarr4/Reports/report/ReportSparePartProject/Purchase">Spare Purchase Report  &raquo;</a>
            </p>
            <h2>Vendor Report</h2>
            <p>
                Click here for the Vendor of a Spare Part details.
            </p>
            <p>
                <a class="btn btn-default" href="http://win-vpos7slarr4/Reports/report/ReportSparePartProject/VendorList">Vendor Report &raquo;</a>
            </p>                       
             <h2>Slow-Moving Part Inventory Chart</h2>
            <p>
                Click here for the On-Hand Inventory Chart of Slow-Moving Spare Part for last 12 months report.
            </p>
            <p>
                <a class="btn btn-default" href="http://win-vpos7slarr4/Reports/report/ReportSparePartProject/OnHandInventory">Slow Part-12mths &raquo;</a>
            </p>
            <h2>Fast-Moving Part Inventory Chart</h2>
            <p>
                Click here for the On-Hand Inventory Chart of Fast-Moving Spare Part for last 12 months report.
            </p>
            <p>
                <a class="btn btn-default" href="http://win-vpos7slarr4/Reports/report/ReportSparePartProject/OnHandInventory2">Fast Part-12mths &raquo;</a>
            </p>
            <h2>Vendors Contacts</h2>
            <p>
                Click here for the Vendor label details report screen.
            </p>
            <p>
                <a class="btn btn-default" href="http://win-vpos7slarr4/Reports/report/ReportSparePartProject/VendorContacts">Vendor Address Contact &raquo;</a>
            </p>
        </div>
     
    </div>
</asp:Content>
