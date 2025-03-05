<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/NumericalAnalysis.Master" AutoEventWireup="true" CodeBehind="GraeffeMethod.aspx.cs" Inherits="GraeffeMethod" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/LatestCommon.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/MatrixAnalysis.css" />   
    
    <script type="text/javascript" src="../../JavaScript/NumericalAnalysis.js"></script>
    <script>
        let LastEquation = "";
        function SetLastEquation(Values) {
            LastEquation= Values;
        }

        function SetLast_Equation(va) {
            document.getElementById('txtEquation').value = LastEquation;
        }

    function GenerateMatrix(id)
        {
            let MatrixArea;
            
            let stxtEquation = 0;
            let stxtFirstV = 0;
            let stxtSecondV = 0;
            MethodType = 1;

            if (id == "txtEquation")
            {
                stxtEquation= document.getElementById(id).value;
                MatrixArea = document.getElementById('MatrixArea');
                
            }
           
            //alert(QuestionId);

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/NumericalAnalysis/GraeffeMethod.aspx/GenerateMatrix") %>';

              var xhttp = new XMLHttpRequest();


              xhttp.open("POST", pageUrl, true);

              xhttp.setRequestHeader("Content-type", "application/json");

              const JsonInput = {
                  sEquation: "",
              };

            JsonInput.sEquation = stxtEquation;

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
         <div>
            <h1 class="PageNameHeading">Graeffe's Root Squaring Method</h1>
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
                        <label class="InputID">Enter Function or Equation </label>
                    </td>
                    <td colspan="2">
                        <input id="txtEquation" type="text" name="txtMatrixOrder"  class="MatrixOrder" />
                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
             
                  <tr>
                    <td colspan="3">
                        <input  class="CTestYourSelf" id="btnCreate" type="button" value="Solve " onclick="GenerateMatrix('txtEquation');" />
                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                        

            </table>
        </div>

        <div id="MatrixArea">
        </div>
        </body>
</asp:Content>
