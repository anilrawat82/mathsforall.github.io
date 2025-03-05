<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="MatrixMultiply.aspx.cs" Inherits="MatrixMultiply" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="../../Css/LatestCommon.css" />
    <script type="text/javascript" src="../../JavaScript/Jquery.js"></script>
    <script type="text/javascript" src="../../JavaScript/LinearEquation.js"></script>
    <link type="text/css" rel="stylesheet" href="../../Css/LinearEquation.css" />
    <style>
        h5{
            
            display:inline;
        }
    </style>
    <script type="text/javascript">
        function SetRow2Matrix() {


            let MatrixOrderColA = Number(document.getElementById("txtOrderColA").value);

            document.getElementById("txtOrderRowB").value = MatrixOrderColA;




        }

        
        function GetTextsInput(ElementID) {


            let MatrixRowA = Number(document.getElementById("txtOrderRowA").value);
            let MatrixColA = Number(document.getElementById("txtOrderColA").value);

            let MatrixRowB = Number(document.getElementById("txtOrderRowB").value);
            let MatrixColB = Number(document.getElementById("txtOrderColB").value);
            let myArr = ElementID.split("_");
            //alert(myArr[0]);
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Matrices/MatrixMultiply.aspx/GetInputTextandMaTrixCValue") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");


            const MatrixMultiply = {
                iRowC: "",
                iColC: "",


            };



            MatrixMultiply.iRowC = Number(myArr[1]);
            MatrixMultiply.iColC = Number(myArr[2]);



            const jsonString = JSON.stringify(MatrixMultiply);



            xhttp.onload = function () {
                if (this.status == 200) {

                    let myArr = JSON.parse(xhttp.responseText);
                    str = "";

                    for (key in myArr) {

                        str += myArr[key];
                    }
                    //const myArr = str.split("$$");
                    //txtAvalue
                    //txtBvalue
                    HighLightCell(ElementID, MatrixRowA, MatrixColA, MatrixRowB, MatrixColB, str);




                }
                else {
                    alert("error Now");
                }
            }


            xhttp.send(jsonString);

        }
        function MultiplyAjaxCall() {


            let MatrixRowA = Number(document.getElementById("txtOrderRowA").value);
            let MatrixColA = Number(document.getElementById("txtOrderColA").value);

            let MatrixRowB = Number(document.getElementById("txtOrderRowB").value);
            let MatrixColB = Number(document.getElementById("txtOrderColB").value);


            var MatrixArea = document.getElementById('Solutions');
            let MyMatrixA = "";
            let MyMatrixB = "";




            for (let j = 0; j < MatrixRowA; j++) {
                for (let i = 0; i < MatrixColA; i++) {
                    let strA = "txtAvalue" + j + i;
                    var xA = document.getElementById(strA);
                    MyMatrixA += xA.value + ":";
                }
            }

            for (let j = 0; j < MatrixRowB; j++) {
                for (let i = 0; i < MatrixColB; i++) {

                    let strB = "txtBvalue" + j + i;
                    var xB = document.getElementById(strB);
                    MyMatrixB += xB.value + ":";

                }
            }

            //MyMatrixA = "2:3:4:3:2:1:4:1:3:";
            //MyMatrixB = "5:1:6:2:7:3:";

            
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Matrices/MatrixMultiply.aspx/SolveMatrix") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const MatrixMultiply = {
                iMatrixOrderRowA: "",
                iMatrixOrderColA: "",
                iMatrixOrderRowB: "",
                iMatrixOrderColB: "",
                dMatrixA: "",
                dMatrixB: "",

            };



            MatrixMultiply.iMatrixOrderRowA = Number(MatrixRowA);
            MatrixMultiply.iMatrixOrderColA = Number(MatrixColA);
            MatrixMultiply.iMatrixOrderRowB = Number(MatrixRowB);
            MatrixMultiply.iMatrixOrderColB = Number(MatrixColB);
            MatrixMultiply.dMatrixA = MyMatrixA;
            MatrixMultiply.dMatrixB = MyMatrixB;



            const jsonString = JSON.stringify(MatrixMultiply);



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
    <div>
        <table>
            <tr>
                <td colspan="3" style="text-align: center" class="auto-style1">
                    <label>
                        <h2 class="PageNameHeading">Matrix  Multiplication </h2>
                    </label>
                </td>
            </tr>

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
                    <label class="InputID">Matrix One Order </label>
                </td>
                <td colspan="2">
                    <label class="InputID">Row </label>
                    <input id="txtOrderRowA" type="text" name="txtOrderRowA" value="<%=MatrixOrderRow %>" class="MatrixOrder" />
                    <label class="InputID">Col</label>
                    <input id="txtOrderColA" type="text" name="txtOrderColA" value="<%=MatrixOrderCol %>" class="MatrixOrder" onkeyup="SetRow2Matrix();" />
                </td>

            </tr>
            <tr>
                <td>
                    <label class="InputID">Matrix two  Order </label>
                </td>
                <td colspan="2">

                    <label class="InputID">Row</label>
                   
                        <input id="txtOrderRowB" type="text" name="txtOrderRowB" value="<%=MatrixOrderRow %>" class="MatrixOrder" disabled="disabled" />
                   

                    
                    <label class="InputID">Col </label>
                    <input id="txtOrderColB" type="text" name="txtOrderColB" value="<%=MatrixOrderCol %>" class="MatrixOrder" />

                </td>

            </tr>

        </table>

    </div>


    <div id="Generate Matrix" class="CalculateAnswer" onclick="GenerateMatrixForMultiplication();">
        Click Generate Matrix
        
    </div>

    <div id="MatrixArea">
    </div>

    <div id="dCalculateNow" hidden="hidden" class="CalculateAnswer" onclick="MultiplyAjaxCall();">
        Click Calculate
        
    </div>
       <div id="Solutions">
    </div>
    
</asp:Content>
