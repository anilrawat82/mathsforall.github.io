<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="Transportation.aspx.cs" Inherits="Transportation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="../../JavaScript/Transportation.js"></script>
    <script type="text/javascript" src="../../JavaScript/Jquery.js"></script>

    <link type="text/css" rel="stylesheet" href="../../Css/LatestCommon.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/Transport.css" />


    <style type="text/css">
        .auto-style2 {
            width: 961px;
            height: 389px;
        }
    </style>

<script type="text/javascript">



    function JqueryAjaxCall() {

        let RDemand = Number(document.getElementById("txtD").value);
        let CSupply = Number(document.getElementById("txtS").value);
        var MatrixArea = document.getElementById('TransportSolution');
        let MyCosts = "";
        //for(let Cost)
        //let icost = [4, 6, 8, 8, 6, 8, 6, 7, 5, 7, 6, 8];
        //let iSupply = [40,60,50];
        //let iDemand= [20,30,50,50];

        //let icost = [3, 1, 7, 4, 2, 6, 5, 9, 8, 3, 3, 2];
        //let iSupply = [250,350,400];
        //let iDemand= [200,300,350,150];


        //let icost = [1, 2, 1, 4, 3, 3, 2, 1, 4, 2, 5, 9];
        //let iSupply = [30,50,20];
        //let iDemand= [20,40,30,10];



        //let icost = [2, 2, 2, 1, 10, 8, 5, 4, 7, 6, 6, 8];
        //let iSupply = [3, 7, 5];
        //let iDemand = [4, 3, 4, 4];

        //let icost = [19, 30, 50, 10, 70, 30, 40, 60, 40, 8, 70, 20];
        //let iSupply = [7, 9, 18];
        //let iDemand = [5, 8, 7, 14];


        ////let icost = [11, 13, 17, 14, 16, 18, 14, 10, 21, 24, 13, 10,22,24,32,18,14,12,19,23];
        ////let iSupply = [250, 300, 200,100,100];
        ////let iDemand = [200, 225, 275, 250];

        let iCounter = 0;
        let TransportProblem = $('.TransportMethodA:checked').val();
        let ModiInitialMethod = $('.ModiMethodA:checked').val();
        let SolutionType = $('.SolutionTypeA:checked').val();

        let SolutionTypeA = TransportProblem.toString() + ":" + ModiInitialMethod.toString() + ":" + SolutionType.toString();


        for (let j = 1; j <= CSupply; j++) {
            for (let i = 1; i <= RDemand; i++) {
                let str = "txtCost" + j + i;

                var x = document.getElementById(str);
                MyCosts += x.value + ":";



            }
        }


        iCounter = 0;
        let tSupply = "";
        for (let j = 1; j <= CSupply; j++) {
            let str = "txtSupply" + j;
            var x = document.getElementById(str);
            tSupply += x.value + ":";
        }

        ///alert(tSupply);
        iCounter = 0;
        let tDemand = "";

        for (let j = 1; j <= RDemand; j++) {
            let str = "txtDemand" + j;
            var x = document.getElementById(str);
            tDemand += x.value + ":";
        }
        //alert(tDemand);

        var pageUrl = '<%= ResolveUrl("~/Models/WebPages/OR/Transportation.aspx/TransportationAjax") %>';
        var xhttp = new XMLHttpRequest();


        xhttp.open("POST", pageUrl, true);

        xhttp.setRequestHeader("Content-type", "application/json");

        const Transport_ = {
            iresultD: "",
            iresultS: "",
            sCosts: "",
            sDemandS: "",
            sSupply: "",
            sSolutionType: "",
        };

        let isTesting = false;
        if (isTesting)
        {

            let icost = "19:30:50:10:70:30:40:60:40:8:70:20:";
            let iSupply = "7:9:18:";
            let iDemand = "5:8:7:14:";
            Transport_.iresultD = Number(4);
            Transport_.iresultS = Number(3);
            Transport_.sCosts = icost;
            Transport_.sSupply = iSupply;
            Transport_.sDemandS = iDemand;
            Transport_.sSolutionType = SolutionTypeA;
        }
        else
        { 
            Transport_.iresultD = Number(RDemand);
            Transport_.iresultS = Number(CSupply);
            Transport_.sCosts = MyCosts;
            Transport_.sSupply = tSupply;
            Transport_.sDemandS = tDemand;
            Transport_.sSolutionType = SolutionTypeA;
        }

        const jsonString = JSON.stringify(Transport_);

    //    alert(jsonString);
    
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
                alert("error");
            }
        }

        xhttp.send(jsonString);


    }

       

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div>
            <h1 class="PageNameHeading" >Transportation Problem </h1>
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
                    <label class="InputID">Demand</label></td>
                <td colspan="2">
                    <input id="txtD" type="text" name="txtDemand" value="<%=TxtDemand %>" class ="DemandSupplyInput" />



                </td>
                <%--<td><asp:TextBox runat="server" id="txtD"    /></td>--%>
            </tr>
            <tr>
                <td>
                    <label class="InputID">Supply</label></td>
                <td colspan="2">

                    <input id="txtS" type="text" name="txtSupply" value="<%=txtSupply %>" class= "DemandSupplyInput" />
                </td>

                <%--<td><asp:TextBox runat="server"   id="txtS" /></td>--%>
            </tr>
            <tr>
                <td colspan="3" style="text-align: center">
                    <%--<asp:Button ID="Button1" runat="server" Text="Solve" OnClick="Button1_Click" style="height: 26px"    />--%>
                    <input class="CTestYourSelf" id="Button1" type="button" value="Create Matrix" onclick="GenerateMatrix()" />
                </td>
            </tr>

        </table>
        <div id="MatrixArea">
             
            
     </div>

        
        
