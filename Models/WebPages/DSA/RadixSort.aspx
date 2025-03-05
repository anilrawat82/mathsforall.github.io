<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/DesignAlgo.Master" AutoEventWireup="true" CodeBehind="RadixSort.aspx.cs" Inherits="RadixSort" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link href="../../Css/LatestCommon.css" rel="stylesheet" />
     <link type="text/css" rel="stylesheet" href="../../Css/NewSortingAlgo.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/NewMatrix.css" />
     <script>
         let SortingNum = "";
         function SetLastNumber(Values) {
             SortingNum = Values;
         }
         function SetLast_Number(va) {
             document.getElementById('txtNumberForSorting').value = SortingNum;
         }
         function GenerateMatrix(id) {
             let MatrixArea;
             let QuestionId = 0;
             let sSortingNumbers = 0;

             if (id == "txtNumberForSorting") {
                 sSortingNumbers = document.getElementById(id).value;
                 MatrixArea = document.getElementById('MatrixArea');

             }

             //alert(QuestionId);

             var pageUrl = '<%= ResolveUrl("~/Models/WebPages/DSA/RadixSort.aspx/GenerateMatrix") %>';

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
            <h1 class="PageNameHeading">RADIX SORT</h1>
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
                    <td colspan="3">

                        <input  class="CTestYourSelf" id="btnCreate" type="button" value="Solve " onclick="GenerateMatrix('txtNumberForSorting');" />
                        </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                  </tr>
            </table>
        </div>



        <div id="MatrixArea" class="BackGround">
        </div>
       
     


    </body>
</asp:Content>
