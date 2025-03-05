
let MyMatrixDesign;


function GenerateMatrix() {
    //Clear Solution Before If Exist


    var MatrixArea = document.getElementById('TransportSolution');
    MatrixArea.innerHTML = "";


    let Matrixstring = "";
    var MatrixArea = document.getElementById('MatrixArea');



    let RDemand = Number(document.getElementById("txtD").value);
    let CSupply = Number(document.getElementById("txtS").value);

    if (isNaN(RDemand) == true || isNaN(CSupply) == true) {
        MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Numeric Value Greater than 0 in Demand and Supply</h2>";
        return;
    }

    if (RDemand <= 0 || CSupply <= 0) {
        MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Value Greater than 0 in Demand and Supply";
        return;
    }




    RDemand = RDemand + 2;
    CSupply = CSupply + 2;


    Matrixstring = "<table class=" + "\"SolutionTable\"" + ">";


    for (let C_ = 0; C_ < CSupply; C_++) {

        Matrixstring += "<tr>";
        for (let R_ = 0; R_ < RDemand; R_++) {

            if ((R_ == 0 && C_ == 0) || (R_ == RDemand - 1 && C_ == 0) || (C_ == CSupply - 1 && R_ == 0) || (R_ == RDemand - 1 && C_ == CSupply - 1)) {
                Matrixstring += "<td></td>";
            }

            else if ((R_ == RDemand - 1)) {

                let s = "\"txtSupply" + C_ + "\"";

                Matrixstring += "<td><input type = " + "\"text\" id = " + s.toString() + " class = " + "\"DemandSupplyValue\"" + "/></td>";


            }
            else if (C_ == CSupply - 1) {
                let s = "\"txtDemand" + R_ + "\"";
                Matrixstring += "<td><input type = " + "\"text\" id = " + s.toString() + " class = " + "\"DemandSupplyValue\"" + "/></td>";
            }
            else if (R_ == 0 && (C_ > 0 && C_ < CSupply - 1)) {
                Matrixstring += "<td class=" + "\"TR_TD_Heading\"" + ">Supply" + C_ + "</td>";
            }
            else if (R_ > 0 && C_ == 0) {
                Matrixstring += "<td class=" + "\"TR_TD_Heading\"" + ">Demand" + R_ + "</td>";
            }

            else {

                let s = "\"txtCost" + C_ + R_ + "\"";

                Matrixstring += "<td><input type = " + "\"text\" id = " + s.toString() + " class = " + "\"TransCostText\"" + "/></td>";


            }

        }

        Matrixstring += "</tr>";

    }


    Matrixstring += "</ table >";
    MatrixArea.innerHTML = Matrixstring;
    //MatrixAreaT.value = Matrixstring;



    document.getElementById("CalculateNow").hidden = false;
    document.getElementById("TypeSolution").hidden = false;

    MyMatrixDesign = Matrixstring;

}

function EnableDisableButtons() {
    let TransportProblem = $('.TransportMethodA:checked').val();

    if (TransportProblem == 4) {
        document.getElementById('ModiOptionsInitalSolution').hidden = false;
    }
    else {

        document.getElementById('ModiOptionsInitalSolution').hidden = true;

    }

}

//function GenerateAssignmentMatrix()
//{
  

//    var MatrixArea = document.getElementById('AssignmentSolution');
//    MatrixArea.innerHTML = "";


//    let Matrixstring = "";
//    var MatrixArea = document.getElementById('MatrixArea');

//    //RDEMAND MEANS TOTAL JOBS

//    let RJOBS = Number(document.getElementById("txtJobs").value)+1;
    

//    if (isNaN(RJOBS) == true) {
//        MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Numeric Value Greater than 0 in Demand and Supply</h2>";
//        return;
//    }

//    if (RJOBS <= 0 ) {
//        MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Value Greater than 0 in Demand and Supply";
//        return;
//    }


//    Matrixstring = "<table class=" + "\"SolutionTable\"" + ">";

//    for (let C_ = 0; C_ < RJOBS; C_++) {

//        Matrixstring += "<tr>";
//        for (let R_ = 0; R_ < RJOBS; R_++) {

//            if (R_ == 0 && C_ == 0) {
//                Matrixstring += "<td></td>";
//            }
//            else if (R_ == 0 && C_ > 0)
//            {
//                Matrixstring += "<td class=" + "\"TR_TD_Heading\"" + ">JOBS" + C_ + "</td>";
//            }
//            else if (R_ > 0 && C_ == 0) {
//                Matrixstring += "<td class=" + "\"TR_TD_Heading\"" + ">Cost" + R_ + "</td>";
//            }

//            else {

//                let s = "\"txtCost" + C_ + R_ + "\"";

//                Matrixstring += "<td><input type = " + "\"text\" id = " + s.toString() + " class = " + "\"TransCostText\"" + "/></td>";


//            }

//        }

//        Matrixstring += "</tr>";

//    }


//    Matrixstring += "</ table >";
//    MatrixArea.innerHTML = Matrixstring;
    
//    document.getElementById("CalculateNow").hidden = false;
    

//    MyMatrixDesign = Matrixstring;

//}