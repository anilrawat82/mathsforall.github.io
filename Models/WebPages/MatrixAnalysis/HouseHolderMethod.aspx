﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/NumericalAnalysis.Master" AutoEventWireup="true" CodeBehind="HouseHolderMethod.aspx.cs" Inherits="HouseHolderMethod" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript" src="../../JavaScript/Jquery.js"></script>
    <script type="text/javascript" src="../../JavaScript/MatrixAnalysis.js"></script>
    <script type="text/javascript" src="../../JavaScript/Common.js"></script>
    <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/LatestCommon.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/MatrixAnalysis.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/NewMatrix.css" />

    <style type="text/css">
        .auto-style1 {
            height: 30px;
        }
    </style>

    <script type="text/javascript">
        let FirstTime = false;
        function CalculateSVD()
        {            
            var MatrixArea = document.getElementById('Solutions');
            let MyMatrixA = "";
         
            if (!FirstTime)
            {
                for (let j = 0; j < MatrixRow; j++) {
                    for (let i = 0; i < MatrixCol; i++) {
                        let strA = "txtAvalue_" + j + "_" + i;
                        var xA = document.getElementById(strA);
                        MyMatrixA += xA.value + ":";
                    }
                }

            }
            else {

                
                MyMatrixA ="1:1:1:1:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:1:1:1:1:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:1:1:1:1:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:1:1:1:1:1:0:0:0:1:0:0:0:1:0:0:0:1:0:0:0:0:1:0:0:0:1:0:0:0:1:0:0:0:1:0:0:0:0:1:0:0:0:1:0:0:0:1:0:0:0:1:0:0:0:0:1:0:0:0:1:0:0:0:1:0:0:0:1:1:1:0:0:1:1:0:0:0:0:0:0:0:0:0:0:0:0:1:1:0:0:1:1:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:1:1:0:0:1:1:0:0:0:0:0:0:0:0:0:0:0:0:1:1:0:0:1:1:"
                const myArr = MyMatrixA.split(":");
                let counter = 0;
                for (let j = 0; j < MatrixRow; j++) {
                    for (let i = 0; i < MatrixCol; i++) {
                        let strA = "txtAvalue_" + j + "_" + i;
                        var xA = document.getElementById(strA);
                        xA.value = myArr[counter];
                        counter++;

                    }
                }
                FirstTime = false;
            }

            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/MatrixAnalysis/HouseHolderMethod.aspx/CalculateHouseHolder") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");
            
            const MatrixRank= {
                iRow: "",
                iCol: "",
                dMatrixA: "",                
                
            };


            MatrixRank.iRow = Number(MatrixRow);
            MatrixRank.iCol = Number(MatrixCol);
            MatrixRank.dMatrixA = MyMatrixA;
            const jsonString = JSON.stringify(MatrixRank);

            
            xhttp.onload = function () {
                if (this.readyState == 4 && this.status == 200) {
            //xhttp.onload = function () {
            //    if (this.status == 200) {

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
    <div>
         <div>
            <h1 class="PageNameHeading">House Holder Method</h1>
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
                    <td class ="tdA">
                        <label class="InputID">Matrix Order</label>
                    </td>
                    <td colspan="2" class ="tdA">
                        <input id="txtMatrixOrder" type="number" name="txtMatrixOrder"  class="MatrixOrder" />
                        
                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>
    <%--           <tr>
                    <td class ="tdA">
                        <label class="InputID">Number of Column</label>
                    </td>
                    <td colspan="2" class ="tdA">
                        <input id="txtMatrixOrderC" type="number" name="txtMatrixOrder"  class="MatrixOrder" />
                        
                    </td>
                    <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
                </tr>  --%>

                  <tr>
                    <td colspan="3" class ="tdA">
                        <input  class="CTestYourSelf" id="btnCreate" type="button" value="Generate Input Values Matrix " onclick="GenerateDeterminant(1);"  />
                    </td>
                </tr>        

            </table>
        </div>
       
    </div>
    
   

    <div id="MatrixArea">
    </div>
     <div id="dCalculateNow" hidden="hidden" class ="CalculateAnswer" onclick="CalculateSVD();">
        Find the Rank of Matrix
        
    </div>
    <div id="InFormation" class="BackGround">
        

    </div>
    <div id="Solutions" class="BackGround">


    </div>
</asp:Content>


