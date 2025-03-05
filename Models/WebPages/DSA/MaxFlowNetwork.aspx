<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/DesignAlgo.Master" AutoEventWireup="true" CodeBehind="MaxFlowNetwork.aspx.cs" Inherits="MaxFlowNetwork" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />

    <link type="text/css" rel="stylesheet" href="../../Css/SortingAlgo.css" />
    <link href="../../Css/LatestCommon.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../Css/MasterPage.css" />
    <script type="text/javascript" src="../../JavaScript/NetworkFlow.js"></script>
    <script type="text/javascript" src="../../JavaScript/Jquery.js"></script>
    <script>
        function ResetGraph() {
            let MatrixArea;
            MatrixArea = document.getElementById('iCanvas');
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/DSA/MaxFlowNetwork.aspx/ResetGraph") %>';
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
                if (this.status == 200)
                {

                    let myArr = JSON.parse(xhttp.responseText);
                    str = "";
                    for (key in myArr) {
                        str += myArr[key];
                    }
                    //MatrixArea.innerHTML = str;
                    DrawGraphLine(str);

                }
                else {
                    alert("error Now");
                }
            }


            xhttp.send(jsonString);
        }
        function GenerateFlowDigaram()
        {
            let MatrixArea;
            MatrixArea = document.getElementById('MatrixArea');
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/DSA/MaxFlowNetwork.aspx/GenerateFlowDigaram") %>';
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
                    DrawSolver(str);
                   // MatrixArea.innerHTML = str;

                }
                else {
                    alert("error Now");
                }
            }


            xhttp.send(jsonString);

        }
        function AddSourceSink() {

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/DSA/MaxFlowNetwork.aspx/AddSourceSinkElement") %>';

              var xhttp = new XMLHttpRequest();

              xhttp.open("POST", pageUrl, true);

              xhttp.setRequestHeader("Content-type", "application/json");

              const JsonInput = {
                  ip1: "",
                  ip2: "",
              };
            
             
            let MatrixArea = document.getElementById('iCanvas');
            JsonInput.ip1 = Number(document.getElementById('SourcePoint_').value);
            JsonInput.ip2 = Number(document.getElementById('SinkPoint_').value);
            
            const jsonString = JSON.stringify(JsonInput);
            
            xhttp.onload = function () {
                  if (this.status == 200) {

                      let myArr = JSON.parse(xhttp.responseText);
                      str = "";
                      for (key in myArr) {
                          str += myArr[key];
                      }
                      DrawGraphLine(str);
                      //MatrixArea.innerHTML = str;
                   
                  }
                  else
                  {
                      alert("error Now");
                  }
              }
              xhttp.send(jsonString);

          }
        function GenerateMatrix()
        {
        
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/DSA/MaxFlowNetwork.aspx/AddNetworkFlow") %>';

            var xhttp = new XMLHttpRequest();

            MatrixArea = document.getElementById('iCanvas');
            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const JsonInput = {
                ip1: "",
                ip2: "",
                iFR: "",
            };

            JsonInput.ip1 = Number(document.getElementById('FirstPoint_').value);
            JsonInput.ip2 = Number(document.getElementById('SecondPoint_').value);
            JsonInput.iFR = Number(document.getElementById('FlowRate_').value);


            const jsonString = JSON.stringify(JsonInput);



            xhttp.onload = function () {
                if (this.status == 200) {

                    let myArr = JSON.parse(xhttp.responseText);
                    str = "";
                    for (key in myArr) {
                        str += myArr[key];
                    }
                    DrawGraphLine(str);
                    //MatrixArea.innerHTML = str;
                }
                else {
                    alert("error Now");
                }
            }
            xhttp.send(jsonString);

        }
        function GenrateCircle(event)
        {
            let SolutionType = $('.SolutionTypeA:checked').val();
            
            if (SolutionType == 1)
                return;
            let MatrixArea;
            MatrixArea = document.getElementById('iCanvas');
            var x = event.offsetX;
            var y = event.offsetY;
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/DSA/MaxFlowNetwork.aspx/GenerateGraphCircle") %>';
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
            <h1 class="PageNameHeading">MAX FLOW NETWORK</h1>
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
                    <td style="width:300px">
                        <label class="InputID" style="width:200px">First Point</label>
                        <input id="FirstPoint_" type="text" name="txtMatrixOrder"  class="MatrixOrder"  disabled style="width:100px"/>
                    </td>
                    <td style="width:300px">
                        <label class="InputID" style="width:200px">Second Point</label>
                        <input id="SecondPoint_" type="text" name="txtMatrixOrder"  class="MatrixOrder"  disabled style="width:100px"/>
                    </td>
                    
                   <td style="width:400px">
                        <label class="InputID" style="width:200px">Max Flow</label>
                        <input id="FlowRate_" type="text" name="txtMatrixOrder"  class="MatrixOrder" style="width:100px"/>
                        <input   id="btnCreate" type="button" value="Add " onclick="GenerateMatrix();" class="MatrixOrder" style="width:100px"/>
                    </td>
                </tr>--%>
                  <tr>
                    <td style="width:300px">
                        <label class="InputID" style="width:200px">Source Point</label>
                        <input id="SourcePoint_" type="text" name="txtMatrixOrder"  class="MatrixOrder"   style="width:100px"/>
                    </td>
                    <td style="width:300px">
                        <label class="InputID" style="width:200px">Sink Point</label>
                        <input id="SinkPoint_" type="text" name="txtMatrixOrder"  class="MatrixOrder"   style="width:100px"/>
                    </td>
                    
                   <td style="width:400px">
                        
                        <input   id="btnCreateB" type="button" value="Add Source Sink " onclick="AddSourceSink();" class="MatrixOrder" style="width:300px"/>
                    </td>
                </tr>
                <tr>
                    <td class="OptionHead" style="width:100px" colspan="3">
                        <p >Please select any one :</p>
                    </td>
                </tr>
                <tr>
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
                      <tr>
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
                    <td style="width:300px">
                        <label class="InputID" style="width:200px">First Point</label>
                        <input id="FirstPoint_" type="text" name="txtMatrixOrder"  class="MatrixOrder"  disabled style="width:100px"/>
                    </td>
                    <td style="width:300px">
                        <label class="InputID" style="width:200px">Second Point</label>
                        <input id="SecondPoint_" type="text" name="txtMatrixOrder"  class="MatrixOrder"  disabled style="width:100px"/>
                    </td>
                    
                   <td style="width:400px">
                        <label class="InputID" style="width:200px">Max Flow</label>
                        <input id="FlowRate_" type="text" name="txtMatrixOrder"  class="MatrixOrder" style="width:100px"/>
                        <input   id="btnCreate" type="button" value="Add " onclick="GenerateMatrix();" class="MatrixOrder" style="width:100px"/>
                    </td>
                </tr>
                <%--<tr>
                    <td style="width:300px" colspan="3">
                        <p class="InputID">Please select any one :</p>
                        <input type="radio" name="SolutionType" value="1" checked="true" class="SolutionTypeA" >
                        <label for="StepWise">None</label><br>
                        <input type="radio" name="SolutionType" value="2" class="SolutionTypeA" >
                        <label for="FinalSolution">Add Element</label><br>
                        <input type="radio" name="SolutionType" value="3" class="SolutionTypeA" >
                        <label for="FinalSolution">Delete Element</label><br>
                        <input type="radio" name="SolutionType" value="4" class="SolutionTypeA" >
                        <label for="FinalSolution">Add Line</label><br>
                        <input type="radio" name="SolutionType" value="6" class="SolutionTypeA" >
                        <label for="FinalSolution">Cotrol Line Path</label><br>
                        <input type="radio" name="SolutionType" value="5" class="SolutionTypeA" >
                        <label for="FinalSolution">Delete Line</label><br>
                    </td>
                </tr>--%>
                <tr>
                    
                    
                   <td style="width:1000px" colspan="3">
                        
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
                    <input  class="CTestYourSelf" id="btnCreateA" type="button" value="Solve " onclick="GenerateFlowDigaram();" />
                </td>
            </tr>
       </table>
        <div id="MatrixArea">
        </div>
    </body>
</asp:Content>
