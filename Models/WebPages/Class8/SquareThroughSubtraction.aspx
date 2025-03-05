<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="SquareThroughSubtraction.aspx.cs" Inherits="SquareThroughSubtraction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/LCM_.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/LatestCommon.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/CorrectAnswer.css" />
    <script type="text/javascript" src="../../JavaScript/DecimalToFraction.js"></script>
    <script type="text/javascript" src="../../JavaScript/Common.js"></script>
    <script>

    function SubmitAnswer() {
        var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Class8/SquareThroughSubtraction.aspx/GetSubmitAnswer") %>';
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
    function GenerateTestMatrix()
    {

        let MatrixArea = document.getElementById('MatrixArea');
        document.getElementById("btnCreate").hidden = true;
        document.getElementById("SubmitAnswer").hidden = false;
        var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Class8/SquareThroughSubtraction.aspx/GenerateTestYourselfMatrix") %>';
        var xhttp = new XMLHttpRequest();
        xhttp.open("POST", pageUrl, true);
        xhttp.setRequestHeader("Content-type", "application/json");
        const JsonInput =
        {
         sDecimalNumber: "",
        };

        JsonInput.sDecimalNumber = 0;
        const jsonString = JSON.stringify(JsonInput);
        xhttp.onload = function ()
        {
            if (this.status == 200)
            {

                let myArr = JSON.parse(xhttp.responseText);
                str = "";
                    for (key in myArr)
                    {
                      str += myArr[key];
                    }

                 MatrixArea.innerHTML = str;

              }
            else
            {
                alert("error Now");
            }
        }
        xhttp.send(jsonString);
    }
        function GenerateMatrix(id)
        {
            let iSquareRoot;
            let MatrixArea;

            if (id == "txtSquareRoot") {
                iSquareRoot = document.getElementById(id).value;
                MatrixArea = document.getElementById('MatrixArea');

            }
            else
            {
                iSquareRoot = document.getElementById(id).innerText;

                let Divid = "SolutionDiv_" + id.split('_')[1];
                let Fsol = "FullSolution_" + id.split('_')[1];
                if (CheckFullSolutionVisible(Fsol, Divid) == true)
                    return;
                MatrixArea = document.getElementById(Divid);
            }

            if (isNaN(iSquareRoot) == true || iSquareRoot < 0)
            {
                MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Numeric Value Greater than 0  </h2>";
                return;
            }

            if (iSquareRoot % 1 != 0) {
                MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Natural number only,no decimal allowed </h2>";
                return;
            }

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Class8/SquareThroughSubtraction.aspx/GenerateMatrix") %>';
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", pageUrl, true);
            xhttp.setRequestHeader("Content-type", "application/json");
            const JsonInput = {
            sSquareRoot: "",
            };
            JsonInput.sSquareRoot = Number(iSquareRoot);

            const jsonString = JSON.stringify(JsonInput);
            xhttp.onload = function ()
            {
                if (this.status == 200)
                {
                    let myArr = JSON.parse(xhttp.responseText);
                    str = "";
                        for (key in myArr)
                        {
                            str += myArr[key];
                        }
                    MatrixArea.innerHTML = str;
            }
                else
                {
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
            <h1 class="PageNameHeading">Square Root through repeated subtraction</h1>
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
                        <label class="InputID"> Number(only natural number)</label>
                    </td>
                    <td colspan="2">

                        <input id="txtSquareRoot" type="text" name="txtStartNumber" value="<%=sSquareRoot%>" class="MatrixOrder" />

                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                
               
                  <tr>
                    <td colspan="3">

                        <input class="CTestYourSelf" id="btnCreate" type="button" value="Solve " onclick="GenerateMatrix('txtSquareRoot');" />
                        </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                  <tr>
                    <td colspan="3" >

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
