<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/DesignAlgo.Master" AutoEventWireup="true" CodeBehind="HamiltonianCycle.aspx.cs" Inherits="HamiltonianCycle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />

    <link type="text/css" rel="stylesheet" href="../../Css/SortingAlgo.css" />
    <link href="../../Css/LatestCommon.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../Css/MasterPage.css" />
    <script type="text/javascript" src="../../JavaScript/NetworkFlow.js"></script>
    <script type="text/javascript" src="../../JavaScript/Jquery.js"></script>
    <script>
        function GenerateNextPrevMatrix(value)
        {
            let MatrixArea;
            
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/DSA/HamiltonianCycle.aspx/NextPrevMatrix") %>';
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", pageUrl, true);
            xhttp.setRequestHeader("Content-type", "application/json");
            const JsonInput =
            {
                sNextPrevSolve: "",
            };
            JsonInput.sNextPrevSolve = Number(value);
            const jsonString = JSON.stringify(JsonInput);
            xhttp.onload = function () {
                if (this.status == 200) {

                    let myArr = JSON.parse(xhttp.responseText);
                    str = "";
                    for (key in myArr) {
                        str += myArr[key];
                    }
                    //MatrixArea.innerHTML = str;
                    DirectedGraph = false;
                    SetHamiltonianValue(str)

                }
                else {
                    alert("error Now");
                }
            }


            xhttp.send(jsonString);
        }
        function FindHamiltonian() {
            let MatrixArea;
            MatrixArea = document.getElementById('MatrixArea');
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/DSA/HamiltonianCycle.aspx/FindHamiltonianCycle") %>';
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", pageUrl, true);
            xhttp.setRequestHeader("Content-type", "application/json");
            const JsonInput = {
                sSolve: "",
            };
            JsonInput.sSolve = "";
            const jsonString = JSON.stringify(JsonInput);
            xhttp.onload = function () {
                if (this.status == 200) {

                    let myArr = JSON.parse(xhttp.responseText);
                    str = "";
                    for (key in myArr) {
                        str += myArr[key];
                    }
                    DirectedGraph = false;

                    MatrixArea.innerHTML = str;
                    document.getElementById('NextPrevious').hidden = false;

                }
                else {
                    alert("error Now");
                }
            }


            xhttp.send(jsonString);
        }
        function ResetGraph() {
            let MatrixArea;
            MatrixArea = document.getElementById('iCanvas');
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/DSA/HamiltonianCycle.aspx/ResetGraph") %>';
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", pageUrl, true);
            xhttp.setRequestHeader("Content-type", "application/json");
            const JsonInput =
            {
                sSolve: "",
            };
            JsonInput.sSolve = "";
            const jsonString = JSON.stringify(JsonInput);
            xhttp.onload = function () {
                if (this.status == 200) {

                    let myArr = JSON.parse(xhttp.responseText);
                    str = "";
                    for (key in myArr) {
                        str += myArr[key];
                    }
                    //MatrixArea.innerHTML = str;
                    DirectedGraph = false;
                    DrawGraphLine(str);

                }
                else {
                    alert("error Now");
                }
            }


            xhttp.send(jsonString);
        }
        function FindHamiltonian() {
            let MatrixArea;
            MatrixArea = document.getElementById('MatrixArea');
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/DSA/HamiltonianCycle.aspx/FindHamiltonianCycle") %>';
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", pageUrl, true);
            xhttp.setRequestHeader("Content-type", "application/json");
            const JsonInput = {
                sSolve: "",
            };
            JsonInput.sSolve = "";
            const jsonString = JSON.stringify(JsonInput);
            xhttp.onload = function () {
                if (this.status == 200) {

                    let myArr = JSON.parse(xhttp.responseText);
                    str = "";
                    for (key in myArr) {
                        str += myArr[key];
                    }
                    DirectedGraph = false;
                    
                    MatrixArea.innerHTML = str;
                    document.getElementById('NextPrevious').hidden = false;

                }
                else {
                    alert("error Now");
                }
            }


            xhttp.send(jsonString);

        }
        
        
        function GenrateCircle(event) {
            let SolutionType = $('.SolutionTypeA:checked').val();

            if (SolutionType == 1)
                return;
            let MatrixArea;
            MatrixArea = document.getElementById('iCanvas');
            var x = event.offsetX;
            var y = event.offsetY;
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/DSA/HamiltonianCycle.aspx/GenerateGraphCircle") %>';
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", pageUrl, true);
            xhttp.setRequestHeader("Content-type", "application/json");
            const JsonInput = {
                sx: "",
                sy: "",
                solType: "",
            };
            JsonInput.sx = Number(x);
            JsonInput.sy = Number(y);
            JsonInput.solType = SolutionType;

            const jsonString = JSON.stringify(JsonInput);

            xhttp.onload = function () {
                if (this.status == 200) {

                    let myArr = JSON.parse(xhttp.responseText);
                    str = "";
                    for (key in myArr) {
                        str += myArr[key];
                    }

                    let myArrA = str.split("#");
                    let first = Number(myArrA[0]);
                    let second = Number(myArrA[1]);
                    DirectedGraph = false;
                    DrawGraphLine(myArrA[2]);
                    // MatrixArea.innerHTML = myArrA[2];
                    if (first != -1) {
                        let Ch = Number(first) + 65;
                        document.getElementById('FirstPoint_').value = String.fromCharCode(Ch);

                    }
                    if (second != -1) {
                        let Ch = Number(second) + 65;
                        document.getElementById('SecondPoint_').value = String.fromCharCode(Ch);
                    }
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
            <h1 class="PageNameHeading">BELLMAN-FORD ALGORITHM</h1>
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
                    <td class="OptionHead" style="width:100px" colspan="3">
                        <p >Please select any one :</p>
                    </td>
                </tr>
                <tr style="width:100%">
                    <td class="InputOption" >
                        <input type="radio" name="SolutionType" value="1" checked="true" class="SolutionTypeA" >
                        <label for="StepWise">None</label><br>

                    </td>
                    <td class="InputOption" >
                        <input type="radio" name="SolutionType" value="2" class="SolutionTypeA" >
                        <label for="FinalSolution">Add Element</label><br>
                        
                    </td>
                    <td class="InputOption" >
                        <input type="radio" name="SolutionType" value="3" class="SolutionTypeA" >
                        <label for="FinalSolution">Delete Element</label><br>
                    </td>
                 <tr style="width:100%">
                    <td class="InputOption" >

                        <input type="radio" name="SolutionType" value="4" class="SolutionTypeA" >
                        <label for="FinalSolution">Add Line</label><br>
                        
                    </td>
                    <td class="InputOption" >
                        <input type="radio" name="SolutionType" value="6" class="SolutionTypeA" >
                        <label for="FinalSolution">Cotrol Line Path</label><br>
                    </td>
                    <td class="InputOption" >
                        <input type="radio" name="SolutionType" value="5" class="SolutionTypeA" >
                        <label for="FinalSolution">Delete Line</label><br>
                    </td>
                </tr>
              
                <tr>
                   <td style="width:100%" colspan="3">
                        
                        <input   id="btnCreateC" type="button" value="Reset Graph " onclick="ResetGraph();" class="MatrixOrder" style="width:1000px"/>
                    </td>
                </tr>
                  
            </table>
        </div>
        
    <svg width="1000" height="400"  onmouseup="GenrateCircle(event)" id="iCanvas" >
          <rect x="0" y="0" width="1000" height="400"  style="fill:blue;stroke:pink;stroke-width:5;fill-opacity:0.1;stroke-opacity:0.9" />
    </svg>
        <table>
            <tr>
                <td colspan="3">
                    <input  class="CTestYourSelf" id="btnCreateA" type="button" value="Solve " onclick="FindHamiltonian();" />
                </td>
            </tr>
            
       </table>
        <div id="MatrixArea">
           
        </div>
          <div>
            <table id="NextPrevious" >
            <tr>
                <td>
                    <input  class="CTestNextPrev" id="btPrev" type="button" value="Previous " onclick="GenerateNextPrevMatrix(-1);" />
                </td>
                <td>
                    
                    
                </td>
                <td>
                    <input  class="CTestNextPrev" id="btnext" type="button" value="Next " onclick="GenerateNextPrevMatrix(1);" />
                </td>

            </tr>
            </table>
        </div>
    </body>
</asp:Content>

