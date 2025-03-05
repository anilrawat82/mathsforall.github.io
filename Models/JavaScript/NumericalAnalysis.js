let sValues;
let LastRow = -1;
let LastCol = -1;
let MaxArraySize;
let ColumnSize=2;
let OperatorSelected;
let MethodType = 1;

function GetMatrixValues() {
    sValues = "";
    for (let col = 1; col <= ColumnSize; col++)
    {
        for (let row = 0; row < MaxArraySize; row++) {

            let idValue = "txtvalue_" + row + "_" + col;
            sValues += Number(document.getElementById(idValue).value) + ":";
            
        }
    }
}
function GetMatrixValues2() {
    sValues = "";
    for (let col = 1; col <= ColumnSize; col++) {
        for (let row = 0; row < MaxArraySize; row++) {

            let idValue = "txtvalue_" + row + "_" + col;
            sValues += document.getElementById(idValue).value + ":";
        }
    }
}
function DrawGraphLine(GraphAndLine)
{
    let pivot = GraphAndLine.split("@")[0].split(",");
    let Yvalues = GraphAndLine.split("@")[1].split(",");
    let X= GraphAndLine.split("@")[2].split(",");
    let Y = GraphAndLine.split("@")[3].split(",");
    let xs = GraphAndLine.split("@")[4].split(",");
    let range = GraphAndLine.split("@")[5].split(",");
    
    sOutput = "<svg height =" + "\" " + 400 + "\"" + " width = " + "\" " + 1000 + "\"" + ">";
    sOutput += "<rect  x  =" + "\" " + 0 + "\"" + " y =" + "\" " + 0 + "\"" + " height =" + "\" " + 800 + "\"" + " width = " + "\" " + 1000 + "\"" + "  class=" + "\"SVGRectagle\"" + "/>";
    if (MethodType==2)
        sOutput += "<text x =" + "\"" + 400 + "\"" + " y = " + "\"" + 25 + "\"" + "class=" + "\"SVGElementH\"" + ">" + "False Position Method" + "</text>";
    else
        sOutput += "<text x =" + "\"" + 400 + "\"" + " y = " + "\"" + 25 + "\"" + "class=" + "\"SVGElementH\"" + ">" + "Bisection Method" + "</text>";
    let j = 0;

    let PointS = 0 + "," + pivot[1] + "," + 1000 + "," + pivot[1];
    sOutput += "<polygon points =" + "\" " + PointS + "\"" + "  class=" + "\"SVGRectagle\"" + "/>";
    PointS = pivot[0] + "," + 0 + "," + pivot[0]+ "," + 400;
    sOutput += "<polygon points =" + "\" " + PointS + "\"" + "  class=" + "\"SVGRectagle\"" + "/>";

    let h = (Number(range[1]) - Number(range[0])) / 1000;
    let k = (Number(range[3]) - Number(range[2])) / 400;
    for (i = 0; i < 1000; i++)
    {
        let Yvalues_ = Number(Yvalues[i]);
        sOutput += "<circle cx  =" + "\" " + i + "\"" + " cy =" + "\" " + Yvalues_ + "\"" + "r  =" + "\" " + .25 + "\"" + "  class=" + "\"SVGFxFunction\"" + "/>";
    }

    while (j < X.length)
    {
        let Xr = Number(X[j]);
        let Yr = Number(Y[j]);
        let PointSz = Xr + "," + pivot[1] + "," + Xr + "," + Yr;
        sOutput += "<polygon points =" + "\" " + PointSz + "\"" + "  class=" + "\"SVGDashLine\"" + "/>";
        let YrZ = 0;
        if (Yr > pivot[1]) {

             YrZ = Number(pivot[1]) - 5;
        }
        else
        {
            YrZ = Number(pivot[1]) + 15;
        }
        sOutput += "<text x =" + "\"" + Xr + "\"" + " y = " + "\"" + YrZ + "\"" + "class=" + "\"SVGElementX\"" + ">" + xs[j] + "</text>";
        sOutput += "<circle cx  =" + "\" " + Xr + "\"" + " cy =" + "\" " + Yr + "\"" + "r  =" + "\" " + 1 + "\"" + "  class=" + "\"SVGPoints\"" + "/>";
        j ++;
    }
    sOutput += "</svg>";
    document.getElementById('iCanvas').innerHTML = sOutput;
}
function HighlightForwardValues(ElementID)
{
    let myArr = ElementID.split("_");
    CurrenTrow_ = myArr[1];
    CurrenTCol_ = myArr[2];
    if (CurrenTrow_ == LastRow && CurrenTCol_ == LastCol) {
        return;
    }
    
    let colorB = "darkslategrey";
    if (LastRow != -1 && LastCol != -1) {
        document.getElementById("txtCvalue_" + LastRow + "_" + LastCol).style.backgroundColor = colorB;



        if (OperatorSelected == 1) {
            let R = Number(LastRow) - 1;
            let C = Number(LastCol) - 1;
            document.getElementById("txtCvalue_" + R + "_" + C).style.backgroundColor = colorB;
            R = Number(LastRow) + 1;
            C = Number(LastCol) - 1;
            document.getElementById("txtCvalue_" + R + "_" + C).style.backgroundColor = colorB;
        }
        else {
            let R = Number(LastRow) - 1;
            let C = Number(LastCol) - 1;
            document.getElementById("txtCvalue_" + R + "_" + C).style.backgroundColor = colorB;
            R = LastRow;
            C = LastCol - 1;
            document.getElementById("txtCvalue_" + R + "_" + C).style.backgroundColor = colorB;
        }
    }
    LastRow = CurrenTrow_;
    LastCol = CurrenTCol_;

    let colorA = "darkorange";

    document.getElementById("txtCvalue_" + LastRow + "_" + LastCol).style.backgroundColor = colorA;

    if (OperatorSelected == 1) {
        let R = Number(LastRow) - 1;
        let C = Number(LastCol) - 1;
        document.getElementById("txtCvalue_" + R + "_" + C).style.backgroundColor = colorA;
        R = Number(LastRow) + 1;
        C = Number(LastCol) - 1;
        document.getElementById("txtCvalue_" + R + "_" + C).style.backgroundColor = colorA;
    }
    else {
        let R = Number(LastRow) - 1;
        let C = Number(LastCol) - 1;
        document.getElementById("txtCvalue_" + R + "_" + C).style.backgroundColor = colorA;
        R = LastRow;
        C = LastCol - 1;
        document.getElementById("txtCvalue_" + R + "_" + C).style.backgroundColor = colorA;
    }
}