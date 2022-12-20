var on_off=document.querySelector(".shop_option_power");
// function click_power(){
//     on_off.style.background = "#61188B"
// }
var option=document.querySelectorAll(".shop_option_a");
function click_power() {
    document.querySelector(".shop_option_power").style.background = "#9867b2"
    document.querySelector(".shop_option_power").style.color = "#f2ebf5"
    document.querySelector(".shop_option_power").innerText="ON"
    document.querySelector("#option1").disabled=false;
    document.querySelector("#option2").disabled=false;
    document.querySelector("#option3").disabled=false;
}