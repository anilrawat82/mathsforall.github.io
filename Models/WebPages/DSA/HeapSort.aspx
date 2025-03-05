<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/DesignAlgo.Master" AutoEventWireup="true" CodeBehind="HeapSort.aspx.cs" Inherits="HeapSort" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     
    <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/SortingAlgo.css" />
    <link href="../../Css/LatestCommon.css" rel="stylesheet" />
    <script type="text/javascript" src="../../JavaScript/Jquery.js"></script>
    
    <script>

        let SortingNum = "";
        function SetLastNumber(Values)
        {
            SortingNum = Values;
           
        }
        function SetLast_Number(va)
        {
            
            document.getElementById('txtNumberForSorting').value = SortingNum;
            
        }

        function GenerateMatrixHeap(Values1, Values2)
        {
            SortingNum = Values1;
            document.getElementById('txtNumberForSorting').value = Values1;
            if (Values2 == 2) {
                document.getElementById('MinCheck').checked = true;
                document.getElementById('MaxCheck').checked = false;
            }
            else
            {
                document.getElementById('MinCheck').checked = false;
                document.getElementById('MaxCheck').checked = true;
            }
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
      
           
            //alert(QuestionId);

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/DSA/HeapSort.aspx/GenerateMatrix") %>';

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
            <h1 class="PageNameHeading">HEAP SORT</h1>
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
                         <p class="InputID">Please select Maximize or Minimize Heap:</p>
                        <input type="radio" name="SolutionType" value="1" checked="true" class="SolutionTypeA" id="MaxCheck">
                        <label for="StepWise">Maximize</label><br>
                        <input type="radio" name="SolutionType" value="2" class="SolutionTypeA" id="MinCheck">
                        <label for="FinalSolution">Minimize</label><br>
                </td>
             </tr>
                  <tr>
                    <td colspan="3">

                        <input  class="CTestYourSelf" id="btnCreate" type="button" value="Solve " onclick="GenerateMatrix('txtNumberForSorting');" />
                        </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
            </table>
        </div>

        <div id="MatrixArea">
        </div>
    </body>
</asp:Content>
