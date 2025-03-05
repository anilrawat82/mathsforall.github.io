<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="Statistics2Mode.aspx.cs" Inherits="Statistics2Mode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/NumericalAnalysis.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/MatrixAnalysis.css" />
    <link href="../../Css/LatestCommon.css" rel="stylesheet" />
    <script type="text/javascript" src="../../JavaScript/NumericalAnalysis.js"></script>
    <script type="text/javascript" src="../../JavaScript/Jquery.js"></script>
    <script>
        function GenerateTableFB() {
            LastRow = -1;
            LastCol = -1;
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Class10/Statistics2Mode.aspx/GenerateModeTable") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");
            

            const JsonInput = {
                sMatrixValue: "",
                iType: "",
            };
            let TableType = $('.SolutionTypeA:checked').val();
            JsonInput.iType = Number(TableType);
            
            ColumnSize = 2;
            
            GetMatrixValues2();
            
            JsonInput.sMatrixValue = sValues;
            
            const jsonString = JSON.stringify(JsonInput);
            xhttp.onload = function () {
                if (this.status == 200) {

                    let myArr = JSON.parse(xhttp.responseText);
                    str = "";
                    for (key in myArr) {
                        str += myArr[key];
                    }
                    document.getElementById('MatrixArea1').innerHTML = str;
                    
                }
                else {
                    alert("error Now");
                }
            }
            xhttp.send(jsonString);
        }
        function GenerateMatrix(id) {
            let MatrixArea;

            let stxtInputs = 0;


            if (id == "txtIput") {
                stxtInputs = document.getElementById(id).value;
                MatrixArea = document.getElementById('MatrixArea');
            }

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Class10/Statistics2Mode.aspx/GenerateMatrix") %>';
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");
            let TableType = $('.SolutionTypeA:checked').val();
            const JsonInput = {
                sInputs: "",
                iType: "",
            };

            MaxArraySize = Number(stxtInputs);
            JsonInput.sInputs = stxtInputs;
            JsonInput.iType = Number(TableType);
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
            <h1 class="PageNameHeading">Mode of Grouped Data</h1>
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
                    <td>
                        <label class="InputID">Enter Total Intervals Count</label>
                    </td>
                    <td colspan="2">
                        <input id="txtIput" type="number" name="txtMatrixOrder"  class="MatrixOrder" />
                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                 <tr class="AnswerTable">
                <td  class="InputIDSelection"> 
                        <label class="InputIDSelection">Select Data Type </label>
                </td>
                <td   class="InputIDSelection"> 
                    <input type="radio"  name="SolutionType" value="1" checked="true" class="SolutionTypeA">
                    <label for="Forward">Single Value</label><br>
                </td>

                <td class="InputIDSelection"> 
                    <input type="radio"  name="SolutionType" value="2" class="SolutionTypeA">
                    <label for="BackWard">Class-Interval</label><br>  
                </td>
            </tr>  
         
                
                        
            <tr>
                <td colspan="3">
                    <input  class="CTestYourSelf" id="btnCreate" type="button" value="Generate Input Values Matrix " onclick="GenerateMatrix('txtIput');" />
                </td>
            </tr>        

            </table>
        </div>
        <div id="MatrixArea" class="BackGround">
       </div>
        <table hidden  id="SolveTable">
             <tr>
                <td colspan="4"><input id="btnSolve"  class="CTestYourSelf"  type="button" value="FIND THE MEAN" onclick="GenerateTableFB();" />
                </td>
            </tr>
        </table>
         
        <div id="MatrixArea1" class="BackGround">
        </div>
        </body>
</asp:Content>

