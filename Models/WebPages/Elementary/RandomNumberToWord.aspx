<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="RandomNumberToWord.aspx.cs" Inherits="RandomNumberToWord" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="../../Css/LatestCommon.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/Elementary.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/CorrectAnswer.css" />
    <script type="text/javascript" src="../../JavaScript/NumberToWords.js"></script>
    <script type="text/javascript" src="../../JavaScript/Common.js"></script>
    <%--<script type="text/javascript" src="../../JavaScript/Elementary.js"></script>--%>
    <script>
        function SubmitAnswer() {


            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Elementary/RandomNumberToWord.aspx/GetSubmitAnswer") %>';

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
                    CheckCountingNumbers(str);


                }
                else {
                    alert("error Now");
                }
            }


            xhttp.send(jsonString);
        }

        function GenerateMatrix() {

            let MatrixArea = document.getElementById('MatrixArea');

           
            let QuestionCount = 10;// Number(document.getElementById("txtQuestion").value);
            let iMinRange = Number(document.getElementById("txtMinRange").value);
            let iMaxRange = Number(document.getElementById("txtMaxRange").value);
            if (iMinRange < 0)
                iMinRange = 1;

            //if (QuestionCount < 1)
            //{
            //    MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Numeric Value Greater than 0 in Questions</h2>";
            //    return;
            //}

            //if (QuestionCount > 20) {

            //    QuestionCount = 20;
            //    document.getElementById("txtQuestion").value = QuestionCount;
            //}

            document.getElementById("SubmitAnswer").hidden = false;
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Elementary/RandomNumberToWord.aspx/GenerateMatrix") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const JsonInput = {
                iQuestion: "",
                iMinRange: "",
                iMaxRange: "",
            };

            

            JsonInput.iQuestion = Number(QuestionCount);
            JsonInput.iMinRange = Number(iMinRange);
            JsonInput.iMaxRange = Number(iMaxRange);



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
            <h1 class="PageNameHeading">Convert Random Number To Words</h1>
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

             <%--   <tr>
                    <td>
                        <label class="InputID">Number Of Questions  <b> B/W(1 to 20)</label>
                    </td>
                    <td colspan="2">

                        <input id="txtQuestion" type="text" name="txtMatrixOrder" value="<%=TotalQuestion%>" class="MatrixOrder" />

                    </td>
                    
                </tr>--%>
                

                <tr>
                    <td colspan="3">
                        <label class="InputID">Minimum Range Of Elements</label>
                        <input id="txtMinRange" type="text" name="txtMatrixOrder" value="1" class="MatrixOrder" />
                        <label class="InputID">Max Range</label>
                        <input id="txtMaxRange" type="text" name="txtMatrixOrder" value="50" class="MatrixOrder" />
                        
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
