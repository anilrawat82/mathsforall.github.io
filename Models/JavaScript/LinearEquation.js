
let MyMatrixDesign;
let LastColumnC = "";
let LastMatrixCValue = "";
let MatValue;

//Addition and SubTraction

let LastRow = -1;
let LastCol = -1;
function getRandomColor()
{
    var letters = '0123456789ABCDEF';
    var color = '#';
    for (var i = 0; i < 6; i++)
    {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}
function HighLightEqualCell(CurrenTrow_, CurrenTCol_, Row_, Col_) {

    if (CurrenTrow_ == LastRow && CurrenTCol_ == LastCol) {
        return;
    }

    
    LastRow = CurrenTrow_;
    LastCol = CurrenTCol_;

    for (let iRow = 0; iRow < Row_; iRow++) {


        for (let iCol = 0; iCol < Col_; iCol++) {
            document.getElementById("txtAvalue_" + iRow +"_"+ iCol).style.backgroundColor = "#FFFFFF";
            document.getElementById("txtBvalue_" + iRow + "_" + iCol).style.backgroundColor = "#FFFFFF";
        }
    }

    let colorA = "crimson";

    document.getElementById("txtAvalue_" + CurrenTrow_ +"_"+ CurrenTCol_).style.backgroundColor = colorA;
    document.getElementById("txtBvalue_" + CurrenTrow_ +"_"+ CurrenTCol_).style.backgroundColor = colorA;

    



}
function HighLightAddSubCell(CurrenTrow_, CurrenTCol_,Row_,Col_)
{

    if (CurrenTrow_ == LastRow && CurrenTCol_ == LastCol)
    {
        return;
    }

    if (LastRow != -1 && LastCol != -1)
    {
        document.getElementById("txtCvalue_" + LastRow + "_" + LastCol).style.backgroundColor = "#FFFFFF";
    }
    LastRow = CurrenTrow_;
    LastCol = CurrenTCol_;

    for (let iRow = 0; iRow < Row_; iRow++) {


        for (let iCol = 0; iCol < Col_; iCol++)
        {
            document.getElementById("txtAvalue" + iRow + iCol).style.backgroundColor = "#FFFFFF";
            document.getElementById("txtBvalue" + iRow + iCol).style.backgroundColor = "#FFFFFF";
        }
    }

    let colorA = "crimson";

    document.getElementById("txtAvalue" + CurrenTrow_ + CurrenTCol_).style.backgroundColor = colorA;
    document.getElementById("txtBvalue" + CurrenTrow_ + CurrenTCol_).style.backgroundColor = colorA;
    
    document.getElementById("txtCvalue_" + CurrenTrow_ + "_"+ CurrenTCol_).style.backgroundColor = colorA;
    
 

}
function HighLightCell(ElementID,rowA, ColA, rowB, ColB, textinputA)
{
  
    textinput = textinputA.split("@#$")[0];
    textMatrixC = textinputA.split("@#$")[1];

    if (LastColumnC == ElementID ) {
        return;
    }
    for (let KeyR = 0; KeyR < rowA; KeyR++)
    {
        for (let KeyC = 0; KeyC < ColA; KeyC++) {
            

            document.getElementById("txtAvalue" + KeyR + KeyC).style.backgroundColor = "#FFFFFF";
        }

    }

    for (let KeyR = 0; KeyR < rowB; KeyR++) {
        for (let KeyC = 0; KeyC < ColB; KeyC++) {
            

            
            document.getElementById("txtBvalue" + KeyR + KeyC).style.backgroundColor = "#FFFFFF";
        }

    }


    
    if (LastColumnC != "")
    {
        //alert(LastColumnC);
        let MatrixLastElement = document.getElementById(LastColumnC);
        
        MatrixLastElement.innerHTML = LastMatrixCValue;
    }
    LastMatrixCValue = textMatrixC;
    LastColumnC = ElementID;
    

    let MatrixCElement = document.getElementById(ElementID);
    
    let cellValue = MatrixCElement.innerText.split("+");
    let cellValueLast = cellValue[cellValue.length - 1].split("=")[0];
    MatrixCElement.innerHTML = "";
    
    let stringText="";
    let myArr = textinput.split("$$");
    for (let Key = 0; Key < myArr.length; Key++)
    {
        let colorA = getRandomColor();
        let myArr1 = myArr[Key].split(":");
        
        if (Key < (cellValue.length - 1))
        {
            stringText += "<h5 style=\"\color:" + colorA +"\">" + cellValue[Key] + "</h5>" +"+";
            //<h3 style="color:red" >HI</h3>

        }
        else
        {
            stringText += "<h5 style=\"\color:" + colorA + "\">" + cellValueLast+"</h5>";
        }

        

        document.getElementById("txtAvalue" + myArr1[0] + myArr1[1]).style.backgroundColor = colorA;
        document.getElementById("txtBvalue" + myArr1[2] + myArr1[3]).style.backgroundColor = colorA;
        
    }
    stringText += "=" + cellValue[cellValue.length - 1].split("=")[1]

    MatrixCElement.innerHTML = stringText;
    
}

function getRndInteger(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

function GenerateEqualMatrixString(MatrixOrderRow, MatrixOrderCol, WithValue) {
    let iCnt1 = 0;
    let iCnt2 = 0;

    let RowSpanSet = false;
   
    document.getElementById("dCalculateNow").hidden = WithValue;
    Matrixstring = "<table class=" + "\"SolutionTable\"" + ">";

    Matrixstring += "<tr>";
    Matrixstring += "<th colspan=" + MatrixOrderCol + " class = " + "\"TopHeader\"" + ">Matrix A</th>";
    Matrixstring += "<th></th>";
    Matrixstring += "<th colspan=" + MatrixOrderCol + " class = " + "\"TopHeader\"" + ">Matrix B</th>";
    Matrixstring += "</tr>";


    for (let Row_ = 0; Row_ < MatrixOrderRow; Row_++) {
        Matrixstring += "<tr>";
        for (let Col_ = 0; Col_ < MatrixOrderCol * 2 + 1; Col_++) {
            if (Col_ == MatrixOrderCol) {

                if (RowSpanSet == false) {
                    let s = "\"txtSign" + Number(Row_) + Number(Col_) + "\"";
                    Matrixstring += "<td rowspan=" + MatrixOrderRow + " class = " + "\"SignMatrix\" id = " + s.toString() + ">" + "=" + "</td>";
                    
                    RowSpanSet = true;
                }
            }
            else if (Col_ < MatrixOrderCol)
            {
                let s = "\"txtAvalue_" + Row_ + "_" + Number(Col_) + "\"";
                if (WithValue) {
                    Matrixstring += "<td   onmouseover =" + "\"GetHighlightText(this.id," + MatrixOrderRow + "," + MatrixOrderCol +"); \"   class = " + "\"EqualMatrixvalue\" id = " + s.toString() + ">" + MatValue[iCnt1] + "</td>";
                    iCnt1++;
                }
                else
                {
                    Matrixstring += "<td><input onmouseover =" + "\"GetHighlightText(this.id," + MatrixOrderRow + "," + MatrixOrderCol +"); \"  type = " + "\"text\" id = " + s.toString() + " class = " + "\"AMatrixvalue\"" + "/></td>";
                }
            }
            else if (Col_ > MatrixOrderCol) {
                let s = "\"txtBvalue_" + Row_ + "_" + Number(Col_ - (MatrixOrderCol + 1)) + "\"";
                if (WithValue) {
                    Matrixstring += "<td  onmouseover =" + "\"GetHighlightText(this.id," + MatrixOrderRow + "," + MatrixOrderCol +"); \"   class = " + "\"EqualMatrixvalue\" id = " + s.toString() + ">" + MatValue[iCnt2] + "</td>";
                    iCnt2++;
                }
                else {
                    Matrixstring += "<td><input onmouseover =" + "\"GetHighlightText(this.id," + MatrixOrderRow + "," + MatrixOrderCol +"); \"  type = " + "\"text\" id = " + s.toString() + " class = " + "\"AMatrixvalue\"" + "/></td>";
                }
            }

        }

        Matrixstring += "</tr>";

    }
    Matrixstring += "</ table >";
    MatrixArea.innerHTML = Matrixstring;
    MyMatrixDesign = Matrixstring;

}
function GenerateEqualMatrix(rowid, colid, withValue)
{
    //Clear Solution Before If Exist


    var MatrixArea = document.getElementById('Solutions');
    MatrixArea.innerHTML = "";


    let Matrixstring = "";
    var MatrixArea = document.getElementById('MatrixArea');


    let MatrixOrderRow = Number(document.getElementById(rowid).value);
    let MatrixOrderCol = Number(document.getElementById(colid).value);

    if (MatrixOrderRow <= 0 || MatrixOrderCol <= 0) {
        MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Numeric Value Greater than 0 in Row  and Col </h2>";
        return;
    }
    if (withValue == true)
    {
        MatValue = new Array(MatrixOrderRow * MatrixOrderCol);
        for (let i = 0; i < MatrixOrderRow * MatrixOrderCol; i++) {
            MatValue[i] = getRndInteger(-100, 200);
        }
    }
    GenerateEqualMatrixString(MatrixOrderRow, MatrixOrderCol, withValue)
}
function GenerateMatrixForAdditionSubtraction(SolutionType) {
    //Clear Solution Before If Exist



    var MatrixArea = document.getElementById('Solutions');
    MatrixArea.innerHTML = "";


    let Matrixstring = "";
    var MatrixArea = document.getElementById('MatrixArea');


    let MatrixOrderRow = Number(document.getElementById("txtOrderRow").value);
    let MatrixOrderCol = Number(document.getElementById("txtOrderCol").value);

    //let MatrixOrder = Number(document.getElementById("txtOrder").value);


    if (isNaN(MatrixOrderRow) == true || isNaN(MatrixOrderCol) == true) {
        MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Numeric Value Greater than 0 in Demand and Supply</h2>";
        return;
    }
    let SolutionTypeA = SolutionType == 1 ? '+' : '-';
    if (SolutionType == "3") {
        SolutionTypeA = "=";

    }

   
    let RowSpanSet = false;

    Matrixstring = "<table class=" + "\"SolutionTable\"" + ">";

    Matrixstring += "<tr>";
    Matrixstring += "<th colspan=" + MatrixOrderCol + " class = " + "\"TopHeader\"" + ">Matrix A</th>";
    Matrixstring += "<th>Sign</th>";
    Matrixstring += "<th colspan=" + MatrixOrderCol + " class = " + "\"TopHeader\"" + ">Matrix B</th>";
    Matrixstring += "</tr>";


    for (let Row_ = 0; Row_ < MatrixOrderRow; Row_++) {

        Matrixstring += "<tr>";
        for (let Col_ = 0; Col_ < MatrixOrderCol * 2 + 1; Col_++) {


            if (Col_ == MatrixOrderCol) {

                if (RowSpanSet == false) {
                    let s = "\"txtSign" + Number(Row_) + Number(Col_) + "\"";
                    Matrixstring += "<td rowspan=" + MatrixOrderRow + " class = " + "\"SignMatrix\" id = " + s.toString() + ">" + SolutionTypeA + "</td>";
                    //Matrixstring += "<td rowspan=" + MatrixOrderRow + "class = " + "\"SignMatrix\""+ "><input type = " + "\"text\" id = " + s.toString() + "value=" + "\"" + SolutionTypeA + "\"" +"/></td>";
                    RowSpanSet = true;
                }
            }
            else if (Col_ < MatrixOrderCol) {
                let s = "\"txtAvalue" + Row_ + Number(Col_) + "\"";

                Matrixstring += "<td><input type = " + "\"text\" id = " + s.toString() + " class = " + "\"AMatrixvalue\"" + "/></td>";

            }
            else if (Col_ > MatrixOrderCol) {
                let s = "\"txtBvalue" + Row_ + Number(Col_ - (MatrixOrderCol + 1)) + "\"";

                Matrixstring += "<td><input type = " + "\"text\" id = " + s.toString() + " class = " + "\"AMatrixvalue\"" + "/></td>";
            }

        }

        Matrixstring += "</tr>";

    }


    Matrixstring += "</ table >";

    MatrixArea.innerHTML = Matrixstring;
    //MatrixAreaT.value = Matrixstring;



    document.getElementById("dCalculateNow").hidden = false;


    MyMatrixDesign = Matrixstring;

}

function GenerateMatrixForMultiplication()
{

    LastColumnC = "";
    LastMatrixCValue = "";
    var MatrixArea = document.getElementById('MatrixArea');
    MatrixArea.innerHTML = "";


    let TableStr = "";


    let MatrixRowA = Number(document.getElementById("txtOrderRowA").value);
    let MatrixColA = Number(document.getElementById("txtOrderColA").value);

    let MatrixRowB = Number(document.getElementById("txtOrderRowB").value);
    let MatrixColB = Number(document.getElementById("txtOrderColB").value);

    //let MatrixOrder = Number(document.getElementById("txtOrder").value);


    if (isNaN(MatrixRowA) == true || isNaN(MatrixColA) == true || isNaN(MatrixColB) == true) {
        MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Numeric Value Greater than 0 in Demand and Supply</h2>";
        return;
    }




    let MavValue = Math.max(MatrixRowA, MatrixRowB);
    let MinValue = Math.min(MatrixRowA, MatrixRowB);
    let MinHeight = 50 * MavValue / MinValue;
    let MatrixAisBigger = MatrixRowA > MatrixRowB ? true : false;
    let classA;
    let classB;


    if (MatrixAisBigger) {
        classA = "TD10" + " style = \"\height:50px\"";
        classB = "TD20" + " style = \"\height:" + MinHeight + "px\"";
    }
    else {
        classA = "TD20" + " style = \"\height:" + MinHeight + "px\"";
        classB = "TD10" + " style = \"\height:50px\"";
    }

    TableStr = "<table class=" + "\"SolutionTable\"" + ">";

    TableStr += "<tr>";
    TableStr += "<th  class = " + "\"TopHeader\"" + ">Matrix A</th>";
    
    TableStr += "<th class = " + "\"TopHeader\"" + ">Matrix B</th>";
    TableStr += "</tr>";
    
    TableStr += "<tr><td><table class=\"\MatrixA\">";
    for (let Row_ = 0; Row_ < MatrixRowA; Row_++) {
        TableStr += "<tr>"
        for (let Col_ = 0; Col_ < MatrixColA; Col_++) {

            let s = "\"txtAvalue" + Row_ + Number(Col_) + "\"";
            TableStr += "<td class =" + classA + ">"
            TableStr += "<input type=" + "\"text\" id = " + s.toString() + " class = " + "\"BMatrixvalue\"" + "/>";
            TableStr +="</td>";

        }
    }
    TableStr += "</table></td><td><table class=\"\MatrixB\">";


    for (let Row_ = 0; Row_ < MatrixRowB; Row_++) {
        TableStr += "<tr>"
        for (let Col_ = 0; Col_ < MatrixColB; Col_++) {
            let s = "\"txtBvalue" + Row_ + Number(Col_) + "\"";
            TableStr += "<td class =" + classB + ">";
            TableStr += "<input type=" + "\"text\" id = " + s.toString() + " class = " + "\"BMatrixvalue\"" + "/>";
            TableStr += "</td>";

        }
    }

    TableStr += "</table></td></tr></table>";
    
    MatrixArea.innerHTML = TableStr;

    document.getElementById("dCalculateNow").hidden = false;
    
}


function GenerateMatrix() {
    //Clear Solution Before If Exist



    var MatrixArea = document.getElementById('Solutions');
    MatrixArea.innerHTML = "";


    let Matrixstring = "";
    var MatrixArea = document.getElementById('MatrixArea');



    let MatrixOrder = Number(document.getElementById("txtNumberOfVariable").value);


    if (isNaN(MatrixOrder) == true) {
        MatrixArea.innerHTML = "<h2 class=" + "\"ErrorText\"" + ">Please Enter Numeric Value Greater than 0 in Demand and Supply</h2>";
        return;
    }






    //MatrixOrder = MatrixOrder ;
    //MatrixOrder = MatrixOrder + 2;


    Matrixstring = "<table class=" + "\"SolutionTable\"" + ">";

    Matrixstring += "<tr>";
    Matrixstring += "<th class=" + "\"TR_TD_Heading\"" + ">P</th>";
    Matrixstring += "<th colspan=" + MatrixOrder + " class=" + "\"TR_TD_Heading\"" + ">A</th>";
    Matrixstring += "<th class=" + "\"TR_TD_Heading\"" + ">X</th>";
    Matrixstring += "<th class=" + "\"TR_TD_Heading\"" + ">B</th>";
    Matrixstring += "</tr>";
    let asciiValue = 65;
    for (let Row_ = 0; Row_ < MatrixOrder; Row_++) {

        Matrixstring += "<tr>";
        for (let Col_ = 0; Col_ < MatrixOrder + 3; Col_++) {
            if (Col_ == 0) {
                Matrixstring += "<td class=" + "\"TR_TD_Heading\"" + ">" + Number(Row_ + 1) + " </td>";
            }
            else if (Col_ == MatrixOrder + 1) {
                Matrixstring += "<td class=" + "\"TR_TD_Heading\"" + ">" + "X" + "<sub>" +(Row_+1) + "</sub></td>";
                asciiValue++;
            }
            else if (Col_ == MatrixOrder + 2) {
                let s = "\"txtBvalue" + Row_ + "\"";


                Matrixstring += "<td><input type = " + "\"text\" id = " + s.toString() + " class = " + "\"BMatrixvalue\"" + "/></td>";
            }
            else {
                let s = "\"txtAvalue" + Row_ + Number(Col_ - 1) + "\"";
                //alert(s);

                Matrixstring += "<td><input type = " + "\"text\" id = " + s.toString() + " class = " + "\"AMatrixvalue\"" + "/></td>";

            }

        }

        Matrixstring += "</tr>";

    }


    Matrixstring += "</ table >";

    MatrixArea.innerHTML = Matrixstring;
    //MatrixAreaT.value = Matrixstring;



    document.getElementById("dCalculateNow").hidden = false;


    MyMatrixDesign = Matrixstring;

}

