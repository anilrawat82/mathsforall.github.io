<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="solveFraction.aspx.cs" Inherits="solveFraction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="../../Css/LatestCommon.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/LCM_.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/AutoGenerateMatrix.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/CorrectAnswer.css" />
    <script type="text/javascript" src="../../JavaScript/Elementary.js"></script>
    <script type="text/javascript" src="../../JavaScript/DecimalToFraction.js"></script>
    <script type="text/javascript" src="../../JavaScript/Common.js"></script>
    <script>
        function SubmitAnswer() {



            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Elementary/solveFraction.aspx/GetSubmitAnswer") %>';

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

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Elementary/solveFraction.aspx/GenerateTestYourselfMatrix") %>';

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

            //alert(id);
            let Values;

            let MatrixArea;


            if (id == "idExePression") {
                Values = document.getElementById(id).value;
                MatrixArea = document.getElementById('MatrixArea');

            }
            else {
                Values = document.getElementById(id).innerText;

                let Divid = "SolutionDiv_" + id.split('_')[1];
                let Fsol = "FullSolution_" + id.split('_')[1];
                if (CheckFullSolutionVisible(Fsol, Divid) == true)
                    return;

                MatrixArea = document.getElementById(Divid);
                

            }

         
         
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Elementary/solveFraction.aspx/CalculateCIS") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const Matrix = {
                sExpressionValue: "",
            
            };



             Matrix.sExpressionValue = Values;
            



            const jsonString = JSON.stringify(Matrix);

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
        function SubmitAnswerA(id)
        {
            
            let Values="";
                let MyArray = id.split("_");
            for (let i = 0; i < MyArray.length-1; i++)
            {
                Values += document.getElementById(MyArray[i]).value + "_";
                
            }
            Values += MyArray[MyArray.length-1];
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Elementary/solveFraction.aspx/GetSubmitAnswerA") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const Matrix = {
                sValue: "",
            };


            
            Matrix.sValue = Values;
            


            const jsonString = JSON.stringify(Matrix);



            xhttp.onload = function () {
                if (this.status == 200) {

                    let myArr = JSON.parse(xhttp.responseText);
                    str = "";
                    for (key in myArr) {
                        str += myArr[key];
                    }
                    let elementId = "txtAnswer_" + MyArray[MyArray.length - 1];
                    let AnswerCircleRadiusA = document.getElementById(elementId);
                    AnswerCircleRadiusA.innerHTML = str;

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
     <body >

        <div>
            <h1 class="PageNameHeading">Solve Fraction</h1>
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
                    <td class="InputID">Expression</td>
                    <td colspan="2">
                        <input type="text" id="idExePression" class="InputText" /></td>
                </tr>
                <tr>
                    <td colspan="3">

                        <input class="CTestYourSelf" id="btnCreate" type="button" value="Solve " onclick="GenerateMatrix('idExePression');" />
                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                <tr>
                    <td colspan="3">

                        <input class="CTestYourSelf " id="btnTest" type="button" value="Test Your Self " onclick="GenerateTestMatrix();" />
                    </td>

                </tr>


               
            </table>
        </div>
           <div id="MatrixArea" class="Solution">
        </div>



        <div id="SubmitAnswer" hidden="hidden" class="CalculateAnswer" onclick="SubmitAnswer();  ">
            Submit
        </div>

        




    </body>
</asp:Content>
