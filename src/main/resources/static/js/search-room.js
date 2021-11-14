
const searchDateCheckIn = () => {
    let checkIn = document.getElementById("check_in").value;
    let dateTime = new Date(checkIn).getTime();
     return new Date(dateTime);

}

const searchDateCheckOut = () => {
    let checkOut = document.getElementById("check_out").value;
    let dateTime = new Date (checkOut).getTime();
    return new Date (dateTime);
}

const roomSelected = () => {
    let selected = document.getElementById("room_selected").value;
    return selected;
}

const priceSelected = () => {
    let price = document.getElementById("room_price").value;
    console.log(price);
    return price;
}

const search = () =>{
    const obj = {
        inDate:searchDateCheckIn(),
        outDate:searchDateCheckOut(),
        roomb:roomSelected(),
        price:priceSelected()
    }
    console.log(obj)
    return obj
}

