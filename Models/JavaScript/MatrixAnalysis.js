let MatrixOrder = 0;
let MatrixRow = 0;
let MatrixCol = 0;
let CurrentPos = -1;
let LuSolution;
let LastSelectedMinors = "";
let className = "";
let LastMatrix=-1;
let Count = -1;;
let CountA = -1;

//const Variables = ["X", "Y", "Z", "U", "V", "W", "A", "B", "C"];
//const VariablesX = ["X<sub>1</sub>", "X<sub>2</sub>", "X<sub>3</sub>", "X<sub>4</sub>", "X<sub>5</sub>", "X<sub>6</sub>", "X<sub>7</sub>", "X<sub>8</sub>", "X<sub>9</sub>"];
function ResetLastStyle()
{
    let MinorSelected = "MinorInfo_" + LastMatrix;
    document.getElementById(MinorSelected).innerHTML = "";
    for (let Row_ = 0; Row_ < LastMatrix + 1; Row_++) {
        for (let Col_ = 0; Col_ < LastMatrix + 1; Col_++)
        {
            let s = "MinorSelected_" + Count + "_" + (LastMatrix + 1) + "_" + Row_ + "_" + Col_;
                document.getElementById(s).style = className;
        }
    }

}
function HighlightMinorMatrix(ElementID)
{
    let myArr = ElementID.split("_");
    let M = Number(myArr[2]);
    let C = Number(myArr[1]);
    if (M == MatrixRow)
        return;
    
    if (Number(LastMatrix) == M && CountA == C)
    {
        return;
    }
    if (className != "")
        ResetLastStyle();

    
    CountA = C;
    LastMatrix = M;
    let Rem = C % (M + 1);
    let z = (C - Rem) / (M + 1);
    Count = Number(z);
    let M1 = "MinorSelected_" + z + "_" + (M + 1) + "_0_0";
    className = document.getElementById(M1).getAttribute("class");
    let colorA = "darkorange";

    let MinorSelected = "MinorInfo_" + M;
    document.getElementById(MinorSelected).innerHTML = "For Calculating this Minor we exclude First row and  " + Number(Rem + 1) + " column shown in pink also move pivot element shown in blue out,multiply pivot element with sign above it.";
    document.getElementById(MinorSelected).style.backgroundColor = getRandomColor();
    
    for (let Row_ = 0; Row_ < M + 1; Row_++)
    {
        for (let Col_ = 0; Col_ < M + 1; Col_++)
        {
            let s = "MinorSelected_" + z + "_" + (M + 1) + "_" + Row_ + "_" + Col_;
            if (Col_ != Rem && Row_!=0)
            {
                
                document.getElementById(s).style.backgroundColor = colorA;
            }
            else if (Col_ == Rem && Row_ == 0)
            {
                document.getElementById(s).style.backgroundColor = "blue";
            }
            else
            {
                document.getElementById(s).style.backgroundColor = "pink";

            }
        }
    }
}

