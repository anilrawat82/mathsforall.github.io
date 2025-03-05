<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="TrigoWithSpecificAngle.aspx.cs" Inherits="TrigoWithSpecificAngle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="../../JavaScript/Common.js"></script>
    <link type="text/css" rel="stylesheet" href="../../Css/Trigonometry.css" />  
    <link type="text/css" rel="stylesheet" href="../../Css/LatestCommon.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/DivisionExpression.css" />
    
    <script>
        function SolveIt() {

            let MatrixArea = document.getElementById('MatrixArea');
            let sExpress = document.getElementById('txtExpression').value;
            if (sExpress == "")
                return;
            
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Class10/TrigoWithSpecificAngle.aspx/SolveTheExpression") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const JsonInput = {
                sExpression: "",

            };

            JsonInput.sExpression = sExpress;
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
     <div id="PrintThisPage">
        <div>
            <h1 class="PageNameHeading">Trignometry Ratios of Some Specific Angles</h1>
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
            </table>

            <table class="TrSpecificTable" >
                <tr class="TrSpecificTableMainHeader">
                    <th colspan ="6">
                       We shall now give the values of all the Trigonometry  ratio for 0°,30°,45°,60°,90° in below table for your references
                    </th>
                    
                </tr>
                <tr class ="TrSpecificTableHeader">
                    <td>∠A</td>
                    <td>0°</td>
                    <td>30°</td>
                    <td>45°</td>
                    <td>60°</td>
                    <td>90°</td>
                </tr>
                 <tr class="TrSpecificTableData1">
                    <td>sin A</td>
                    <td>0</td>
                    <td>1/2</td>
                    <td>1/√2</td>
                    <td>√3/2</td>
                    <td>1</td>
                </tr>
                 <tr class="TrSpecificTableData2">
                    <td>cos A</td>
                    <td>1</td>
                    <td>√3/2</td>
                    <td>1/√2</td>
                    <td>1/2</td>
                    <td>0</td>
                </tr>
                 <tr class="TrSpecificTableData1">
                    <td>tan A</td>
                    <td>0</td>
                    <td>1/√3</td>
                    <td>1</td>
                    <td>√3</td>
                    <td>Not Defined</td>
                </tr>
                 <tr class="TrSpecificTableData2">
                    <td>cosec A</td>
                    <td>Not Defined</td>
                    <td>2</td>
                    <td>√2</td>
                    <td>2/√3</td>
                    <td>1</td>
                </tr>
                 <tr class="TrSpecificTableData1">
                    <td>sec A</td>
                    <td>1</td>
                    <td>2/√3</td>
                    <td>√2</td>
                    <td>2</td>
                    <td>Not Defined</td>
                </tr>
                 <tr class="TrSpecificTableData2">
                    <td>cot A</td>
                    <td>Not Defined</td>
                    <td>√3</td>
                    <td>1</td>
                    <td>1/√3</td>
                    <td>0</td>
                </tr>
            </table>
            <table>
               <tr>
                    <td class="TDINPUTNEW"  >
                        <label  id="lblHypo" class="InputID"> Evaluate the Expression</label>
                    </td>
                    <td class="TDINPUTNEW"  >

                        <input id="txtExpression" type="text" name="txtExpression" value="<%=sExpression%>" class="MatrixOrderNew" onmouseover ="GetTextHighLight('txtExpression',4)" onmouseout="RemoveHighLight('txtExpression',4)"  onmousedown="RemoveHighLight('txtExpression',4)"/>                        
                      
                        
                    </td>

                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                <tr>
                    <td colspan="2">
                        <input   class="CTestYourSelf" id="btnCreate" type="button"    value="Evaluate the Expression" onclick="SolveIt();" />
                    </td>
                </tr>
                
            </table>
        </div>
         <div id="MatrixArea"  class="BackGround">
        </div>
         
</asp:Content>
