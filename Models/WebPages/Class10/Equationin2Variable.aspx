<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="Equationin2Variable.aspx.cs" Inherits="Equationin2Variable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/NumericalAnalysis.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/MatrixAnalysis.css" />
    <link href="../../Css/LatestCommon.css" rel="stylesheet" />
    <script type="text/javascript" src="../../JavaScript/Jquery.js"></script>
    <script>
        function SolveEquations() {
            let FirstEquation = document.getElementById("txtFirstEquation").value;
            let secondEquation = document.getElementById("txtSecondEquation").value;
            var Solution = document.getElementById('MatrixArea');
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Class10/Equationin2Variable.aspx/SolveEquationInTwoVariable") %>';
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", pageUrl, true);
            xhttp.setRequestHeader("Content-type", "application/json");

            const TwoVariableEqn = {
                sEquationA: "",
                sEquationB: "",
                iSolverType: "",
            };

            let SolverType = $('.SolutionTypeA:checked').val();
            TwoVariableEqn.sEquationA = FirstEquation;
            TwoVariableEqn.sEquationB = secondEquation;
            TwoVariableEqn.iSolverType = Number(SolverType);
            const jsonString = JSON.stringify(TwoVariableEqn);

            xhttp.onload = function () {
                if (this.status == 200) {

                    let myArr = JSON.parse(xhttp.responseText);
                    str = "";
                    for (key in myArr) {
                        str += myArr[key];
                    }

                    Solution.innerHTML = str;

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
            <h1 class="PageNameHeading">Algebraic Methods of Solving a pair of Linear Equation</h1>
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
                        <label class="InputID">First Equation</label>
                    </td>
                    <td colspan="3">
                        <input id="txtFirstEquation" type="text" name="txtMatrixOrder"  class="MatrixOrder" />
                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                 <tr>
                    <td>
                        <label class="InputID">Second Equation </label>
                    </td>
                    <td colspan="3">
                        <input id="txtSecondEquation" type="text" name="txtMatrixOrder"  class="MatrixOrder" />
                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>

            </table>
        </div>
        
        
        <table   id="SolveTable">
                
            <tr class="AnswerTable">
                <td  class="InputIDSelection"> 
                       <label class="InputIDSelection">Select  Method </label>
                </td>
                <td   class="InputIDSelection"> 
                    <input type="radio"  name="SolutionType" value="0" checked="true" class="SolutionTypeA">
                    <label for="Forward">Substitution Method</label><br>
                </td>

                <td class="InputIDSelection"> 
                    <input type="radio"  name="SolutionType" value="1" class="SolutionTypeA">
                    <label for="BackWard">Elimination Method</label><br>  
                </td>
                 <td class="InputIDSelection"> 
                    <input type="radio"  name="SolutionType" value="2" class="SolutionTypeA">
                    <label for="BackWard">Cross-Muktiplication Method</label><br>  
                </td>
            </tr>
                  
             <tr>
                <td colspan="4"><input id="btnSolve"  class="CTestYourSelf"  type="button" value="SOLVE THE EQUATION" onclick="SolveEquations();" />
                </td>
            </tr>
        </table>
        <div id="MatrixArea" class="BackGround">           
            
        </div>
        
        </body>
</asp:Content>
