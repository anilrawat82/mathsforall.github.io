<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/DesignAlgo.Master" AutoEventWireup="true" CodeBehind="BinomialHeapModifyElement.aspx.cs" Inherits="BinomialHeapModifyElement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/SortingAlgo.css" />
    <link href="../../Css/LatestCommon.css" rel="stylesheet" />
    <script type="text/javascript" src="../../JavaScript/Jquery.js"></script>
    
    <script>

        let SortingNum = "";
        function GenrateModifyElement(value)
        {
            let myArr = value.split("_");
            document.getElementById('rModifiy').checked = true;
            document.getElementById('txtNumberForSortingA').value = myArr[1];
            document.getElementById('txtNumberForSortingB').value = myArr[2];
            document.getElementById('txtNumberForSorting').value = myArr[0];
            EnabeleDisableText();
            GenerateHeapMatrix();
            GenerateMatrix("HI");
         
        }
        function EnabeleDisableText()
        {
            let SolutionType = $('.SolutionTypeZ:checked').val();
            let a = true;
            let b = true;
            let c = true;
            let d = true;

            if (SolutionType == 1)
            {
                c = false;
            }
            if (SolutionType == 2) {
                d = false;

            }
            if (SolutionType == 3)
            {
                a = false;
                b = false;
            }
          
                document.getElementById('txtNumberForSortingA').disabled = a;
                document.getElementById('txtNumberForSortingB').disabled = b;
                document.getElementById('txtNumberForSortingC').disabled = c;
                document.getElementById('txtNumberForSortingD').disabled = d;
            
            
        }
        function SetLastNumber(Values)
        {
            
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
            document.getElementById('MatrixArea').innerHTML = "";

            //alert(QuestionId);

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/DSA/BinomialHeapModifyElement.aspx/GenerateHeapMatrix") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");
            
            const JsonInput =
            {
                sSortingNumbers: "",
             
            };

            JsonInput.sSortingNumbers = sSortingNumbers;
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
        function GenerateMatrix(id)
        {
            let MatrixArea;
            MatrixArea = document.getElementById('MatrixArea');
            let SolutionType = $('.SolutionTypeZ:checked').val();

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/DSA/BinomialHeapModifyElement.aspx/GenerateMatrix") %>';

              var xhttp = new XMLHttpRequest();


              xhttp.open("POST", pageUrl, true);

              xhttp.setRequestHeader("Content-type", "application/json");
              


            const JsonInput = {
                  iSelectedType: "",
                  iCurrentValue: "",
                  iModifyValue: "",

            };
            JsonInput.iSelectedType = SolutionType;
            if (SolutionType == 1)
                JsonInput.iCurrentValue = Number(document.getElementById('txtNumberForSortingC').value);
            else if (SolutionType == 2)
                JsonInput.iCurrentValue = Number(document.getElementById('txtNumberForSortingD').value);
            else
                JsonInput.iCurrentValue = Number(document.getElementById('txtNumberForSortingA').value);

                JsonInput.iModifyValue = Number(document.getElementById('txtNumberForSortingB').value);


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
     <body onload="SetLast_Number('hi')">
        <div>
            <h1 class="PageNameHeading">Add,Delete or Modify element from HEAP </h1>
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
                        <label class="InputID">Enter Numbers with comma Sepration like(23,36,45..) </label>
                    </td>
                    <td colspan="2">
                        <input id="txtNumberForSorting" type="text" name="txtMatrixOrder"  class="MatrixInput"  />
                    </td>
                </tr>
            
             
           
                <tr>
                    <td colspan="3">

                        <input  class="CTestYourSelf" id="btnCreateHeap" type="button" value="Create Binomial Heap " onclick="GenerateHeapMatrix();" />
                        </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                  <tr>
                    <td colspan="3"><div id="MatrixHeapArea"></div></td>

                 </tr>
               <tr>
                   <td colspan ="1"  class="InputID"> 
                       <input type="radio" name="SolutionTypeY" value="1" checked="true" class="SolutionTypeZ" onclick="EnabeleDisableText();">
                        <label for="StepWise">INSERT ELEMENT</label><br>
                   </td>
                   <td colspan ="2"  class="InputID"> 
                       <label class="InputID">New Element</label>
                        <input id="txtNumberForSortingC" type="text" name="txtMatrixOrder"  class="MatrixOrder"  />
                   </td>
                 </tr>
                <tr>
                    <td colspan ="1"  class="InputID"> 
                        
                        <input type="radio" name="SolutionTypeY" value="2" class="SolutionTypeZ" onclick="EnabeleDisableText();">
                        <label for="FinalSolution">DELETE ELEMENT</label><br>
                        
                    </td>
                    <td colspan ="2"  class="InputID">
                        <label class="InputID">Current Element</label>
                        <input id="txtNumberForSortingD" type="text" name="txtMatrixOrder"  class="MatrixOrder" disabled />
                    </td>
                </tr>
                 <tr>
                     <td class="InputID">
                        <input type="radio" name="SolutionTypeY" value="3" class="SolutionTypeZ" onclick="EnabeleDisableText();" id="rModifiy">
                        <label for="FinalSolution">MODIFY ELEMENT</label><br>
                      </td>
                     <td>
                         <label class="InputID">Current Element</label>
                        <input id="txtNumberForSortingA" type="text" name="txtMatrixOrder"  class="MatrixOrder" disabled />
                     </td>
                     <td>
                         <label class="InputID">New Element</label>
                        <input id="txtNumberForSortingB" type="text" name="txtMatrixOrder"  class="MatrixOrder" disabled />
                     </td>
                </tr>
               <%-- <tr>
               <td colspan ="3"  class="InputID"> 
                        <p class="InputID">HEAP TYPE:</p>
                        <input type="radio" name="SolutionTypeY" value="1" checked="true" class="SolutionTypeZ" onclick="EnabeleDisableText();">
                        <label for="StepWise">INSERT ELEMENT</label><br>
                        <input type="radio" name="SolutionTypeY" value="2" class="SolutionTypeZ" onclick="EnabeleDisableText();">
                        <label for="FinalSolution">DELETE ELEMENT</label><br>
                        <input type="radio" name="SolutionTypeY" value="3" class="SolutionTypeZ" onclick="EnabeleDisableText();">
                        <label for="FinalSolution">MODIFY ELEMENT</label><br>
                        <label class="InputID">Current Element</label>
                        <input id="txtNumberForSortingA" type="text" name="txtMatrixOrder"  class="MatrixOrder" disabled />
                        <label class="InputID">New Element</label>
                        <input id="txtNumberForSortingB" type="text" name="txtMatrixOrder"  class="MatrixOrder" disabled />
                </td>
             </tr>--%>
                  <tr>
                    <td colspan="3">

                        <input  class="CTestYourSelf" id="btnCreate" type="button" value="Solve " onclick="GenerateMatrix();" />
                        </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
            </table>
        </div>

        <div id="MatrixArea">
        </div>
    </body>
</asp:Content>