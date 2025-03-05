
let IsAnswerCorrect;
let MaxQuestion = 11
let Marks = 50;
let iTotalNumber = 50;
let Questions = 10;
function CheckMultiply(AnswrBank_, QuestionCount) {
    AnswrBank = AnswrBank_.split(",");

    for (let Ques_ = 1; Ques_ <= QuestionCount; Ques_++) {


        AnswrBankC = AnswrBank[Ques_ - 1].split("::");
        for (let RowIn_ = 0; RowIn_ < AnswrBankC.length; RowIn_++) {

            let Len = AnswrBankC[RowIn_];

            for (let ColIn_ = Len.length; ColIn_ > 0; ColIn_--) {
                let sTextId = "txtAnswer_" + Ques_ + "_" + RowIn_ + "_" + ColIn_;
                let AnswrBankRow = AnswrBankC[RowIn_][ColIn_ - 1];
                let Element_ = document.getElementById(sTextId);

                if (AnswrBankRow == "Z") {
                    let TextElement = Element_.innerText;
                    if (TextElement != "" && TextElement != "X") {
                        //SetSatusofText(sTextId, AnswrBankRow);
                        SetSatusofTextNew(sTextId, AnswrBankRow, "txtCorrectAnswerCounting", 20);
                    }
                }
                else {
                    //SetSatusofText(sTextId, AnswrBankRow);
                    SetSatusofTextNew(sTextId, AnswrBankRow, "txtCorrectAnswerCounting", 20);
                }

            }
        }

    }
}

function CheckAnswerLCMHCF(AnswrBank_) {
    document.getElementById("SubmitAnswer").hidden = true;
    document.getElementById("btnCreate").hidden = false;
    document.getElementById("btnTest").hidden = false;
    let Counter = 0;
    let Score = document.getElementById("hScore");
    let Questions = 10;
    NewMarks = 10;
    let AnswrBank = AnswrBank_.split(",");
    for (let row_ = 1; row_ < MaxQuestion; row_++) {

        let DivId = "FullSolution_" + row_;
        let MatrixArea = document.getElementById(DivId);
        MatrixArea.hidden = false;
        let AnswrBankRow = AnswrBank[row_];
        sTextId = "TxtSolutionValue" + row_;
        SetSatusofTextNew(sTextId, Number(AnswrBankRow), "txtCorrectAnswerCounting", 20);

    }

    Score.innerHTML = NewMarks.toString() + "/" + Questions.toString();

}
function CheckAnswerConversion(AnswrBank_) {
    document.getElementById("SubmitAnswer").hidden = true;
    document.getElementById("btnCreate").hidden = false;
    document.getElementById("btnTest").hidden = false;
    let Counter = 0;
    let Score = document.getElementById("hScore");
    let Questions = 10;
    NewMarks = 10;
    let AnswrBank = AnswrBank_.split(",");
    for (let row_ = 1; row_ < MaxQuestion; row_++) {

        let DivId = "FullSolution_" + row_;
        let MatrixArea = document.getElementById(DivId);
        MatrixArea.hidden = false;
        let AnswrBankRow = AnswrBank[row_];
        let KgG = AnswrBankRow.split(":");
        if (KgG.length == 1) {
            sTextId = "TxtSolutionValue" + row_+"0";
            SetSatusofTextNew(sTextId, Number(AnswrBankRow), "txtCorrectAnswerCounting", 20);
        }
        else
        {
            sTextId = "TxtSolutionValue" + row_+"1";
            SetSatusofTextNew(sTextId, Number(KgG[0]), "txtCorrectAnswerCounting", 20);
            sTextId = "TxtSolutionValue" + row_ + "2";
            SetSatusofTextNew(sTextId, Number(KgG[1]), "txtCorrectAnswerCounting", 20);
        }

    }

    Score.innerHTML = NewMarks.toString() + "/" + Questions.toString();

}

