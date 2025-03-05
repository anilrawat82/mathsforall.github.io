<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/DesignAlgo.Master" AutoEventWireup="true" CodeBehind="LiquidConversion.aspx.cs" Inherits="LiquidConversion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="../../Css/LatestCommon.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/TestYourself.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/CorrectAnswer.css" />
    <script type="text/javascript" src="../../JavaScript/LCM_.js"></script>
    <script type="text/javascript" src="../../JavaScript/DecimalToFraction.js"></script>
    <script type="text/javascript" src="../../JavaScript/Common.js"></script>
    <script type="text/javascript" src="../../JavaScript/Jquery.js"></script>
    <script>
        
        function GenerateTestMatrix()
        {
            let MatrixArea = document.getElementById('MatrixArea');

            document.getElementById("btnCreate").hidden = true;
            document.getElementById("btnTest").hidden = true;
            document.getElementById("SubmitAnswer").hidden = false;
            

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/class4/LiquidConversion.aspx/GenerateTestYourselfMatrix") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const JsonInput =
            {
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

        function GetAddSubTextsInput(ElementID)
        {
            //let TestArea = document.getElementById('TestArea');
            //TestArea.innerHTML = ElementID;
            HighLightLCMCell(ElementID);
        }
        function GenerateMatrix(id)
        {
            
            let MatrixArea;
            let QuestionId = 0;
            let iKG = 0;
            let iGram = 0;

            let Type = $('.SolutionTypeA:checked').val();
            if (id == "txtKg") {
                iKG = Number(document.getElementById('txtKg').value);
                iGram = Number(document.getElementById('txtGram').value);
                MatrixArea = document.getElementById('MatrixArea');

            }
            else {

                alert(id);    
                Nu = id.split('_');
                iKG = Number(Nu[2]);
                iGram = Number(Nu[3]);
                Type = Number(Nu[4]) + 1;
                let Divid = "SolutionDiv_" + id.split('_')[1];
                let Fsol = "FullSolution_" + id.split('_')[1];
                if (CheckFullSolutionVisible(Fsol, Divid) == true)
                    return;
                MatrixArea = document.getElementById(Divid);
            }    

            


            
            
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/class4/LiquidConversion.aspx/GenerateMatrix") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const JsonInput = {
                txtKG: "",
                txtGram: "",
                txtType: "",
            };

            
            
            JsonInput.txtKG = iKG;
            JsonInput.txtGram = iGram;
            JsonInput.txtType = Type;
            

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

        function SubmitAnswer()
        {
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/class4/LiquidConversion.aspx/GetSubmitAnswer") %>';

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

                    CheckAnswerConversion(str);


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
            <h1 class="PageNameHeading">LIQUID CONVERSION</h1>
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
                        <label class="InputID">Enter the Liquid Mass</label>
                    </td>
                    <td>
                        <input id="txtKg" type="text" name="txtMatrixOrder"  class="MatrixOrder" />
                        <label class="InputID">KL</label>

                    </td>
                   <td>

                        <input id="txtGram" type="text" name="txtMatrixOrder"  class="MatrixOrder" />
                        <label class="InputID">ML</label>

                    </td>
                   <tr>
                <td  class="InputID"> 
                       <label class="InputID">Select Conversion</label>
                </td>
                <td   class="InputID"> 
                    <input type="radio"  name="SolutionType" value="1" checked="true" class="SolutionTypeA">
                    <label for="Forward">KL TO ML</label><br>
                </td>

                <td class="InputID"> 
                    <input type="radio"  name="SolutionType" value="2" class="SolutionTypeA">
                    <label for="BackWard">ML TO KL</label><br>  
                </td>
            </tr>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                  <tr>
                    <td colspan="3">

                        <input  class="CTestYourSelf" id="btnCreate" type="button" value="Solve " onclick="GenerateMatrix('txtKg');" />
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
