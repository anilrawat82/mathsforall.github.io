//let HightLightText = ['Example:12,18,36', 'ABC,PQR,XYZ', 'secΘ=13/12,tanα=4/3,cotA=12/16', '(1+secΘ)/(1+tanΘ)', 'cos45/(sec30+cosec30),(5COS60^2+4SEC30^2-TAN45^2)/(SIN30^2+COS30^2)'];
//let HightLightMouseMove = ['MatrixOrder', 'InputTextTriangleAtMouseUp', 'MatrixOrder', 'MatrixOrder','InputTextSpecificAngle'];
//let RemoveMouseMove = ['MatrixOrder', 'InputTextTriangle', 'MatrixOrder', 'MatrixOrder', 'MatrixOrderNew'];

//function GetTextHighLight(iElementId, iTextId)
//{
//    let ElementId = document.getElementById(iElementId);
    
//    if (ElementId.value == "") {
//        ElementId.value = HightLightText[iTextId];
//        ElementId.className = HightLightMouseMove[iTextId];
//      //  ElementId.style.color = "gray";
//    }
//}

//function RemoveHighLight(iElementId, iTextId )
//{
//    let ElementId = document.getElementById(iElementId);
//    if (ElementId.value == HightLightText[iTextId])
//    {
//        ElementId.value = "";
//        ElementId.className = RemoveMouseMove[iTextId];
//        //ElementId.style.color = "black";
//    }
//}

let NewMarks = 0;
///This is used to check Answer if it is in string Form
function SetSatusofTextNew2(sTextId, CorrectAnswer,CorrectClass, RedPixelSize, checkIsEmpty = false) 
    {
        let Element_ = document.getElementById(sTextId);
        let TextElement = Element_.value;
        let result;
        let status = 0;
        if (TextElement == "") {
            status = 2;
        }
        if (TextElement != "") {
            result = TextElement.replaceAll(' ', '');
            if (result != CorrectAnswer) {
                status = 1;
            }

        }
        if (status == 1)
        {

            NewMarks--;
            let Eparent = Element_.parentElement;

            Element_.remove();

            let CorrectAns = document.createElement("label");

            Eparent.appendChild(CorrectAns);
            CorrectAns.classList.add(CorrectClass);
            CorrectAns.innerHTML = "<b style=" + "\"color:red ;text-decoration: line-through;background-color:yellowgreen; \">" + TextElement + " </b>" + (CorrectAnswer);

            
        }
        else if (status==2) {

            Element_.value = (CorrectAnswer);
            Element_.disabled = true;
            Element_.style.background = "#ffd300";
            Element_.style.color = "#808080";
            if (!checkIsEmpty) {
                if (CorrectAnswer != 0) {
                    NewMarks--;
                }
            }
            else {
                NewMarks--;
            }
        }
        else {
            Element_.style.backgroundColor = "#00FF00";
            Element_.disabled = true;
        }

}


function SetSatusofTextNew(sTextId, Value,CorrectClass,RedPixelSize,checkIsEmpty=false) {

    let Element_ = document.getElementById(sTextId);
    let TextElement = Element_.value;
   
    if (TextElement!= Value && TextElement!="" )
    {
        
        NewMarks--;
        let Eparent = Element_.parentElement;

        Element_.remove();

        let CorrectAns = document.createElement("label");

        Eparent.appendChild(CorrectAns);
        CorrectAns.classList.add(CorrectClass);
        if (TextElement == "")
        {
            CorrectAns.innerHTML = (Value);
        }
        else
        {
            //CorrectAns.innerHTML = "<b style=" + "\"color:red ;font-size:" + RedPixelSize +"px ;text-decoration: line-through;background-color:yellowgreen; \">" + TextElement + " </b>" + (Value);
            CorrectAns.innerHTML = "<b style=" + "\"color:red ;text-decoration: line-through;background-color:yellowgreen; \">" + TextElement + " </b>" + (Value);
            
        }
    }
    else if (TextElement == "")
    {
       
        Element_.value = (Value);
        Element_.disabled = true;
        Element_.style.background = "#ffd300";
        Element_.style.color = "#808080";
        if (!checkIsEmpty) {
            if (Value != 0) {
                NewMarks--;
            }
        }
        else
        {
            NewMarks--;
        }
    }
    else
    {
        Element_.style.backgroundColor = "#00FF00";
        Element_.disabled = true;
    }
    
}

