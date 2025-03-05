<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="EqualityMatrix.aspx.cs" Inherits="EqualityMatrix" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="../../JavaScript/Jquery.js"></script>
    <script type="text/javascript" src="../../JavaScript/LinearEquation.js"></script>
    <link type="text/css" rel="stylesheet" href="../../Css/LatestCommon.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/LinearEquation.css" />
    <script type="text/javascript">
        function GetHighlightText(ElementID, RowValue, ColValue) {
            let myArr = ElementID.split("_");
            HighLightEqualCell(myArr[1], myArr[2], RowValue, ColValue)
        }
        function SolveEqualityMatrix() {


            let MatrixOrderRow = Number(document.getElementById("txtOrderRowA").value);
            let MatrixOrderCol = Number(document.getElementById("txtOrderColA").value);
            var MatrixArea = document.getElementById('Solutions');
            let MyMatrixA = "";
            let MyMatrixB = "";

          


            for (let j = 0; j < MatrixOrderRow; j++) {
                for (let i = 0; i < MatrixOrderCol; i++) {
                    let strA = "txtAvalue_" + j +"_" + i;
                    var xA = document.getElementById(strA);
                    MyMatrixA += xA.value + ":";


                    let strB = "txtBvalue_" + j +"_"+ i;
                    var xB = document.getElementById(strB);
                    MyMatrixB += xB.value + ":";

                }
            }





            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Matrices/EqualityMatrix.aspx/SolveMatrix") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const MatrixEqual = {
                iMatrixOrderRow: "",
                iMatrixOrderCol: "",
                dMatrixA: "",
                dMatrixB: "",
            };


            MatrixEqual.iMatrixOrderRow = Number(MatrixOrderRow);
            MatrixEqual.iMatrixOrderCol = Number(MatrixOrderCol);
            MatrixEqual.dMatrixA = MyMatrixA;
            MatrixEqual.dMatrixB = MyMatrixB;
            const jsonString = JSON.stringify(MatrixEqual);
            xhttp.onload = function () {
                if (this.status == 200) {

                    let myArr = JSON.parse(xhttp.responseText);
                    str = "";
                    for (key in myArr) {
                        str += myArr[key];
                    }
                    AdditionDone = true;
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
                <td colspan="2" style="text-align: center" class="auto-style1">
                    <label>
                        <h1 class="PageNameHeading">Equality of matrices <b>(Class 12-Chapter 3) </b></h1>
                    </label>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center" class="auto-style1">
                    <label>
                        <h2 style="color: #ffd800">Two matrices  are said to be equal if</h2>
                    </label>
                    <ul>
                        <li>
                            <h3 style="color: #0094ff; text-align: left">They are of the same order</h3>
                        </li>
                        <li>
                            <h3 style="color: #0094ff; text-align: left">Each element of A is equal to the corresponding element of B</h3>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td>
                    <label><b style="font-size: 20px">Equal Matrix Order</b> <b style="color: chartreuse">example [2*2],[3*4],[3*2] so on </b></label>
                </td>
                <td>
                    <label>Row </label>
                    <input id="txtOrderRow" type="text" name="txtOrderRowA" value="<%=MatrixOrderRow %>" class="MatrixOrder" />
                    <label>Col</label>
                    <input id="txtOrderCol" type="text" name="txtOrderColA" value="<%=MatrixOrderCol %>" class="MatrixOrder" />
                    <input id="Button1" type="button" value="Create Matrix" onclick="GenerateEqualMatrix('txtOrderRow', 'txtOrderCol', true);" />
                </td>
            </tr>

            <tr>
                <td>
                    <label><b style="font-size: 20px">Find Values when matrices are equal </b><b style="color: chartreuse">example [2*2],[3*4],[3*2] so on </b></label>
                </td>
                <td>
                    <label>Row </label>
                    <input id="txtOrderRowA" type="text" name="txtOrderRowB" value="<%=MatrixOrderRow %>" class="MatrixOrder" />
                    <label>Col</label>
                    <input id="txtOrderColA" type="text" name="txtOrderColB" value="<%=MatrixOrderCol %>" class="MatrixOrder" />
                    <input id="Button2" type="button" value="Create Matrix" onclick="GenerateEqualMatrix('txtOrderRowA', 'txtOrderColA', false);" />
                </td>
            </tr>


        </table>
        <div id="MatrixArea">
        </div>
       
        <div id="dCalculateNow" hidden="hidden" class="CalculateAnswer" onclick="SolveEqualityMatrix();">
            Click Calculate
        </div>
         <div id="Solutions">
        </div>
    </div>
</asp:Content>
