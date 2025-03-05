<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="TangetToCircle.aspx.cs" Inherits="TangetToCircle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/LatestCommon.css" />
    <script type="text/javascript" src="../../JavaScript/Jquery.js"></script>
    <script type="text/javascript" src="../../JavaScript/Geometry.js"></script>
    <script type="text/javascript" src="../../JavaScript/DecimalToFraction.js"></script>
    <script type="text/javascript" src="../../JavaScript/Common.js"></script>
    <link href="../../Css/MatrixAnalysis.css" rel="stylesheet" />
    <link href="../../Css/Trigonometry.css" rel="stylesheet" />
<script>
        function GenerateMatrix() {

            let MatrixArea = document.getElementById('MatrixArea');
            
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Class8/TangetToCircle.aspx/GenerateMatrix") %>';
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", pageUrl, true);
            xhttp.setRequestHeader("Content-type", "application/json");
            const JsonInput =
            {
                sExpressions: "",
            };
            JsonInput.sExpressions = document.getElementById("txtExpressionA").value;
            
            const jsonString = JSON.stringify(JsonInput);
            
            xhttp.onload = function () {
                if (this.status == 200) {

                    let myArr = JSON.parse(xhttp.responseText);
                    str = "";
                    for (key in myArr) {
                        str += myArr[key];
                    }
                    let data = str.split("###");
                    
                    if (data[0] != "")
                    {                        
                        if (ImageLoaded != data[0] && ImageLoaded != "")
                        {
                            let Imagel = document.getElementById('ImageName' + ImageLoaded);
                            Imagel.hidden = true;
                        }
                        ImageLoaded = data[0];
                        let Image = document.getElementById('ImageName' + data[0]);
                        if (data[0] == "1")
                        {
                            UpdateTangentSecant(data[1].toUpperCase());
                        }
                        else if (data[0] == "3" || data[0] == "4")
                        {
                            UpdatePABPCD(data[1].toUpperCase(), data[0]);
                        }
                        Image.hidden = false;
                    }
                    MatrixArea.innerHTML = data[2];

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
            <h1 class="PageNameHeading">Tangent And Secant (Classs VIII) </h1>
        </div>
        <div>
            <table>
                <tr>
                    <td>
                        <label>
                            <h2 class="NameDateScore">Name</h2>
                            <input id="txtName" type="text"  runat="server" name="txtName" class="textName" />
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
                    <td colspan="3">
                       <label class="InputID">Write The statement </label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <input id="txtExpressionA" type="text" name="txtStartNumber" value="PT is a tangent of circle with centre O at point T. A secant passing through P in at Q and R.PQ=12 and PR=3, then PT." class="MatrixOrderStatment" />    
                    </td>
                </tr>
                 <tr>
                    <td colspan="3">
                    <input class="CTestYourSelf" id="btnCreate" type="button" value="Solve " onclick="GenerateMatrix();" />
                    </td>
     
                 </tr>
            </table>
        </div>
        <div id="ImageName1" hidden>
            <svg height="300" width="500">
                <circle r="100" cx="275" cy="150" stroke="black" stroke-width="3" fill="none"></circle>
                <circle r="4" cx="275" cy="150" fill="blue"></circle>
                <line x1="40" y1="225" x2="343" y2="225" style="stroke:black;stroke-width:2"></line>
                <line x1="40" y1="225" x2="210" y2="75" style="stroke:black;stroke-width:2"></line>
                <text id="TangentP1" x="25" y="230" class="SVGTriangleVertexName">P</text>
                <text id="TangentT1" x="180" y="90" class="SVGTriangleVertexName">T</text>
                <text id="SecantA1" x="200" y="250" class="SVGTriangleVertexName">A</text>
                <text id="SecantB1" x="350" y="240" class="SVGTriangleVertexName">B</text>
                <text x="285" y="160" class="SVGTriangleVertexName">O</text>
             </svg>           
        </div>
        <div id="ImageName2" hidden  >
                <svg height="300" width="500">
                <circle r="100" cx="275" cy="150" stroke="black" stroke-width="3" fill="none"></circle>
                <circle r="4" cx="275" cy="150" fill="blue"></circle>
                <line x1="40" y1="225" x2="210" y2="75" style="stroke:black;stroke-width:2"></line>
                <line x1="40" y1="225" x2="275" y2="150" style="stroke:black;stroke-width:2"></line>
                <line x1="208" y1="225" x2="275" y2="150" style="stroke:black;stroke-width:2"></line>
                <line x1="275" y1="225" x2="275" y2="150" style="stroke:black;stroke-width:2"></line>
                <line x1="290" y1="205" x2="275" y2="205" style="stroke:black;stroke-width:2"></line>
                <line x1="290" y1="205" x2="290" y2="225" style="stroke:black;stroke-width:2"></line>           
                <line x1="40" y1="225" x2="343" y2="225" style="stroke:black;stroke-width:2"></line>            
                <text id="TangentP1" x="25" y="230" class="SVGTriangleVertexName">P</text>
                <text id="TangentT1" x="180" y="90" class="SVGTriangleVertexName">T</text>
                <text id="SecantA1" x="200" y="250" class="SVGTriangleVertexName">A</text>
                <text id="SecantB1" x="350" y="240" class="SVGTriangleVertexName">B</text>
                <text x="285" y="160" class="SVGTriangleVertexName">O</text>
                <text x="268" y="245" class="SVGTriangleVertexName">N</text>
            </svg>     
        </div>
        <div id="ImageName3" hidden>
            <svg height="300" width="500">
                <circle r="100" cx="275" cy="150" stroke="black" stroke-width="3" fill="none"></circle>
                <circle r="4" cx="275" cy="150" fill="blue"></circle>
                <line x1="40" y1="150" x2="340" y2="75" style="stroke:black;stroke-width:2"></line>
                <line x1="40" y1="150" x2="340" y2="225" style="stroke:black;stroke-width:2"></line>            
                <text id="TangentP13" x="25" y="150" class="SVGTriangleVertexName">P</text>
                <text id="SecantA13" x="170" y="210" class="SVGTriangleVertexName">A</text>
                <text id="SecantB13" x="350" y="240" class="SVGTriangleVertexName">B</text>
                <text id="SecantA23" x="160" y="110" class="SVGTriangleVertexName">C</text>
                <text id="SecantB23" x="345" y="75" class="SVGTriangleVertexName">D</text>
                <text x="285" y="160" class="SVGTriangleVertexName">O</text>
                
            </svg>     
        </div>
        <div id="ImageName4" hidden>
          <svg height="300" width="500">
              <circle r="100" cx="275" cy="150" stroke="black" stroke-width="3" fill="none"></circle>
              <circle r="4" cx="275" cy="150" fill="blue"></circle>
              <line x1="195" y1="210" x2="340" y2="75" style="stroke:black;stroke-width:2"></line>
              <line x1="185" y1="110" x2="340" y2="225" style="stroke:black;stroke-width:2"></line>            
              <text id="TangentP14" x="245" y="150" class="SVGTriangleVertexName">P</text>
              <text id="SecantA14" x="170" y="210" class="SVGTriangleVertexName">A</text>
              <text id="SecantB14" x="345" y="75" class="SVGTriangleVertexName">B</text>              
              <text id="SecantA24" x="160" y="110" class="SVGTriangleVertexName">C</text>
              <text id="SecantB24" x="350" y="240" class="SVGTriangleVertexName">D</text>
              <text x="285" y="160" class="SVGTriangleVertexName">O</text>          
          </svg>     
     </div>
    <div id="MatrixArea" class="AnswerTable">            
    </div>
    </body>
</asp:Content>
