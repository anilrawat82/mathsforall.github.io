<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="Division.aspx.cs" Inherits="Division" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="../../Css/LatestCommon.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/Elementary.css" />
    <link href="../../Css/PrimaryDivision.css" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="../../Css/LCM_.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/CorrectAnswer.css" />
    <script type="text/javascript" src="../../JavaScript/Elementary.js"></script>
    <script type="text/javascript" src="../../JavaScript/DecimalToFraction.js"></script>
    <script type="text/javascript" src="../../JavaScript/Common.js"></script>
    <script>

        function SubmitAnswer()
        {

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Elementary/Division.aspx/GetSubmitAnswer") %>';
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
                    CheckDivisionAnswer(str);
                }
                else {
                    alert("error Now");
                }
            }
            xhttp.send(jsonString);
        }
        function GenerateTestMatrix() {
            
            let WithRemainder = document.getElementById('chkRemainder');
            let MatrixArea = document.getElementById('MatrixArea');

            document.getElementById("btnCreate").hidden = true;
            document.getElementById("SubmitAnswer").hidden = false;

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Elementary/Division.aspx/GenerateTestYourselfMatrix") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const JsonInput = {
                sWithRemainder: "",
            };
            JsonInput.sWithRemainder = WithRemainder.checked;
            
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
        function GenerateMatrix(idDivisor, idDividend) {
            let MatrixArea;
            let iDivisor;
            let iDividend;
            let WithRemainder = document.getElementById('chkRemainder');
            
            if (idDivisor == "txtDivisor" && idDividend == "txtDividend")
            {
                iDivisor = document.getElementById(idDivisor).value;
                iDividend = document.getElementById(idDividend).value;
                MatrixArea = document.getElementById('MatrixArea');
                
            }
            else
            {
               
                iDivisor = document.getElementById(idDivisor).innerText;
                iDividend = document.getElementById(idDividend).innerText;
                let Divid = "SolutionDiv_" + idDivisor.split('_')[1];
                let Fsol = "FullSolution_" + idDivisor.split('_')[1];
                if (CheckFullSolutionVisible(Fsol, Divid) == true)
                    return;
                MatrixArea = document.getElementById(Divid);
                

            }


            if (isNaN(iDivisor) == true && isNaN(iDividend) == true) {
                MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Numeric Value Greater than 0 in Divisor  and Dividend</h2>";
                return;
            }
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Elementary/Division.aspx/GenerateMatrix") %>';
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", pageUrl, true);
            xhttp.setRequestHeader("Content-type", "application/json");
            const JsonInput = {
                sDivisor: "",
                sDividened: "",
                sWithRemainder: "",
            };
            

            JsonInput.sDivisor = Number(iDivisor);
            JsonInput.sDividened = Number(iDividend);
            JsonInput.sWithRemainder = WithRemainder.checked;
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
    <style type="text/css">
        .auto-style1 {
            height: 34px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <body>
        <div>
            <h1 class="PageNameHeading">Division Method</h1>
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
                        <label class="InputID">Dividend</label>
                    </td>
                    <td colspan="2">

                        <input id="txtDividend" type="text" name="txtDividend" value="<%=sDividend%>" class="MatrixOrder" />

                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                <tr>
                    <td>
                        <label class="InputID">Divisor</labe>
                    </td>
                    <td colspan="2">

                        <input id="txtDivisor" type="text" name="txtDivisor" value="<%=sDivisor%>" class="MatrixOrder" />

                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>

                <tr>
                    <td>
                        <label class="InputID   ">With Remainder</labe>
                    </td>
                    <td colspan="2">
                    <input class="CTestYourSelf" id="chkRemainder" type="checkbox"  />
                        </td>
        <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                    </tr>
                <tr>
                    <td colspan="3">

                        <input class="CTestYourSelf" id="btnCreate" type="button" value="Solve"  onclick="GenerateMatrix('txtDivisor', 'txtDividend');" />
                        </td>
                        <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                <tr>
                    <td colspan="3">

                        <input class="CTestYourSelf" id="btnTest" type="button" value="Test Your Self " onclick="GenerateTestMatrix();" />
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
