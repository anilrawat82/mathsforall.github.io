let MaxArraySize = 0;
let sValues
let FirstPart;
let secondPart;
let MyId = -1;
let StepWise;
let WeightPos;
let CurrenPBYW = -1;
let LastPBYW = -1;

function GetMatrixValues()
{
    sValues = "";
    for (let row = 1; row <=2 ; row++) {
        for (let col = 1; col <= MaxArraySize; col++)
        {
            let idValue = "txtAvalue" + row + col;
            sValues += Number(document.getElementById(idValue).value) + ":";
        }
    }
}
function FinalSolution(sol)
{
    MyId = -1;
    FirstPart = sol.split("####")[0];
    secondPart = sol.split("####")[1];
    StepWise = secondPart.split("@@@@");
}
function StepBySolution(id)
{
    MyId += id;
    if (MyId >= 0 && MyId < StepWise.length - 1)
    {
        let MyStringA = StepWise[MyId].split(":");
        let MaxWeight = MyStringA[0];
        let AllocatedWeight = MyStringA[1];
        let RemainingWeight = MyStringA[2];

        //let Matrixstring = "<table class=" + "\"SolutionTable\"" + ">";
        let Matrixstring = "";
        Matrixstring += "<tr>";
        let found = false;
        for (let Col_ = 0; Col_ < MaxArraySize+1; Col_++) {

            if ( Col_ == 0) {
                Matrixstring += "<td class=" + "\"INFO3\"" + ">" + "Weight Allocated" + "</td>";
            }
            else 
            {
                let value = "-";
                
                Aclass = "\"INFO2\"";
                for (let l = MyStringA.length - 2; l >= 3; l = l - 2)
                {
                    if (MyStringA[l - 1] == Col_ - 1)
                    {
                        value = MyStringA[l];
                        if (l == MyStringA.length-2)
                        {
                            found = true;
                            Aclass = "\"INFO5\"";
                            AllocatedWeight = Number(value);
                            WeightPos = Number(MyStringA[l - 1]) + 1;
                            CurrenPBYW = WeightPos;
                            
                        }
                         
                        
                        break;
                    }
                }
                Matrixstring += "<td class=" + Aclass + ">" + value +"</td>";
                
            }
        }
        Matrixstring += "</tr>";
        Matrixstring += "<tr>";
        Matrixstring += "<td colspan=" + MaxArraySize + 1 + " class=" + "\"INFO1\"" + ">";
        Matrixstring += "Among all profit weight  ratio  maximum which is also unallocated is colored green at pos " + WeightPos;
        Matrixstring += "</td>";

        Matrixstring += "<tr>";
        Matrixstring += "<td colspan=" + MaxArraySize + 1 + " class=" + "\"INFO2\"" + ">";
        Matrixstring += "Maximum weight available is " + MaxWeight;
        Matrixstring += ",so we can allocate " + AllocatedWeight;
        Matrixstring += ",max weight remains after allocation is " + RemainingWeight;

        Matrixstring += "</td>";

        Matrixstring += "</tr>";
        Matrixstring += "</table>";
        
        let LastPBYW = -1;

        document.getElementById('solutionTable').innerHTML = FirstPart + Matrixstring;
        let id = "PBYW" + CurrenPBYW;
        document.getElementById(id).style.backgroundColor = "chartreuse";
        
        
    
    }
    else
    {
        MyId -= id;
    }
}