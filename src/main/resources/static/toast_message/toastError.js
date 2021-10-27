let x2;
let toast2 = document.getElementById("toastError");
function showToastError(){
    clearTimeout(x);
    toast2.style.transform = "translateX(0)";
    x2 = setTimeout(()=>{
        toast2.style.transform = "translateX(400px)"
    }, 1700);
}