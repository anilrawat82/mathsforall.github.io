<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="Counting.aspx.cs" Inherits="Counting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="../../Css/CorrectAnswer.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/Elementary.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link href="../../Css/LatestCommon.css" rel="stylesheet" />
    <script type="text/javascript" src="../../JavaScript/Elementary.js"></script>
    <script type="text/javascript" src="../../JavaScript/Common.js"></script>
    <script>
        function SubmitAnswer() {


            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Elementary/Counting.aspx/GetSubmitAnswer") %>';

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

                    let iStartNumber = Number(document.getElementById("txtStartNumber").value);
                    let iEndingNumber = Number(document.getElementById("txtEndingNumber").value);

                    CheckCounting(str, iStartNumber, iEndingNumber)


                }
                else {
                    alert("error Now");
                }
            }


            xhttp.send(jsonString);
        }

        function GenerateMatrix() {

            let MatrixArea = document.getElementById('MatrixArea');

            let iStartNumber = Number(document.getElementById("txtStartNumber").value);
            let iEndingNumber = Number(document.getElementById("txtEndingNumber").value);




            if (isNaN(iStartNumber) == true || isNaN(iEndingNumber) == true) {
                MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Numeric Value Greater than 0 in Elements and Questions</h2>";
                return;
            }



            document.getElementById("SubmitAnswer").hidden = false;
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Elementary/Counting.aspx/GenerateMatrix") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const JsonInput = {
                iStartNumber: "",
                iEndingNumber: "",
            };


            JsonInput.iStartNumber = Number(iStartNumber);
            JsonInput.iEndingNumber = Number(iEndingNumber);



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
    <style type="text/css">
        .auto-style1 {
            height: 50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body>
        <div>
            <h1 class="PageNameHeading">Counting</h1>
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
                        <label class="InputID">Starting Number</label>
                    </td>
                    <td colspan="2">

                        <input id="txtStartNumber" type="text" name="txtStartNumber" value="<%=StartNumber%>" class="MatrixOrder" />

                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                <tr>
                    <td>
                        <label class="InputID">Ending Number</label>
                    </td>
                    <td colspan="2">
                        <input id="txtEndingNumber" type="text" name="txtEndingNumber" value="<%=EndingNumber%>" class="MatrixOrder" />


                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>

                <tr>
                    <td colspan="3">

                        <input class="CTestYourSelf"  id="Button1" type="button" value="Test Your Self" onclick="GenerateMatrix();" />
                        
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
