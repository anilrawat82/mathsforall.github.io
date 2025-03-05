<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="FactorizeExpression.aspx.cs" Inherits="FactorizeExpression" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link type="text/css" rel="stylesheet" href="../../Css/Elementary.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <script>
        function GenerateMatrix(id) {



            let sFactorExpression;


            if (id == "txtFactorExpression") {
                sFactorExpression = document.getElementById(id).value;
                MatrixArea = document.getElementById('MatrixArea');

            }
            else {
                sFactorExpression = document.getElementById(id).innerText;

                let Divid = "SolutionDiv_" + id.split('_')[1];

                MatrixArea = document.getElementById(Divid);
                MatrixArea.hidden = false;

            }






            //if (isNaN(sFactorExpression) == true) {
            //    MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Numeric Value Greater than 0 in Elements and Questions</h2>";
            //    return;
            //}




            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Elementary/FactorizeExpression.aspx/GenerateMatrix") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const JsonInput = {
                sFactorExpression: "",

            };


            JsonInput.sFactorExpression = sFactorExpression;
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
            <h1 class="PageNameHeading">Factorize Expression</h1>
        </div>
        <div>
            <table>

                
                <tr>
                    <td>
                        <label> Number</label>
                    </td>
                    <td colspan="2">

                        <input id="txtFactorExpression" type="text" name="txtStartNumber" value="<%=sSquareRoot%>" class="MatrixOrder" />

                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                
               
                  <tr>
                    <td colspan="3">

                        <input class="CTestYourSelf" id="btnCreate" type="button" value="Solve " onclick="GenerateMatrix('txtFactorExpression');" />
                        </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                  <tr>
                    <td colspan="3" >

                        <input class="CTestYourSelf" id="btnTest" type="button" value="Test Your Self " onclick="GenerateTestMatrix();" " />
                    </td>

                </tr>



            </table>
        </div>



      
       
      


    </body>
</asp:Content>