function GenerateDeterminant(type) {
    document.getElementById('Solutions').innerHTML = "";
    var MatrixArea = document.getElementById('MatrixArea');
    MatrixArea.innerHTML = "";
    if (type == "1") {
        MatrixRow = Number(document.getElementById("txtMatrixOrder").value);
        MatrixCol = MatrixRow;
    }
    else {
        MatrixRow = Number(document.getElementById("txtMatrixOrderR").value);
        MatrixCol = Number(document.getElementById("txtMatrixOrderC").value);
    }


    if (isNaN(MatrixRow) == true|| isNaN(MatrixCol) == true)  {
        MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Numeric Value Greater than 0 </h2>";
        return;
    }
    let Matrixstring = "";
    Matrixstring = "<table class=" + "\"SolutionTable\"" + ">";
    Matrixstring += "<tr>";
    Matrixstring += "<th colspan=" + MatrixCol + " class = " + "\"TopHeader\"" + ">Matrix</th>";
    Matrixstring += "</tr>";
    for (let Row_ = 0; Row_ < MatrixRow; Row_++)
    {
        Matrixstring += "<tr>";
        for (let Col_ = 0; Col_ < MatrixCol; Col_++) {

            let s = "\"txtAvalue_" + Row_ + "_" + Number(Col_) + "\"";

            Matrixstring += "<td><input type = " + "\"text\" id = " + s.toString() + " class = " + "\"AMatrixvalue\"" + "/></td>";
        }
    }
    Matrixstring += "</table >";
    MatrixArea.innerHTML = Matrixstring;
    document.getElementById("dCalculateNow").hidden = false;
}
function GenerateSolutionTable(stext)
  {
      let myArr = stext.split("$$$");

      let sSolution = myArr[0];
      for (let k = 1; k < myArr.length - 1; k++)
      {
          let myArrA = myArr[k].split("##");
          let TCol = myArrA[0];

          let MinorSelected = "MinorInfo_" + TCol;
          sSolution += "<table class=" + "\"SolutionTable\"" + ">";

          sSolution += myArrA[1];
          sSolution += "</table >";

          sSolution += "<table class=" + "\"SolutionTable\"" + ">";
          sSolution += "<tr>";
          sSolution += "<td id = " + MinorSelected + " class=" + "\"MinorSelectedInfo\"" + ">";
          sSolution += "</td>";
          sSolution += "</tr>";
          sSolution += "</table >";
          let iColour = 0;
          let maxRow = Math.ceil(Number(MatrixRow * (myArrA.length - 3) / 80));
          let m = 2;
          
          for (let jk = 0; jk < maxRow; jk++)
          {
            let lineCount = 0;
            sSolution += "<table class=" + "\"SolutionTableT\"" + ">";
            sSolution += "<tr>";            
              
            let isContinue = true;
            if (m == myArrA.length - 1)
                  isContinue = false;
             while(isContinue)
             {
                  
                  let bFirstIime = true;
                  sSolution += "<td >";
                  sSolution += "<table class=" + "\"SolutionTableM\"" + ">";
                  let outSide = myArrA[m].split(":");
                  sSolution += "<tr>";
                  if (iColour % 2 == 0)
                      sSolution += "<td rowspan=" + Number(TCol + 1) + " class=" + "\"MatrixOutsideA\"" + ">";
                  else
                      sSolution += "<td rowspan=" + Number(TCol + 1) + " class=" + "\"MatrixOutsideB\"" + ">";

                  let sx = "";
                  for (let v = 0; v < outSide.length; v++) {
                      sx += outSide[v] + "*";
                  }
                  //sx = sx.Remove(sx.Length - 1, 1);
                  sx = sx.substr(0, sx.length - 1)
                  if (iColour == 0)
                      sSolution += "(" + sx + ")";
                  else
                      sSolution += "+(" + sx + ")";

                  sSolution += "</td>";
                  Minors = myArrA[m + 1].split(":");
                  let count = 0;
                 
                 
                 lineCount += MatrixRow;

                 m = m + 2;
                 if (lineCount > 35 ||( m >= myArrA.length - 1))
                 {
                     isContinue = false;
                 }
                  for (let i = -1; i < Number(TCol); i++) {
                      let iSymbol = 0;
                      if (!bFirstIime)
                          sSolution += "<tr>";
                      bFirstIime = false;
                      for (let j = 0; j < Number(TCol); j++) {

                          let s = "MinorSelected_" + iColour + "_" + TCol + "_" + i + "_" + j;
                          if (i != -1) {
                              if (iColour % 2 == 0) {
                                  if (j == 0) { sSolution += "<td id = " + s + " class=" + "\"MatrixMinorALeft\"" + " onmouseover = " + "HighlightMinorMatrix(this.id);" + ">"; }
                                  else if (j == TCol - 1) { sSolution += "<td id = " + s + " class=" + "\"MatrixMinorARight\"" + " onmouseover = " + "HighlightMinorMatrix(this.id);" + ">"; }
                                  else { sSolution += "<td id = " + s + " class=" + "\"MatrixMinorA\"" + " onmouseover = " + "HighlightMinorMatrix(this.id);" + ">"; }

                              }
                              else {
                                  if (j == 0) { sSolution += "<td id = " + s + " class=" + "\"MatrixMinorBLeft\"" + " onmouseover = " + "HighlightMinorMatrix(this.id);" + ">"; }
                                  else if (j == TCol - 1) { sSolution += "<td id = " + s + " class=" + "\"MatrixMinorBRight\"" + " onmouseover = " + "HighlightMinorMatrix(this.id);" + ">"; }
                                  else { sSolution += "<td id = " + s + " class=" + "\"MatrixMinorB\"" + " onmouseover = " + "HighlightMinorMatrix(this.id);" + ">"; }

                              }
                          }
                          if (i == -1) {
                              sSolution += "<td id = " + s + " class=" + "\"MatrixSign\"" + ">";

                              sSolution += iSymbol % 2 == 0 ? "+" : "-";
                              iSymbol++;
                          }
                          else {
                              sSolution += Minors[count];
                              count++;
                          }
                          sSolution += "</td>";


                      }
                      sSolution += "</tr>";
                  }
                  iColour++;
                  sSolution += "</table >";
                  sSolution += "</td>";
              }
          }
          sSolution += "</tr>";
          sSolution += "</table>";
      }      
      sSolution += myArr[myArr.length - 1];
      document.getElementById('Solutions').innerHTML = sSolution;
}
function GetHighlightText(LineInfoa)
{
    
    var newStr1 = LineInfoa.split('#');
    //document.getElementById(newStr1[0]).style.color = newStr1[1];
    document.getElementById(newStr1[0]).className = "MatrixSelected";
   
}

