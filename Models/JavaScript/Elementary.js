
function CheckSubtraction(AnswrBank_, QuestionCount, Digits, bcarryOver)
{
    let LastMarks = QuestionCount;
    let Counter = QuestionCount;
    document.getElementById("SubmitAnswer").hidden = true;
    NewMarks = QuestionCount;
    let Iscorrect = true;
    let AnswrBank = AnswrBank_.split(":");
    for (let Ques_ = 1; Ques_ <= QuestionCount; Ques_++)
    {
        Iscorrect = true;
        let AnswerDigits = AnswrBank[Ques_ - 1].length;
        let diff = Digits - AnswerDigits;

        for (let Digit_ = 1; Digit_ <= Digits; Digit_++)
        {
            let sTextId = "txtAnswer_" + Ques_ + "_" + Digit_;
            let AnswerDigit = 0;
            if (diff > 0)
            {
                let k = 0;
            }
            if (Digit_ >= diff + 1)
            {
                AnswerDigit = AnswrBank[Ques_ - 1].substr(Digit_ - 1 - diff, 1);

            }
            SetSatusofTextNew(sTextId, Number(AnswerDigit), "txtCorrectAnswerCounting", 20);
            
        }
        if (NewMarks != LastMarks) {
            Counter--;
        }
        LastMarks = NewMarks;
    }
    let Score = document.getElementById("hScore");
    Score.innerHTML = Counter.toString() + "/" + QuestionCount.toString();
    
}

        
function CheckAddition(AnswrBank_, QuestionCount, Digits, bcarryOver)
{
            let LastMarks = QuestionCount;
            let Counter = QuestionCount;
            let Iscorrect = true;
            let AnswrBankCarryOver;
            let AnswrBank;
            let CarryOver;
             NewMarks = QuestionCount;

            if (bcarryOver == 0) {
                AnswrBank = AnswrBank_.split(":");

            }
            else
            {
                AnswrBankCarryOver = AnswrBank_.split(":#");
                AnswrBank = AnswrBankCarryOver[0].split(":");
                CarryOver = AnswrBankCarryOver[1].split(":");
            }
            if (bcarryOver == 1) {
                Digits++;
            }



            document.getElementById("SubmitAnswer").hidden = true;
              for (let Ques_ = 1; Ques_ <= QuestionCount; Ques_++)
              {
                let AnswerDigits = AnswrBank[Ques_ - 1].length;
                let diff = Digits - AnswerDigits;

                for (let Digit_ = 1 + diff; Digit_ <= Digits; Digit_++) {
                    let sTextId = "txtAnswer_" + Ques_ + "_" + Digit_;
                    
                    let AnswerDigit = AnswrBank[Ques_ - 1].substr(Digit_ - 1 - diff, 1);
                    SetSatusofTextNew(sTextId, Number(AnswerDigit), "txtCorrectAnswerCounting", 20);

                    
                }
                  if (bcarryOver == 1)
                  {

                      for (let Digit_ = 1; Digit_ <= Digits; Digit_++)
                      {
                        let sTextId = "txtCarryOver_" + Ques_ + "_" + Digit_;
                        
                        let AnswerDigit = CarryOver[Ques_ - 1].substr(Digit_ - 1, 1);

                        SetSatusofTextNew(sTextId, Number(AnswerDigit), "txtCorrectAnswerCounting", 20);
                       
                      }
                  }
                  if (NewMarks != LastMarks)
                  {
                      Counter--;
                  }
                  LastMarks = NewMarks;
            }
            let Score = document.getElementById("hScore");
            Score.innerHTML = Counter.toString() + "/" + QuestionCount.toString();

        }
function CheckCounting(AnswrBank_, StartingNumber, EndingNumber)
{
            let AnswrBank = AnswrBank_.split(",");
            let iTotalNumber = Math.abs(EndingNumber - StartingNumber) + 1;
            let iMaxRow = iTotalNumber <= 100 ? 10 : (iTotalNumber / 10);
            let counter = 0;
            let Score = document.getElementById("hScore");
            document.getElementById("SubmitAnswer").hidden = true;
            NewMarks = iTotalNumber-2;
            let bDone = false;
            for (let Col_ = 0; Col_ < 20; Col_ = Col_ + 2) {
                if (bDone) {
                    break;
                }
                for (let Row_ = 0; Row_ < iMaxRow; Row_++) {
                    if (bDone) {
                        break;
                    }

                    if (Col_ % 2 == 0) {
                        let Value = (iMaxRow * Col_ / 2 + Row_);

                        if ((Value != 0) && (Value != iTotalNumber - 1))
                        {

                            let sTextId = "txtNumber_" + Row_ + "_" + Col_;
                            SetSatusofTextNew(sTextId, Number(AnswrBank[Value]),"txtCorrectAnswerCounting",30);


                        }

                        if (Value >= 0 && Value <= iTotalNumber) {
                            counter++;
                        }
                        if (counter == iTotalNumber) {
                            bDone = true;

                        }
                    }

                }
            }
            Score.innerHTML = NewMarks.toString() + "/" + (iTotalNumber-2).toString();
        }


    function CheckAnswer(AnswrBank_, Elements, Questions)
        {
            let Counter = 0;
            let Score = document.getElementById("hScore");
            NewMarks = Questions*2;
            let AnswrBank = AnswrBank_.split(",");

            for (let iq = 0; iq < Questions; iq++)
            {
                let S = "txtSmallvalue_" + iq;
                Counter++;
                let SX = "txtLargevalue_" + iq;
       
                SetSatusofTextNew(S, Number(AnswrBank[Counter - 1]), "txtCorrectAnswerCounting", 30);
                SetSatusofTextNew(SX, Number(AnswrBank[Counter]), "txtCorrectAnswerCounting", 30);
                Counter++;


            }

            Score.innerHTML = NewMarks.toString() + "/" + (Questions*2).toString();

        }

        function IsPositionFilled(AnswrBankA, Digit) {
            let isFound = false;
            for (let iq = 1; iq < AnswrBankA.length; iq++) {
                if (AnswrBankA[iq] == Digit) {
                    isFound = true;
                    break;
                }
            }

            return isFound;
        }
    function CheckMissingAnswer(AnswrBank_, Elements, Questions) {
            let Counter = 0;
            let Score = document.getElementById("hScore");
            NewMarks = Questions;
            
            let AnswrBank = AnswrBank_.split(":##");
            //txtAvalue_
            for (let iq = 0; iq < Questions; iq++) {
                let AnswrBankA = AnswrBank[iq].split(":");

                let StartElements = AnswrBankA[0];
               
                for (let ie = 0; ie < Elements; ie++)
                {
                    if (!IsPositionFilled(AnswrBankA, ie))
                    {
                        let sTextId = "txtAvalue_" + iq + "_" + ie;

                        SetSatusofTextNew(sTextId, Number(StartElements), "txtCorrectAnswerCounting", 30);
                      
                    }
                    StartElements++;
                }
                


            }
        Score.innerHTML = NewMarks.toString() + "/" + Questions.toString();
        }
