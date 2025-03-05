<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="Fraction.aspx.cs" Inherits="Barchart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/NumericalAnalysis.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/MatrixAnalysis.css" />
    <link href="../../Css/LatestCommon.css" rel="stylesheet" />
    <script type="text/javascript" src="../../JavaScript/Jquery.js"></script>
    <script src="../../JavaScript/Chart.js"></script>
    <script src="../../JavaScript/PrimaryClass.js"></script>
    <script>

        
        function SolveCurveFitting() {
            let xAC = document.getElementById("Barchart");
            
            SolveCurveFitting2(MaxArraySize);
            
        }
        function GenerateMatrix(id) {
            let MatrixArea;

            let stxtInputs = 0;

            document.getElementById('MatrixArea1').innerHTML = "";
            
            stxtInputs = document.getElementById(id).value;
            MatrixArea = document.getElementById('MatrixArea');
            


            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Class4/Barchart.aspx/GenerateMatrix") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const JsonInput = {
                sInputs: "",
            };
            MaxArraySize = Number(stxtInputs);
            JsonInput.sInputs = stxtInputs;
            const jsonString = JSON.stringify(JsonInput);
            xhttp.onload = function () {
                if (this.status == 200) {

                    let myArr = JSON.parse(xhttp.responseText);
                    str = "";
                    for (key in myArr) {
                        str += myArr[key];
                    }
                    document.getElementById('SolveTable').hidden = false;

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
            <h1 class="PageNameHeading">Bar Charts</h1>
        </div>
        <div>
            <table>
             <tr>
                    <td class ="tdA">
                        <label>
                            <h2  class="NameDateScore">Name</h2>
                            <input  id="txtName" type="text"  runat="server" name="txtName" class="textName" />
                        </label>
                    </td>
                    <td class ="tdA">
                        <label>
                            <h2 class="NameDateScore">Date</h2>
                            <asp:Label ID="LblDateTime" runat="server" Text="Label" class="textDate"></asp:Label>
                        </label>
                    </td>
                    <td class ="tdA">
                        <label>
                            <h2 class="NameDateScore">Score :</h2>
                            <h2 id="hScore" class="textScore"></h2>

                        </label>
                    </td>
                </tr>
               <tr>
                    <td class ="tdA">
                        <label class="InputID">Enter Total data point Counts</label>
                    </td>
                    <td colspan="2">
                        <input id="txtIput" type="number" name="txtMatrixOrder"  class="MatrixOrder" />
                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                <tr>
        <td colspan="3">

        <input  class="CTestYourSelf" id="btnCreate" type="button" value=" Generate Input Values Matrix " onclick="GenerateMatrix('txtIput');" />
    </td>

</tr>

     </table>
</div>
        <div id="MatrixArea">
    </div>
    
       
        <table hidden id="SolveTable">
            <tr>
                <td colspan="3"><input id="btnSolve"  class="CTestYourSelf"  type="button" value="SOLVE" onclick="SolveCurveFitting();" />
                </td>
            </tr>
        </table>
        <canvas id="Barchart" style="width:100%;max-width:600px"></canvas>
        <div id="MatrixArea1">
                
        </div>
        </body>
</asp:Content>