function GetHighlightTextOut(LineInfoa)
{
    var newStr1 = LineInfoa.split('#');
    //document.getElementById(newStr1[0]).style.color = newStr1[1];
    document.getElementById(newStr1[0]).className = "MatrixNew";
}

function GetHighlightTextArray(LineInfoa)
{
    var newStr1 = LineInfoa.split('#');
    let StYleId = Number(newStr1.length) - 1;
    for (let k = 1; k < newStr1.length- 1; k++)
    {
        let stra = newStr1[0] + "_"+ newStr1[k];
        //document.getElementById(stra).style.color = newStr1[StYleId];
        document.getElementById(stra).className = "MatrixSelected";
    }  
}

function GetHighlightTextOutArray(LineInfoa)
{
    var newStr1 = LineInfoa.split('#');
    let StYleId = Number(newStr1.length) - 1;
    for (let k = 1; k < newStr1.length - 1; k++)
    {
        let stra = newStr1[0] + "_" + newStr1[k];
        //document.getElementById(stra).style.color = newStr1[StYleId];
        document.getElementById(stra).className = "MatrixNew";
        
    }
}


function GetHighlightOrthoText(LineInfoa) {

    var newStr1 = LineInfoa.split('#');
    let n = Number(newStr1[1]);
    let S1 = newStr1[0] + n;
    let S2 = newStr1[0] + (n + 1);
    let Row = Number(newStr1[2])
    let Col = Number(newStr1[3])
    for (let i=0; i< Row;i++)
    {
        for (let j= 0; j <Col; j++)
        {
            let Txt1 = S1 + "_" + i + "_" + j;
            let Txt2 = S2 + "_" + i + "_" + j;
            document.getElementById(Txt1).style.backgroundColor = newStr1[4];
            document.getElementById(Txt2).style.backgroundColor = newStr1[4];
        }
    }   

}