function CheckAnswerMinDivMul(AnswrBank_, ID = -1) {


    if (ID == -1) {
        document.getElementById("SubmitAnswer").hidden = true;
        document.getElementById("btnCreate").hidden = false;
    }
    else {
        document.getElementById("SubmitAnswer" + ID).hidden = true;
        document.getElementById("btnCreate").hidden = false;

    }

    let Score = document.getElementById("hScore");

    let AnswrBank = AnswrBank_.split(",");
    let Questions = 20;
    NewMarks = 20;
    let iCount = 2;
    for (let row_ = 1; row_ < MaxQuestion; row_++) {

        let DivId = "FullSolution_" + row_;
        let MatrixArea = document.getElementById(DivId);
        MatrixArea.hidden = false;
        let AnswrBankRow = AnswrBank[iCount];
        sTextId = "TxtSolutionValue" + row_;
        SetSatusofTextNew(sTextId, AnswrBankRow, "txtCorrectAnswerCounting", 20, true);
        iCount++
        AnswrBankRow = AnswrBank[iCount];
        sTextId = "TxtMinMulDivValue" + row_;
        SetSatusofTextNew(sTextId, AnswrBankRow, "txtCorrectAnswerCounting", 20, true);

        iCount++
    }

    Score.innerHTML = NewMarks.toString() + "/" + Questions.toString();

}
//function CheckAnswerFractionandDecimal(AnswrBank_)
function CheckDivisionAnswer(AnswrBank_)
{
    let SingleSolution = AnswrBank_.split("@");
    for (let i = 1; i < SingleSolution.length; i++)
    {
        let ssingle = SingleSolution[i].split("#");
        sTextId = "txtQuotient_" + i;
        SetSatusofTextNew(sTextId, ssingle[0], "txtCorrectAnswerCounting", 20, true);
        sTextId = "txtRemainder_" + i;
        SetSatusofTextNew(sTextId, ssingle[1], "txtCorrectAnswerCounting", 20, true);
        //let Len = ssingle[2].split(":").length;
        //let QuotientV = ""; 
        //for (let m = 1; m < Len; m++)
        //{
        //    let Col = Number(m) + 1;
        //    sTextId = "txtSol_" + i + "_" + 0 + "_" + Col;
        //    let Ctrl = document.getElementById(sTextId);
        //    QuotientV += Ctrl.value;
        //}
       
        for (let k = 2; k < ssingle.length; k++)
        {
            if (k != 3) {
                let ssol = ssingle[k].split(":");
                for (let m = 1; m < ssol.length; m++) {
                    let Row = Number(k) - 2;
                    let Col = Number(m) + 1;
                    //if (Row > 0)
                    //    Row++;
                    if (ssol[m] != '')
                    {
                        sTextId = "txtSol_" + i + "_" + Row + "_" + Col;
                        SetSatusofTextNew(sTextId, ssol[m], "txtCorrectAnswerCounting", 20, true);
                    }

                }
            }
        }
        
    }
}
function CheckAnswers(AnswrBank_, ID = -1) {



    if (ID == -1) {
        document.getElementById("SubmitAnswer").hidden = true;
        document.getElementById("btnCreate").hidden = false;
    }
    else {
        document.getElementById("SubmitAnswer" + ID).hidden = true;
        document.getElementById("btnCreate").hidden = false;

    }

    let Score = document.getElementById("hScore");

    let AnswrBank = AnswrBank_.split(",");
    let Questions = 10;
    NewMarks = 10;
    for (let row_ = 1; row_ < MaxQuestion; row_++) {

        let DivId = "FullSolution_" + row_;
        let MatrixArea = document.getElementById(DivId);
        MatrixArea.hidden = false;
        let AnswrBankRow = AnswrBank[row_];
        sTextId = "TxtSolutionValue" + row_;

        SetSatusofTextNew(sTextId, AnswrBankRow, "txtCorrectAnswerCounting", 20, true);

    }

    Score.innerHTML = NewMarks.toString() + "/" + Questions.toString();

}


