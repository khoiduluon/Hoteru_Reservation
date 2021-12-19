var cardServicePrice = document.getElementById("card-service-price").value = 0;
var cardFoodPrice = document.getElementById("card-food-price").value = 0;
var cardRoomPrice = document.getElementById("card-room-price").value;
var cardTotalPrice = document.getElementById("card-total-price").value = parseInt(cardRoomPrice);
var fullName = document.getElementById("fullname").value;
var phone = document.getElementById("phone").value;
var totalStayPrice = 0;

document.getElementById("card-total-price").innerHTML = cardRoomPrice;

const dateCheckIn = () => {
    let checkIn = document.getElementById("checkIn").value;
    document.getElementById("check_in").innerHTML = checkIn;
    return new Date(checkIn).getTime();
}

const dateCheckOut = () => {
    let checkOut = document.getElementById("checkOut").value;
    document.getElementById("check_out").innerHTML = checkOut;
    let timeStay = new Date(checkOut).getTime() - dateCheckIn();
    let dayStay = timeStay / (1000 * 3600 * 24);
    totalStayPrice = dayStay * cardRoomPrice;
    document.getElementById("room-price-result").innerHTML = totalStayPrice;
    cardTotalPrice = totalStayPrice + cardFoodPrice + cardServicePrice;
    document.getElementById("card-total-price").innerHTML = cardTotalPrice;
    document.getElementById("dayStay").innerHTML = `${dayStay} ngày`;
    return new Date(checkOut).getTime();
}

const getService = function () {
    let service = document.getElementsByClassName("service");
    let arr = [...service];
    let services = [];
    for (let i = 0; i < arr.length; i++) {
        if (arr[i].checked === true) {
            let start = arr[i].name.indexOf("-") + 1;
            let end = arr[i].length;
            let name = arr[i].name.slice(0, start - 1);
            let price = arr[i].name.slice(start, end);
            services.push({
                id: arr[i].value,
                name: name,
                price: price
            });

            let servicePrice = services.reduce((total, cur) => {
                let price = parseInt(cur.price);
                let formatTotal = parseInt(total);
                formatTotal += price;
                return formatTotal;
            }, 0);
            document.getElementById("card-service-name").innerHTML = services.map(sv => sv.name)
            cardServicePrice = servicePrice;
            cardTotalPrice = totalStayPrice + cardFoodPrice + cardServicePrice;
            document.getElementById("card-service-price").innerHTML = cardServicePrice
            document.getElementById("card-total-price").innerHTML = cardTotalPrice;
        }
    }
    if (services.length <= 0) {
        cardServicePrice = 0;
        cardTotalPrice = totalStayPrice + cardFoodPrice + cardServicePrice;
        document.getElementById("card-service-price").innerHTML = cardServicePrice;
        document.getElementById("card-total-price").innerHTML = cardTotalPrice;
        document.getElementById("card-service-name").innerHTML = '';
    }
    return services;
}

const getFood = function () {
    let food = document.getElementsByClassName("food");
    let arr = [...food];
    let foods = [];
    for (let i = 0; i < arr.length; i++) {
        if (arr[i].checked === true) {
            let start = arr[i].name.indexOf("-") + 1;
            let end = arr[i].length;
            let name = arr[i].name.slice(0, start - 1);
            let price = arr[i].name.slice(start, end);
            foods.push({
                id: arr[i].value,
                name: name,
                price: price
            });
            let foodPrice = foods.reduce((total, cur) => {
                let price = parseInt(cur.price);
                let formatTotal = parseInt(total);
                formatTotal += price;
                return formatTotal;
            }, 0);
            cardFoodPrice = foodPrice;
            cardTotalPrice = totalStayPrice + cardFoodPrice + cardServicePrice;
            document.getElementById("card-food-name").innerHTML = `${foods.map(f => f.name)}`;
            document.getElementById("card-food-price").innerHTML = cardFoodPrice;
            document.getElementById("card-total-price").innerHTML = cardTotalPrice;
        }
    }
    if (foods.length <= 0) {
        cardFoodPrice = 0;
        cardTotalPrice = totalStayPrice + cardFoodPrice + cardServicePrice;
        document.getElementById("card-food-price").innerHTML = cardFoodPrice;
        document.getElementById("card-total-price").innerHTML = cardTotalPrice;
        document.getElementById("card-food-name").innerHTML = '';
    }
    return foods;
}

// let formatCurrency = new Intl.NumberFormat('en-US',{
//     style:'currency',
//     currency: 'VND'
// })
// let formatPrice = new Intl.NumberFormat().format(formatTotal);

var dateRange = [];
var listDate = document.getElementById("listDate").value;
var obj = JSON.parse(listDate);
var objDate = obj.map(obj => ({start: new Date(obj.inDate), end: new Date(obj.outDate)}))

$('#checkIn').datepicker({
    dateFormat: 'dd M yy',
    minDate: 0,
    beforeShowDay: function (date) {
        var dateString = jQuery.datepicker.formatDate('yy-mm-dd', date);
        for (let i = 0; i < objDate.length; i++) {
            for (let date = objDate[i].start; date <= objDate[i].end; date.setDate(date.getDate() + 1)) {
                dateRange.push($.datepicker.formatDate('yy-mm-dd', date))
            }
        }
        return [dateRange.indexOf(dateString) == -1];
    }
});
$('#checkOut').datepicker({
    dateFormat: 'dd M yy',
    minDate: 0,
    beforeShowDay: function (date) {
        var dateString = jQuery.datepicker.formatDate('yy-mm-dd', date);
        for (let i = 0; i < objDate.length; i++) {
            for (let date = objDate[i].start; date <= objDate[i].end; date.setDate(date.getDate() + 1)) {
                dateRange.push($.datepicker.formatDate('yy-mm-dd', date))
            }
        }
        return [dateRange.indexOf(dateString) == -1];
    }
});

const booking = function () {
    const ci = dateCheckIn();
    const co = dateCheckOut();
    const newObjDate = objDate.map(obj => ({start: obj.start.getTime(), end: obj.end.getTime()}))

    const obj = {
        customerb: document.getElementById("user_id").value,
        roomb: document.getElementById("room_id").value,
        inDate: new Date(dateCheckIn()),
        outDate: new Date(dateCheckOut()),
        total: cardTotalPrice,
        fullname: fullName,
        phone: phone,
        foodBookings: getFood(),
        serviceBookings: getService()
    }


    for (let i = new Date(ci); i <= new Date(co); i.setDate(i.getDate() + 1)) {
        console.log(i)
        var temp = newObjDate.some(date => date.start === i.getTime() || date.end === i.getTime());
    }
    if (co - ci <= 0) {
        alert('Please select Date')
        return;
    }
    console.log(temp)
    if (!temp) {
        console.log('ok')
        axios.post('/book-create', obj).then(function (response) {
            setTimeout(() => {
                location.reload()
            }, 5000);
            location.href = "/booking/detail/" + response.data;
        }).catch(function (error) {
            showToastError();
        });
        return;
    }
    if(temp) {
        alert("The date you choose is already booked");
        console.log("not ok")
        return;
    }
}