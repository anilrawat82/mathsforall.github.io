<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="MatrixCreation.aspx.cs" Inherits="MatrixCreation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="../../Css/LatestCommon.css" />
    <script type="text/javascript" src="../../JavaScript/Jquery.js"></script>
    <script type="text/javascript" src="../../JavaScript/LinearEquation.js"></script>
    <link type="text/css" rel="stylesheet" href="../../Css/LinearEquation.css" />



    <style type="text/css">
        .auto-style1 {
            height: 30px;
        }
    </style>
    <script type="text/javascript">
        
        function CreateZeroMatrix() {

            let MatrixOrderRow = Number(document.getElementById("txtZeroRow").value);
            let MatrixOrderCol = Number(document.getElementById("txtZeroCol").value);
            var MatrixArea = document.getElementById('SolZero');
            document.getElementById('RowZero').hidden = false;
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Matrices/MatrixCreation.aspx/CreateZeroMatrix") %>';
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", pageUrl, true);
            xhttp.setRequestHeader("Content-type", "application/json");

            const MatrixCreate = {
                iMatrixOrderRow: "",
                iMatrixOrderCol: "",
            
            };
            MatrixCreate.iMatrixOrderRow = Number(MatrixOrderRow);
            MatrixCreate.iMatrixOrderCol = Number(MatrixOrderCol);
            
            const jsonString = JSON.stringify(MatrixCreate);
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
        function CreateMatrix() {

            let MatrixOrderRow = Number(document.getElementById("txtOrderRow").value);
            let MatrixOrderCol = Number(document.getElementById("txtOrderCol").value);
            var MatrixArea = document.getElementById('SolCreateMatrix');
            document.getElementById('RowCreateMatrix').hidden = false;
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Matrices/MatrixCreation.aspx/CreateMatrix") %>';
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", pageUrl, true);
            xhttp.setRequestHeader("Content-type", "application/json");

            const MatrixCreate = {
                iMatrixOrderRow: "",
                iMatrixOrderCol: "",
                sMatrixCaption: "",
            };
            MatrixCreate.iMatrixOrderRow = Number(MatrixOrderRow);
            MatrixCreate.iMatrixOrderCol = Number(MatrixOrderCol);
            MatrixCreate.sMatrixCaption = "Matrix of Order ";
            const jsonString = JSON.stringify(MatrixCreate);
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
        function CreateRowMatrix() {

            let MatrixOrderRow = 1;
            let MatrixOrderCol = Number(document.getElementById("txtRowMatrix").value);
            var MatrixArea = document.getElementById('SolCMatrix');
            document.getElementById('RowCMatrix').hidden = false;
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Matrices/MatrixCreation.aspx/CreateMatrix") %>';
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", pageUrl, true);
            xhttp.setRequestHeader("Content-type", "application/json");

            const MatrixCreate = {
                iMatrixOrderRow: "",
                iMatrixOrderCol: "",
                sMatrixCaption: "",
            };
            MatrixCreate.iMatrixOrderRow = Number(MatrixOrderRow);
            MatrixCreate.iMatrixOrderCol = Number(MatrixOrderCol);
            MatrixCreate.sMatrixCaption = "Row Matrix of Order ";
            const jsonString = JSON.stringify(MatrixCreate);
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
        function CreateColumnMatrix() {

            let MatrixOrderRow = Number(document.getElementById("txtRowCount").value);
            let MatrixOrderCol = 1;
            var MatrixArea = document.getElementById('SolColMatrix');
            document.getElementById('ColCMatrix').hidden = false;

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Matrices/MatrixCreation.aspx/CreateMatrix") %>';
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", pageUrl, true);
            xhttp.setRequestHeader("Content-type", "application/json");

            const MatrixCreate = {
                iMatrixOrderRow: "",
                iMatrixOrderCol: "",
                sMatrixCaption: "",
            };
            MatrixCreate.iMatrixOrderRow = Number(MatrixOrderRow);
            MatrixCreate.iMatrixOrderCol = Number(MatrixOrderCol);
            MatrixCreate.sMatrixCaption = "Col Matrix of Order ";
            const jsonString = JSON.stringify(MatrixCreate);
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
        function CreateSquareMatrix() {

            let MatrixOrderRow = Number(document.getElementById("txtSquareMatrix").value);
            let MatrixOrderCol = MatrixOrderRow;
            var MatrixArea = document.getElementById('SolSquare');
            document.getElementById('RowSquare').hidden = false;
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Matrices/MatrixCreation.aspx/CreateMatrix") %>';
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", pageUrl, true);
            xhttp.setRequestHeader("Content-type", "application/json");

            const MatrixCreate = {
                iMatrixOrderRow: "",
                iMatrixOrderCol: "",
                sMatrixCaption: "",
            };
            MatrixCreate.iMatrixOrderRow = Number(MatrixOrderRow);
            MatrixCreate.iMatrixOrderCol = Number(MatrixOrderCol);
            MatrixCreate.sMatrixCaption = "Square Matrix of Order ";
            const jsonString = JSON.stringify(MatrixCreate);
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

        function CreateScalerMatrix() {

            let MatrixOrderRow = Number(document.getElementById("txtScalerMatrix").value);
            let MatrixOrderCol = MatrixOrderRow;
            var MatrixArea = document.getElementById('SolScalar');
            document.getElementById('RowScalar').hidden = false;

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Matrices/MatrixCreation.aspx/CreateScalerMatrix") %>';
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", pageUrl, true);
            xhttp.setRequestHeader("Content-type", "application/json");

            const MatrixCreate = {
                iMatrixOrderRow: "",
                iMatrixOrderCol: "",
            };
            MatrixCreate.iMatrixOrderRow = Number(MatrixOrderRow);
            MatrixCreate.iMatrixOrderCol = Number(MatrixOrderCol);
            const jsonString = JSON.stringify(MatrixCreate);
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
        function CreateDiagonalMatrix() {

            let MatrixOrderRow = Number(document.getElementById("txtDiagonalMatrix").value);
            let MatrixOrderCol = MatrixOrderRow;
            var MatrixArea = document.getElementById('SolDiagonal');
            document.getElementById('RowDiagonal').hidden = false;

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Matrices/MatrixCreation.aspx/CreateDiagonalMatrix") %>';
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", pageUrl, true);
            xhttp.setRequestHeader("Content-type", "application/json");

            const MatrixCreate = {
                iMatrixOrderRow: "",
                iMatrixOrderCol: "",
            };
            MatrixCreate.iMatrixOrderRow = Number(MatrixOrderRow);
            MatrixCreate.iMatrixOrderCol = Number(MatrixOrderCol);
            const jsonString = JSON.stringify(MatrixCreate);
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
        function CreateIdentityMatrix() {

            let MatrixOrderRow = Number(document.getElementById("txtIdentityMatrix").value);
            let MatrixOrderCol = MatrixOrderRow;
            var MatrixArea = document.getElementById('SolIdentity');
            document.getElementById('RowIdentity').hidden = false;
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Matrices/MatrixCreation.aspx/CreateIdentityMatrix") %>';
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", pageUrl, true);
            xhttp.setRequestHeader("Content-type", "application/json");

            const MatrixCreate = {
                iMatrixOrderRow: "",
                iMatrixOrderCol: "",
            };
            MatrixCreate.iMatrixOrderRow = Number(MatrixOrderRow);
            MatrixCreate.iMatrixOrderCol = Number(MatrixOrderCol);
            const jsonString = JSON.stringify(MatrixCreate);
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
                <td colspan="3" style="text-align: center" class="auto-style1">
                    <label>
                        <h2 class="PageNameHeading"> DIFFRENT TYPE OF MATRICES </h2>
                    </label>
                </td>
            </tr>
            <tr>
                <td>
                    <label> <b class="InputID">Matrix Order</b> <b style="color: chartreuse"> example [2*2],[3*4],[3*2] so on </b> </label>
                </td>
                <td colspan="2">
                    <label>Row </label>
                    <input id="txtOrderRow" type="text" name="txtOrderRow" value="<%=MatrixOrderRow %>" class="MatrixOrder" />
                    <label>Col</label>
                    <input id="txtOrderCol" type="text" name="txtOrderCol" value="<%=MatrixOrderCol %>" class="MatrixOrder" />



                    <input id="Button1" type="button" value="Create Matrix" onclick="CreateMatrix();" />
                    <%--<input id="Button1" type="button" value="Create Matrix" onclick="JqueryAjaxCall();" />--%>
                    
                    


                </td>


                <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
            </tr>
           <tr id="RowCreateMatrix" hidden="hidden">
                <td colspan="3">
                    <div id="SolCreateMatrix">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <label><b class="InputID">Column Matrix</b><b style="color: #ff6a00">( A matrix is said to be a <b style="color:teal">column matrix</b> if it has only one column.)</b></label>
                </td>
                <td colspan="2">

                    <label>Row </label>
                    <input id="txtRowCount" type="text" name="txtOrderRow" class="MatrixOrder" />
                    <input id="ButtonA" type="button" value="Create Matrix" onclick="CreateColumnMatrix();" />
                </td>
            </tr>
            <tr id="ColCMatrix" hidden="hidden">
                <td colspan="3">
                    <div id="SolColMatrix">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <label><b class="InputID">Row Matrix</b><b style="color: #b200ff"> ( A matrix is said to be a <b style="color:teal">row matrix</b> if it has only one row.)</b></label>
                </td>
                <td colspan="2">

                    <label>Col</label>
                    <input id="txtRowMatrix" type="text" name="txtOrderCol" value="<%=MatrixOrderCol %>" class="MatrixOrder" />
                    <input id="ButtonB" type="button" value="Create Matrix" onclick="CreateRowMatrix();" />
                </td>
            </tr>
            <tr id="RowCMatrix" hidden="hidden">
                <td colspan="3">
                    <div id="SolCMatrix">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <label ><b  class="InputID">Square matrix</b><b style="color: #0026ff">( A matrix is said to be <b style="color:teal">square matrix </b> when the number of rows are equal to the number of columns.)</b></label>
                </td>
                <td colspan="2">

                    <label>Row /Col</label>
                    <input id="txtSquareMatrix" type="text" name="txtOrderCol" value="<%=MatrixOrderCol %>" class="MatrixOrder" />
                    <input id="ButtonZ" type="button" value="Create Matrix" onclick="CreateSquareMatrix();" />
                </td>
            </tr>
            <tr id="RowSquare" hidden="hidden">
                <td colspan="3">
                    <div id="SolSquare">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <label><b class="InputID">Identity matrix</b><b style="color: crimson">( A square matrix is said to be a <b style="color:teal">Identity matrix</b>  if all diagonals are  1 and rest are all zero.)</b></label>
                </td>
                <td colspan="2">

                    <label>Row /Col</label>
                    <input id="txtIdentityMatrix" type="text" name="txtOrderCol" value="<%=MatrixOrderCol %>" class="MatrixOrder" />
                    <input id="ButtonC" type="button" value="Create Matrix" onclick="CreateIdentityMatrix();" />
                </td>
            </tr>
            <tr id="RowIdentity" hidden="hidden">
                <td colspan="3">
                    <div id="SolIdentity">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <label><b class="InputID">diagonal matrix</b><b style="color: darkgoldenrod">( A square matrix is said to be a <b style="color:teal">diagonal matrix</b> if all its non diagonal elements are zero.)</b></label>
                </td>
                <td colspan="2">

                    <label>Row /Col</label>
                    <input id="txtDiagonalMatrix" type="text" name="txtOrderCol" value="<%=MatrixOrderCol %>" class="MatrixOrder" />
                    <input id="ButtonF" type="button" value="Create Matrix" onclick="CreateDiagonalMatrix();" />
                </td>
            </tr>
            <tr id="RowDiagonal" hidden="hidden">
                <td colspan="3">
                    <div id="SolDiagonal">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <label><b class="InputID">Scalar matrix</b><b style="color: yellowgreen">( A square matrix is said to be a <b style="color:teal">Scalar matrix</b> if all its  diagonal elements are equal and non diagonal elements are zero )</b></label>
                </td>
                <td colspan="2">

                    <label>Row /Col</label>
                    <input id="txtScalerMatrix" type="text" name="txtOrderCol" value="<%=MatrixOrderCol %>" class="MatrixOrder" />
                    <input id="ButtonQ" type="button" value="Create Matrix" onclick="CreateScalerMatrix();" />
                </td>
            </tr>
            <tr id="RowScalar" hidden="hidden">
                <td colspan="3">
                    <div id="SolScalar">
                    </div>
                </td>
            </tr>

             <tr>
                <td>
                    <label><b class="InputID">Zero matrix</b><b style="color: orange">( A  matrix is said to be a <b style="color:teal">Zero matrix</b> if all its elements are zero )</b></label>
                </td>
                <td colspan="2">
                     <label>Row </label>
                    <input id="txtZeroRow" type="text" name="txtOrderRow" value="<%=MatrixOrderRow %>" class="MatrixOrder" />
                    <label>Col</label>
                    <input id="txtZeroCol" type="text" name="txtOrderCol" value="<%=MatrixOrderCol %>" class="MatrixOrder" />

                    
                    <input id="ButtonK" type="button" value="Create Matrix" onclick="CreateZeroMatrix();" />
                </td>
            </tr>
            <tr id="RowZero" hidden="hidden">
                <td colspan="3">
                    <div id="SolZero">
                    </div>
                </td>
            </tr>

        </table>
    </div>







</asp:Content>