function CheckLargeSmallValue(AnswrBank_) {

    let Questions = 20;
    NewMarks = Questions;


    document.getElementById("SubmitAnswer").hidden = true;
    document.getElementById("btnCreate").hidden = false;
    let Counter = 0;
    let Score = document.getElementById("hScore");

    let AnswrBank = AnswrBank_.split(",");
    for (let row_ = 1; row_ < MaxQuestion; row_++) {

        let DivId = "FullSolution_" + row_;
        let MatrixArea = document.getElementById(DivId);
        MatrixArea.hidden = false;
        let AnswrBankLS = AnswrBank[row_].split("#");
        let AnswrBankL = AnswrBankLS[0];
        let AnswrBankS = AnswrBankLS[1];
        sTextId = "TxtSolutionValueL" + row_;
        SetSatusofTextNew(sTextId, AnswrBankL, "txtCorrectAnswerCounting", 20, true);
        //SetSatusofTextDiv(sTextId, AnswrBankL);
        sTextId = "TxtSolutionValueS" + row_;
        //SetSatusofTextDiv(sTextId, AnswrBankS);
        SetSatusofTextNew(sTextId, AnswrBankS, "txtCorrectAnswerCounting", 20, true);
    }

    Score.innerHTML = NewMarks.toString() + "/" + Questions.toString();

}
function CheckAnswerDecimalToFraction(AnswrBank_) {
    let Questions = 50;
    NewMarks = Questions;

    document.getElementById("SubmitAnswer").hidden = true;
    document.getElementById("btnCreate").hidden = false;

    let Score = document.getElementById("hScore");

    let AnswrBank = AnswrBank_.split(":");
    for (let row_ = 1; row_ < MaxQuestion; row_++) {

        let DivId = "FullSolution_" + row_;

        let MatrixArea = document.getElementById(DivId);
        MatrixArea.hidden = false;
        let AnswrBankRow = AnswrBank[row_].split(",");
        let sTextId = "FractionInputNum_" + row_;
        sTextId = "FractionInputNum_" + row_;

        SetSatusofTextNew(sTextId, AnswrBankRow[1], "txtCorrectAnswerCounting", 20, true);
        sTextId = "FractionInputdeno_" + row_;

        SetSatusofTextNew(sTextId, AnswrBankRow[2], "txtCorrectAnswerCounting", 20, true);
        sTextId = "MixedFractionInput_" + row_;
        SetSatusofTextNew(sTextId, AnswrBankRow[3], "txtCorrectAnswerCounting", 20);

        sTextId = "MixedFractionInputNum_" + row_;
        SetSatusofTextNew(sTextId, AnswrBankRow[4], "txtCorrectAnswerCounting", 20, true);

        sTextId = "MixedFractionInputdeno_" + row_;
        SetSatusofTextNew(sTextId, AnswrBankRow[2], "txtCorrectAnswerCounting", 20, true);




    }

    Score.innerHTML = NewMarks.toString() + "/" + Questions.toString();
}


