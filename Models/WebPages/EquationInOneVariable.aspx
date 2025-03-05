<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="EquationInOneVariable.aspx.cs" Inherits="EquationInOneVariable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link type="text/css" rel="stylesheet" href="../Css/LatestCommon.css" />
      <link type="text/css" rel="stylesheet" href="../Css/LCM_.css" />
    <link type="text/css" rel="stylesheet" href="../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../Css/AutoGenerateMatrix.css" />
    <link type="text/css" rel="stylesheet" href="../Css/LinearEquation.css" />
    <link type="text/css" rel="stylesheet" href="../Css/CorrectAnswer.css" />
    <script type="text/javascript" src="../JavaScript/Elementary.js"></script>
    <script type="text/javascript" src="../JavaScript/DecimalToFraction.js"></script>
    <script type="text/javascript" src="../JavaScript/Common.js"></script>
    <script type="text/javascript">

        function SubmitAnswer()
        {
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/EquationInOneVariable.aspx/GetSubmitAnswer") %>';
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
                    CheckAnswers(str);
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
            document.getElementById("SubmitAnswer").hidden = false;

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/EquationInOneVariable.aspx/GenerateTestYourselfMatrix") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const JsonInput = {
                sDecimalNumber: "",


            };

            JsonInput.sDecimalNumber = 0;


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
            let EquationinOneVariable;
            let MatrixArea;

            if (id == "idExePression") {
                EquationinOneVariable = document.getElementById(id).value;
                MatrixArea = document.getElementById('MatrixArea');

                
            }
            else
            {
                EquationinOneVariable = document.getElementById(id).innerText;

                let Divid = "SolutionDiv_" + id.split('_')[1];
                let Fsol = "FullSolution_" + id.split('_')[1];
                if (CheckFullSolutionVisible(Fsol, Divid) == true)
                    return;
                MatrixArea = document.getElementById(Divid);
                

            }



            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/EquationInOneVariable.aspx/SolveEquation") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const OneVariableEqn = {
                sEquation: "",
            };
            OneVariableEqn.sEquation = EquationinOneVariable;
            const jsonString = JSON.stringify(OneVariableEqn);            

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
            <h1 class="PageNameHeading">Equation in one varaiable</h1>
        </div>
        <div>
            <table>

                  <tr>
                    <td>
                        <label>
                            <h2  class="NameDateScore">Name</h2>
                            <input  id="txtName" type="text"  runat="server" name="txtName" class="textName" />
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
                        <label class="InputID">Linear Equation Expression  <b>2x+3=5 or 4x+2=5x+4 or 4y+5y=10</b></label>
                    </td>
                    <td colspan="2">
                        <input id="idExePression" type="text" name="txtMatrixOrder" value=" 4x+2=5x+4" class="MatrixOrder" />
                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>




                <tr>
                    <td colspan="3" >
                        <%--<asp:Button ID="Button1" runat="server" Text="Solve" OnClick="Button1_Click" style="height: 26px"    />--%>
                        <input class="CTestYourSelf" id="btnCreate" type="button" value="Solve" onclick="GenerateMatrix('idExePression');" />
                    </td>
                </tr>

                <tr>
                    <td colspan="3">

                        <input class="CTestYourSelf " id="btnTest" type="button" value="Test Your Self " onclick="GenerateTestMatrix();" />
                    </td>

                </tr>


            </table>
        </div>



        <div id="MatrixArea">
        </div>
        <div id="SubmitAnswer" hidden="hidden" class="CalculateAnswer" onclick="SubmitAnswer();">
            Submit
        </div>



    </body>



    <div id="Solutions">
    </div>
</asp:Content>
