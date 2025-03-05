﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="AlgebraicDivision.aspx.cs" Inherits="AlgebraicDivision" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/LatestCommon.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/CorrectAnswer.css" />
    <link href="../../Css/Factorization8.css" rel="stylesheet" />
    <script type="text/javascript" src="../../JavaScript/Jquery.js"></script>
    <script type="text/javascript" src="../../JavaScript/DecimalToFraction.js"></script>
    <script type="text/javascript" src="../../JavaScript/Common.js"></script>
    <script>

        function SubmitAnswer() {

            document.getElementById("btnTest").hidden = false;
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Class8/FactorizationWithIdentity.aspx/GetSubmitAnswer") %>';
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
                    CheckAnswerForIdentity(str);
                }
                else {
                    alert("error Now");
                }
            }
            xhttp.send(jsonString);
        }
        function GenerateTestMatrix() {

            let MatrixArea = document.getElementById('MatrixArea');

            document.getElementById("btnCreate").hidden = true;
            document.getElementById("btnTest").hidden = true;
            document.getElementById("SubmitAnswer").hidden = false;
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Class8/FactorizationWithIdentity.aspx/GenerateTestYourselfMatrix") %>';
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", pageUrl, true);
            xhttp.setRequestHeader("Content-type", "application/json");
            const JsonInput =
            {
                iQuestionType: "",
            };
            let SolutionType = $('.SolutionTypeA:checked').val();

            JsonInput.iQuestionType = SolutionType;
            
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
        function GenerateMatrix(id) {
            let iCommonFactor;
            let MatrixArea;

            if (id == "txtExpression") {
                iCommonFactor = document.getElementById(id).value;
                MatrixArea = document.getElementById('MatrixArea');

            }
            else {
                iCommonFactor = document.getElementById(id).innerText;

                let Divid = "SolutionDiv_" + id.split('_')[1];
                let Fsol = "FullSolution_" + id.split('_')[1];
                if (CheckFullSolutionVisible(Fsol, Divid) == true)
                    return;
                MatrixArea = document.getElementById(Divid);
            }



            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Class8/FactorizationWithIdentity.aspx/GenerateMatrix") %>';
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", pageUrl, true);
            xhttp.setRequestHeader("Content-type", "application/json");
            const JsonInput = {
                sExpressions: "",
            };
            JsonInput.sExpressions = iCommonFactor;

            const jsonString = JSON.stringify(JsonInput);

            xhttp.onload = function () {
                if (this.status == 200) {
                    let myArr = JSON.parse(xhttp.responseText);
                    str = "";
                    for (key in myArr) {
                        str += myArr[key];
                    }
                    //alert(str);
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
            <h1 class="PageNameHeading">Division of Algebaric Expression (Classs VIII) </h1>
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
                    <td colspan="3">
                        <label class="InputID">Divide Expression </label>
                        <input id="txtExpressionA" type="text" name="txtStartNumber" value="a^2+8a+16" class="MatrixOrder" />
                        <label class="InputID" style="color:darkorange"> By  </label>
                        <input id="txtExpressionB" type="text" name="txtStartNumber" value="a^2+8a+16" class="MatrixOrder" />

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
                        <p>Please select Test Type:</p>
                        <input type="radio" name="SolutionType" value="1" checked="true" class="SolutionTypeA">
                        <label for="StepWise">Monomial by another Monomial</label><br>
                        <input type="radio" name="SolutionType" value="2" class="SolutionTypeA">
                        <label for="FinalSolution">Polynomial by a Monomial</label><br>
                        <input type="radio" name="SolutionType" value="3" class="SolutionTypeA">
                        <label for="FinalSolution">Polynomial by another Polynomial</label><br>
                        <input type="radio" name="SolutionType" value="4" class="SolutionTypeA">
                        <label for="FinalSolution">Mix</label><br>

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


        </div>
             <div id="SubmitAnswer" hidden="hidden" class="CalculateAnswer" onclick="SubmitAnswer();  ">
                 Submit
             </div>


    </body>
</asp:Content>
