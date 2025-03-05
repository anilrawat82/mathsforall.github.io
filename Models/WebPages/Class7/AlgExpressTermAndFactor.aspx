<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="AlgExpressTermAndFactor.aspx.cs" Inherits="AlgExpressTermAndFactor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="../../Css/LatestCommon.css" />
    <link href="../../Css/StandardForm.css" rel="stylesheet" />
    <script type="text/javascript" src="../../JavaScript/Jquery.js"></script>
    <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/CorrectAnswer.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/LatestCommon.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/CorrectAnswer.css" />
    <script type="text/javascript" src="../../JavaScript/DecimalToFraction.js"></script>
    <script type="text/javascript" src="../../JavaScript/Common.js"></script>
     <script>

         function SubmitAnswer()
         {

             document.getElementById("btnTest").hidden = false;
             var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Class7/AlgExpressTermAndFactor.aspx/GetSubmitAnswer") %>';
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
                     CheckCommonFactors(str);
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
             var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Class7/AlgExpressTermAndFactor.aspx/GenerateTestYourselfMatrix") %>';
             var xhttp = new XMLHttpRequest();
             xhttp.open("POST", pageUrl, true);
             xhttp.setRequestHeader("Content-type", "application/json");
             const JsonInput =
             {
                 iDifficultyLevel: "",
             };
             let DifficultyType_ = $('.SolutionTypeA:checked').val();

             JsonInput.iDifficultyLevel = DifficultyType_;
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

             

             var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Class7/AlgExpressTermAndFactor.aspx/GenerateMatrix") %>';
             var xhttp = new XMLHttpRequest();
             xhttp.open("POST", pageUrl, true);
             xhttp.setRequestHeader("Content-type", "application/json");
             const JsonInput = {
                 sExpressions: "",
             };
             JsonInput.sExpressions = sExpression;

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
            <h1 class="PageNameHeading">Algebaric Expression For Classs VII </h1>
            <h4 class="PageSubHeading">Identify terms and factors in the expression(Exercise=12.1)</h4>
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

                        <input id="txtExpression" type="text" name="txtStartNumber" value="12x+36Y^2-45xz" class="MatrixOrder" />

                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>


                <tr>
                    <td colspan="3">

                        <input class="CTestYourSelf" id="btnCreate" type="button" value="Solve " onclick="GenerateMatrix('txtExpression');" />
                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                
                 <tr>
                    <td colspan="3" class="InputID" style="color: greenyellow; background-color: cadetblue">
                        <p>Please select Difficulty Level:</p>
                        <input type="radio" name="SolutionType" value="0" checked="true" class="SolutionTypeA">
                        <label for="StepWise">Simple</label><br>
                        <input type="radio" name="SolutionType" value="1" class="SolutionTypeA">
                        <label for="FinalSolution">Medium</label><br>
                        <input type="radio" name="SolutionType" value="2" class="SolutionTypeA">
                        <label for="FinalSolution">Difficult</label><br>
                    </td>
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