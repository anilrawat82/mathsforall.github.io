<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/DesignAlgo.Master" AutoEventWireup="true" CodeBehind="BinomialHeapFull.aspx.cs" Inherits="BinomialHeapFull" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/SortingAlgo.css" />
    <link href="../../Css/LatestCommon.css" rel="stylesheet" />
    <script type="text/javascript" src="../../JavaScript/Jquery.js"></script>
    
    <script>
        function GenerateHeapSolution(Values) {
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
            //alert(QuestionId);

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/DSA/BinomialHeapFull.aspx/GenerateMatrix") %>';

              var xhttp = new XMLHttpRequest();


              xhttp.open("POST", pageUrl, true);

              xhttp.setRequestHeader("Content-type", "application/json");

              const JsonInput = {
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
                      alert("error Now" + this.status);
                  }
              }


              xhttp.send(jsonString);


          }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <body>
        <div>
            <h1 class="PageNameHeading">BINOMIAL TREE</h1>
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
                        <label class="InputID">Enter Numbers of element in Power 2 Like 2<sup>1</sup> ,2<sup>2</sup>,2<sup>3</sup> i.e(2,4,8 upto 16) .Given input box has 4 elemets</label>
                    </td>
                    <td colspan="2">

                        <input id="txtNumberForSorting" type="text" name="txtMatrixOrder"  class="MatrixOrder" value="3,6,15,34" /> 
                        

                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
            
                  <tr>
                    <td colspan="3">

                        <input  class="CTestYourSelf" id="btnCreate" type="button" value="Solve " onclick="GenerateMatrix('txtNumberForSorting');" />
                        </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                 <tr>
                    <td colspan="3">

                        <h1>Rules for making Binomial Tree</h1>
                        <h2>Initally all Element are set to B<sub>0</sub> where 0 denote children of root  </h2>
                        <h3>1 Only Tree with same number of child can be merge like   B<sub>0</sub> with B<sub>0</sub> ,or B<sub>2</sub> with B<sub>2</sub>   so on </h3>
                        <h3>2 Rule for merging is that tree with minimum root will become parent of other ,other tree will become <b><u>left most child </u> </b> </h3>
                        <h3>3 Rule merging  will start from right to left </h3>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
            </table>
        </div>

        <div id="MatrixArea">
        </div>
    </body>
</asp:Content>
