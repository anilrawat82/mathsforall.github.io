<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/DesignAlgo.Master" AutoEventWireup="true" CodeBehind="LCSDP.aspx.cs" Inherits="LCSDP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/DynamicP.css" />
    <link href="../../Css/LatestCommon.css" rel="stylesheet" />
    <script type="text/javascript" src="../../JavaScript/LCSDP.js"></script>
    <script>
        let FirstS = "";
        let SecondS = "";
        function SetStrings(Value1, Value2) {

            FirstS = Value1;
            SecondS = Value2;

        }
        function SetLastStrings(va) {

            document.getElementById('txtFirst').value = FirstS;
            document.getElementById('txtSecond').value = SecondS;
        }
        function GenerateMatrix() {
            let MatrixArea;
            let txtFirst_ = document.getElementById('txtFirst').value;
            let txtSecond_ = document.getElementById('txtSecond').value;
            

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/DSA/LCSDP.aspx/GenerateMatrix") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const JsonInput = {
                stxtFirst: "",
                stxtSecond: "",
            };

            JsonInput.stxtFirst = txtFirst_;
            JsonInput.stxtSecond = txtSecond_;

            Firststring = txtFirst_;
            Secondstring = txtSecond_;
            const jsonString = JSON.stringify(JsonInput);



            xhttp.onload = function () {
                if (this.status == 200) {

                    let myArr = JSON.parse(xhttp.responseText);
                    str = "";
                    for (key in myArr) {
                        str += myArr[key];
                    }
                    SplitString(str)
                    document.getElementById('NextPrevious').hidden = false;
                    //MatrixArea.innerHTML = str;

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
            <h1 class="PageNameHeading">Longest Common Subsequence</h1>
            
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
                        <label class="InputID">Enter First String </label>
                    </td>
                    <td colspan="2">
                        <input id="txtFirst" type="text" name="txtMatrixOrder"  class="MatrixOrder" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="InputID">Enter Second String </label>
                    </td>
                    <td colspan="2">
                        <input id="txtSecond" type="text" name="txtMatrixOrder"  class="MatrixOrder" />
                    </td>
                </tr>
                  <tr>

                    <td colspan="3">

                        <input  class="CTestYourSelf" id="btnCreate" type="button" value="Solve " onclick="GenerateMatrix();" />
                        </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                
                
              



            </table>
        </div>



        <div id="MatrixArea">
        </div>
        <div>
            <table id="NextPrevious" >
            <tr>
                <td>
                    <input  class="CTestNextPrev" id="btPrev" type="button" value="Previous " onclick="GenerateLCSMatrix(-1);" />
                </td>
                <td>
                    
                    
                </td>
                <td>
                    <input  class="CTestNextPrev" id="btnext" type="button" value="Next " onclick="GenerateLCSMatrix(1);" />
                </td>

            </tr>
            </table>
        </div>
       
     


    </body>
</asp:Content>
