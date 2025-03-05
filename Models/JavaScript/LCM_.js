
let LastRow = -1;
let LastElement = "";
function getRandomColorA()
{
    var letters = '0123456789ABCDEF';
    var color = '#';
    for (var i = 0; i < 6; i++) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}

function HighLightLCMCell(ElementID) {

    let myArr = ElementID.split("_");
    let arrLength = myArr.length;
        
    
    let Row_ = myArr[1];
    if (Row_ == LastRow )
    {
        return;
    }
    LastRow = Row_;
    let MAXROW = myArr[arrLength - 2];
    let MAXCOL = myArr[arrLength - 1];

    for (let iRow = 0; iRow < MAXROW ; iRow++) {


        for (let iCol = 0; iCol < MAXCOL; iCol++) {
            document.getElementById(myArr[0] + "_" + iRow + "_" + iCol).style.backgroundColor = "cornflowerblue";
            
        }
    }

    let colorA = "crimson";
    
    
    for (let i = 2; i < arrLength-2; i++)
    {
        if (myArr[i] == "Y")
        {
            
            document.getElementById(myArr[0] + "_"  + Row_ + "_" + (i - 2)).style.backgroundColor = colorA;
        }
    }
    if (document.getElementById(LastElement))
    {
        document.getElementById(LastElement).style.backgroundColor = "cornflowerblue";
    }
    document.getElementById(ElementID).style.backgroundColor = colorA;
    LastElement = ElementID;

    


}

