function slide(i, p) {
    var I = document.getElementById(i);
    var P = document.getElementById(p);
    if (I.style.display != "block") {
        I.style.display = "block";
    } else {
        I.style.display = "none";
    }
}