function GetHighlightOrthoTextOut(LineInfoa) {
    var newStr1 = LineInfoa.split('#');
    let n = Number(newStr1[1]);
    let S1 = newStr1[0] + n;
    let S2 = newStr1[0] + (n + 1);
    let Row = Number(newStr1[2])
    let Col = Number(newStr1[3])
    for (let i = 0; i < Row; i++) {
        for (let j = 0; j < Col; j++) {
            let Txt1 = S1 + "_" + i + "_" + j;
            let Txt2 = S2 + "_" + i + "_" + j;
            document.getElementById(Txt1).style.backgroundColor = newStr1[4];
            document.getElementById(Txt2).style.backgroundColor = newStr1[4];
        }
    }   
}
function GetHighlightOrthoText2(LineInfoa)
{
    var newStr1 = LineInfoa.split('#');
    let n = Number(newStr1[1]);
    let S1 = newStr1[0] + n;
    let S2 = newStr1[0] + (n + 1);
    let S3 = newStr1[2];
    document.getElementById(S1).style.backgroundColor = newStr1[3];
    if (S3==2)
        document.getElementById(S2).style.backgroundColor = newStr1[3];
}
function GetHighlightOrthoTextOut2(LineInfoa)
{
    var newStr1 = LineInfoa.split('#');
    let n = Number(newStr1[1]);
    let S1 = newStr1[0] + n;
    let S2 = newStr1[0] + (n + 1);
    let S3 = newStr1[2];
    document.getElementById(S1).style.backgroundColor = newStr1[3];
    if (S3 == 2)
        document.getElementById(S2).style.backgroundColor = newStr1[3];
}
function GenerateEquationSystem(type,lU)
{
    document.getElementById('Solutions').innerHTML = "";
    var MatrixArea = document.getElementById('MatrixArea');
    MatrixArea.innerHTML = "";
    if (type == "1") {
        MatrixRow = Number(document.getElementById("txtMatrixOrder").value);
        MatrixCol = MatrixRow;
    }
    else {
        MatrixRow = Number(document.getElementById("txtMatrixOrderR").value);
        MatrixCol = Number(document.getElementById("txtMatrixOrderC").value);
    }


    if (isNaN(MatrixRow) == true || isNaN(MatrixCol) == true) {
        MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Numeric Value Greater than 0 </h2>";
        return;
    }
    let Matrixstring = "";
    Matrixstring = "<table class=" + "\"SolutionTable\"" + ">";
    Matrixstring += "<tr>";
    Matrixstring += "<th colspan=" + MatrixCol + " class = " + "\"TopHeader\"" + ">MatrixA</th>";
    Matrixstring += "<th  class = " + "\"TopHeader\"" + ">X</th>";
    Matrixstring += "<th class = " + "\"TopHeader\"" + ">MatrixB</th>";
    Matrixstring += "</tr>";
    for (let Row_ = 0; Row_ < MatrixRow; Row_++) {
        Matrixstring += "<tr>";
        for (let Col_ = 0; Col_ < MatrixCol+1; Col_++) {

            let s = "\"txtAvalue_" + Row_ + "_" + Number(Col_) + "\"";
            if (Col_ == MatrixCol)
            {
                Matrixstring += "<td  class = " + "\"VariableName\"" + "/>" + "X<sub>" + Row_ + "</sub>" + "</td>";
                
            }
            if (Col_ == MatrixCol)
            {
                Matrixstring += "<td><input type = " + "\"text\" id = " + s.toString() + " class = " + "\"BMatrixvalue\"" + "/></td>";
            }
            else
            {
                Matrixstring += "<td><input type = " + "\"text\" id = " + s.toString() + " class = " + "\"AMatrixvalue\"" + "/></td>";
            }
        }
    }
    Matrixstring += "</table >";
    MatrixArea.innerHTML = Matrixstring;
    document.getElementById("dCalculateNow").hidden = false;
}
function GetHighlightTextLUP(LineInfoa)
{
    var newStr = LineInfoa.split('#');
    var newStr1 = newStr[0].split('_');
    let sx = "txtvalue_" + newStr[0];
    document.getElementById(sx).style.backgroundColor = newStr[1];
    for (let i = 0; i < MatrixOrder; i++)
    {
        let Col = Number(MatrixOrder) * 2 + Number(newStr1[2]);
        let s = "txtvalue_" + newStr1[0] + "_" + i + "_" + Col;
        document.getElementById(s).style.backgroundColor = newStr[1];
    }
    for (let i = 0; i < MatrixOrder; i++) {
        let Col = Number(MatrixOrder) + i;
        let s = "txtvalue_" + newStr1[0] + "_" + newStr1[1] + "_" + Col;
        document.getElementById(s).style.backgroundColor = newStr[1];
    }

}
function GetHighlightTextOutLUP(LineInfoa)
{
    var newStr = LineInfoa.split('#');
    var newStr1 = newStr[0].split('_');
    let sx = "txtvalue_" + newStr[0];
    document.getElementById(sx).style = "InputMatrixvalue";

    for (let i = 0; i < MatrixOrder; i++)
    {
        let Col = Number(MatrixOrder) * 2 + Number(newStr1[2]);
        let s = "txtvalue_" + newStr1[0] + "_" + i + "_" + Col;
        document.getElementById(s).style = "AugmentedMatrix";
    }
    for (let i = 0; i < MatrixOrder; i++) {
        let Col = Number(MatrixOrder) + i;
        let s = "txtvalue_" + newStr1[0] + "_" + newStr1[1] + "_" + Col;
        document.getElementById(s).style = "EquationVariable";

    }
}

function FillMatrix(id)
{
    document.getElementById("SolutionID").innerHTML = "";
    CurrentPos = CurrentPos + Number(id);
    if (CurrentPos <= -1) {
        CurrentPos = -1;
        return;
    }
    else if (CurrentPos >= LuSolution.length)
    {
        CurrentPos = LuSolution.length - 1;
        return;
    }   
    document.getElementById("SolutionID").innerHTML = LuSolution[CurrentPos];
    
    
}