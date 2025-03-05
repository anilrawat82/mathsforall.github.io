function GetHighlightText( LineInfoa)
{
    var newStr1 = LineInfoa.split('_');
    var row = Number(newStr1[1]);
    var col = newStr1[2];
    var ColorName = newStr1[4];
    let rowA = Number(newStr1[5]);
    for (let iCol = 1; iCol <= col; iCol++)
    {
        document.getElementById("Matrix_" + row + "_" + iCol).style.backgroundColor = ColorName;
    }
    row += rowA;
    if (row > 0)
    {
        document.getElementById("Weight_" + row).style.backgroundColor = ColorName;
        document.getElementById("Profit_" + row).style.backgroundColor = ColorName;

    }
    
    
    
}

function GetHighlightTextOut(LineInfoa)
{

    var newStr1 = LineInfoa.split('_');
    var row = newStr1[3];
    var col = newStr1[2];
    for (let iRow = 0; iRow <= row; iRow++)
    {
        for (let iCol = 1; iCol <= col; iCol++)
        {
            if (iRow == 0) {
                document.getElementById("Matrix_" + iRow + "_" + iCol).style.backgroundColor = "crimson";
            }
            else {
                document.getElementById("Matrix_" + iRow + "_" + iCol).style.backgroundColor = "dimgrey";
            }
        }
        if (iRow > 0)
        {
            document.getElementById("Weight_" + iRow).style.backgroundColor = "maroon";
            document.getElementById("Profit_" + iRow).style.backgroundColor = "darkolivegreen";
        }
    }



}
