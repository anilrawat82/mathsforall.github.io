<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="SolveExpression.aspx.cs" Inherits="SolveExpression" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="../../Css/Elementary.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <script type="text/javascript" src="../../JavaScript/Elementary.js"></script>
    <script>
        function GenerateMatrix() {

            let MatrixArea = document.getElementById('MatrixArea');

            let Expression = document.getElementById("txtExpression").value;
            let Values = document.getElementById("txtValues").value;
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Elementary/SolveExpression.aspx/GenerateMatrix") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const JsonInput = {
                sExpression: "",
                sArguments: "",

            };

            
            JsonInput.sExpression = Expression;
            JsonInput.sArguments = Values;

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
    <style type="text/css">
        .auto-style1 {
            height: 34px;
        }
        .auto-style2 {
            width: 100%;
            height: 100%;
            color:brown;
            background-color:dimgray;
            font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;        
            font-size:xx-large;

        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <body>
        <div>
            <h1 class="PageNameHeading">Solve Expression</h1>
        </div>
        <div>
            <table>

                <tr>
                    <td class="auto-style1">
                        <label>
                            <h2 style="display: inline">Name</h2>
                            <input style="display: inline" id="txtName" type="text"  runat="server" name="txtName" class="MatrixOrder" />
                        </label>
                    </td>
                    <td class="auto-style1">
                        <label>
                            <h2 style="display: inline">Date</h2>
                            <asp:Label ID="LblDateTime" runat="server" Text="Label" BackColor="#00CCFF" BorderStyle="Solid" Font-Bold="True" Font-Names="Verdana" ForeColor="White"></asp:Label>
                        </label>
                    </td>
                    <td class="auto-style1">
                        <label>
                            <h2 style="display: inline">Score :</h2>
                            <h2 id="hScore" style="display: inline"></h2>

                        </label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label> Expression 5X+3y</label>
                    </td>
                    <td colspan="2">

                        <input id="txtExpression" type="text" name="txtDivisor" value="<%=Expression%>" class="MatrixOrder" />
                        
                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>

                   <tr>
                    <td>
                        <label> Values (X=5,Y=10)</label>
                    </td>
                    <td colspan="2">

                        <input id="txtValues" type="text" name="txtDividend" value="<%=Values%>" class="MatrixOrder" />

                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                
                <tr>
                    <td colspan="3">

                        <input id="Button1" type="button" value="Solve " onclick="GenerateMatrix();" class="auto-style2" />
                      
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>




            </table>
        </div>



        <div id="MatrixArea">
        </div>
        

        <div id="Solutions">
        </div>


    </body>
</asp:Content>
