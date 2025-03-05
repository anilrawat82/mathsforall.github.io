let HightLightText;
let HightLightMouseMove;
let RemoveMouseMove;
let totalElement = 0;
function ParseData(strInfo)
{
    let txtArr = strInfo.split('\r');
    totalElement = txtArr[0].split(',').length;

    var newStr1 = txtArr[1].split(',');
    var newStr2 = txtArr[2].split(',');
    var newStr3 = txtArr[3].split(',');

    // alert(totalElement);
    HightLightText = new Array(totalElement);
    HightLightMouseMove = new Array(totalElement);
    RemoveMouseMove = new Array(totalElement);
    for (let k = 0; k < totalElement; k++) {
        HightLightText[k] = newStr1[k].replace(/#/g, ",");
        HightLightMouseMove[k] = newStr2[k].replace(/#/g, ",");
        RemoveMouseMove[k] = newStr3[k].replace(/#/g, ",");
    }
}
