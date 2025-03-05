<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="Derivative.aspx.cs" Inherits="Derivative" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
    
    <script type="text/javascript"  src="../../JavaScript/Jquery.js"></script>
    <script type="text/javascript" src="../../JavaScript/Common.js"></script>
    <script type="text/javascript" src="../../JavaScript/HighLightText.js"></script>
    <script type="text/javascript" src="../../JavaScript/Trigonometry.js"></script>
    <link type="text/css" rel="stylesheet" href="../../Css/LatestCommon.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/InitialInputs.css" />  
    <link type="text/css" rel="stylesheet" href="../../Css/Trigonometry.css" />  
    
    <script>
        function sendFile(file)
        {
            var formData = new FormData();
            formData.append('file', file.files[0]);
            $.ajax({
                type: 'post',
                url: 'AjaxFile.ashx',
                data: formData,
                processData: false,
                contentType: false,
                success: function (data)
                {
                    if (status != 'error') {
                        
                        LoadSavedFile(file.files[0].name);
                    }
                },

                error: function (data) {
                    alert("Whoops something went wrong!");
                }
            });
        }        
      function SubmitTest()
        {
            let MatrixArea = document.getElementById('MatrixArea');

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Class1112/Derivative.aspx/SubmitAnswer") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const JsonInput = {
                sExpression: "",

            };

          JsonInput.sExpression = document.getElementById('txtExpression').value;

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
                else
                {
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
            <h1 class="PageNameHeading">Derivative</h1>
        </div>
        <div>
            <table>

                 <tr>
                    <td>
                        <label>
                            <h2  class="NameDateScore">Name</h2>
                            <input  id="txtName" type="text"  runat="server"  runat="server"  runat="server" name="txtName" class="textName" />
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
                    <td class="TDINPUT"  >
                        <label  id="lblHypo" class="InputID"> Expression</label>
                    </td>
                    <td colspan="2" class="TDINPUT"  >

                        <input id="txtExpression" type="text" name="txtDerivative" class="MatrixOrder" />
                      
                        
                    </td>

                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                <tr id="btnCreateT">
                    <td colspan="3" class="TDINPUT" >
                        
                        <input class="CTestYourSelf" id="btnDerivative" type="button"  onclick="SubmitTest();" value="Find Derivative"   />
                        
                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
            </table>
        </div>
         <div id="MatrixArea">
        </div>
         
        
</asp:Content>
