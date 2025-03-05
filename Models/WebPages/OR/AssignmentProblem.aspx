<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="AssignmentProblem.aspx.cs" Inherits="AssignmentProblem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="../../JavaScript/Assignment.js"></script>
    <script type="text/javascript" src="../../JavaScript/Jquery.js"></script>

    <link type="text/css" rel="stylesheet" href="../../Css/LatestCommon.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/Transport.css" />


 
<script type="text/javascript">

    function UpdateRadioButton(value)
    {
        document.getElementsByName('AssignmentType').value = value;
       
    }
    function SolveAssignmentProblem()
    {
        let SolutionType = $('.SolutionTypeA:checked').val();
        
        let iJOBS = Number(document.getElementById("txtJobs").value);

        var MatrixArea = document.getElementById('AssignmentSolution');
        let MyCosts = "";

        for (let j = 1; j <= iJOBS; j++) {
            for (let i = 1; i <= iJOBS; i++) {
                let str = "txtCost" + j + i;

                var x = document.getElementById(str);
                MyCosts += x.value + ":";

            }
        }

        var pageUrl = '<%= ResolveUrl("~/Models/WebPages/OR/AssignmentProblem.aspx/SolveProblem") %>';
        var xhttp = new XMLHttpRequest();


        xhttp.open("POST", pageUrl, true);

        xhttp.setRequestHeader("Content-type", "application/json");

        const Assignment_ = {
            iJobs: "",
            sCosts: "",
            iAssignmentType: "",
        };

        let isTesting = false;
        if (isTesting)
        {
            Assignment_.iJobs = 4;
            //let icost = "11:7:10:17:10:13:21:7:11:13:13:13:15:13:14:18:10:13:16:14:12:8:16:19:10:";
            //let icost = "13:8:16:18:19:9:15:24:9:12:12:9:4:4:4:6:12:10:8:13:15:17:18:12:20:";
            //let icost = "3:1:1:4:4:2:2:5:5:3:4:8:4:2:5:9:";
            //let icost = "7:5:8:4:5:6:7:4:8:7:9:8:0:0:0:0:"
            //let icost = "1:4:6:3:9:7:10:9:4:5:11:17:8:7:8:5:"
            //let icost = "18:24:28:32:8:13:17:19:10:15:19:22:0:0:0:0:"


            //max
            let icost = "35:27:28:37:28:34:29:40:35:24:32:28:24:32:25:28:"
            //let icost = "30:37:40:28:40:40:24:27:21:36:40:32:33:30:35:25:38:40:36:36:29:62:41:34:39:";
            let aCost = icost.split(':');
            let k = 0;
            for (let j = 1; j <= iJOBS; j++) {
                for (let i = 1; i <= iJOBS; i++) {
                    let str = "txtCost" + j + i;
                    document.getElementById(str).value = aCost[k];
                    k++;


                }
            }
            Assignment_.sCosts = icost;

        }
        else {
            Assignment_.iJobs = iJOBS;
            Assignment_.sCosts = MyCosts;

        }

        Assignment_.iAssignmentType = SolutionType;
        const jsonString = JSON.stringify(Assignment_);

         
      
        xhttp.onload = function ()

        {
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
                alert("error");
            }
        }

        xhttp.send(jsonString);


    }
    </script>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div>
            <h1 class="PageNameHeading" >Assignment Problem(Hungarian Method) </h1>
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
                    <label class="InputID">Number of Jobs</label></td>
                <td colspan="2">

                    <input id="txtJobs" type="text" name="txtJobs" value="<%=TxtJobs %>" class= "DemandSupplyInput" />
                </td>

                <%--<td><asp:TextBox runat="server"   id="txtS" /></td>--%>
            </tr>
            <tr>
                <td colspan="3" class="Notes">
                    NotE:For Unbalance Question Just add zero in the Additional Row or Column
                </td>

            </tr>
            <tr>
                <td colspan="3" style="text-align: center">
                    <%--<asp:Button ID="Button1" runat="server" Text="Solve" OnClick="Button1_Click" style="height: 26px"    />--%>
                    <input class="CTestYourSelf" id="Button1" type="button" value="Create Matrix" onclick="GenerateAssignmentMatrix()" />
                </td>
            </tr>

        </table>
    </div>
    <div id="MatrixArea">
     </div>
<div id="idAssignmentType" hidden >
<p class="AssigmentTypeLabel" >Please select Assignment Type:</p>
  <input type="radio"  name="AssignmentType" value="1" checked="true" class="SolutionTypeA">
  <label class="AssigmentTypeOption" for="StepWise" onclick="UpdateRadioButton(1)">Minimization</label><br>
  <input type="radio"  name="AssignmentType" value="2" class="SolutionTypeA">
  <label  class="AssigmentTypeOption" for="FinalSolution" onclick="UpdateRadioButton(2)">Maximization</label><br>  

</div>

    <div >
        <input class="CTestYourSelf" id="CalculateNow" type="button" value="Calculate" onclick="SolveAssignmentProblem();" hidden="hidden"  />
        
    </div>
        <div id="AssignmentSolution">
        </div>

</asp:Content>
