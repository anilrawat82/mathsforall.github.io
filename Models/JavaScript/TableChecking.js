function CheckTable_Answer(AnswrBank_)
{
    document.getElementById("SubmitAnswer").hidden = true;
    let AnswrBank = AnswrBank_.split(",");
    
    let QuestionCount = AnswrBank.length;
    NewMarks = QuestionCount;
    for (let Answer_ = 0; Answer_ < AnswrBank.length; Answer_++)
    {
        let sTextId = "txtNumberWord_" + Answer_;
        let Value = AnswrBank[Answer_];

        SetSatusofTextNew(sTextId, Number(Value), "txtCorrectAnswerCounting", 20);
    }

    let Score = document.getElementById("hScore");
    Score.innerHTML = NewMarks.toString() + "/" + QuestionCount.toString();
}
