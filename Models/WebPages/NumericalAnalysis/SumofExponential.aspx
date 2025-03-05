<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/NumericalAnalysis.Master" AutoEventWireup="true" CodeBehind="SumofExponential.aspx.cs" Inherits="SumofExponential" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/NumericalAnalysis.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/MatrixAnalysis.css" />
    <link href="../../Css/LatestCommon.css" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="../../Css/NewMatrix.css" />
    <script type="text/javascript" src="../../JavaScript/NumericalAnalysis.js"></script>
    <script type="text/javascript" src="../../JavaScript/Jquery.js"></script>
    <script>
        function SolveCurveFitting()
        {
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/NumericalAnalysis/SumofExponential.aspx/SumOfExponential") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const JsonInput = {
                sMatrixValue: "",
            };
            GetMatrixValues();
            
            JsonInput.sMatrixValue = sValues;
            const jsonString = JSON.stringify(JsonInput);
            xhttp.onload = function () {
                if (this.status == 200) {

                    let myArr = JSON.parse(xhttp.responseText);
                    str = "";
                    for (key in myArr) {
                        str += myArr[key];
                    }
                    
                    document.getElementById('MatrixArea1').innerHTML = str;
                    
                }
                else {
                    alert("error Now");
                }
            }
            xhttp.send(jsonString);
        }
        function GenerateMatrix(id) {
            let MatrixArea;

            let stxtInputs = 0;

            document.getElementById('MatrixArea1').innerHTML = "";
            if (id == "txtIput") {
                stxtInputs = document.getElementById(id).value;
                MatrixArea = document.getElementById('MatrixArea');
                document.getElementById('SolveTable').hidden = false;              
            }


            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/NumericalAnalysis/SumofExponential.aspx/GenerateMatrix") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const JsonInput = {
                sInputs: "",                
            };
            
            
            ColumnSize = 2;
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
            <h1 class="PageNameHeading">Linearization of NonLinear Laws</h1>
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
                    <td class ="tdA">
                        <label class="InputID">Enter Total data point Counts</label>
                    </td>
                    <td colspan="2">
                        <input id="txtIput" type="number" name="txtMatrixOrder"  class="MatrixOrder" />
                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                <tr>
                    <td colspan="3">
                        <input  class="CTestYourSelf" id="btnCreate" type="button" value="Generate Input Values Matrix " onclick="GenerateMatrix('txtIput');" />
                    </td>
                </tr>     
            </table>
        </div>
        
        <div id="MatrixArea">
        </div>
     
        
        <table hidden id="SolveTable">
            <tr>
                <td colspan="3"><input id="btnSolve"  class="CTestYourSelf"  type="button" value="SOLVE" onclick="SolveCurveFitting();" />
                </td>
            </tr>
        </table>
        <div id="MatrixArea1"  class="AnswerTable">
        </div>
        </body>
</asp:Content>
