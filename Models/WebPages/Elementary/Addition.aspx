<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="Addition.aspx.cs" Inherits="Addition" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="../../Css/LatestCommon.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/Elementary.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link href="../../Css/LatestCommon.css" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="../../Css/CorrectAnswer.css" />

    <script type="text/javascript" src="../../JavaScript/Elementary.js"></script>
    <script type="text/javascript" src="../../JavaScript/Common.js"></script>
    <script>

        function SubmitAnswer() {



            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Elementary/Addition.aspx/GetSubmitAnswer") %>';

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

                    let myArray = str.split("$");
                    
                    let QuestionCount = Number(myArray[0]);// Number(document.getElementById("txtQuestion").value);
                    let Digits = Number(document.getElementById("txtNumberofDigits").value);
                    let bcarryOver = Number(document.getElementById("bcarryOver").checked);




                    CheckAddition(myArray[1], QuestionCount, Digits, bcarryOver);


                }
                else {
                    alert("error Now");
                }
            }


            xhttp.send(jsonString);
        }
        function GenerateMatrix() {

            let MatrixArea = document.getElementById('MatrixArea');

            let NumberToAdd = Number(document.getElementById("txtNumberToAdd").value);
            let QuestionCount = 5;// Number(document.getElementById("txtQuestion").value);
            let Digits = Number(document.getElementById("txtNumberofDigits").value);
            let bcarryOver = Number(document.getElementById("bcarryOver").checked);

            

          

            if ( QuestionCount < 1 ) {
                MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Numeric Value Greater than 0 in Questions</h2>";
                return;
            }
            if (NumberToAdd < 2) {
                MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Numeric Value Greater or Equal to 2 in NumberToAdd</h2>";
                return;
            }

            if ( Digits < 1) {
                MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Numeric Value Greater than 0 in Digits</h2>";
                return;
            }

           
            if (NumberToAdd < 2) {
                NumberToAdd =2;
            }
            if (NumberToAdd > 5) {
                NumberToAdd = 5;
            }

            document.getElementById("txtNumberToAdd").value = NumberToAdd;


            if (QuestionCount < 1) {
                QuestionCount = 1;
            }
            if (QuestionCount > 20) {
                QuestionCount = 20;
            }

           // document.getElementById("txtQuestion").value = QuestionCount;


            if (Digits < 1) {
                Digits = 1;
            }
            if (Digits > 5) {
                Digits = 5;
            }

            document.getElementById("txtNumberofDigits").value = Digits;



            document.getElementById("SubmitAnswer").hidden = false;
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Elementary/Addition.aspx/GenerateMatrix") %>';

             var xhttp = new XMLHttpRequest();


             xhttp.open("POST", pageUrl, true);

             xhttp.setRequestHeader("Content-type", "application/json");

          

            const JsonInput = {
                iNumberToAdd: "",
                iQuestionCount: "",
                iDigits: "",
                icarryOver: "",
            };
            


            JsonInput.iQuestionCount = Number(QuestionCount);
            JsonInput.iNumberToAdd = Number(NumberToAdd);
            JsonInput.iDigits = Number(Digits);
            JsonInput.icarryOver = Number(bcarryOver);


            const jsonString = JSON.stringify(JsonInput);
            


            xhttp.onload = function ()
            {
                let myArr = JSON.parse(xhttp.responseText);
                     str = "";
                     for (key in myArr) {
                         str += myArr[key];
                     }


                     MatrixArea.innerHTML = str;

                 //if (this.status == 2000) {

                 //    let myArr = JSON.parse(xhttp.responseText);
                 //    str = "";
                 //    for (key in myArr) {
                 //        str += myArr[key];
                 //    }


                 //    MatrixArea.innerHTML = str;

                 //}
                 //else {
                 //    alert("error Now");
                 //}
             }


             xhttp.send(jsonString);


         }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <body>
        <div>
            <h1  class="PageNameHeading">Additions </h1>
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
               <%-- <tr>
                    <td>
                        <label class="LabelClass">Number Of Questions B/W(1 to 20)</label>
                    </td>
                    <td colspan="2">

                        <input id="txtQuestion" type="text" name="txtMatrixOrder" value="<%=TotalQuestion%>" class="MatrixOrder" />

                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>--%>
                <tr>
                    <td>
                        <label class="InputID">Numbers Of Add<b> B/W(2 to 5)</b></label>
                    </td>
                    <td colspan="2">
                        <input id="txtNumberToAdd" type="text" name="txtNumberToAdd" value="<%=NumberToAdd%>" class="MatrixOrder" min="2" max="5" />


                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                 <tr>
                    <td>
                        <label class="InputID">Number Of Digits <b> B/W(1 to 5)</b></label>
                    </td>
                    <td colspan="2">
                        <input id="txtNumberofDigits" type="text" name="txtNumberofDigits" value="<%=Digits%>" class="MatrixOrder" />


                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                   <tr>
                    <td colspan="3">
                        <label class="InputID">Carry Over</label>
                        <input id="bcarryOver" type="checkbox" value="1" />
                        
                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                <tr>
                    <td colspan="3">
                        
                        <input class="CTestYourSelf"  value="Test Your Self "  id="Button1" type="button" onclick="GenerateMatrix();" />
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



    </body>
</asp:Content>
