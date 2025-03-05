<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/DesignAlgo.Master" AutoEventWireup="true" CodeBehind="KnapsackProblem.aspx.cs" Inherits="KnapsackProblem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/SortingAlgo.css" />
    <link href="../../Css/LatestCommon.css" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="../../Css/DynamicP.css" />
    <script type="text/javascript" src="../../JavaScript/Jquery.js"></script>
    <script type="text/javascript" src="../../JavaScript/GreedyAlgo.js"></script>
    <script type="text/javascript" src="../../JavaScript/KnapSackProb.js"></script>

 <script>
     function FillMatrix(value)
     {
         let SolutionType = $('.SolutionTypeA:checked').val();
         if (SolutionType == 1) {
             StepBySolution(value);
         }
         else {
             var pageUrl = '<%= ResolveUrl("~/Models/WebPages/DSA/KnapsackProblem.aspx/GenerateMatrixValues") %>';
             var xhttp = new XMLHttpRequest();

             xhttp.open("POST", pageUrl, true);

             xhttp.setRequestHeader("Content-type", "application/json");

             const JsonInput = {
                 RightLeftId: "",
             };
             JsonInput.RightLeftId = Number(value);

             const jsonString = JSON.stringify(JsonInput);
             xhttp.onload = function ()
             {
                 if (this.status == 200) {

                     let myArr = JSON.parse(xhttp.responseText);
                     str = "";
                     for (key in myArr) {
                         str += myArr[key];
                     }
                     
                     document.getElementById("StepSolution").innerHTML = str.split("@@@")[0];
                     let stra = str.split("@@@")[1].split(":");
                     document.getElementById("Matrix_" + stra[0] + "_" + stra[1]).innerHTML = stra[2];
                     if (JsonInput.RightLeftId == -1)
                     {
                         document.getElementById("Matrix_" + stra[3] + "_" + stra[4]).innerHTML = stra[5];
                     }
                     
                 }
                 else {
                     alert("error Now");
                 }
             }
             xhttp.send(jsonString);
         }
     }

     function SolveKnapSackP()
     {
         var pageUrl = '<%= ResolveUrl("~/Models/WebPages/DSA/KnapsackProblem.aspx/SolveKnapSack") %>';

      var xhttp = new XMLHttpRequest();

        let SolutionType = $('.SolutionTypeA:checked').val();
      xhttp.open("POST", pageUrl, true);

      xhttp.setRequestHeader("Content-type", "application/json");

      const JsonInput = {
          sMatrixValue: "",
          MaxWeight: "",
          iProlemType: "",
      };
      GetMatrixValues();

      JsonInput.sMatrixValue = sValues;
        JsonInput.MaxWeight = Number(document.getElementById('txtMaxWeight').value);
        JsonInput.iProlemType = Number(SolutionType);

      MaxWeight = JsonInput.MaxWeight;

      const jsonString = JSON.stringify(JsonInput);
      xhttp.onload = function () {
          if (this.status == 200) {

              let myArr = JSON.parse(xhttp.responseText);
              str = "";
              for (key in myArr) {
                  str += myArr[key];
              }
              
              if (SolutionType == 2)
              {
                  //0-1 type
                  document.getElementById('solutionTable').innerHTML = str;
              }
              else
              {
                  //fractioal type
                FinalSolution(str);
                document.getElementById('solutionTable').innerHTML = FirstPart + "</table>";
              }
              
              
              document.getElementById('NextPrevious').hidden = false;

          }
          else {
              alert("error Now");
          }
      }
      xhttp.send(jsonString);
  }
     function GenerateMatrix()
     {
        let MatrixArea;
        let sSortingNumbers = 0;
        sArraySize= document.getElementById('txtArraySize').value;
        MatrixArea = document.getElementById('MatrixArea');
        var pageUrl = '<%= ResolveUrl("~/Models/WebPages/DSA/KnapsackProblem.aspx/GenerateMatrix") %>';

        var xhttp = new XMLHttpRequest();


         xhttp.open("POST", pageUrl, true);

         xhttp.setRequestHeader("Content-type", "application/json");

         const JsonInput = {
             sArraySizes: "",
         };

         JsonInput.sArraySizes = Number(sArraySize);
         MaxArraySize = Number(sArraySize);
         const jsonString = JSON.stringify(JsonInput);
         xhttp.onload = function () {
             if (this.status == 200) {

                 let myArr = JSON.parse(xhttp.responseText);
                 str = "";
                 for (key in myArr) {
                     str += myArr[key];
                 }
                 document.getElementById('KnapSackProbType').hidden = false;
                 
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
            <h1 class="PageNameHeading"> Knapsack Problem</h1>
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
                    <td>
                        <label class="InputID">Enter the array size</label>
                    </td>
                    <td colspan="2">

                        <input id="txtArraySize" type="text" name="txtMatrixOrder"  class="MatrixOrder" />
                        

                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                  <tr>
                    <td colspan="3">

                        <input  class="CTestYourSelf" id="btnCreate" type="button" value="Generate Table " onclick="GenerateMatrix();" />
                        </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
            </table>
        </div>

        <div id="MatrixArea">
        </div>
         <div id="KnapSackProbType" hidden>
             <table>
                    <tr>
                        <td class="OptionHead" style="width:100px">
                            <p >Please select any one :</p>
                        </td>
                    </tr>

                    <tr>
                        <td class="InputOption" >
                        <input type="radio" name="SolutionType" value="1" checked="true" class="SolutionTypeA" >
                        <label for="StepWise">Fractional Type</label><br>
                        </td>
                        </tr>
                 <tr>
                        <td class="InputOption" >
                        <input type="radio" name="SolutionType" value="2" class="SolutionTypeA" >
                        <label for="FinalSolution">Zero-one Type</label><br>
                        </td>
                    
                    </tr>
            </table>
         </div>
         <table hidden  id="SolveTable">
             <tr>
                <td><input id="btnSolve"  class="CTestYourSelf"  type="button" value="Solve" onclick="SolveKnapSackP();" />
                </td>
            </tr>
        </table>
        <div id="solutionTable">
        </div>
         <div>
             <table id="StepSolution" >

            </table>
         </div>
          <div>
            <table id="NextPrevious" hidden>
            <tr>
                <td>
                    <input  class="CTestNextPrev" id="btPrev" type="button" value="Previous " onclick="FillMatrix(-1);" />
                </td>
                <td>
                    
                </td>
                <td>
                    <input  class="CTestNextPrev" id="btnext" type="button" value="Next " onclick="FillMatrix(1);" />
                </td>

            </tr>
            </table>
        </div>
       
         
     


    </body>
</asp:Content>

