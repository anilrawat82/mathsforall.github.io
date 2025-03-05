<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="StandardForm.aspx.cs" Inherits="StandardForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link type="text/css" rel="stylesheet" href="../../Css/LatestCommon.css" />
    <link href="../../Css/StandardForm.css" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/CorrectAnswer.css" />
    
    <script type="text/javascript" src="../../JavaScript/Common.js"></script>
    <script type="text/javascript" src="../../JavaScript/DecimalToFraction.js"></script>
    
    <script>

        function GenerateTestMatrix()
        {
            let MatrixArea = document.getElementById('MatrixArea');
            let iMaxDigits = Number(document.getElementById('txtDigits').value)
            if (isNaN(iMaxDigits) == true || iMaxDigits < 2 || iMaxDigits > 5) {
                MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Numeric Value B/W (2 to 5)  </h2>";
                return;
            }

            document.getElementById("btnCreate").hidden = true;
            document.getElementById("btnTest").hidden = true;
            document.getElementById("SubmitAnswer").hidden = false;


            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/ElementaryB/StandardForm.aspx/GenerateTestYourselfMatrix") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const JsonInput =
            {
                itxtDigits: "",
            };

            JsonInput.itxtDigits = iMaxDigits;


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
        function GenerateMatrix(id) {
            let MatrixArea;
            let QuestionId = 0;
            let iExpandedExp = 0;

            if (id == "txtNumberS") {
                iExpandedExp = document.getElementById(id).value;
                MatrixArea = document.getElementById('MatrixArea');
            }
            else {
                iExpandedExp = document.getElementById(id).innerText;

                let Divid = "SolutionDiv_" + id.split('_')[1];
                let Fsol = "FullSolution_" + id.split('_')[1];
                if (CheckFullSolutionVisible(Fsol, Divid) == true)
                    return;
                MatrixArea = document.getElementById(Divid);
                QuestionId = id.split('_')[1];

            }



            //alert(QuestionId);

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/ElementaryB/StandardForm.aspx/GenerateMatrix") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const JsonInput = {
                sExpression: "",
                iQuestionId: "",


            };

            JsonInput.sExpression = iExpandedExp;
            JsonInput.iQuestionId = QuestionId;


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

        function SubmitAnswer() {
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/ElementaryB/StandardForm.aspx/GetSubmitAnswer") %>';

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
                   
                    CheckAnswerLCMHCF(str);


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
            <h1 class="PageNameHeading">Convert to Standard Form </h1>
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
                        <label class="InputID">Enter the Expression like(<b style="color:darkblue">4*100+2*10+10*1</b>)</label>
                    </td>
                    <td colspan="2">

                        <input id="txtNumberS" type="text" name="txtMatrixOrder"  class="MatrixOrder" />
                        

                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
               
                  <tr>
                    <td colspan="3">

                        <input  class="CTestYourSelf" id="btnCreate" type="button" value="Solve " onclick="GenerateMatrix('txtNumberS');" />
                        </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>

                  <tr>
                    <td>
                        <label class="InputID">Maximum Digits in Number b/w(2 to5)</label>
                    </td>
                    <td colspan="2">

                        <input id="txtDigits" type="text" name="txtMatrixOrder" value="2" class="MatrixOrder" />
                        

                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                 <tr>
                    <td colspan="3" >

                        <input id="btnTest" type="button" value="Test Your Self " onclick="GenerateTestMatrix();" class="CTestYourSelf" />
                    </td>

                </tr>
                
              



            </table>
        </div>



        <div id="MatrixArea">
        </div>
       
       <div id="TestArea">
        </div>
             <div id="SubmitAnswer" hidden="hidden" class="CalculateAnswer" onclick="SubmitAnswer();  ">
            Submit
        </div>



    </body>
</asp:Content>
