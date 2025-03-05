
function CheckCountingNumbers(AnswrBank_)
{

    
    document.getElementById("SubmitAnswer").hidden = true;
    let AnswrBank = AnswrBank_.split(",");
    NewMarks = AnswrBank.length;
    let QuestionCount = AnswrBank.length;
    for (   let Answer_ = 0; Answer_ < AnswrBank.length; Answer_++) {

        let sTextId = "txtNumberWord_" + AnswrBank[Answer_];
        let Element_ = document.getElementById(sTextId);
        let TextElement = Element_.value;
        let TextElement_ = TextElement.split(" ");
        let Value = ConvertNumberToText(parseInt(AnswrBank[Answer_]));
        let Value_ = Value.split(" ");

        let CorrectAns = true;
        
        for (let k = 0; k < Value_.length-1; k++)
        {
            let WordFound = false;
            let CorrectAnswer = Value_[k].trim().toUpperCase();
            let AnswerWritten;
            if (TextElement_.length >= k)
            {
                AnswerWritten = TextElement_[k].trim().toUpperCase();
                WordFound = true;
            }
            if (WordFound)
            {
                if (CorrectAnswer.localeCompare(AnswerWritten) != 0)
                {
                    CorrectAns = false;
                    break;
                    
                }

            }

        }

        
        SetTextToNumber(CorrectAns, sTextId,  Value, "txtCorrectAnswerCounting", 30);

        //if (CorrectAns)
        //{
        //    Element_.style.backgroundColor = "#00FF00";


        //}
        //else
        //{
        //    Marks--;
        //    let Eparent = Element_.parentElement;
        //    if (TextElement == "") {
        //        Element_.remove();
        //    }
        //    else {
        //        Element_.style.textDecoration = "line-through";
        //        Element_.style.color = "#FFFFFF";
        //        Element_.style.fontSize = "30px";
        //        Element_.style.height = "50%";
        //        Element_.style.width = "50%";
        //        Element_.style.backgroundColor = "#FF0000";


        //    }

        //    let CorrectAns = document.createElement("input");
        //    CorrectAns.value = Value;
        //    Eparent.appendChild(CorrectAns);
        //    CorrectAns.classList.add("txtCorrectAnswerNumber");
            

        //}
       
    }

    let Score = document.getElementById("hScore");
    Score.innerHTML = NewMarks.toString() + "/" + QuestionCount.toString();
}

function ConvertNumberToText(num) {

    let tempString = "";

    let thousands;

    let temp;

    result = "";





    if (num < 1000) {

        tempString = HelperConvertNumberToText(num);

        result += tempString;

    }

    else {

        thousands = (num - num % 1000) / 1000;

        temp = num - thousands * 1000;

        tempString = HelperConvertNumberToText(thousands);

        result += tempString;

        result += "Thousand ";

        tempString = HelperConvertNumberToText(temp);

        result += tempString;

    }

    return result;

}

function HelperConvertNumberToText(num) {

    let strones = [

        "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight",

        "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen",

        "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen",

    ];



    let strtens = [

        "Ten", "Twenty", "Thirty", "Fourty", "Fifty", "Sixty",

        "Seventy", "Eighty", "Ninety", "Hundred"

    ];



    let result = "";

    let buf = "";

    let single, tens, hundreds;



    if (num > 1000)

        return false;



    hundreds = (num - num % 100) / 100;

    num = num - hundreds * 100;

    if (num < 20) {

        tens = 0; // special case

        single = num;

    }

    else {

        tens = (num - num % 10) / 10;

        num = num - tens * 10;

        single = num;

    }



    result = "";



    if (hundreds > 0) {

        result += strones[hundreds - 1];

        result += " Hundred ";

    }

    if (tens > 0) {

        result += strtens[tens - 1];

        result += " ";

    }

    if (single > 0) {

        result += strones[single - 1];

        result += " ";

    }



    buf = result;

    return buf;

}