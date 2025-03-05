<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="CommonForm.aspx.cs" Inherits="CommonForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Xml ID="XmlInitial" runat="server" DocumentSource="~/Models/XMLS/Initalize.xml"></asp:Xml>
    <asp:Table ID="Table1" runat="server"></asp:Table>
    
    <asp:Button runat="server" Text="Updating Session File " Height="54px"  Width="1249px" OnClick="UpdateSession" /></br>
    <asp:Button runat="server" Text="Updating Question File " Height="54px"  Width="1249px" OnClick="UpdateQuestion" />
    <ul>
        <li>
            <input id="Checkbox1" type="checkbox" />
        </li>
    </ul>
</asp:Content>
