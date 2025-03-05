<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="DesignAlgorithms.Test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link type="text/css" rel="stylesheet" href="Models/Css/Elementary.css" />
    <link type="text/css" rel="stylesheet" href="Models/Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="Models/Css/AutoGenerateMatrix.css" />
    <link type="text/css" rel="stylesheet" href="Models/Css/Fraction.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
       
            <table>
                
                <tr>
                    <td class="auto-style1">
                        <label>
                            <h2 style="display: inline">Name</h2>
                            <input style="display: inline" id="txtName" type="text" name="txtMatrixOrder" class="MatrixOrder" />
                        </label>
                    </td>
                    <td class="auto-style1">
                        <label>
                            <h2 style="display: inline">Date</h2>
                            <asp:Label ID="LblDateTime" runat="server" Text="Label" BackColor="#00CCFF" BorderStyle="Solid" Font-Bold="True" Font-Names="Verdana" ForeColor="White"></asp:Label>
                        </label>
                    </td>

                     <td>
                        <label>
                            <h2 style="display: inline">Score :</h2>
                            <h2 id="hScore" style="display: inline"></h2>

                        </label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="LabelClass">Number Of Questions B/W(1 to 20)</label>
                    </td>
                    <td colspan="2">

                        <input id="txtQuestion" type="text" name="txtMatrixOrder" value="5" class="MatrixOrder" />

                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                <tr>
                    <td hidden="hidden">
                        <label class="LabelClass">Numbers Of Add B/W(2 to 5)</label>
                    </td>
                    <td colspan="2">
                        <input id="txtNumberToAdd" type="text" name="txtNumberToAdd" value="45" class="MatrixOrder" />


                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                 <tr>
                    <td>
                        <label class="LabelClass">Number Of Digits B/W(1 to 5)</label>
                    </td>
                    <td colspan="2">
                        <input id="txtNumberofDigits" type="text" name="txtNumberofDigits" value="5" class="MatrixOrder" />


                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>

                <tr>
                    <td colspan="3">
                        <label class="LabelClass">Carry Over</label>
                        <input id="bcarryOver" type="checkbox" value="1" />
                        
                        
                        <input id="Button1" type="button" value="Create " onclick="GenerateMatrix();" />
                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>




            </table>
        </div>

</asp:Content>
