<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/DesignAlgo.Master" AutoEventWireup="true" CodeBehind="MergBinomialHeap.aspx.cs" Inherits="MergBinomialHeap" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
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

        function GenerateMergeMatrix(MatrixArea_, ArrayId)
        {
            let MatrixArea;

            MatrixArea = document.getElementById(MatrixArea_);
            //alert(QuestionId);

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/DSA/MergBinomialHeap.aspx/GenerateMatrix") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const JsonInput = {
                sSortingNumbers: "",
                iArrayId: "",
            };

            JsonInput.sSortingNumbers = "";
            JsonInput.iArrayId = Number(ArrayId);


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
        function GenerateMatrix(id,MatrixArea_,ArrayId)
        {
            let MatrixArea;
            let QuestionId = 0;
            let sSortingNumbers = 0;

         
            sSortingNumbers = document.getElementById(id).value;
            MatrixArea = document.getElementById(MatrixArea_);
            //alert(QuestionId);

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/DSA/MergBinomialHeap.aspx/GenerateMatrix") %>';

              var xhttp = new XMLHttpRequest();


              xhttp.open("POST", pageUrl, true);

              xhttp.setRequestHeader("Content-type", "application/json");

              const JsonInput = {
                  sSortingNumbers: "",
                  iArrayId: "",
              };

            JsonInput.sSortingNumbers = sSortingNumbers;
            JsonInput.iArrayId = Number(ArrayId);


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
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <body>
        <div>
            <h1 class="PageNameHeading">MERGE BINOMIAL HEAP </h1>
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
                    <td colspan="2" >

                        <input id="txtNumberForSortingA" type="text" name="txtMatrixOrder"  class="MatrixOrder" style="width:600px" />
                        

                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
            
                  <tr>
                    <td colspan="3">

                        <input  class="CTestYourSelf" id="btnCreateA" type="button" value="Generate First Heap " onclick="GenerateMatrix('txtNumberForSortingA','MatrixAreaA','0');" />
                        </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                <tr>
                    <td colspan ="3">
                        <div id="MatrixAreaA"></div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="InputID">Enter Numbers comma Sepration like(23,36,45..) </label>
                    </td>
                    <td colspan="2">

                        <input id="txtNumberForSortingB" type="text" name="txtMatrixOrder"  class="MatrixOrder"  style="width:600px" />
                        

                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
            
                  <tr>
                    <td colspan="3">

                        <input  class="CTestYourSelf" id="btnCreateB" type="button" value="Generate Second Heap " onclick="GenerateMatrix('txtNumberForSortingB','MatrixAreaB','1');" />
                        </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                <tr>
                    <td colspan ="3">
                        <div id="MatrixAreaB"></div>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">

                        <input  class="CTestYourSelf" id="btnCreateC" type="button" value="Merge Both Heap " onclick="GenerateMergeMatrix('MatrixArea', '2');" />
                        </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
            </table>
        </div>

        <div id="MatrixArea">
        </div>
    </body>
</asp:Content>
