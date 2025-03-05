
let normalX;
let normalY;
let normalX1;
let normalY1;
let PxA;
let PyA;
let sOutput;
let bSolver = false;
let DirectedGraph = true;
function DrawSolverA(SolverFile) {
    bSolver = true;
    let SolverA = SolverFile.split("***")
    let sOutputA;
    let counter = 0;
    while (counter < SolverA.length - 1) {

        sOutputA += SolverA[counter];
        DrawGraphLineA(SolverA[counter + 1]);
        sOutputA += sOutput;

        counter += 2;
    }
    sOutputA += SolverA[SolverA.length - 1];
    document.getElementById('MatrixArea').innerHTML = sOutputA;
    bSolver = false;
}
function DrawGraphLineA(GraphAndLine) {

    let Graph = GraphAndLine.split("@@@")[0].split(":");
    let Line = GraphAndLine.split("@@@")[1].split(":");
    sOutput = "<svg height =" + "\" " + 400 + "\"" + " width = " + "\" " + 1000 + "\"" + ">";
    sOutput += "<rect  x  =" + "\" " + 0 + "\"" + " y =" + "\" " + 0 + "\"" + " height =" + "\" " + 800 + "\"" + " width = " + "\" " + 1000 + "\"" + "  class=" + "\"SVGRectagle\"" + "/>";
    sOutput += "<text x =" + "\"" + 750 + "\"" + " y = " + "\"" + 25 + "\"" + "class=" + "\"SVGElementH\"" + ">" + "MaxFlow-RemainingFlow-UsedFlow" + "</text>";
    let j = 0;
    if (Line.length >= 5) {
        while (j < Line.length) {
            Line[j] = Number(Line[j]);
            Line[j + 1] = Number(Line[j + 1]);
            Line[j + 2] = Number(Line[j + 2]);
            Line[j + 3] = Number(Line[j + 3]);

            let Cx = Line[j + 5];
            let Cy = Line[j + 6];
            let FlowInfo = Line[j + 7];

            if (Cx == 0 && Cy == 0) {
                let PointS = Line[j] + "," + Line[j + 1] + "," + Line[j + 2] + "," + Line[j + 3];
                sOutput += "<polygon points =" + "\" " + PointS + "\"" + "class=" + "\"SVGLine1\"" + " stroke =" + "\"" + Line[j + 4] + "\"" + "/>";
                GetPerpandicularValue(Line[j], Line[j + 1], Line[j + 2], Line[j + 3], 0.6, 15);
                if (DirectedGraph)
                {                    
                    PointS = PxA + "," + PyA + "," + normalX + "," + normalY;
                    sOutput += "<polygon points =" + "\" " + PointS + "\"" + "class=" + "\"SVGLine1\"" + " stroke =" + "\"" + Line[j + 4] + "\"" + "/>";
                    PointS = PxA + "," + PyA + "," + normalX1 + "," + normalY1;
                    sOutput += "<polygon points =" + "\" " + PointS + "\"" + "class=" + "\"SVGLine1\"" + " stroke =" + "\"" + Line[j + 4] + "\"" + "/>";
                }
                let pzx = Number(PxA) - 20;
                let pzy = Number(PyA) - 20;
                sOutput += "<text x =" + "\"" + pzx + "\"" + " y = " + "\"" + pzy + "\"" + "class=" + "\"SVGElement\"" + ">" + FlowInfo + "</text>";
                //sOutput += "<text x =" + "\"" + pzx + "\"" + " y = " + "\"" + pzy +  " fill=" + "\"red\"" + ">" + FlowInfo + "</text>";


            }
            else {
                let PointCurveX1 = 0;
                let PointCurveY1 = 0;
                let PointCurveX2 = 0;
                let PointCurveY2 = 0;
                let PointCurveX3 = 0;
                let PointCurveY3 = 0;

                let Counter = 0;
                for (let k = 0; k < 1; k = k + .001) {

                    let t = k;
                    let Bx = Math.pow((1 - t), 2) * Line[j] + 2 * (1 - t) * t * Cx + t * t * Line[j + 2];
                    let By = Math.pow((1 - t), 2) * Line[j + 1] + 2 * (1 - t) * t * Cy + t * t * Line[j + 3];

                    let circleC = "SVGCircleColor";
                    sOutput += "<circle cx  =" + "\" " + Bx + "\"" + " cy =" + "\" " + By + "\"" + "r  =" + "\" " + 1 + "\"" + "class=" + "\"SVGLine1\"" + " stroke =" + "\"" + Line[j + 4] + "\"" + "/>";

                    if (Counter == 450) {
                        PointCurveX1 = Bx;
                        PointCurveY1 = By;
                    }
                    else if (Counter == 550) {
                        PointCurveX2 = Bx;
                        PointCurveY2 = By;
                    }
                    else if (Counter == 600) {
                        PointCurveX3 = Bx;
                        PointCurveY3 = By;
                    }
                    Counter++;
                }
                if (DirectedGraph)
                {
                    GetPerpandicularValue(PointCurveX1, PointCurveY1, PointCurveX2, PointCurveY2, 0.5, 15);
                    let PointS = PointCurveX3 + "," + PointCurveY3 + "," + normalX + "," + normalY;
                    sOutput += "<polygon points =" + "\" " + PointS + "\"" + "class=" + "\"SVGLine1\"" + " stroke =" + "\"" + Line[j + 4] + "\"" + "/>";
                    PointS = PointCurveX3 + "," + PointCurveY3 + "," + normalX1 + "," + normalY1;
                    sOutput += "<polygon points =" + "\" " + PointS + "\"" + "class=" + "\"SVGLine1\"" + " stroke =" + "\"" + Line[j + 4] + "\"" + "/>";
                }
                let pzx = Number(PointCurveX3) - 20;
                let pzy = Number(PointCurveY3) - 20;
                sOutput += "<text x =" + "\"" + pzx + "\"" + " y = " + "\"" + pzy + "\"" + "class=" + "\"SVGElement\"" + ">" + FlowInfo + "</text>";
                //sOutput += "<label x =" + "\"" + pzx + "\"" + " y = " + "\"" + pzy + "\"" + " class=" + "\"SVGElement\"" + " style=" + "\"color:" + "Red" + "\"" + ">" + FlowInfo + "</label>";
            }
            j += 8;

        }

    }


    j = 0;
    if (Graph.length > 3) {
        while (j < Graph.length) {
            sOutput += "<circle cx  =" + "\" " + Graph[j] + "\"" + " cy =" + "\" " + Graph[j + 1] + "\"" + "r  =" + "\" " + 15 + "\"" + " class=" + "\"" + Graph[j + 2] + "\"" + "/>";
            
            sOutput += "<text x =" + "\"" + Graph[j + 3] + "\"" + " y = " + "\"" + Graph[j + 4] + "\"" + "class=" + "\"SVGElement\"" + ">" + Graph[j + 6] + "</text>";

            let yA = Number(Graph[j + 4]) - 2 * 15;
            sOutput += "<text x =" + "\"" + Graph[j + 3] + "\"" + " y = " + "\"" + yA + "\"" + "class=" + "\"SVGElement\"" + ">" + Graph[j + 5] + "</text>";
            j += 7;
        }
    }
    sOutput += "</svg>";
    if (!bSolver)
        document.getElementById('iCanvas').innerHTML = sOutput;
}


