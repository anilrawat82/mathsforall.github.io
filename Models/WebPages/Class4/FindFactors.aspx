<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="FindFactors.aspx.cs" Inherits="FindFactors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
<link type="text/css" rel="stylesheet" href="../../Css/NumericalAnalysis.css" />
<link type="text/css" rel="stylesheet" href="../../Css/MatrixAnalysis.css" />
<link href="../../Css/LatestCommon.css" rel="stylesheet" />
    
    <link href="../../Css/TestYourself.css" rel="stylesheet" />
    <script type="text/javascript" src="../../JavaScript/Jquery.js"></script>
    <script type="text/javascript" src="../../JavaScript/DecimalToFraction.js"></script>
    <script type="text/javascript" src="../../JavaScript/Common.js"></script>
     <script>

         function SubmitAnswer()
         {

             document.getElementById("btnTest").hidden = false;
             var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Class4/FindFactors.aspx/GetSubmitAnswer") %>';
             var xhttp = new XMLHttpRequest();
             xhttp.open("POST", pageUrl, true);
             xhttp.setRequestHeader("Content-type", "application/json");
             

             
             const Matrix = {
                 Ivalue: "",
                 
             };
             Matrix.Ivalue = 2;
             
             const jsonString = JSON.stringify(Matrix);
             xhttp.onload = function () {
                 if (this.status == 200) {
                     let myArr = JSON.parse(xhttp.responseText);
                     str = "";
                     for (key in myArr) {
                         str += myArr[key];
                     }
                     CheckCommonFactors2(str,"#");
                 }
                 else {
                     alert("error Now");
                 }
             }
             xhttp.send(jsonString);
         }
         function GenerateTestMatrix()
         {

             let MatrixArea = document.getElementById('MatrixArea');

             document.getElementById("btnCreate").hidden = true;
             document.getElementById("btnTest").hidden = true;
             document.getElementById("SubmitAnswer").hidden = false;
             var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Class4/FindFactors.aspx/GenerateTestYourselfMatrix") %>';
             var xhttp = new XMLHttpRequest();
             xhttp.open("POST", pageUrl, true);
             xhttp.setRequestHeader("Content-type", "application/json");
             const JsonInput =
             {
                 empty: "",
             };
             

             JsonInput.empty = 1;
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
         function GenerateMatrix(id)
         {
             let sExpression;
             let MatrixArea;

             if (id == "txtExpression") {
                 sExpression = document.getElementById(id).value;
                 MatrixArea = document.getElementById('MatrixArea');

             }
             else {
                 sExpression = document.getElementById(id).innerText;

                 let Divid = "SolutionDiv_" + id.split('_')[1];
                 let Fsol = "FullSolution_" + id.split('_')[1];
                 if (CheckFullSolutionVisible(Fsol, Divid) == true)
                     return;
                 MatrixArea = document.getElementById(Divid);
             }

             
             let MethodType_ = $('.SolutionTypeA:checked').val();
             var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Class4/FindFactors.aspx/GenerateMatrix") %>';
             var xhttp = new XMLHttpRequest();
             xhttp.open("POST", pageUrl, true);
             xhttp.setRequestHeader("Content-type", "application/json");
             const JsonInput = {
                 sExpressions: "",
                 MethodType: "",
             };
             JsonInput.sExpressions = sExpression;
             JsonInput.MethodType = MethodType_;

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
    <body class"AnswerTable">
        <div>
            <h1 class="PageNameHeading">Find the Factors for a given Number : Classs IV </h1>
            
        </div>
        <div>
            <table>

                <tr>
                    <td>
                        <label>
                            <h2 class="NameDateScore">Name</h2>
                            <input id="txtName" type="text"  runat="server" name="txtName" class="textName" />
                        </label>
                    </td>
                    <td>
                        <label>
                            <h2 class="NameDateScore">Date</h2>
                            <asp:Label ID="LblDateTime" runat="server" Text="Label" class="textDate"></asp:Label>
                        </label>
                    </td>
                    <td>
                        <label>
                            <h2 class="NameDateScore">Score :</h2>
                            <h2 id="hScore" class="textScore"></h2>

                        </label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="InputID">Identify terms and factors in the expression </label>
                    </td>
                    <td colspan="2">

                        <input id="txtExpression" type="text" name="txtStartNumber" value="48" class="MatrixOrder" />

                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>


              
                 <tr>
                    <td colspan="3" class="InputID" style="color: greenyellow; background-color: cadetblue">
                        <p>Please select Method:</p>
                        <input type="radio" name="SolutionType" value="0" checked="true" class="SolutionTypeA">
                        <label for="StepWise">Multiply</label><br>
                        <input type="radio" name="SolutionType" value="1" class="SolutionTypeA">
                        <label for="FinalSolution">Division</label><br>
                        
                    </td>
                </tr>
                  <tr>
                 <td colspan="3">

                          <input class="CTestYourSelf" id="btnCreate" type="button" value="Solve " onclick="GenerateMatrix('txtExpression');" />
                      </td>
                      <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                  </tr>
                
                <tr>
                    <td colspan="3">

                        <input class="CTestYourSelf" id="btnTest" type="button" value="Test Your Self " onclick="GenerateTestMatrix();" class="auto-style2" />
                    </td>

                </tr>


            </table>
        </div>



        <div id="MatrixArea">
            
        </div>


       
        <div id="SubmitAnswer" hidden="hidden" class="CalculateAnswer" onclick="SubmitAnswer();  ">
            Submit
        </div>


    </body>
</asp:Content>