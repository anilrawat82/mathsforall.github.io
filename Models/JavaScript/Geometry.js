let ImageLoaded="";
function UpdateTangentSecant(value)
{
    document.getElementById("TangentP1").innerHTML = value.charAt(0);
    document.getElementById("TangentT1").innerHTML = value.charAt(1);
    document.getElementById("SecantA1").innerHTML = value.charAt(2);
    document.getElementById("SecantB1").innerHTML = value.charAt(3);

}
function UpdatePABPCD(value, id)
{    
    document.getElementById("TangentP1"+id).innerHTML = value.charAt(0);
    document.getElementById("SecantA1"+id).innerHTML = value.charAt(1);
    document.getElementById("SecantB1"+id).innerHTML = value.charAt(2);
    document.getElementById("SecantA2"+id).innerHTML = value.charAt(4);
    document.getElementById("SecantB2"+id).innerHTML = value.charAt(5);

}