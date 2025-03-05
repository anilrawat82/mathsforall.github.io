<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/NumericalAnalysis.Master" AutoEventWireup="true" CodeBehind="NewtonDivideDifference.aspx.cs" Inherits="NewtonDivideDifference" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/NumericalAnalysis.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/MatrixAnalysis.css" />
    <link href="../../Css/LatestCommon.css" rel="stylesheet" />
    <script type="text/javascript" src="../../JavaScript/NumericalAnalysis.js"></script>
    <script type="text/javascript" src="../../JavaScript/Jquery.js"></script>
    <script>
        function GenerateTableFB() {
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/NumericalAnalysis/NewtonDivideDifference.aspx/GenerateNewtonTable") %>';

            var xhttp = new XMLHttpRequest();
            LastRow = -1;
            LastCol = -1;
            
            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const JsonInput = {
                sMatrixValue: "",
                sValueToFind: "",               
            };
            
            ColumnSize = 2;
            GetMatrixValues();
            JsonInput.sMatrixValue = sValues;
            JsonInput.sValueToFind = document.getElementById('txtDValue').value;

            const jsonString = JSON.stringify(JsonInput);
            xhttp.onload = function () {
                if (this.status == 200) {

                    let myArr = JSON.parse(xhttp.responseText);
                    str = "";
                    for (key in myArr) {
                        str += myArr[key];
                    }
                    let V = str.split("#@#");
                    document.getElementById('MatrixArea2').innerHTML = V[0];
                    document.getElementById('MatrixArea1').innerHTML = V[1];
                }
                else
                {
                    alert("error Now");
                }
            }
            xhttp.send(jsonString);
        }
        function GenerateDivMatrix(id)
        {
            let MatrixArea;

            let stxtInputs= 0;

            
            if (id == "txtIput") {
                stxtInputs= document.getElementById(id).value;
                MatrixArea = document.getElementById('MatrixArea');
                document.getElementById('MatrixArea2').innerHTML = "";
                document.getElementById('MatrixArea1').innerHTML = "";                                
            }


            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/NumericalAnalysis/NewtonDivideDifference.aspx/GenerateMatrix") %>';
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", pageUrl, true);
            xhttp.setRequestHeader("Content-type", "application/json");

            const JsonInput = {
                sInputs: "",
            
            };
            
            MaxArraySize = Number(stxtInputs);
            JsonInput.sInputs = stxtInputs;
            const jsonString = JSON.stringify(JsonInput);

            xhttp.onload = function () {
                if (this.status == 200) {

                    let myArr = JSON.parse(xhttp.responseText);
                    str = "";
                    for (key in myArr) {
                        str += myArr[key];
                    }
                    document.getElementById('SolveTable').hidden = false;                    
                    MatrixArea.innerHTML = str;                    
                }
                else {
                    alert("error Now");
                }
            }
            xhttp.send(jsonString);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body>
        <div>
            <h1 class="PageNameHeading">NEWTON DIFFERENCE METHOD</h1>
        </div>
        <div>
           <table>
              <tr>
                    <td class ="tdA">
                        <label>
                            <h2  class="NameDateScore">Name</h2>
                            <input  id="txtName" type="text"  runat="server" name="txtName" class="textName" />
                        </label>
                    </td>
                    <td class ="tdA">
                        <label>
                            <h2 class="NameDateScore">Date</h2>
                            <asp:Label ID="LblDateTime" runat="server" Text="Label" class="textDate"></asp:Label>
                        </label>
                    </td>
                    <td class ="tdA">
                        <label>
                            <h2 class="NameDateScore">Score :</h2>
                            <h2 id="hScore" class="textScore"></h2>

                        </label>
                    </td>
                </tr>
               <tr>
                    <td>
                        <label class="InputID">Enter Total Intervals Count</label>
                    </td>
                    <td colspan="2">
                        <input id="txtIput" type="number" name="txtMatrixOrder"  class="MatrixOrder" />
                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>              
                  <tr>
                    <td colspan="3">
                        <input  class="CTestYourSelf" id="btnCreate" type="button" value="Generate Input Values Matrix " onclick="GenerateDivMatrix('txtIput');" />
                    </td>
                </tr>        

            </table>
        </div>
        
        <div id="MatrixArea" class="AnswerTable">
        </div>
        
        <table hidden  id="SolveTable">
              <tr class="AnswerTable">
                    <td colspan="2">
                        <label class="InputIDSelection">Determine the value of</label>
                    </td>
                    <td >
                        <input id="txtDValue" type="text" name="txtMatrixOrder"  class="MatrixOrder" />
                    </td>
                </tr>
             <tr >
                <td colspan="3"><input id="btnSolve"  class="CTestYourSelf"  type="button" value="Solve" onclick="GenerateTableFB();" />
                </td>
            </tr>
    </table>
        <div id="MatrixArea2" class="AnswerTable">
        </div>
        <div id="MatrixArea1" class="AnswerTable">
        </div>
        </body>
</asp:Content>