function SetTextToNumber(isCorrect, sTextId, Value, CorrectClass, RedPixelSize) {

    let Element_ = document.getElementById(sTextId);
    let TextElement = Element_.value;
    
    if (!isCorrect && TextElement!="")
    {
        NewMarks--;
        let Eparent = Element_.parentElement;

        Element_.remove();

        let CorrectAns = document.createElement("label");

        Eparent.appendChild(CorrectAns);
        CorrectAns.classList.add(CorrectClass);
        if (TextElement == "") {
            CorrectAns.innerHTML = (Value);
        }
        else {
            //CorrectAns.innerHTML = "<b style=" + "\"color:red ;font-size:" + RedPixelSize +"px ;text-decoration: line-through;background-color:yellowgreen; \">" + TextElement + " </b>" + (Value);
            CorrectAns.innerHTML = "<b style=" + "\"color:red ;text-decoration: line-through;background-color:yellowgreen; \">" + TextElement + " </b>" + (Value);

        }
    }
    else if (TextElement == "") {
        NewMarks--;
        Element_.value = (Value);
        Element_.disabled = true;
        Element_.style.background = "#ffd300";
        Element_.style.color = "#808080";
    }
    else {
        Element_.style.backgroundColor = "#00FF00";
        Element_.disabled = true;
    }

}


//function SetSatusofText(sTextId, Value) {

//    let Element_ = document.getElementById(sTextId);
//    let TextElement = Element_.value;
    
//    if (TextElement != Value) {
//        Marks--;
//        let Eparent = Element_.parentElement;

//        Element_.remove();

//        let CorrectAns = document.createElement("label");
        
//        Eparent.appendChild(CorrectAns);
//        CorrectAns.classList.add("txtCorrectAnswer");
//        if (TextElement == "")
//        {
//            CorrectAns.innerHTML =(Value);
//        }
//        else
//        {
//            CorrectAns.innerHTML = "<b style=" + "\"color:red ;font-size:15px ;text-decoration: line-through;background-color:yellowgreen; \">" +  TextElement  +" </b>" + (Value);
//        }
//    }
//    else {
//        Element_.style.backgroundColor = "#00FF00";
//    }
//}

function PrintPage(IdTable,PDFName)
{
    var element = document.getElementById(IdTable);

    html2pdf(element);
    
}

function SaveSolutionToCsv(Information, FileName)
{
    var csv = Information;
    var hiddenElement = document.createElement('a');
    hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(csv);
    hiddenElement.target = '_blank';

    hiddenElement.download = FileName;
    hiddenElement.click();

}
function CheckFullSolutionVisible(FullSolution, Divid)
{
    let IsVisible = false;
    let MatrixArea = document.getElementById(Divid);
    let FullSolution_ = document.getElementById(FullSolution);

    if (MatrixArea.hidden == false)
    {
        FullSolution_.style.backgroundColor = "chartreuse";
        FullSolution_.innerHTML = "Full Solution";
        MatrixArea.hidden = true;
        IsVisible=true;
    }
    else
    {
        FullSolution_.innerHTML = "Hide Solution";
        FullSolution_.style.backgroundColor = "darkseagreen";
        MatrixArea.hidden = false;
        if (MatrixArea.innerHTML != "")
        {
            IsVisible = true;
        }
    }
}
function getRandomColor() {
    var letters = '0123456789ABCDEF';
    var color = '#';
    for (var i = 0; i < 6; i++) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}
