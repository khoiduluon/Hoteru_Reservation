

const dateCheckIn = () => {
    let checkIn = document.getElementById("checkIn").value;
    document.getElementById("check_in").innerHTML = checkIn;
    return new Date(checkIn).getTime();
}

const dateCheckOut = () => {
    let checkOut = document.getElementById("checkOut").value;
    document.getElementById("check_out").innerHTML = checkOut;
    let timeStay =  new Date (checkOut).getTime() - dateCheckIn();
    let dayStay = timeStay / (1000 * 3600 * 24);
    document.getElementById("dayStay").innerHTML = `${dayStay} ngày`;
    return new Date (checkOut).getTime();
}



const getService = function() {
    let service = document.getElementsByClassName("service");
    let arr = [...service];
    let services = [];
    for(let i = 0; i < arr.length;i++){
        if(arr[i].checked === true){
            let start = arr[i].name.indexOf("-") + 1;
            let end = arr[i].length;
            let name = arr[i].name.slice(0, start - 1);
            let price = arr[i].name.slice(start,end);
            services.push({
                id: arr[i].value,
                name: name,
                price: price
            });
            let cardService = [...services];
            let cardFoodPrice = cardService.reduce((total, cur) => {
                let price = parseInt(cur.price);
                let formatTotal = parseInt(total);
                formatTotal += price;
                return formatTotal;
            }, 0);
            document.getElementById("card-service-name").innerHTML = cardService.map(sv=>sv.name)
            document.getElementById("card-service-price").innerHTML = cardFoodPrice
            document.getElementById("card-total-price").value = cardFoodPrice;
            document.getElementById("card-total-price").innerHTML = cardFoodPrice;
        }
    }
    console.log(services)
    return services;
}

const getFood = function() {
    let food = document.getElementsByClassName("food");
    let arr = [...food];
    let foods = [];
    for(let i = 0 ;i< arr.length;i++){
        if(arr[i].checked===true){
            let start = arr[i].name.indexOf("-") + 1;
            let end = arr[i].length;
            let name = arr[i].name.slice(0, start - 1);
            let price = arr[i].name.slice(start,end);
            foods.push({
                id: arr[i].value,
                name: name,
                price: price
            });
            let cardFoods = [...foods];
            let cardPriceFood = cardFoods.reduce((total, cur) => {
                let price = parseInt(cur.price);
                let formatTotal = parseInt(total);
                formatTotal += price;
                return formatTotal;
            }, 0);
            document.getElementById("card-food-name").innerHTML = cardFoods.map(f => f.name);
            document.getElementById("card-food-price").innerHTML = cardPriceFood;
            let totalPrice = document.getElementById("card-total-price").value;
            document.getElementById("card-total-price").innerHTML = totalPrice + cardPriceFood;
        }
    }
    return foods;
}

const booking = function (){
    let check_in = new Date(dateCheckIn());
    let check_out = new Date(dateCheckOut());
    let room_id = document.getElementById("room_id").value;
    let cardTotalPrice = document.getElementById("card-total-price").value;
    let user_id = document.getElementById("user_id").value;
    const obj = {
        foodBookings: getFood(),
        serviceBookings: getFood(),
        inDate: check_in,
        outDate: check_out,
        room_id: room_id,
        username: user_id,
        total: cardTotalPrice
    }
    console.log(obj);
}

// let formatCurrency = new Intl.NumberFormat('en-US',{
//     style:'currency',
//     currency: 'VND'
// })
//let formatPrice = new Intl.NumberFormat().format(formatTotal);