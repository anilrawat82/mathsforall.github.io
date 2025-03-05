
function GenerateAssignmentMatrix()
{
    document.getElementById('idAssignmentType').hidden = false;
   

    //Clear Solution Before If Exist
    var MatrixArea = document.getElementById('AssignmentSolution');
    MatrixArea.innerHTML = "";


    let Matrixstring = "";
    var MatrixArea = document.getElementById('MatrixArea');

    //RDEMAND MEANS TOTAL JOBS

    let RJOBS = Number(document.getElementById("txtJobs").value) + 1;


    if (isNaN(RJOBS) == true) {
        MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Numeric Value Greater than 0 in Demand and Supply</h2>";
        return;
    }

    if (RJOBS <= 0) {
        MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Value Greater than 0 in Demand and Supply";
        return;
    }


    Matrixstring = "<table class=" + "\"SolutionTable\"" + ">";

    for (let C_ = 0; C_ < RJOBS; C_++) {

        Matrixstring += "<tr>";
        for (let R_ = 0; R_ < RJOBS; R_++) {

            if (R_ == 0 && C_ == 0) {
                Matrixstring += "<td></td>";
            }
            else if (R_ == 0 && C_ > 0) {
                Matrixstring += "<td class=" + "\"TR_TD_Heading\"" + ">JOBS" + C_ + "</td>";
            }
            else if (R_ > 0 && C_ == 0) {
                Matrixstring += "<td class=" + "\"TR_TD_Heading\"" + ">Cost" + R_ + "</td>";
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

    document.getElementById("CalculateNow").hidden = false;


    MyMatrixDesign = Matrixstring;

}


///New Code
let LastSelectedRowCol = "";
let LastSelectedRowColNumber = 0;
let lastColor = "";
function getRandomColor() {
    var letters = '0123456789ABCDEF';
    var color = '#';
    for (var i = 0; i < 6; i++) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}

function HighlightCells(id) {

    textHighlight = id.split("_");
    let ROW_COL = textHighlight[1];
    let MaxCell = textHighlight[2];
    let RowOrColumnNumber = textHighlight[3];
    let colorA = "crimson";

    if (LastSelectedRowCol != "") {
        HightLightTableRowOrColumn(MaxCell, LastSelectedRowCol, LastSelectedRowColNumber, lastColor, 1)
    }

    HightLightTableRowOrColumn(MaxCell, ROW_COL, RowOrColumnNumber, colorA, 0)


}

function HightLightTableRowOrColumn(MaxCell, ROW_COL, RowOrColumnNumber, colorA, isLastValue) {
    for (let k = 1; k <= MaxCell; k++) {
        let IdName = "";
        if (ROW_COL == "R") {
            IdName = "ZerotxtCost_" + ROW_COL + RowOrColumnNumber + k;
        }
        else {
            IdName = "ZerotxtCost_" + ROW_COL + k + RowOrColumnNumber;
        }
        if (k == 1 && isLastValue == 0) {
            LastSelectedRowColNumber = RowOrColumnNumber;
            LastSelectedRowCol = ROW_COL;
            lastColor = document.getElementById(IdName).style.backgroundColor;
        }
        document.getElementById(IdName).style.backgroundColor = colorA;

    }

}

let lastSelectedZeroAllocation = "";
let AssignedZeroCellColor = "";
let UnAssignedZeroCellColor = "";
function HighlightAssignedZeroCells(id) {

    if (lastSelectedZeroAllocation != "") {

        textHighlightL = lastSelectedZeroAllocation.split(":");
        let ZeroAllocationCounterL = textHighlightL[1];
        let RoworColL = textHighlightL[0];
        let lengthL = textHighlightL.length - 2;

        //id="ZeroAllocationtxtCost_1_5_3"
        let ZeroCellName = "ZeroAllocationtxtCost_" + ZeroAllocationCounterL + "_";

        for (let k = 2; k < lengthL + 2; k++) {
            let Row = textHighlightL[k].split("_")[0];
            let col = textHighlightL[k].split("_")[1];
            let ZeroFullName = ZeroCellName + Row + "_" + col;
            if (k == 2) {

                document.getElementById(ZeroFullName).style.backgroundColor = AssignedZeroCellColor;

            }
            else {
                document.getElementById(ZeroFullName).style.backgroundColor = UnAssignedZeroCellColor

            }

            document.getElementById(ZeroFullName).style.borderWidth = "3px";

        }
    }

    textHighlight = id.split(":");
    let ZeroAllocationCounter = textHighlight[1];
    let RoworCol = textHighlight[0];
    let length = textHighlight.length - 2;

    //id="ZeroAllocationtxtCost_1_5_3"
    let ZeroCellName = "ZeroAllocationtxtCost_" + ZeroAllocationCounter + "_";

    let colorA = "#FFFF00";
    for (let k = 2; k < length + 2; k++) {

        let Row = textHighlight[k].split("_")[0];
        let col = textHighlight[k].split("_")[1];
        let ZeroFullName = ZeroCellName + Row + "_" + col;

        if (k == 2) {
            AssignedZeroCellColor = document.getElementById(ZeroFullName).style.backgroundColor;
            document.getElementById(ZeroFullName).style.backgroundColor = colorA
        }
        else if (k == 3) {
            UnAssignedZeroCellColor = document.getElementById(ZeroFullName).style.backgroundColor;

            document.getElementById(ZeroFullName).style.backgroundColor = colorA
        }
        else {
            document.getElementById(ZeroFullName).style.backgroundColor = colorA

        }

        document.getElementById(ZeroFullName).style.borderWidth = "5px";



        lastSelectedZeroAllocation = id;

    }
}

let lastSelectedTickID = "";
function HighlightTickRowColCells(id) {

    if (lastSelectedTickID != "") {

        HightlightTickRC(lastSelectedTickID, "darkgray")
    }
    let colorA = "crimson";
    HightlightTickRC(id, colorA)
    lastSelectedTickID = id;

}

function HightlightTickRC(id, color) {
    let textHighlightL = id.split(":");
    let LabelCounter = textHighlightL[1];
    for (let C = 2; C < textHighlightL.length; C++) {
        let LableName = "TickingCell_" + LabelCounter + "_" + textHighlightL[C];
        document.getElementById(LableName).style.backgroundColor = color;
    }
}

//id = "LineDrawing_2_5_1"
//id = "LineCrossing:2:R_1"

//LineCrossing: 2: R_2
let lastlineCrossing = "";
function HighlightLineCrossing(id) {

    if (lastlineCrossing != "") {

        UpdateHighlightLineCrossing(lastlineCrossing, "mediumaquamarine")
    }
    let colorA = "crimson";
    UpdateHighlightLineCrossing(id, colorA);
    lastlineCrossing = id;

}

function UpdateHighlightLineCrossing(id, color) {
    // LineCrossing: 5: 2:R:2
    //LineDrawing_2_2_1

    let textHighlightL = id.split(":");
    let TotalJobs = textHighlightL[1]
    let LabelCounter = textHighlightL[2];
    let RowOrCol = textHighlightL[3];
    let RowOrColNumber = textHighlightL[4];


    for (let k = 1; k <= TotalJobs; k++) {
        let LableName = "LineDrawing_" + LabelCounter + "_";
        if (RowOrCol == "R") {
            LableName += RowOrColNumber + "_" + k;
        }
        else {
            LableName += k + "_" + RowOrColNumber;
        }

        document.getElementById(LableName).style.backgroundColor = color;
    }

}
