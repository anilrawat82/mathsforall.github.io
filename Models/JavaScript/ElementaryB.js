let MaxQuestion = 11

function CheckAscendingDescendingAnswer(AnswrBank_, Elements, Questions)
{

    let Score = document.getElementById("hScore");
    
    let AnswrBank = AnswrBank_.split(",");
    document.getElementById("SubmitAnswer").hidden = true;
    let AnswerCounter = 0;
    NewMarks = Questions * Elements;
    for (let iq = 0; iq < Questions; iq++)
    {
        for (let iE = 0; iE < Elements; iE++)
        {
            let sTextId = "txtAnswer_" + iq + "_" + iE;
            SetSatusofTextNew(sTextId, Number(AnswrBank[AnswerCounter]), "txtCorrectAnswerCounting", 20,true);
            AnswerCounter++;
        }
    }

    Questions = Questions * Elements;
    Score.innerHTML = NewMarks.toString() + "/" + Questions.toString();
    

}

function CheckExpandingForm(AnswrBank_) {
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
        
        SetSatusofTextNew2(sTextId, AnswrBankRow, "txtCorrectAnswerCounting", 20, true);
    }
    Score.innerHTML = NewMarks.toString() + "/" + Questions.toString();

}
