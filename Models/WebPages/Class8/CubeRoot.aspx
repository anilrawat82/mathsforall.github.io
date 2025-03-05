<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="CubeRoot.aspx.cs" Inherits="CubeRoot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/LatestCommon.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/LCM_.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/CorrectAnswer.css" />
    <script type="text/javascript" src="../../JavaScript/LCM_.js"></script>
    <script type="text/javascript" src="../../JavaScript/DecimalToFraction.js"></script>
    <script type="text/javascript" src="../../JavaScript/Common.js"></script>
    <script>
        function ShowElements() {
            document.getElementById("btnTest").hidden = false;
            document.getElementById("btnCreate").hidden = false;
            document.getElementById("btnCreateA").hidden = false;
            document.getElementById("btnCreateB").hidden = false;
            document.getElementById("btnTest1").hidden = false;
            document.getElementById("SubmitAnswer0").hidden = true;

            document.getElementById("SubmitAnswer2").hidden = true;

        }
        function HideElements(Id) {
            document.getElementById("btnTest").hidden = true;
            document.getElementById("btnCreate").hidden = true;
            document.getElementById("btnCreateA").hidden = true;
            document.getElementById("btnCreateB").hidden = true;
            document.getElementById("btnTest1").hidden = true;

            if (Id == 0) {
                document.getElementById("SubmitAnswer0").hidden = false;
                document.getElementById("MatrixArea0").hidden = false;
                document.getElementById("SubmitAnswer2").hidden = true;
                document.getElementById("MatrixArea2").hidden = true;
            }
            else {
                document.getElementById("SubmitAnswer0").hidden = true;
                document.getElementById("MatrixArea0").hidden = true;
                document.getElementById("SubmitAnswer2").hidden = false;
                document.getElementById("MatrixArea2").hidden = false;

            }


            document.getElementById("MatrixArea2").innerHTML = "";
            document.getElementById("MatrixArea0").innerHTML = "";
        }
        function SubmitAnswer(ID) {
            ShowElements();
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Class8/CubeRoot.aspx/GetSubmitAnswer") %>';
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", pageUrl, true);
            xhttp.setRequestHeader("Content-type", "application/json");

            const Matrix = {
                Ivalue: "",
            };
            Matrix.Ivalue = ID;
            const jsonString = JSON.stringify(Matrix);
            xhttp.onload = function () {
                if (this.status == 200) {
                    let myArr = JSON.parse(xhttp.responseText);
                    str = "";
                    for (key in myArr) {
                        str += myArr[key];
                    }

                    if (ID == 0) {
                        CheckAnswers(str, ID);
                    }
                    else {

                        CheckAnswerMinDivMul(str, ID);
                    }
                }
                else {
                    alert("error Now");
                }
            }
            xhttp.send(jsonString);
        }
        function GenerateTestMatrix(ID) {
            HideElements(ID);
            let MatrixArea = document.getElementById('MatrixArea' + ID);
            document.getElementById("btnCreate").hidden = true;
            document.getElementById("SubmitAnswer" + ID).hidden = false;
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Class8/CubeRoot.aspx/GenerateTestYourselfMatrix") %>';
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", pageUrl, true);
            xhttp.setRequestHeader("Content-type", "application/json");
            const JsonInput =
            {
                iID: "",
            };

            JsonInput.iID = ID;
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
        function GenerateMatrix(id, itype = 0) {
            let iSquareRoot;
            let MatrixArea;


            if (id == "txtCubeRoot" || id == "txtCubeRootDiv" || id == "txtCubeRootMul") {
                iSquareRoot = document.getElementById(id).value;
                MatrixArea = document.getElementById('MatrixArea' + itype);

            }
            else {
                iSquareRoot = document.getElementById(id).innerText;

                let Divid = "SolutionDiv_" + id.split('_')[1];

                let Fsol = "FullSolution_" + id.split('_')[1];

                if (CheckFullSolutionVisible(Fsol, Divid) == true)
                    return;
                MatrixArea = document.getElementById(Divid);
            }

            if (isNaN(iSquareRoot) == true || iSquareRoot < 0) {
                MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Numeric Value Greater than 0  </h2>";
                return;
            }

            if (iSquareRoot % 1 != 0) {
                MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Natural number only,no decimal allowed </h2>";
                return;
            }

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Class8/CubeRoot.aspx/GenerateMatrix") %>';
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", pageUrl, true);
            xhttp.setRequestHeader("Content-type", "application/json");
            const JsonInput = {
                sCubeRoot: "",
                itype: "",
            };
            JsonInput.sCubeRoot = Number(iSquareRoot);
            JsonInput.itype = itype;
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


        function GetAddSubTextsInput(ElementID) {
            //let TestArea = document.getElementById('TestArea');
            //TestArea.innerHTML = ElementID;
            // HighLightLCMCell(ElementID);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body>
        <div>
            <h1 class="PageNameHeading">Cube Root Calculation</h1>
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
                        <label class="InputID">Number(only natural number)</label>
                    </td>
                    <td colspan="2">

                        <input id="txtCubeRoot" type="text" name="txtStartNumber" value="<%=sCubeRoot%>" class="MatrixOrder" />

                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>


                <tr>
                    <td colspan="3">

                        <input class="CTestYourSelf" id="btnCreate" type="button" value="Solve " onclick="GenerateMatrix('txtCubeRoot', 0);" />
                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                <tr>
                    <td colspan="3">

                        <input class="CTestYourSelf" id="btnTest" type="button" value="Test Your Self " onclick="GenerateTestMatrix(0);" class="auto-style2" />
                    </td>

                </tr>



            </table>
        </div>
        <div id="MatrixArea0">
        </div>
        <div id="SubmitAnswer0" hidden="hidden" class="CalculateAnswer" onclick="SubmitAnswer(0);  ">
            Submit
        </div>
        <hr class="LineBreak">
        <div>
            <table>
                <tr>
                    <td colspan="3">
                        <label class="InputIDA">Is the below number is Perfect cube?if not find the smallest multiple of given number which is perfect cube.Find the cube root of the new number</label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="InputID">Number(only natural number)</label>
                    </td>
                    <td>

                        <input id="txtCubeRootMul" type="text" name="txtStartNumber" value="<%=sCubeRootMul%>" class="MatrixOrder" />

                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>

                <tr>
                    <td colspan="3">
                        <input class="CTestYourSelf" id="btnCreateA" type="button" value="Solve " onclick="GenerateMatrix('txtCubeRootMul', 1);" />
                    </td>
                </tr>

            </table>
        </div>
        <div id="MatrixArea1">
        </div>
        <hr class="LineBreak">
        <div>
            <table>
                <tr>
                    <td colspan="3">
                        <label class="InputIDB">Is the below number is Perfect cube?if not find the smallest number by which  given number must divided so that the number become perfect cube.Find the cube root of the new number</label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="InputID">Number(only natural number)</label>
                    </td>
                    <td>
                        <input id="txtCubeRootDiv" type="text" name="txtStartNumber" value="<%=sCubeRootDiv%>" class="MatrixOrder" />
                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                <tr>
                    <td colspan="3">
                        <input class="CTestYourSelf" id="btnCreateB" type="button" value="Solve " onclick="GenerateMatrix('txtCubeRootDiv', 2);" />
                    </td>
                </tr>

                <tr>
                    <td colspan="3">
                        <input class="CTestYourSelf" id="btnTest1" type="button" value="Test Your Self " onclick="GenerateTestMatrix(2);" class="auto-style2" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="MatrixArea2">
        </div>
        <div id="SubmitAnswer2" hidden="hidden" class="CalculateAnswer" onclick="SubmitAnswer(2);  ">
            Submit
        </div>


    </body>
</asp:Content>
