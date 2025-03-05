<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="Subtraction.aspx.cs" Inherits="Subtraction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="../../Css/LatestCommon.css" />
     <link type="text/css" rel="stylesheet" href="../../Css/Elementary.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/CorrectAnswer.css" />
    <script type="text/javascript" src="../../JavaScript/Elementary.js"></script>
    <script type="text/javascript" src="../../JavaScript/Common.js"></script>
    <script>

        function SubmitAnswer() {

            

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Elementary/Subtraction.aspx/GetSubmitAnswer") %>';

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
                      let Digits = Number(document.getElementById("txtNumberofDigits").value);
                      let bcarryIN = Number(document.getElementById("bcarryOver").checked);


                      

                      CheckSubtraction(str, QuestionCount, Digits, bcarryIN)


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
            let Digits = Number(document.getElementById("txtNumberofDigits").value);
            let bcarryOver = Number(document.getElementById("bcarryOver").checked);

            

          


            //if (QuestionCount < 1) {
            //    MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Numeric Value Greater than 0 in Questions</h2>";
            //    return;
            //}
          

            if (Digits < 1) {
                MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Numeric Value Greater than 0 in Digits</h2>";
                return;
            }




            //if (QuestionCount < 1) {
            //    QuestionCount = 1;
            //}
            //if (QuestionCount > 20) {
            //    QuestionCount = 20;
            //}

            //document.getElementById("txtQuestion").value = QuestionCount;


            if (Digits < 1) {
                Digits = 1;
            }
            if (Digits > 5) {
                Digits = 5;
            }

            document.getElementById("txtNumberofDigits").value = Digits;
            

            document.getElementById("SubmitAnswer").hidden = false;
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Elementary/Subtraction.aspx/GenerateMatrix") %>';

             var xhttp = new XMLHttpRequest();


             xhttp.open("POST", pageUrl, true);

             xhttp.setRequestHeader("Content-type", "application/json");

          

            const JsonInput = {
                iQuestionCount: "",
                iDigits: "",
                icarryOver: "",
            };
            


            JsonInput.iQuestionCount = Number(QuestionCount);
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
            <h1 class="PageNameHeading">Subtraction</h1>
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
                        <label class="InputID">Number Of Questions <b> B/W(1 to 20)</b></label>
                    </td>
                    <td colspan="2">

                        <input id="txtQuestion" type="text" name="txtMatrixOrder" value="<%=TotalQuestion%>" class="MatrixOrder" />

                    </td>
                
                </tr>--%>
               
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
                        <input id="Button1" type="button" value="Test Your Self " class="CTestYourSelf" onclick="GenerateMatrix();" />

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
