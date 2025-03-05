<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="AscendingDescending.aspx.cs" Inherits="AscendingDescending" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="../../Css/LatestCommon.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/Elementary.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/CorrectAnswer.css" />
    <script type="text/javascript" src="../../JavaScript/ElementaryB.js"></script>
    <script type="text/javascript" src="../../JavaScript/Jquery.js"></script>
    <script type="text/javascript" src="../../JavaScript/Common.js"></script>
    <script>    

        let FirstTime = true;

        function SubmitAnswer() {


            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Elementary/AscendingDescending.aspx/GetSubmitAnswer") %>';

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
                    //alert(str);
                    let ElementCount = Number(document.getElementById("txtNumberofElement").value);
                   // let QuestionCount = Number(document.getElementById("txtQuestion").value);


                    CheckAscendingDescendingAnswer(str, ElementCount, 10)


                }
                else
                {
                    alert("error Now");
                }
            }


            xhttp.send(jsonString);
        }

        function GenerateMatrix() {

            let MatrixArea = document.getElementById('MatrixArea');

            let ElementCount = Number(document.getElementById("txtNumberofElement").value);
            let QuestionCount = 10;// Number(document.getElementById("txtQuestion").value);
            let iMinRange = Number(document.getElementById("txtMinRange").value);
            let iMaxRange = Number(document.getElementById("txtMaxRange").value);
            let SolutionType = $('.SolutionTypeA:checked').val();


            if (isNaN(ElementCount) == true || isNaN(QuestionCount) == true) {
                MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Numeric Value Greater than 0 in Elements and Questions</h2>";
                return;
            }



            document.getElementById("SubmitAnswer").hidden = false;
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Elementary/AscendingDescending.aspx/GenerateMatrix") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const Matrix = {
                iQuestion: "",
                Ielement: "",
                iMinRange: "",
                iMaxRange: "",
                iOrderType: "",
            };


            Matrix.iQuestion = Number(QuestionCount);
            Matrix.Ielement = Number(ElementCount);
            Matrix.iMinRange = Number(iMinRange);
            Matrix.iMaxRange = Number(iMaxRange);
            Matrix.iOrderType = Number(SolutionType);



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
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body>
        <div>
            <h1 class="PageNameHeading">Arrange Numbers in Ascending Or Descending Order</h1>
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
              <%--  <tr>
                    <td>
                        <label class="InputID">Number Of Questions</label>
                    </td>
                    <td colspan="2">

                        <input id="txtQuestion" type="text" name="txtMatrixOrder" value="<%=TotalQuestion%>" class="MatrixOrder" />

                    </td>
                    
                </tr>--%>
                <tr>
                    <td>
                        <label class="InputID">Number Of Elements</label>
                    </td>
                    <td colspan="2">
                        <input id="txtNumberofElement" type="text" name="txtMatrixOrder" value="<%=NumberofElement%>" class="MatrixOrder" />


                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>

                <tr>
                    <td colspan="3">
                        <label class="InputID">Minimum Range Of Elements</label>
                        <input id="txtMinRange" type="text" name="txtMatrixOrder" value="0" class="MatrixOrder" />
                        <label class="InputID">Max Range</label>
                        <input id="txtMaxRange" type="text" name="txtMatrixOrder" value="50" class="MatrixOrder" />

                        <p class="InputID">Please select Ascending or Descending:</p>
                        <input type="radio" name="SolutionType" value="1" checked="true" class="SolutionTypeA">
                        <label for="StepWise">Ascending</label><br>
                        <input type="radio" name="SolutionType" value="2" class="SolutionTypeA">
                        <label for="FinalSolution">Descending</label><br>
                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>

                <tr>
                    <td colspan="3">
                        <input id="Button1" type="button" value="Test Your Self" class="CTestYourSelf" onclick="GenerateMatrix();" />
                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>


            </table>
        </div>



        <div id="MatrixArea">
        </div>
        <div id="SubmitAnswer" hidden="hidden" class="CalculateAnswer" onclick="SubmitAnswer();">
            Submit
        </div>

        <div id="Solutions">
        </div>


    </body>
</asp:Content>