<div id="TypeSolution" hidden="hidden" >
   <p>Please select your TransportationMethode:</p>
  <input type="radio"  name="TransportMethod" value="1" checked  class="TransportMethodA" onclick="EnableDisableButtons();" >
  <label for="NORTHWEST" class="TransportMethodLabel" >NORTH-WEST</label><br>
  <input type="radio"  name="TransportMethod" value="2" class="TransportMethodA" onclick="EnableDisableButtons();">
  <label for="MIN_COST" class="TransportMethodLabel">Minimum Cost Method</label><br>
  <input type="radio"  name="TransportMethod" value="3" class="TransportMethodA" onclick="EnableDisableButtons();">
  <label for="VogelApprox" class="TransportMethodLabel">Vogel Approximation Method</label><br>
  <input type="radio"  name="TransportMethod" value="4" class="TransportMethodA" onclick="EnableDisableButtons();">
  <label for="MODI" class="TransportMethodLabel"> MODI Method</label> 
    <div id="ModiOptionsInitalSolution" hidden>
        <h3 style="color:coral" > Calculate initial basic feasible solution using any one methods given below:</h3>
         <ul class ="ModiOptionChecked" id="ModiOptions"  >
             <li>North West Method <input type="radio"  name="ModiMethod" value="1" checked class="ModiMethodA"></li>
             <li>Minimum Cost Method<input type="radio"  name="ModiMethod" value="2" class="ModiMethodA"></li>
             <li>Vogel Approximation Method<input type="radio"  name="ModiMethod" value="3" class="ModiMethodA" ></li>

         </ul>
    </div>
  <br>  

  <p>Please select Solution Type:</p>
  <input type="radio"  name="SolutionType" value="1" checked="true" class="SolutionTypeA">
  <label for="StepWise">Step-Wise Solution</label><br>
  <input type="radio"  name="SolutionType" value="2" class="SolutionTypeA">
  <label for="FinalSolution">Final Solution</label><br>  
   </div>   
    <div>
        <input class="CTestYourSelf" id="CalculateNow" type="button" value="Calculate" onclick="JqueryAjaxCall();" hidden="hidden"  />
        
    </div>
        <div id="TransportSolution">
        </div>
   
            
        </div>
        
</asp:Content>