function DrawSolver(SolverFile) {
    bSolver = true;
    let SolverA = SolverFile.split("***")
    let sOutputA;
    let counter = 0;
    while (counter < SolverA.length - 1) {

        sOutputA += SolverA[counter];
        DrawGraphLine(SolverA[counter + 1]);
        sOutputA += sOutput;

        counter += 2;
    }
    sOutputA += SolverA[SolverA.length - 1];
    document.getElementById('MatrixArea').innerHTML = sOutputA;
    bSolver = false;
}
    function DrawGraphLine(GraphAndLine)
    {
        
        let Graph = GraphAndLine.split("@@@")[0].split(":");
        let Line = GraphAndLine.split("@@@")[1].split(":");
        sOutput = "<svg height =" + "\" " + 400 + "\"" + " width = " + "\" " + 1000 + "\"" + ">";
        sOutput += "<rect  x  =" + "\" " + 0 + "\"" + " y =" + "\" " + 0 + "\"" + " height =" + "\" " + 800 + "\"" + " width = " + "\" " + 1000 + "\"" + "  class=" + "\"SVGRectagle\"" + "/>";
        sOutput += "<text x =" + "\"" + 750 + "\"" + " y = " + "\"" + 25 + "\"" + "class=" + "\"SVGElementH\"" + ">" + "MaxFlow-RemainingFlow-UsedFlow" + "</text>";
        let j = 0;
        if (Line.length >= 5) {
            while (j < Line.length) {
                Line[j] = Number(Line[j]);
                Line[j + 1] = Number(Line[j + 1]);
                Line[j + 2] = Number(Line[j + 2]);
                Line[j + 3] = Number(Line[j + 3]);
                
                let Cx = Line[j + 5];
                let Cy = Line[j + 6];
                let FlowInfo = Line[j + 7];

                if (Cx == 0 && Cy == 0)
                {
                    let PointS = Line[j] + "," + Line[j+1] + "," + Line[j+2] + "," + Line[j+3];
                    sOutput += "<polygon points =" + "\" " + PointS + "\"" + "class=" + "\"SVGLine1\"" + " stroke =" + "\"" + Line[j + 4] + "\"" + "/>";
                    GetPerpandicularValue(Line[j], Line[j + 1], Line[j + 2], Line[j + 3], 0.6, 15);
                    if (DirectedGraph)
                    {
                        PointS = PxA + "," + PyA + "," + normalX + "," + normalY;
                        sOutput += "<polygon points =" + "\" " + PointS + "\"" + "class=" + "\"SVGLine1\"" + " stroke =" + "\"" + Line[j + 4] + "\"" + "/>";
                        PointS = PxA + "," + PyA + "," + normalX1 + "," + normalY1;
                        sOutput += "<polygon points =" + "\" " + PointS + "\"" + "class=" + "\"SVGLine1\"" + " stroke =" + "\"" + Line[j + 4] + "\"" + "/>";
                    }
                    let pzx = Number(PxA) - 20;
                    let pzy = Number(PyA) - 20;
                    sOutput += "<text x =" + "\"" + pzx + "\"" + " y = " + "\"" + pzy + "\"" + "class=" + "\"SVGElement\"" + ">" + FlowInfo + "</text>";
                    //sOutput += "<text x =" + "\"" + pzx + "\"" + " y = " + "\"" + pzy +  " fill=" + "\"red\"" + ">" + FlowInfo + "</text>";
                    
                    
                }
                else 
                {
                    let PointCurveX1 = 0;
                    let PointCurveY1 = 0;
                    let PointCurveX2 = 0;
                    let PointCurveY2 = 0;
                    let PointCurveX3 = 0;
                    let PointCurveY3 = 0;

                    let Counter = 0;
                    for (let k = 0; k < 1; k = k + .001) {

                        let t = k;
                        let Bx = Math.pow((1 - t), 2) * Line[j] + 2 * (1 - t) * t * Cx + t * t * Line[j + 2];
                        let By = Math.pow((1 - t), 2) * Line[j + 1] + 2 * (1 - t) * t * Cy + t * t * Line[j + 3];

                        let circleC = "SVGCircleColor";
                        sOutput += "<circle cx  =" + "\" " + Bx + "\"" + " cy =" + "\" " + By + "\"" + "r  =" + "\" " + 1 + "\"" + "class=" + "\"SVGLine1\"" + " stroke =" + "\"" + Line[j + 4] + "\"" + "/>";

                        if (Counter == 450) {
                            PointCurveX1 = Bx;
                            PointCurveY1 = By;
                        }
                        else if (Counter == 550) {
                            PointCurveX2 = Bx;
                            PointCurveY2 = By;
                        }
                        else if (Counter == 600) {
                            PointCurveX3 = Bx;
                            PointCurveY3 = By;
                        }
                        Counter++;
                    }
                    if (DirectedGraph)
                    {
                        GetPerpandicularValue(PointCurveX1, PointCurveY1, PointCurveX2, PointCurveY2, 0.5, 15);
                        let PointS = PointCurveX3 + "," + PointCurveY3 + "," + normalX + "," + normalY;
                        sOutput += "<polygon points =" + "\" " + PointS + "\"" + "class=" + "\"SVGLine1\"" + " stroke =" + "\"" + Line[j + 4] + "\"" + "/>";
                        PointS = PointCurveX3 + "," + PointCurveY3 + "," + normalX1 + "," + normalY1;
                        sOutput += "<polygon points =" + "\" " + PointS + "\"" + "class=" + "\"SVGLine1\"" + " stroke =" + "\"" + Line[j + 4] + "\"" + "/>";
                    }
                    let pzx = Number(PointCurveX3) - 20;
                    let pzy = Number(PointCurveY3) - 20;
                    sOutput += "<text x =" + "\"" + pzx + "\"" + " y = " + "\"" + pzy + "\"" + "class=" + "\"SVGElement\"" + ">" + FlowInfo + "</text>";
                    //sOutput += "<label x =" + "\"" + pzx + "\"" + " y = " + "\"" + pzy + "\"" + " class=" + "\"SVGElement\"" + " style=" + "\"color:" + "Red" + "\"" + ">" + FlowInfo + "</label>";
                }
                j += 8;

            }

        }

        
        j = 0;
        if (Graph.length > 3) {
            while (j < Graph.length) {
                sOutput += "<circle cx  =" + "\" " + Graph[j] + "\"" + " cy =" + "\" " + Graph[j + 1] + "\"" + "r  =" + "\" " + 15 + "\"" + " class=" + "\"" + Graph[j + 2] + "\"" + "/>";
                sOutput += "<text x =" + "\"" + Graph[j + 3] + "\"" + " y = " + "\"" + Graph[j + 4] + "\"" + "class=" + "\"SVGElement\"" + ">" + Graph[j + 5] + "</text>";

                j += 6;
            }
        }
        sOutput += "</svg>";
        if (!bSolver)
            document.getElementById('iCanvas').innerHTML = sOutput;
    }
        
