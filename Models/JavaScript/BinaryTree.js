//function Jquery_Test_Ajax(MyValue) {
//    alert("Jquery_Test_Ajax");
//    var TreePos_ = document.getElementById('TreePos_');
//    var canvas = document.getElementById('myCanvas');
//    canvas.hidden = true;
//    TreePos_.innerHTML = MyValue;
//}


function JqueryBinary_TreeGraph(str,CurrentNode)
{
    
    let mystrA = str.split(":#");

    let mystr = mystrA[0].split(":");
    let mystrTour = mystrA[1].split("$");
    let length = mystr.length;
    let level = Math.ceil(Math.log(length + 1) / Math.log(2));


    let lk = 0;
    let TourTraverse = 0;

    let PA = 25 * Math.pow(2, level - 1);

    let PB = PA;
    const WidthPos = [length];
    const HeightPos = [length];

    var canvas = document.getElementById('myCanvas');
    canvas.hidden = false;
    var context = canvas.getContext('2d');
    canvas.style.backgroundColor = 'Yellowgreen';
    context.clearRect(0, 0, canvas.width, canvas.height);
    
    for (let j = 0; j < level; j++)
    {
        let k = Math.pow(2, j);
        if (j > 0) { PA = PA / 2; }


        for (let i = 0; i < k; i++) {
            if (mystr[lk] > 0) {

                var centerX = PA + PB * i;
                var centerY = 100 + 50 * j;
                var radius = 15;
                

                context.beginPath();
                context.arc(centerX, centerY, radius, 0, 2 * Math.PI, false);
                console.log(centerX + " :: " + centerY);
                if (Number(mystr[lk]) == Number(CurrentNode)) {

                    context.fillStyle = 'rgb(172,203,255)';
                    
                }
                else if (Number(mystrTour[TourTraverse]) == Number(mystr[lk])) {
                    //context.fillStyle = 'rgb(' + 238 + ', ' + 156 + ',' + '34)';
                    context.fillStyle = 'rgb(238,156,34)';
                    TourTraverse++;
                }
                else
                {
                    context.fillStyle = 'white';
                }
                context.fill();



                context.lineWidth = 2;
                context.strokeStyle = 'black';
                context.stroke();
                context.font = '8pt Calibri';
                context.fillStyle = 'black';
                context.fillText(mystr[lk], centerX - 10, centerY);
                WidthPos[lk] = centerX;
                HeightPos[lk] = centerY;

                //alert(WidthPos[lk] + "::" + HeightPos[lk] + "::" + lk);

                if (lk > 0) {
                    if ((lk + 1) % 2 == 0) {

                        context.beginPath();
                        context.moveTo(WidthPos[((lk + 1) / 2) - 1], HeightPos[((lk + 1) / 2) - 1] + radius);
                        context.lineTo(centerX, centerY - radius);
                        context.stroke();

                    }
                    else {

                        context.beginPath();
                        context.moveTo(WidthPos[(lk) / 2 - 1], HeightPos[((lk) / 2) - 1] + radius);
                        context.lineTo(centerX, centerY - radius);
                        context.stroke();

                    }
                }
            }

            lk++;
        }
        PB = PA;

    }

}