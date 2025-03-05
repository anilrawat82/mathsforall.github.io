let sHypo = "Hypotenuse";
let sBase = "Base(Side adjacent to Angle)"
let sPerp = "Perpadicular(Side opposite to Angle)"
let RightAnglePoint = "";
let RatioAnglePoint = "";
let LastPoint = ""; 
let isStringUpdated = false;
//let NewMarkT = 70;
let QuestionCount = 10;
function ClearRightRatioAngle()
{
    document.getElementById('txtRightAngleAt').value = "";
    document.getElementById('txtRatioAngle').value="";
    updateStrings(false);
}
function CheckAngleChar(txtTriangleVetex, txtRightAngleAt)
{
    let Vertex = document.getElementById(txtTriangleVetex).value.toUpperCase();
    RightAnglePoint = document.getElementById(txtRightAngleAt).value.toUpperCase();
    let IsFound = false;
    for (V = 0; V < Vertex.length; V++)
    {
        if (Vertex[V] == RightAnglePoint) {
            IsFound = true;
            break;
        }
    }
    if (!IsFound)
    {
        document.getElementById(txtRightAngleAt).value = "";
    }
    updateStrings(false);
    document.getElementById('txtRatioAngle').value = "";
    
}

function CheckRatioChar(txtTriangleVetex, txtRightAngleAt, txtRatioAngle)
{

    let Vertex = document.getElementById(txtTriangleVetex).value.toUpperCase();
     RightAnglePoint = document.getElementById(txtRightAngleAt).value.toUpperCase();
     RatioAnglePoint = document.getElementById(txtRatioAngle).value.toUpperCase();
     LastPoint = ""; 
    
    if (RightAnglePoint == RatioAnglePoint) {
        document.getElementById(txtRatioAngle).value = "";
    }
    else
    {
        let IsFound = false;
        for (V = 0; V < Vertex.length; V++)
        {
            if (Vertex[V] != RatioAnglePoint && Vertex[V] != RightAnglePoint)
            {
                LastPoint = Vertex[V];
            }
            if (Vertex[V] == RatioAnglePoint) {
                IsFound = true;
             
            }
        }
        if (!IsFound) {
            document.getElementById(txtRatioAngle).value = "";
        }

    }

    if (document.getElementById(txtRatioAngle).value != "") {
        updateStrings(true);
    }
    else {
        updateStrings(false);
    }
 
}

