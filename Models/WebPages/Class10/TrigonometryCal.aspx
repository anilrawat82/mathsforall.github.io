<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="TrigonometryCal.aspx.cs" Inherits="TrigonometryCal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript" src="../../JavaScript/Common.js"></script>
    <script type="text/javascript" src="../../JavaScript/Trigonometry.js"></script>
    <link type="text/css" rel="stylesheet" href="../../Css/InitialInputs.css" />  
    <link type="text/css" rel="stylesheet" href="../../Css/Trigonometry.css" />  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <body>
        <div>
            <h1 class="PageNameHeading">Trignometry Ratio Calculations</h1>
        </div>
        <div>
            <table>

                <tr>
                    <td class="TDINPUT"  >
                        <label>
                            <h2 style="display: inline">Name</h2>
                            <input style="display: inline" id="txtName" type="text"  runat="server" name="txtName" class="MatrixOrder" />
                        </label>
                    </td>
                    <td class="TDINPUT"  >
                        <label>
                            <h2 style="display: inline">Date</h2>
                            <asp:Label ID="LblDateTime" runat="server" Text="Label" BackColor="#00CCFF" BorderStyle="Solid" Font-Bold="True" Font-Names="Verdana" ForeColor="White"></asp:Label>
                        </label>
                    </td>
                    <td class="TDINPUT"  >
                        <label>
                            <h2 style="display: inline">Score :</h2>
                            <h2 id="hScore" style="display: inline"></h2>

                        </label>
                    </td>
                </tr>
                <tr>
                    <td class="TDINPUT" >
                        <label  class="InputStatement"> Given</label>
                    </td>
                    <td colspan ="2"  class="TDINPUT" >
                        
                        <input type ="text" class="InputTextTriangle"   id="txtGivenInfo"  style ="width:580px; height:50px" onmouseover ="GetTextHighLight('txtGivenInfo',2)" onmouseout="RemoveHighLight('txtGivenInfo',2)"  onmousedown="RemoveHighLight('txtGivenInfo',2)"/>
                    </td>
                </tr>
                
                  <tr>
                    <td class="TDINPUT" >
                        <label  class="InputStatement"> Calculate  </label>
                    </td>
                    <td colspan ="2"  class="TDINPUT" >
                        <input type ="text" class="InputTextTriangle"   id="txtTriangleVetex"  style ="width:580px; height:50px" onmouseover ="GetTextHighLight('txtTriangleVetex',3)" onmouseout="RemoveHighLight('txtTriangleVetex',3)"  onmousedown="RemoveHighLight('txtTriangleVetex',3)"/>
                    </td>
                </tr>
                
                <tr id="btnCreateT">
                    <td colspan="3" class="TDINPUT" >
                        <input class="CTestYourSelf" id="btnCreateTriangle" type="button"  value="Solve "  onclick="DrawSVGTriangle();" />
                    </td>
                </tr>
                 
                <tr hidden id="btnTest" >
                    <td colspan="3" class="TDINPUT" >
                        <input   class="CTestYourSelf" id="btnTestYourself" type="button"    value="Test Yourself" onclick="TestYourself();" />
                    </td>
                </tr>
            </table>
        </div>
         <div id="MatrixArea">
        </div>
        <input   class="CTestYourSelf" id="idSubmit" type="button"  hidden  value="Submit Solution" onclick="SubmitTest();" />
    </body>
</asp:Content>
