let MyStrings = "";
let MyStringsC = "";
let MyId = -1;
let MyId2 = -1;
let Firststring;
let Secondstring;
let Solution;
let SolutionV;
function SplitString(sline)
{
    MyId = -1;
    MyId2 = -1;
    MyStrings = sline.split("&&&&")[0].split("@@@@");
    MyStringsC = sline.split("&&&&")[1].split("@@@@");
    GenerateInitialMatrix();
}
function GenerateInitialMatrix()
{
    let MyStringA = MyStrings[0].split(":");
    let Matrixstring = "<table class=" + "\"SolutionTable\"" + ">";
    Solution = new Array(MyStringA[1]);
    SolutionV = new Array(MyStringA[1]);
    for (let Row_ = -1; Row_ < MyStringA[0]; Row_++) {
        Matrixstring += "<tr>";
        for (let Col_ = -1; Col_ < MyStringA[1]; Col_++) {

            if (Row_ <= 0 && Col_ <= 0) {
                Matrixstring += "<td class=" + "\"TDText\"" + ">" + "-" + "</td>";
            }
            else if (Row_ == -1 && Col_> 0)
            {
                Matrixstring += "<td class=" + "\"TDText\"" + ">" + Secondstring.substring(Col_ - 1, Col_) + "</td>";
                Solution[Col_ - 1] = Secondstring.substring(Col_ - 1, Col_);
                SolutionV[Col_ - 1] = 0;
            }
            else if (Col_ == -1 && Row_>  0) {
                Matrixstring += "<td class=" + "\"TDText\"" + ">" + Firststring.substring(Row_-1, Row_ )  + "</td>";
             }
            else if (Row_ == 0 || Col_ == 0)
            {
                Matrixstring += "<td class=" + "\"TDCurrent\"" + ">" + 0 + "</td>";
            }
            else
            {
                Matrixstring += "<td class=" + "\"TDPrevious\"" + "></td>";
            }
            
        }
        Matrixstring += "</tr>";
    }
    Matrixstring += "</table>";
    Matrixstring += "<Div class=" + "\"SolutionTable\"" + ">";
    
    Matrixstring += "<h1 class=" + "\"TopHeader\"" + ">Now we will compare both strings character by character. </h1>"
    Matrixstring += "</Div>";
    document.getElementById('MatrixArea').innerHTML = Matrixstring;
}
function GenerateTraverseLCSMatrix(id)
{
    MyId2 = id;
    if (MyId2 >= 0 && MyId2 < MyStringsC.length) {
        let RowChar = "";
        let ColChar = "";
        let MyStringA = MyStrings[MyStrings.length - 2].split(":");
        let MyStringS = MyStringsC[MyId2].split(":");
        if (MyStringS.length % 2 == 1)
            SolutionV[MyStringS[MyStringS.length - 1]] = 1;
        let Length = MyStringA.length - 1;
        let CLength = 8;

        let Matrixstring = "<table class=" + "\"SolutionTable\"" + ">";
        let Aclass = "";
        for (let Row_ = -1; Row_ < Number( MyStringA[0]) + 1; Row_++) {
            Matrixstring += "<tr>";
            for (let Col_ = -1; Col_ < MyStringA[1]; Col_++) {
                
                if (Row_ <=0  && Col_ <=0) {
                    Matrixstring += "<td class=" + "\"TDText\"" + ">" + "-" + "</td>";
                }
                else if (Row_ == -1 && Col_ > 0)
                {
                    Aclass = "\"TDText\"";

                    Matrixstring += "<td class=" + Aclass + ">" + Secondstring.substring(Col_ - 1, Col_) + "</td>";
                }
                else if (Col_ == -1 && Row_ > 0) {
                    Aclass = "\"TDText\"";
                    Matrixstring += "<td class=" + Aclass + ">" + Firststring.substring(Row_ - 1, Row_) + "</td>";
                }
                else if (Row_ == 0 || Col_ == 0) {
                    Aclass = "\"TDText\"";
                    for (let l = 0; l < MyStringS.length-1; l = l + 2) {
                        if (MyStringS[l] == Row_ && MyStringS[l + 1] == Col_) {
                            Aclass = "\"TDMinimum\"";
                            break;
                        }
                    }
                    if (Row_ == Number(MyStringA[0])) {
                        Matrixstring += "<td class=" + Aclass + "></td>";
                    }
                    else
                    {
                        Matrixstring += "<td class=" + Aclass + ">" + 0 + "</td>";
                    }
                }
                else if (Row_ == MyStringA[0] ) {
                    Aclass = "\"TDText\"";
                    if (SolutionV[Col_ - 1]==1)
                        Matrixstring += "<td class=" + "\"TDSOLUTION\"" + ">" + Solution[Col_ - 1] + "</td>";
                    else
                        Matrixstring += "<td class=" + Aclass + "></td>";
                }
                else if (CLength < Length)
                {
                    Aclass = "\"TDText\"";
                    for (let l = 0; l < MyStringS.length-1; l = l + 2)
                    {
                        if (MyStringS[l] == Row_ && MyStringS[l + 1] == Col_)
                        {
                            Aclass = "\"TDMinimum\"";
                            break;
                        }
                    }
                    
                    Matrixstring += "<td class=" + Aclass + ">" + MyStringA[CLength] + "</td>";
                    CLength++;

                }
                else {
                    Matrixstring += "<td class=" + "\"TDPrevious\"" + "></td>";
                }

            }
            Matrixstring += "</tr>";
        }
        Matrixstring += "</table>";
        Matrixstring += "<Div class=" + "\"SolutionTable\"" + ">";
        {
            Matrixstring += "<h1>Now we retrace the path where ever we have updated from diagonal we will put that character in bottom row.</h1>"
        }
        Matrixstring += "</Div>";
        document.getElementById('MatrixArea').innerHTML = Matrixstring;
    }
    else {
        MyId2 -= id;
    }

}
function GenerateLCSMatrix(id)
{
    MyId += id;
    if (MyId >= 0 && MyId < MyStrings.length-1)
    {
        let RowChar = "";
        let ColChar = "";
        let MyStringA = MyStrings[MyId].split(":");
        let Length = MyStringA.length-1;
        let CLength = 8;
        
        let Matrixstring = "<table class=" + "\"SolutionTable\"" + ">";
        let Aclass="";
        for (let Row_ = -1; Row_ < MyStringA[0]; Row_++)
        {
            Matrixstring += "<tr>";
            for (let Col_ = -1; Col_ < MyStringA[1]; Col_++)
            {
                if ((MyStringA[4] == Row_ && MyStringA[5] == Col_) || (MyStringA[6] == Row_ && MyStringA[7] == Col_)) { Aclass = "\"TDMinimum\""; }
                else {Aclass = "\"TDPrevious\"";}

                if (Row_ <= 0 && Col_ <= 0) {
                    Matrixstring += "<td class=" + "\"TDText\"" + ">" + "-" + "</td>";
                }
                else if (Row_ == -1 && Col_ > 0) {

                    if (Col_ == MyStringA[3])
                    {
                        ColChar = Secondstring.substring(Col_ - 1, Col_);
                        Aclass = "\"TDSelectedRowAndCol\"";
                    }
                    else
                    {
                        Aclass = "\"TDText\"";
                    }
                    
                    Matrixstring += "<td class=" + Aclass + ">" + Secondstring.substring(Col_ - 1, Col_) + "</td>";
                }
                else if (Col_ == -1 && Row_ > 0) {
                    if (Row_ == MyStringA[2])
                    {
                        RowChar = Firststring.substring(Row_ - 1, Row_);
                        Aclass = "\"TDSelectedRowAndCol\"";
                    }
                    else {
                        Aclass = "\"TDText\"";
                    }

                    Matrixstring += "<td class=" + Aclass + ">" + Firststring.substring(Row_ - 1, Row_) + "</td>";
                }
                else if (Row_ == 0 || Col_ == 0)
                {
                    Matrixstring += "<td class=" + Aclass +  ">" + 0 + "</td>";
                }
                else if (CLength < Length)
                    {
                  
                    if (Row_ == MyStringA[2] && Col_ == MyStringA[3])
                        {
                            Matrixstring += "<td class=" + "\"TDCurrent\"" + ">" + MyStringA[CLength] + "</td>";
                        }
                    else
                        {
                        Matrixstring += "<td class=" + Aclass + ">" + MyStringA[CLength] + "</td>";
                        }
                        CLength++;
                    }
                else
                {
                    Matrixstring += "<td class=" + "\"TDPrevious\"" + "></td>";
                }
                    
            }
            Matrixstring += "</tr>";
        }
        Matrixstring += "</table>";
        Matrixstring += "<Div class=" + "\"SolutionTable\"" + ">";
        if (ColChar == RowChar) {
            Matrixstring += "<h1>Since both selected char in black color are same so take  upper diagonal value shown in green color and add 1 to it. </h1>"
        }
        else
        {
            Matrixstring += "<h1>Since both selected char in black color are differet,select maximum value shown in green color.</h1>"
        }
        Matrixstring += "</Div>";
        document.getElementById('MatrixArea').innerHTML = Matrixstring;
    }
    else
    {
        if (MyId >= MyStrings.length - 1)
        {
            if (MyId - MyStrings.length +2 < MyStringsC.length) {
                GenerateTraverseLCSMatrix(MyId - MyStrings.length + 1);
            }
            else
            {
                MyId -= id;
            }
        }
        else
        {
            MyId -= id;
        }
        
    }
}