function updateStrings(bupdate)
{
    if (bupdate==true) {
        document.getElementById('lblHypo').innerHTML = sHypo + "<b style=" + "\"" + "color:darkorchid ;font-size:20px" + "\"" + ">(" + LastPoint + RatioAnglePoint + ")</b>";
        document.getElementById('lblBase').innerHTML = sBase + "<b style=" + "\"" + "color:darkorchid ;font-size:20px" + "\"" + ">(" + RightAnglePoint + RatioAnglePoint + ")</b>";
        document.getElementById('lblPerp').innerHTML = sPerp + "<b style=" + "\"" + "color:darkorchid ;font-size:20px" + "\"" + ">(" + LastPoint + RightAnglePoint   +")</b>";
        isStringUpdated = true;
        
        document.getElementById('btnCreateTriangle').disabled = false;
        document.getElementById('idTriangleDiv').hidden = false;
        
        
    }
    else if (isStringUpdated==true)
    {
        document.getElementById('lblHypo').innerHTML = sHypo;
        document.getElementById('lblBase').innerHTML = sBase;
        document.getElementById('lblPerp').innerHTML = sPerp;
        isStringUpdated = false;
        document.getElementById('btnCreateTriangle').disabled = true;
        document.getElementById('idTriangleDiv').hidden  = true;
        
        document.getElementById('btnRatio').hidden  = true;
    }
    
    document.getElementById('idTriangleArea').innerHTML = "";
    document.getElementById('MatrixArea').innerHTML="";
}
function GetTrianglePoints()
{
    document.getElementById('btnCreate').value = "Calculate Trigonometric ratio for angle " + RatioAnglePoint;
    return LastPoint + ":" + RightAnglePoint + ":" + RatioAnglePoint;
    
}
function SetStudentAnswerFromXml(studentSolution)
{
    let StudentAnswer = studentSolution.split("##");
    for (Q = 1; Q <= QuestionCount; Q++)
    {
        StudentAnswerA = StudentAnswer[Q - 1].split("::");
        let Id = 'txtSolution' + Q + "0"
        if (StudentAnswerA[0] != "") {
           document.getElementById(Id).value = StudentAnswerA[0];
        }
        let counter = 0;
        for (R = 1; R < 4; R++) {
            counter++;
            if (StudentAnswerA[counter] != "") {
                Id = 'txtSolution' + Q + R;
                document.getElementById(Id).value = StudentAnswerA[counter];
            }
            counter++;
            if (StudentAnswerA[counter] != "")
            { 
                 Id = 'txtSolution' + Q + R + R;
                document.getElementById(Id).value = StudentAnswerA[counter];
            }
        }
        
    }
    
}
function GetStudentAnswer()
{
    let StudentAnswer = "";
    for (Q = 1; Q <= QuestionCount; Q++)
    {
        let Id = 'txtSolution' + Q + "0"
        StudentAnswer += document.getElementById(Id).value + "::";
        for (R = 1; R < 4; R++) {
            Id = 'txtSolution' + Q + R;
            StudentAnswer += document.getElementById(Id).value + "::";
            Id = 'txtSolution' + Q + R + R;
            StudentAnswer += document.getElementById(Id).value + "::";
        }
        StudentAnswer += "##";
    }
    return StudentAnswer;
}
function CheckSolution(solution)
{
    NewMarks  = 70;
    let Score = document.getElementById("hScore");
    let myArray = solution.split("##");
    for (Q = 1; Q < myArray.length-1; Q++)
    {
        let myArrayA = myArray[Q].split("::");
        SetSatusofTextNew('txtSolution' + Q + "0", myArrayA[0], "txtCorrectAnswerCounting", 20);


        //SetSatusofTrigoText('txtSolution' + Q + "0", myArrayA[0],false);
        let Counter = 0;
        for (R = 1; R < 4; R++)
        {
            Counter++;
            SetSatusofTextNew('txtSolution' + Q + R, myArrayA[Counter], "txtCorrectAnswerCounting", 20);
            //SetSatusofTrigoText('txtSolution' + Q + R, myArrayA[Counter],true);
            Counter++;
            SetSatusofTextNew('txtSolution' + Q + R + R, myArrayA[Counter], "txtCorrectAnswerCounting", 20);
            //SetSatusofTrigoText('txtSolution' + Q + R + R, myArrayA[Counter],false);
        }
    }

    Score.innerHTML = NewMarks .toString() + "/" + 70;
}
function Check_Text_Pos(sTextElement, sSolValue)
{
    let bIsEqual = false;
    let Values = sTextElement.split("/");
    let SolValues = sSolValue.split("/");

    
    if (Values.length == SolValues.length && Values.length==2)
    {
        for (let j = 0; j < 2; j++)
        {
            let TextValue = 0;
            let SolValue = 0;
            for (let k = 0; k < 2; k++) {
                let chT = Values[j][k];
                let chS = SolValues[j][k];

                let index = 0;
                TextValue += chT.charCodeAt(index);
                SolValue += chS.charCodeAt(index);
            }
            if (TextValue != SolValue)
            {
                return false; 
            }
            else
            {
                bIsEqual = true;
            }

        }

        
    }
  

    return bIsEqual;
}
//function SetSatusofTrigoText(sTextId, Value,CheckTextPos) {
//    let Element_ = document.getElementById(sTextId);
//    let TextElement = Element_.value.toUpperCase();
//    Value = Value.toUpperCase();
   
//    if (TextElement != Value)
//    {
//        let IsEqual = false;
//        if (CheckTextPos == true)
//        {
//            IsEqual=Check_Text_Pos(TextElement, Value);
//        }

//        if (!IsEqual) {
//            NewMarkT--;
//            let Eparent = Element_.parentElement;

//            Element_.remove();

//            let CorrectAns = document.createElement("label");

//            Eparent.appendChild(CorrectAns);
//            CorrectAns.classList.add("txtCorrectAnswer");
//            if (TextElement == "") {
//                CorrectAns.innerHTML = (Value);
//            }
//            else
//            {
//                CorrectAns.innerHTML = "<b style=" + "\"color:yellow;font-size:20px ;text-decoration: line-through 3px blue;background-color:red; \">" + TextElement + " </b>" + (Value);
//            }
//        }
//        else
//        {
//            Element_.style.backgroundColor = "#00FF00";

//        }
//    }
//    else {
//        Element_.style.backgroundColor = "#00FF00";
//    }
//}