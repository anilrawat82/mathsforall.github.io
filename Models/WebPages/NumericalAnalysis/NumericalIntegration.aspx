<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/NumericalAnalysis.Master" AutoEventWireup="true" CodeBehind="NumericalIntegration.aspx.cs" Inherits="NumericalIntegration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script type="text/javascript" src="../../JavaScript/NumericalAnalysis.js"></script>
    <script type="text/javascript" src="../../JavaScript/Jquery.js"></script>

        <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/LatestCommon.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/MatrixAnalysis.css" />

    <script>
        function SolveCurveFitting() {
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/NumericalAnalysis/NumericalIntegration.aspx/SolveNumericalIntegration") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const JsonInput = {
                sMatrixValue: "",
                sTableType: "",
            };
            GetMatrixValues();
            let TableType = $('.SolutionTypeA:checked').val();
            JsonInput.sMatrixValue = sValues;
            JsonInput.sTableType = TableType;

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
                document.getElementById('iNote').hidden = false;               
            }


            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/NumericalAnalysis/NumericalIntegration.aspx/GenerateMatrix") %>';

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
            <h1 class="PageNameHeading">Numerical Integration Trapezoidal & Simpson Rule</h1>
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
                        <label class="InputID">Enter Total data point Counts</label>
                    </td>
                    <td colspan="2">
                        <input id="txtIput" type="number" name="txtMatrixOrder"  class="MatrixOrder" />
                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                   
            </table>
        </div>
        
        
        <table>
            
            <tr>
                <td colspan="4">
                        <input  class="CTestYourSelf" id="btnCreate" type="button" value="Generate Input Values Matrix " onclick="GenerateMatrix('txtIput');" />
                    </td>
                </tr>        
             <tr>
                <td colspan="4">
                    <div id="MatrixArea">
                    </div>
                </td>
                </tr>        
               <tr>
                    <td colspan="4" id="iNote" hidden>
                       <label class="NOTEText">NOTE: Value of X should be equally spaced like(1,3,5..) or(4,7,10,... </label>
                    </td>
                </tr> 
             
        
        <table hidden id="SolveTable">
            <tr class="AnswerTable">
                <td  class="InputIDSelection"> 
                       <label class="InputIDSelection">Integration Method </label>
                </td>
                <td   class="InputIDSelection"> 
                    <input type="radio"  name="SolutionType" value="1" checked="true" class="SolutionTypeA">
                    <label for="Forward">Trapezoidal Rule</label><br>
                </td>

                <td class="InputIDSelection"> 
                    <input type="radio"  name="SolutionType" value="2" class="SolutionTypeA">
                    <label for="BackWard">Simppson's 1/3-Rule</label><br>  
                </td>
                <td class="InputIDSelection"> 
                    <input type="radio"  name="SolutionType" value="3" class="SolutionTypeA">
                    <label for="BackWard">Simppson's 3/8-Rule</label><br>  
                      
                </td>
            </tr>
            <tr>
                <td colspan="4"><input id="btnSolve"  class="CTestYourSelf"  type="button" value="SOLVE" onclick="SolveCurveFitting();" />
                </td>
            </tr>
        </table>
        <div id="MatrixArea1" class="AnswerTable">
        </div>
        </body>
</asp:Content>
