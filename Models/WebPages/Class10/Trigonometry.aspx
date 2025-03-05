<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="Trigonometry.aspx.cs" Inherits="Trigonometry" %>
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


        function LoadSavedFile(filename)
        {
           
            let MatrixArea = document.getElementById('MatrixArea');

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Class10/Trigonometry.aspx/LoadSaveFile") %>';

             var xhttp = new XMLHttpRequest();


             xhttp.open("POST", pageUrl, true);

             xhttp.setRequestHeader("Content-type", "application/json");

             const JsonInput = {
                 SLoadFileName: "",

            };

            JsonInput.SLoadFileName = filename;
             const jsonString = JSON.stringify(JsonInput);

             xhttp.onload = function () {
                 if (this.status == 200) {

                     let myArr = JSON.parse(xhttp.responseText);
                     str = "";
                     for (key in myArr) {
                         str += myArr[key];
                     }
                     MatrixArea.hidden = false;
                     let myArray = str.split("$::$");
                     
                     MatrixArea.innerHTML = myArray[2];
                     SetStudentAnswerFromXml(myArray[0]);
                     CheckSolution(myArray[1]);

                 }
                 else {
                     alert("error Now");
                 }
             }


             xhttp.send(jsonString);
         }
      function SubmitTest()
        {
            let MatrixArea = document.getElementById('MatrixArea');

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Class10/Trigonometry.aspx/SubmitAnswer") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const JsonInput = {
                Stestyourself: "",

            };

            JsonInput.Stestyourself = GetStudentAnswer();

            const jsonString = JSON.stringify(JsonInput);

            xhttp.onload = function () {
                if (this.status == 200) {

                    let myArr = JSON.parse(xhttp.responseText);
                    str = "";
                    for (key in myArr) {
                        str += myArr[key];
                    }
                    document.getElementById('idSubmit').hidden = true;
                    document.getElementById('btnTest').hidden = false;
                    document.getElementById('btnCreateT').hidden = false;
                    
                  
                    CheckSolution(str);
               
                    
                }
                else
                {
                    alert("error Now");
                }
            }


            xhttp.send(jsonString);
        }
        function TestYourself()
        {
            
            let MatrixArea = document.getElementById('MatrixArea');
            
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Class10/Trigonometry.aspx/TestYourself") %>';
            
            var xhttp = new XMLHttpRequest();
            

            xhttp.open("POST", pageUrl, true);
            
            xhttp.setRequestHeader("Content-type", "application/json");
            
            const JsonInput = {
                Stestyourself: "",
            
            };
            
            JsonInput.Stestyourself = "abc";
            
            const jsonString = JSON.stringify(JsonInput);
            
            xhttp.onload = function ()
            {
                if (this.status == 200) {

                    let myArr = JSON.parse(xhttp.responseText);
                    str = "";
                    for (key in myArr) {
                        str += myArr[key];
                    }
                    
                    MatrixArea.innerHTML = str;
                    document.getElementById('idSubmit').hidden = false; 
                    document.getElementById('btnTest').hidden = true; 
                    document.getElementById('btnCreateT').hidden = true; 
                    
                }
                else {
                    

                    alert("error Now");
                }
            }


            xhttp.send(jsonString);

        }
        function DrawSVGTriangle()
        {
            let MatrixArea = document.getElementById('idTriangleArea');
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Class10/Trigonometry.aspx/DrawTriangle") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");
            
            const JsonInput = {
                SHypotenuse: "",
                SBase: "",
                SPerpandicular: "",
                STrianglePoints: "",
            };
            let TrianglePoints = GetTrianglePoints();
            JsonInput.SHypotenuse = document.getElementById('txtHypo').value;
            JsonInput.SBase = document.getElementById('txBase').value;
            JsonInput.SPerpandicular = document.getElementById('txtPerPandicular').value;
            JsonInput.STrianglePoints = TrianglePoints;
            
            const jsonString = JSON.stringify(JsonInput);

            xhttp.onload = function () {
                if (this.status == 200) {

                    let myArr = JSON.parse(xhttp.responseText);
                    str = "";
                    for (key in myArr) {
                        str += myArr[key];
                    }

                    let myArray = str.split("#$#");


                    if (myArray[0] == 0) {
                        MatrixArea.innerHTML = myArray[1];
                    }
                    else {
                        let myArrayA = myArray[1].split("$$");
                        document.getElementById('txtHypo').value = myArrayA[0];

                        document.getElementById('txtPerPandicular').value = myArrayA[1];
                        document.getElementById('txBase').value = myArrayA[2];
                        MatrixArea.innerHTML = myArrayA[3];
                        document.getElementById('btnRatio').hidden = false;
                        let MatrixAreaA = document.getElementById('MatrixArea');
                        MatrixAreaA.innerHTML = "";
                    }
                    
                }
                else {
                    alert("error Now");
                }
            }


            xhttp.send(jsonString);

        }
        function SolveTrignometry()
        {

            let MatrixArea = document.getElementById('MatrixArea');

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Class10/Trigonometry.aspx/SolveTrignometry") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const JsonInput = {
                SHypotenuse: "",
                SBase: "",
                SPerpandicular: "",
                STrianglePoints: "",
            };
            let TrianglePoints = GetTrianglePoints();
            JsonInput.SHypotenuse = document.getElementById('txtHypo').value;
            JsonInput.SBase = document.getElementById('txBase').value;
            JsonInput.SPerpandicular = document.getElementById('txtPerPandicular').value;
            JsonInput.STrianglePoints = TrianglePoints;

            const jsonString = JSON.stringify(JsonInput);



            xhttp.onload = function () {
                if (this.status == 200) {

                    let myArr = JSON.parse(xhttp.responseText);
                    str = "";
                    for (key in myArr) {
                        str += myArr[key];
                    }

                    let myArray = str.split("#$#");


                    if (myArray[0] == 0) {
                        MatrixArea.innerHTML = myArray[1];
                    }
                    else {
                        let myArrayA = myArray[1].split("$$");
                        document.getElementById('txtHypo').value = myArrayA[0];

                        document.getElementById('txtPerPandicular').value = myArrayA[1];
                        document.getElementById('txBase').value = myArrayA[2];
                        MatrixArea.innerHTML = myArrayA[3];

                    }

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
            <h1 class="PageNameHeading">Trignometry Ratio Calculations</h1>
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
                    <td colspan ="3"  class="TDINPUT" >
                        <label  class="InputStatement"> In <b  style="color:orangered ;font-size:32px">∆</b>  </label>
                        <input type ="text" maxlength="3" class="InputTextTriangle"   id="txtTriangleVetex"  style ="width:80px; height:20px" onkeyup="ClearRightRatioAngle();"/>
                        <label  class="InputStatement" > right angled at </label>
                        <input type ="text" maxlength="1" class="InputRightAngleAt"  id="txtRightAngleAt" style ="width:25px; " onkeyup="CheckAngleChar('txtTriangleVetex','txtRightAngleAt');" />
                        <label  class="InputStatement" > Calculate the  trignometric ratio of the angle  </label>
                        <input type ="text" maxlength="1" class="InputRatioAngle"  id="txtRatioAngle" style ="width:25px; " onkeyup="CheckRatioChar('txtTriangleVetex','txtRightAngleAt','txtRatioAngle');" />

                    </td>
                </tr>
                <tr>
                    <td class="TDINPUT"  >
                        <label  id="lblHypo" class="InputID"> Hypotenuse</label>
                    </td>
                    <td colspan="2" class="TDINPUT"  >

                        <input id="txtHypo" type="text" name="txtHypo" value="<%=sHypotenuse%>" class="MatrixOrder" />
                      
                        
                    </td>

                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                
               <tr>
                    <td class="TDINPUT" >
                        <label id="lblBase" class="InputID" > Base(Side adjacent to Angle)</label>
                    </td>
                    <td colspan="2" class="TDINPUT" >

                        <input id="txBase" type="text" name="txtBase" value="<%=sBase%>" class="MatrixOrder" />
                        

                    </td>

                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                <tr>
                    <td class="TDINPUT" >
                        <label  id="lblPerp" class="InputID"> Perpadicular(Side opposite to Angle)</label>
                    </td>
                    <td colspan="2" class="TDINPUT" >

                        <input id="txtPerPandicular" type="text" name="txtPerPandicular" value="<%=sPerPandicular%>" class="MatrixOrder" />
                        

                    </td>

                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
               
                <tr id="btnCreateT">
                    <td colspan="3" class="TDINPUT" >
                        
                        <input class="CTestYourSelf" id="btnCreateTriangle" type="button" disabled value="Create Triangle "  onclick="DrawSVGTriangle();" />
                        
                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                 <tr hidden id="idTriangleDiv">
                     <td colspan="3" class="TDINPUT" >
                           <div id="idTriangleArea">
                            </div>
                     </td>
                 </tr>
                
                  <tr hidden id="btnRatio">
                    <td colspan="3" class="TDINPUT" >
                        
                        
                        <input   class="CTestYourSelf" id="btnCreate" type="button"    value="Calculate Trigonometric ratio for angle  " onclick="SolveTrignometry();" />
                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
                 
                <tr id="btnTest" >
                    <td colspan="3" class="TDINPUT" >
                        
                        <input   class="CTestYourSelf" id="btnTestYourself" type="button"    value="Test Yourself" onclick="TestYourself();" />
                    </td>
                </tr>


            </table>
        </div>
         <div id="MatrixArea">
        </div>
         </div>
        <input   class="CTestYourSelf" id="idSubmit" type="button"  hidden  value="Submit Solution" onclick="SubmitTest();" />
    <table hidden>
        <tr>
        <td  class="CTestYourSelf">
            Select a file to upload:
            <input type="file" id="myFile" onchange="sendFile(this);" >
        </td>
        
        </tr>
    </table>
         
        
</asp:Content>
