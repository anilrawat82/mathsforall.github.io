<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="WriteRandomTable.aspx.cs" Inherits="WriteRandomTable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="../../Css/LatestCommon.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/Elementary.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/CorrectAnswer.css" />
    
    <script type="text/javascript" src="../../JavaScript/TableChecking.js"></script>
    <script type="text/javascript" src="../../JavaScript/Common.js"></script>
    
    <script>
        function SubmitAnswer() {


            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Elementary/WriteRandomTable.aspx/GetSubmitAnswer") %>';

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
                    
                    CheckTable_Answer(str);


                }
                else {
                    alert("error Now");
                }
            }


            xhttp.send(jsonString);
        }

        function GenerateMatrix() {

            let MatrixArea = document.getElementById('MatrixArea');

            let iTotalQuestion = Number(document.getElementById("txtQuestion").value);
            let iMinTable = Number(document.getElementById("txtMinTableRange").value);
            let iMaxTable = Number(document.getElementById("txtMaxTableRange").value);
            let iMinRange = Number(document.getElementById("txtMinRange").value);
            let iMaxRange = Number(document.getElementById("txtMaxRange").value);

            
            

           

            //if (isNaN(iStartNumber) == true || isNaN(iEndingNumber) == true || isNaN(iTableNumber) == true) {
            //    MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Numeric Value Greater than 0 in Elements and Table Number</h2>";
            //    return;
            //}



            document.getElementById("SubmitAnswer").hidden = false;
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Elementary/WriteRandomTable.aspx/GenerateMatrix") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const JsonInput = {
                iTotalQuestion:"",
                iTableNumberRange1: "",
                iTableNumberRange2: "",
                iMinRange: "",
                iMaxRange: "",
                
            };

            JsonInput.iTotalQuestion = Number(iTotalQuestion);
            JsonInput.iTableNumberRange1 = Number(iMinTable);
            JsonInput.iTableNumberRange2 = Number(iMaxTable);
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
            <h1 class="PageNameHeading">Write Random Tables</h1>
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
                        <label class="InputID">Number Of Questions</label>
                    </td>
                    <td colspan="2">

                        <input id="txtQuestion" type="text" name="txtMatrixOrder" value="<%=TotalQuestion%>" class="MatrixOrder" />

                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                

                <tr>
                    <td colspan="3">
                        <label class="InputID">Minimum Range Of Table</label>
                        <input id="txtMinTableRange" type="text" name="txtMatrixOrder" value="1" class="MatrixOrder" />
                        <label class="InputID">Max Range</label>
                        <input id="txtMaxTableRange" type="text" name="txtMatrixOrder" value="10" class="MatrixOrder" />
                        
                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
               
                <tr>
                    <td colspan="3">
                        <label class="InputID">Minimum Range Of Elements</label>
                        <input id="txtMinRange" type="text" name="txtMatrixOrder" value="1" class="MatrixOrder" />
                        <label class="InputID">Max Range</label>
                        <input id="txtMaxRange" type="text" name="txtMatrixOrder" value="10" class="MatrixOrder" />
                        
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

        <div id="Solutions">
        </div>


    </body>
</asp:Content>
