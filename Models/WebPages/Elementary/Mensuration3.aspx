﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="Mensuration3.aspx.cs" Inherits="Mensuration3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="../../Css/LatestCommon.css" />
     <link type="text/css" rel="stylesheet" href="../../Css/Common.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/AutoGenerateMatrix.css" />
    <script type="text/javascript" src="../../JavaScript/Elementary.js"></script>

    <script>
        function SubmitAnswerA(id) {
            //alert(id);
            let Values = "";
            let MyArray = id.split("_");
            for (let i = 0; i < MyArray.length - 2; i++) {

                Values += document.getElementById(MyArray[i]).value + "_";

            }
            Values += document.getElementById(MyArray[MyArray.length - 2]).value;
            let pos = MyArray[MyArray.length - 1];
            //Values += MyArray[MyArray.length-1];
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Elementary/Mensuration3.aspx/GetSubmitAnswerA") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const Matrix = {
                sValue: "",
                Position: "",
            };



            Matrix.sValue = Values;
            Matrix.Position = pos;
            const jsonString = JSON.stringify(Matrix);

            xhttp.onload = function () {
                if (this.status == 200) {

                    let myArr = JSON.parse(xhttp.responseText);
                    str = "";
                    for (key in myArr) {
                        str += myArr[key];
                    }
                    let elementId = "txtAnswer_" + MyArray[MyArray.length - 1];
                    let AnswerCircleRadiusA = document.getElementById(elementId);
                    AnswerCircleRadiusA.innerHTML = str;

                }
                else {
                    alert("error Now");
                }
            }


            xhttp.send(jsonString);

        }
        function GenerateMatrix() {
            var pageUrl = '<%= ResolveUrl("~/Models/WebPages/Elementary/Mensuration3.aspx/GenerateMatrix") %>';

            var xhttp = new XMLHttpRequest();


            xhttp.open("POST", pageUrl, true);

            xhttp.setRequestHeader("Content-type", "application/json");

            const Matrix = {
                sOptions: "",
            };


            Matrix.sOptions = 1;



            const jsonString = JSON.stringify(Matrix);



            xhttp.onload = function () {
                if (this.status == 200) {

                    let myArr = JSON.parse(xhttp.responseText);
                    str = "";
                    for (key in myArr) {
                        str += myArr[key];
                    }
                    let Matrix_Area = document.getElementById('MatrixArae');
                    Matrix_Area.innerHTML = str;
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
     <body onload="GenerateMatrix()">

        <h1 class="PageNameHeading">Mensuration </h1>
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
        </div>
    
         
          <div id="MatrixArae">
         </div>



    </body>
</asp:Content>
