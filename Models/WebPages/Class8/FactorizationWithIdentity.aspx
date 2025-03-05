<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="FactorizationWithIdentity.aspx.cs" Inherits="FactorizationWithIdentity" %>

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
                iIdentityType: "",
                iDifficultyType: "",
            };
            let IdentityType_ = $('.IdentityType:checked').val();
            let DifficultyType_ = $('.SolutionTypeA:checked').val();

            JsonInput.iIdentityType = IdentityType_;
            JsonInput.iDifficultyType = DifficultyType_;

            const jsonString = JSON.stringify(JsonInput);
            //alert(jsonString);
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
                MatrixArea = document.getElementById('Solution');

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
            <h1 class="PageNameHeading">Factorisation Using Identity (Classs VIII) </h1>
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
                    <td class="IdentityType" colspan="3">
                        <label>Types Of Identity, we will use solve the questions </label>
                    </td>
                </tr>
                <tr>
                    <td colspan="1" class="InputIDS1">
                        <label>1)</label>
                    </td>
                    <td colspan="2" class="InputIDT1">
                        <label>a^2+2ab+b^2=(a+b)^2</label>
                    </td>
                </tr>
                <tr>
                    <td colspan="1" class="InputIDS2">
                        <label>2)</label>
                    </td>
                    <td colspan="2" class="InputIDT2">
                        <label>a^2-2ab+b^2=(a-b)^2</label>
                    </td>
                </tr>
                <tr>
                    <td colspan="1" class="InputIDS1">
                        <label>3)</label>
                    </td>
                    <td colspan="2" class="InputIDT1">
                        <label>a^2-b^2=(a+b)(a-b)</label>
                    </td>
                </tr>
                <tr>
                    <td colspan="1" class="InputIDS2">
                        <label>4)</label>
                    </td>
                    <td colspan="2" class="InputIDT2">
                        <label>x^2+(a+b)x+ab=(x+a)(x-b) </label>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label class="InputID">Factorisation of the Expression</label>
                    </td>
                    <td colspan="2">

                        <input id="txtExpression" type="text" name="txtStartNumber" value="a^2+8a+16" class="MatrixOrder" />

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
                    <td colspan="3">
                        <div id="Solution">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="InputID" style="color: darkmagenta; background-color: burlywood">
                        <p>Please select Question Type:</p>
                        <input type="radio" name="IdentityTypeA" value="0" checked="true" class="IdentityType">
                        <label for="StepWise">a^2+2ab+b^2=(a+b)^2</label><br>
                        <input type="radio" name="IdentityTypeA" value="1" class="IdentityType">
                        <label for="FinalSolution">a^2-2ab+b^2=(a-b)^2</label><br>
                        <input type="radio" name="IdentityTypeA" value="2" class="IdentityType">
                        <label for="FinalSolution">a^2-b^2=(a+b)(a-b)</label><br>
                        <input type="radio" name="IdentityTypeA" value="3" class="IdentityType">
                        <label for="FinalSolution">x^2+(a+b)x+ab=(x+a)(x-b)</label><br>
                        <input type="radio" name="IdentityTypeA" value="4" class="IdentityType">
                        <label for="FinalSolution">Mix Type</label><br>
                    </td>
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
        </div>
             <div id="SubmitAnswer" hidden="hidden" class="CalculateAnswer" onclick="SubmitAnswer();  ">
                 Submit
             </div>


    </body>
</asp:Content>
