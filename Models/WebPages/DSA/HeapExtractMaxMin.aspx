<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/DesignAlgo.Master" AutoEventWireup="true" CodeBehind="HeapExtractMaxMin.aspx.cs" Inherits="HeapExtractMaxMin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/SortingAlgo.css" />
    <link href="../../Css/LatestCommon.css" rel="stylesheet" />
    <script type="text/javascript" src="../../JavaScript/Jquery.js"></script>
    
    <script>

        let SortingNum = "";
        function SetLastNumber(Values)
        {
            //for (k = 0; k < 10; k++)
            //{ 
                
            //}
            SortingNum = Values;
           
        }
        function SetLast_Number(va)
        {
           
            document.getElementById('txtNumberForSorting').value = SortingNum;
        }
        function GenerateHeapMatrix() {
            let MatrixArea;
            let QuestionId = 0;
            let sSortingNumbers = 0;


            sSortingNumbers = document.getElementById('txtNumberForSorting').value;
            MatrixArea = document.getElementById('MatrixHeapArea');
            let SolutionType = $('.SolutionTypeA:checked').val();
            document.getElementById('MatrixArea').innerHTML="";
            document.getElementById('btnCreate').hidden = false;
            if (SolutionType == 1)
                document.getElementById('btnCreate').value = "Extract Max Value";
            else
                document.getElementById('btnCreate').value = "Extract Min Value";

            //alert(QuestionId);

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/DSA/HeapExtractMaxMin.aspx/GenerateHeapMatrix") %>';

              var xhttp = new XMLHttpRequest();


              xhttp.open("POST", pageUrl, true);

              xhttp.setRequestHeader("Content-type", "application/json");

              const JsonInput =
              {
                  sSortingNumbers: "",
                  sSolutionType: "",

              };

              JsonInput.sSortingNumbers = sSortingNumbers;
              JsonInput.iSolutionType = SolutionType;
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
        function GenerateMatrixBucket(Values)
        {
            document.getElementById('txtNumberForSorting').value = Values;
            GenerateMatrix('txtNumberForSorting');

        }
        function GenerateMatrix(id)
        {
            let MatrixArea;
            let QuestionId = 0;
            let sSortingNumbers = 0;

         
            sSortingNumbers = document.getElementById(id).value;
            MatrixArea = document.getElementById('MatrixArea');
            let SolutionType = $('.SolutionTypeA:checked').val();
    
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/DSA/HeapExtractMaxMin.aspx/GenerateMatrix") %>';
            var xhttp = new XMLHttpRequest();

            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");
            xhttp.setRequestHeader("Content-Length", "1000000000");


            const JsonInput = {
                sSortingNumbers: "",
                sSolutionType: "",
            };

            JsonInput.sSortingNumbers = sSortingNumbers;
            JsonInput.sSolutionType = SolutionType;

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
            <h1 class="PageNameHeading">Extract MAXIMUM OR MINIMUM element from HEAP </h1>
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
                        <label class="InputID">Enter atleast 2 Numbers For Sorting with comma Sepration like(23,36,45..) </label>
                    </td>
                    <td colspan="2">

                        <input id="txtNumberForSorting" type="text" name="txtMatrixOrder"  class="MatrixOrder" />
                        

                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
             <tr>
                <td colspan ="3"  class="InputID"> 
                         <p class="InputID">HEAP TYPE:</p>
                        <input type="radio" name="SolutionType" value="1" checked="true" class="SolutionTypeA">
                        <label for="StepWise">Max Heap</label><br>
                        <input type="radio" name="SolutionType" value="2" class="SolutionTypeA">
                        <label for="FinalSolution">Min Heap</label><br>
                </td>
             </tr>
                 <tr>
                    <td colspan="3">

                        <input  class="CTestYourSelf" id="btnCreateHeap" type="button" value="Create Heap Tree " onclick="GenerateHeapMatrix();" />
                        </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                  <tr>
                    <td colspan="3"><div id="MatrixHeapArea"></div></td>

                 </tr>
                  <tr>
                    <td colspan="3">

                        <input  class="CTestYourSelf" id="btnCreate" type="button" hidden="hidden" value="Solve " onclick="GenerateMatrix('txtNumberForSorting');" />
                        </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
            </table>
        </div>

        <div  id="MatrixArea">
            
        </div>
    </body>
</asp:Content>
