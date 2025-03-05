<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="MatrixAdditionSubtraction.aspx.cs" Inherits="MatrixAdditionSubtraction" %>

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
        let AdditionDone = false;

        function GetAddSubTextsInput(ElementID)
        {

            let MatrixOrderRow = Number(document.getElementById("txtOrderRow").value);
            let MatrixOrderCol = Number(document.getElementById("txtOrderCol").value);
            
            let myArr = ElementID.split("_");

            
            
            
            HighLightAddSubCell(myArr[1], myArr[2], MatrixOrderRow, MatrixOrderCol)
        }


        function AddSubAjaxCall()
        {

            
            let MatrixOrderRow = Number(document.getElementById("txtOrderRow").value);
            let MatrixOrderCol = Number(document.getElementById("txtOrderCol").value);
            var MatrixArea = document.getElementById('Solutions');
            let MyMatrixA = "";
            let MyMatrixB = "";

            let SolutionType = $('.SolutionTypeA:checked').val();

            
            for (let j = 0; j < MatrixOrderRow; j++) {
                for (let i = 0; i < MatrixOrderCol; i++) {
                    let strA = "txtAvalue" + j + i;
                    var xA = document.getElementById(strA);
                    MyMatrixA += xA.value + ":";


                    let strB = "txtBvalue" + j + i;
                    var xB = document.getElementById(strB);
                    MyMatrixB += xB.value + ":";

                }
            }


            
            

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Matrices/MatrixAdditionSubtraction.aspx/SolveMatrix") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");
            
            const MatrixAddSub = {
                iMatrixOrderRow: "",
                iMatrixOrderCol: "",
                dMatrixA: "",
                dMatrixB: "",
                sSolutionType: "",
            };


            MatrixAddSub.iMatrixOrderRow = Number(MatrixOrderRow);
            MatrixAddSub.iMatrixOrderCol = Number(MatrixOrderCol);
            MatrixAddSub.dMatrixA = MyMatrixA;
            MatrixAddSub.dMatrixB = MyMatrixB;
            MatrixAddSub.sSolutionType = SolutionType;

            
            const jsonString = JSON.stringify(MatrixAddSub);

            

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

        function ChangeSignAjaxCall()
        {
            if (AdditionDone == false) { return;}

            let MatrixOrderRow = Number(document.getElementById("txtOrderRow").value);
            let MatrixOrderCol = Number(document.getElementById("txtOrderCol").value);
            if (isNaN(MatrixOrderRow) != true && isNaN(MatrixOrderCol) != true) {

                var MatrixArea = document.getElementById('Solutions');
                let strA = "txtSign" + 0 + Number(MatrixOrderCol);
                var xA = document.getElementById(strA);
                let SolutionTypeA = $('.SolutionTypeA:checked').val() == 1 ? '+' : '-';
                let elementA = document.getElementById(strA);
                elementA.innerHTML = SolutionTypeA;

                var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Matrices/MatrixAdditionSubtraction.aspx/UpdateMatrixC") %>';

                var xhttp = new XMLHttpRequest();


                xhttp.open("POST", pageUrl, true);

                xhttp.setRequestHeader("Content-type", "application/json");

                const MatrixAddSub = {
                    sSolutionType: "",
                };

               
                MatrixAddSub.sSolutionType = $('.SolutionTypeA:checked').val();


                const jsonString = JSON.stringify(MatrixAddSub);



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
            
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table>


            <tr>
                <td colspan="3" style="text-align: center" class="auto-style1">
                    <label>
                        <h2 class="PageNameHeading">Matrix  Addition or Subtraction </h2>
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
                    <label class="InputID">Matrix Order example [2*2],[3*2],[3*4] so on  </label>
                </td>
                <td colspan="2">
                    <label class="InputID">Row </label>
                    <input id="txtOrderRow" type="text" name="txtOrderRow" value="<%=MatrixOrderRow %>" class="MatrixOrder" />
                    <label class="InputID">Col</label>
                    <input id="txtOrderCol" type="text" name="txtOrderCol" value="<%=MatrixOrderCol %>" class="MatrixOrder" />


                    <input type="radio" name="SolutionType" value="1" checked="true" class="SolutionTypeA" onclick="ChangeSignAjaxCall();">
                    <label for="Addition" class="InputID">Addition</label>
                    <input type="radio" name="SolutionType" value="2" class="SolutionTypeA" onclick="ChangeSignAjaxCall();">
                    <label for="Subtraction" class="InputID">Subtraction</label>

                   <%-- <input id="Button1" type="button" value="Create Matrix" onclick="GenerateMatrixForAdditionSubtraction($('.SolutionTypeA:checked').val())" />--%>
                    <%--<input id="Button1" type="button" value="Create Matrix" onclick="JqueryAjaxCall();" />--%>
                    
                    


                </td>
                <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
            </tr>



        </table>
    </div>
     <div id="Button1"  class ="CalculateAnswer" onclick="GenerateMatrixForAdditionSubtraction($('.SolutionTypeA:checked').val());" >
        Generate Matrix
        
    </div>
   

    <div id="MatrixArea">
    </div>
     <div id="dCalculateNow" hidden="hidden" class ="CalculateAnswer" onclick="AddSubAjaxCall();">
        Click Calculate
        
    </div>

    <div id="Solutions">
    </div>
</asp:Content>

<%--<input id="CalculateNow" type="button" value="Calculate" onclick="AddSubAjaxCall();" class="CalculateButton" />--%>