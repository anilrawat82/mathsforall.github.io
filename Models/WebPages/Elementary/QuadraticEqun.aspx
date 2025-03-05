<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="QuadraticEqun.aspx.cs" Inherits="QuadraticEqun" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/NumericalAnalysis.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/MatrixAnalysis.css" />
    <link href="../../Css/LatestCommon.css" rel="stylesheet" />
    <script type="text/javascript" src="../../JavaScript/Elementary.js"></script>
    <script>
        function SubmitAnswer() {
            

            let MatrixArea = document.getElementById('MatrixArea');
            let QuadString_ = document.getElementById('txtQuadratic').value;
            
            
            
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Elementary/QuadraticEqun.aspx/GetSubmitAnswer") %>';

              var xhttp = new XMLHttpRequest();


              xhttp.open("POST", pageUrl, true);

              xhttp.setRequestHeader("Content-type", "application/json");

              const Matrix = {
                  QuadExpression: "",
               };


            Matrix.QuadExpression = QuadString_;
            

            const jsonString = JSON.stringify(Matrix);

            

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
            <h1 class="PageNameHeading">Quadratic Equation </h1>
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
                        <label class="InputID">Quadratic Expression (AX<sup>2</sup>+BX+C=0) <b>For Square Use ^ like x^2</b></label>
                    </td>
                    <td colspan="2">
                        <input id="txtQuadratic" type="text" name="txtMatrixOrder" value="6X^2-X-3.125=-8/9X^2" class="MatrixOrder" />
                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                
                 
                <tr>
                    <td colspan="3">
                        
                        
                        
                        <input id="Button1" type="button" value="Create " onclick="SubmitAnswer();" />
                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>




            </table>
        </div>
        <div id="MatrixArea" class="BackGround">
        </div>
    </body>
</asp:Content>
