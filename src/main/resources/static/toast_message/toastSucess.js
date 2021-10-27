let x;
let toast = document.getElementById("toast");
function showToast(){
    clearTimeout(x);
    toast.style.transform = "translateX(0)";
    x = setTimeout(()=>{
        toast.style.transform = "translateX(400px)"
    }, 1700);
}