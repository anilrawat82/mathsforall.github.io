<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="HCFSolution.aspx.cs" Inherits="HCFSolution" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="../../Css/LatestCommon.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/LCM_.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/CorrectAnswer.css" />
    <script type="text/javascript" src="../../JavaScript/LCM_.js"></script>
    <script type="text/javascript" src="../../JavaScript/DecimalToFraction.js"></script>
    <script type="text/javascript" src="../../JavaScript/Common.js"></script>
    <script>

        function GenerateTestMatrix() {
            
            let MatrixArea = document.getElementById('MatrixArea');

            document.getElementById("btnCreate").hidden = true;
            document.getElementById("SubmitAnswer").hidden = false;

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Elementary/HCFSolution.aspx/GenerateTestYourselfMatrix") %>';

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
        function GetAddSubTextsInput(ElementID) {


            let TestArea = document.getElementById('TestArea');



            TestArea.innerHTML = ElementID;



            HighLightLCMCell(ElementID);
        }
        function GenerateMatrix(id) {


            let MatrixArea;

            let iHCFNumbers =0;

            //if (isNaN(iStartNumber) == true || isNaN(iEndingNumber) == true || isNaN(iTableNumber) == true) {
            //    MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Numeric Value Greater than 0 in Elements and Table Number</h2>";
            //    return;
            //}

            if (id == "txtHCFNumberS") {
                iHCFNumbers = document.getElementById(id).value;
                MatrixArea = document.getElementById('MatrixArea');

            }
            else {
                iHCFNumbers = document.getElementById(id).innerText;

                let Divid = "SolutionDiv_" + id.split('_')[1];
                let Fsol = "FullSolution_" + id.split('_')[1];
                if (CheckFullSolutionVisible(Fsol, Divid) == true)
                    return;
                MatrixArea = document.getElementById(Divid);
                

            }




            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Elementary/HCFSolution.aspx/GenerateMatrix") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const JsonInput = {
                sHCFNumbers: "",


            };

            JsonInput.sHCFNumbers = iHCFNumbers;


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



            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Elementary/HCFSolution.aspx/GetSubmitAnswer") %>';

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
            <h1 class="PageNameHeading">Find The HCF OR GCF of a Number</h1>
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
                        <label class="InputID">Enter atleast 2 Numbers For HCF with comma Sepration like(23,36,45..) </label>
                    </td>
                    <td colspan="2">

                        <input id="txtHCFNumberS" type="text" name="txtMatrixOrder"  class="MatrixOrder" />

                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                

             
               
               
                  <tr>
                    <td colspan="3">

                        <input class="CTestYourSelf" id="btnCreate" type="button" value="Solve" onclick="GenerateMatrix('txtHCFNumberS');" />
                        </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                  <tr>
                    <td colspan="3" >

                        <input class="CTestYourSelf" id="btnTest" type="button" value="Test Your Self " onclick="GenerateTestMatrix();"/>
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