function SetSatusofTextDiv(sTextId, Value) {
    let Element_ = document.getElementById(sTextId);
    let TextElement = Element_.value;
    let CorrectAnswer = Value.split(".");
    let StudentAnswer = TextElement.split(".");
    let WrongAnswer = false;
    if (CorrectAnswer[0] != StudentAnswer[0]) {
        WrongAnswer = true;
    }
    if (StudentAnswer.length > 1) {
        for (let j = 0; j < StudentAnswer[1].length; j++) {
            if (CorrectAnswer[1].charAt(j) != StudentAnswer[1].charAt(j)) {
                WrongAnswer = true;

            }
        }
    }
    if (StudentAnswer.length != CorrectAnswer.length) {
        WrongAnswer = true;

    }

    if (WrongAnswer) {
        Marks--;
        let Eparent = Element_.parentElement;


        if (TextElement == "") {
            Element_.remove();
        }
        else {
            Element_.style.textDecoration = "line-through";
            Element_.style.color = "#FFFFFF";
            Element_.style.fontSize = "30px";
            Element_.style.height = "50%";
            Element_.style.width = "50%";
            Element_.style.backgroundColor = "#FF0000";
        }

        let CorrectAns = document.createElement("input");
        CorrectAns.value = (Value);
        Eparent.appendChild(CorrectAns);
        CorrectAns.classList.add("txtCorrectAnswer");
    }
    else {
        Element_.style.backgroundColor = "#00FF00";
    }
}
function SetCommonParameter() {
    document.getElementById("SubmitAnswer").hidden = true;
    document.getElementById("btnCreate").hidden = false;


    NewMarks = 10;
}
function CheckFactorisationByGrouping(AnswrBank_) {

    SetCommonParameter();
    let AnswrBank = AnswrBank_.split(",");
    for (let row_ = 1; row_ < MaxQuestion; row_++) {

        let DivId = "FullSolution_" + row_;
        let MatrixArea = document.getElementById(DivId);
        MatrixArea.hidden = false;
        let AnswrBankRow = AnswrBank[row_].toUpperCase();
        let Answer2 = AnswrBankRow.split(":");

        //        alert(Answer2);

        sTextId = "TxtSolutionValue" + row_;
        let Element_ = document.getElementById(sTextId);
        let TextElement = Element_.value.toUpperCase();
        if (TextElement == "") {
            NewMarks--;
            Element_.value = (Answer2[0]);
            Element_.disabled = true;
            Element_.style.background = "#ffd300";
            Element_.style.color = "#808080";

        }
        else if (TextElement == Answer2[0]) {
            Element_.style.backgroundColor = "#00FF00";
            Element_.disabled = true;

        }
        else {
            for (let i = 2; i < Answer2.length - 1; i++) {
                if (Answer2[i] != "1") {
                    let found = TextElement.includes(Answer2[i]);
                    if (found) {

                        TextElement = TextElement.replace(Answer2[i], "");
                    }
                }

            }
            let Answer3 = Answer2[Answer2.length - 1].split("#");
            for (let i = 0; i < Answer3.length; i++) {
                let found = TextElement.includes(Answer3[i]);

                if (found) {

                    TextElement = TextElement.replace(Answer3[i], "");
                    break;
                }
            }
            let IsWrong = true;
            if (TextElement == "" || TextElement == "()") {
                IsWrong = false;
            }
            SetFactorByIdentity(IsWrong, sTextId, Answer2[0], "txtCorrectAnswerCounting", 20, true);
        }
    }
    let Score = document.getElementById("hScore");
    Score.innerHTML = NewMarks.toString() + "/" + Questions.toString();
}
function CheckCommonFactors(AnswrBank_) {
    SetCommonParameter();
    let AnswrBank = AnswrBank_.split(",");
    for (let row_ = 1; row_ < MaxQuestion; row_++) {

        let DivId = "FullSolution_" + row_;
        let MatrixArea = document.getElementById(DivId);
        MatrixArea.hidden = false;
        let AnswrBankRow = AnswrBank[row_].toUpperCase();
        let Answer2 = AnswrBankRow.split(":");
        sTextId = "TxtSolutionValue" + row_;
        let Element_ = document.getElementById(sTextId);
        let TextElement = Element_.value.toUpperCase();
        if (TextElement == "") {
            NewMarks--;
            Element_.value = (Answer2[0]);
            Element_.disabled = true;
            Element_.style.background = "#ffd300";
            Element_.style.color = "#808080";

        }
        else if (TextElement == Answer2[0]) {
            Element_.style.backgroundColor = "#00FF00";
            Element_.disabled = true;

        }
        else {
            for (let i = 1; i < Answer2.length; i++) {
                if (Answer2[i] != "1") {
                    let found = TextElement.includes(Answer2[i]);
                    if (found) {

                        TextElement = TextElement.replace(Answer2[i], "");
                    }
                }
            }
            let IsWrong = true;
            if (TextElement == "" || TextElement == "()") {
                IsWrong = false;
            }
            SetFactorByIdentity(IsWrong, sTextId, Answer2[0], "txtCorrectAnswerCounting", 20, true);
        }
    }
    let Score = document.getElementById("hScore");
    Score.innerHTML = NewMarks.toString() + "/" + Questions.toString();
}
function CheckCommonFactors2(AnswrBank_,split) {
    SetCommonParameter();
    let AnswrBank = AnswrBank_.split(split);
    for (let row_ = 1; row_ < MaxQuestion; row_++) {

        let DivId = "FullSolution_" + row_;
        let MatrixArea = document.getElementById(DivId);
        MatrixArea.hidden = false;
        let AnswrBankRow = AnswrBank[row_].toUpperCase();
        let Answer2 = AnswrBankRow.split(":");
        sTextId = "TxtSolutionValue" + row_;
        let Element_ = document.getElementById(sTextId);
        let TextElement = Element_.value.toUpperCase();
        if (TextElement == "") {
            NewMarks--;
            Element_.value = (Answer2[0]);
            Element_.disabled = true;
            Element_.style.background = "#ffd300";
            Element_.style.color = "#808080";

        }
        else if (TextElement == Answer2[0]) {
            Element_.style.backgroundColor = "#00FF00";
            Element_.disabled = true;

        }
        else {
            for (let i = 1; i < Answer2.length; i++) {
                if (Answer2[i] != "1") {
                    let found = TextElement.includes(Answer2[i]);
                    if (found) {

                        TextElement = TextElement.replace(Answer2[i], "");
                    }
                }
            }
            let IsWrong = true;
            if (TextElement == "" || TextElement == "()") {
                IsWrong = false;
            }
            SetFactorByIdentity(IsWrong, sTextId, Answer2[0], "txtCorrectAnswerCounting", 20, true);
        }
    }
    let Score = document.getElementById("hScore");
    Score.innerHTML = NewMarks.toString() + "/" + Questions.toString();
}
function CheckAnswerForIdentity(AnswrBank_) {

    document.getElementById("SubmitAnswer").hidden = true;
    document.getElementById("btnCreate").hidden = false;

    let Score = document.getElementById("hScore");

    let AnswrBank = AnswrBank_.split(",");
    let Questions = 10;
    NewMarks = 10;
    for (let row_ = 1; row_ < MaxQuestion; row_++) {

        let DivId = "FullSolution_" + row_;
        let MatrixArea = document.getElementById(DivId);
        MatrixArea.hidden = false;
        let AnswrBankRow = AnswrBank[row_];
        let Answer2 = AnswrBankRow.split("#");
        sTextId = "TxtSolutionValue" + row_;
        let Element_ = document.getElementById(sTextId);
        let TextElement = Element_.value.toUpperCase();
        let Answer = "";
        if (TextElement != "") {
            for (let i = 0; i < Answer2.length; i++) {
                if (Answer2[i] != "") {
                    Answer += Answer2[i];
                    let found = TextElement.includes(Answer2[i]);
                    // alert(Answer2[i] + found);
                    if (found) {

                        TextElement = TextElement.replace(Answer2[i], "");
                    }
                }
            }
            //            alert(TextElement);
            let IsWrong = true;
            if (TextElement == "" || TextElement == "()") {
                IsWrong = false;
            }

            SetFactorByIdentity(IsWrong, sTextId, Answer, "txtCorrectAnswerCounting", 20, true);

        }
        else {
            for (let i = 0; i < Answer2.length; i++) {
                if (Answer2[i] != "") {
                    Answer += Answer2[i];
                }
            }
            SetFactorByIdentity(true, sTextId, Answer, "txtCorrectAnswerCounting", 20, true);

        }


        //        SetSatusofTextNew(sTextId, AnswrBankRow, "txtCorrectAnswerCounting", 20, true);

    }

    Score.innerHTML = NewMarks.toString() + "/" + Questions.toString();

}

function SetFactorByIdentity(Wrong, sTextId, Value, CorrectClass, RedPixelSize, checkIsEmpty = false) {

    let Element_ = document.getElementById(sTextId);
    let TextElement = Element_.value;

    if (Wrong && TextElement != "") {

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
    else if (TextElement == "" && Wrong) {

        Element_.value = (Value);
        Element_.disabled = true;
        Element_.style.background = "#ffd300";
        Element_.style.color = "#808080";
        NewMarks--;

    }
    else {
        Element_.style.backgroundColor = "#00FF00";
        Element_.disabled = true;
    }

}



