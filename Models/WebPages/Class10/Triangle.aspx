<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="Triangle.aspx.cs" Inherits="Triangle" %>
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
            
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Class10/Triangle.aspx/GenerateMatrix") %>';
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
    <div id="MatrixArea" class="AnswerTable">            
    </div>
    </body>
</asp:Content>
