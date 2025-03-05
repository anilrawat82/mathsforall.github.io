function SolveCurveFitting2(MaxArraySize)
{
    let xValuesA=[];
    let yValuesA = [];
    let barColors = []
    for (let j = 0; j < MaxArraySize; j++) {
        let Str = "txtvalue_" + j + "_1";        
        let xA = document.getElementById(Str);
        xValuesA.push(xA.value);
        Str = "txtvalue_" + j + "_2";
        xA = document.getElementById(Str);
        yValuesA.push(xA.value);
        let R = Math.floor(Math.random() * 255);
        let G = Math.floor(Math.random() * 255);
        let B = Math.floor(Math.random() * 255);
        barColors.push("rgb(" + R + "," +  G + "," + B+")")
    }
    let Caption = document.getElementById("txtCaption").value;
    let xAC = document.getElementById("Barchart");    
    new Chart(xAC, {
        type: "bar",
        data: {
            labels: xValuesA,
            datasets: [{
                backgroundColor: barColors,
                data: yValuesA
            }]
        },
        options: {
            legend: { display: false },
            title: {
                display: true,
                text: Caption,
            }
        }
    });
}