function showToaster(mes, bcolor) {
    var message = mes; 
    var toaster = document.getElementById("toaster");
    toaster.innerText = message;
    toaster.style.display = "block";
    toaster.style.backgroundColor = bcolor;

    setTimeout(function () {
        toaster.style.display = "none";
    }, 4000);
}