function SetHamiltonianValue(values)
{
    let SolverA = values.split(":")
    for (let k = 0; k < SolverA.length; k++)
    {
        let j = k + 1;
        document.getElementById('ArrayVal' + j).innerHTML = SolverA[k];
        
    }
    
}

function GetPerpandicularValue(X1, Y1, X2, Y2, distance, ALength)
{

    PxA = X1 + (X2 - X1) * distance;
    PyA = Y1 + (Y2 - Y1) * distance;
    if (DirectedGraph)
    {

        let Px = X1 + (X2 - X1) * .5;
        let Py = Y1 + (Y2 - Y1) * .5;

        let slopePerp = -(X2 - X1) / (Y2 - Y1);
        let Py1 = slopePerp * (Px - 4 - Px) + Py;
        let Py2 = slopePerp * (Px + 4 - Px) + Py;
        let Distace = Math.sqrt((-4 * -4) + (Py1 - Py) * (Py1 - Py));
        normalX = Px + ALength * -4 / Distace;
        normalY = Py + ALength * (Py1 - Py) / Distace;
        let DistaceA = Math.sqrt((4 * 4) + (Py2 - Py) * (Py2 - Py));
        normalX1 = Px + ALength * 4 / DistaceA;
        normalY1 = Py + ALength * (Py2 - Py) / DistaceA;
    }

}