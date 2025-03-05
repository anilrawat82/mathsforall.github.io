<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="Multiply.aspx.cs" Inherits="Multiply" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="../../Css/LatestCommon.css" />
     <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/Multiplication.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/CorrectAnswer.css" />
    <script type="text/javascript" src="../../JavaScript/DecimalToFraction.js"></script>
    <script type="text/javascript" src="../../JavaScript/Common.js"></script>
    <script>
        function SubmitAnswer()
        {

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Elementary/Multiply.aspx/GetSubmitAnswer") %>';

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



                    let QuestionCount = 10;// Number(document.getElementById("txtQuestion").value);
                  
                    
                    document.getElementById("SubmitAnswer").hidden = true;
                    CheckMultiply(str, QuestionCount);


                }
                else {
                    alert("error Now");
                }
            }


            xhttp.send(jsonString);
        }
        function GenerateMatrix()
        {
            
            let MatrixArea = document.getElementById('MatrixArea');

            let tMultiplier= Number(document.getElementById("txtMultiplier").value);
            let tMultiplicand = Number(document.getElementById("txtMultiplicand").value);
            let QuestionCount = 10;// Number(document.getElementById("txtQuestion").value);
            
            let bcarryOver = Number(document.getElementById("bcarryOver").checked);





            //if (QuestionCount < 1) {
            //    MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Numeric Value Greater than 0 in Questions</h2>";
            //    return;
            //}
            if (tMultiplier < 1) {
                MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Numeric Value Greater or Equal to 2 in NumberToAdd</h2>";
                return;
            }

            if (tMultiplicand  < 1) {
                MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Numeric Value Greater than 0 in Digits</h2>";
                return;
            }


            if (tMultiplier < 1) {
                tMultiplier = 1;
            }
            if (tMultiplier > 5) {
                tMultiplier = 5;
            }

            document.getElementById("txtMultiplier").value = tMultiplier;


            if (QuestionCount < 1) {
                QuestionCount = 1;
            }
            if (QuestionCount > 20) {
                QuestionCount = 20;
            }

            //document.getElementById("txtQuestion").value = QuestionCount;


            if (tMultiplicand  < 1) {
                tMultiplicand = 1;
            }
            if (tMultiplicand > 5) {
                tMultiplicand = 5;
            }

            document.getElementById("txtMultiplicand").value = tMultiplicand ;



            document.getElementById("SubmitAnswer").hidden = false;
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Elementary/Multiply.aspx/GenerateMatrix") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");



            const JsonInput = {
                iMultiplier: "",
                iQuestionCount: "",
                iMultiplicand : "",
                icarryOver: "",
            };
            


            JsonInput.iQuestionCount = Number(QuestionCount);
            JsonInput.iMultiplier = Number(tMultiplier);
            JsonInput.iMultiplicand = Number(tMultiplicand);
            JsonInput.icarryOver = Number(bcarryOver);
            

            const jsonString = JSON.stringify(JsonInput);
            


            xhttp.onload = function () {
                let myArr = JSON.parse(xhttp.responseText);
                str = "";
                for (key in myArr) {
                    str += myArr[key];
                }


                MatrixArea.innerHTML = str;

               
            }


            xhttp.send(jsonString);


        }
    
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body>
        <div>
            <h1 class="PageNameHeading">Multiply </h1>
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
                        <label class="InputID">Number Of Questions B/W(1 to 20)</label>
                    </td>
                    <td colspan="2">

                        <input id="txtQuestion" type="text" name="txtMatrixOrder" value="<%=TotalQuestion%>" class="MatrixOrder" />

                    </td>
                    
                </tr>--%>
                <tr>
                    <td>
                        <label class="InputID">Multiplier Digits<b> B/W(1 to 5)</b></label>
                    </td>
                    <td colspan="2">
                        <input id="txtMultiplier" type="text" name="txtNumberToAdd" value="<%=Multiplier%>" class="MatrixOrder" />


                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                 <tr>
                    <td>
                        <label class="InputID">Multiplicand Digits <b> B/W(1 to 3)</b></label>
                    </td>
                    <td colspan="2">
                        <input id="txtMultiplicand" type="text" name="txtNumberofDigits" value="<%=Multiplicand%>" class="MatrixOrder" />


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
                        
                        
                        <input class="CTestYourSelf"  value="Test Your Self " id="Button1" type="button"  onclick="GenerateMatrix();" />
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

        <asp:Panel ID="pnlQuestionPanel" runat="server">
          
        </asp:Panel>

    </body>
</asp:Content>
