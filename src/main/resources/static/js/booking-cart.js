var cardServicePrice = document.getElementById("card-service-price").value = 0;
var cardFoodPrice = document.getElementById("card-food-price").value = 0;
var cardRoomPrice = document.getElementById("card-room-price").value;
var cardTotalPrice = document.getElementById("card-total-price").value = parseInt(cardRoomPrice);
var fullName = document.getElementById("fullname").value;
var phone = document.getElementById("phone").value;
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
    var totalStayPrice = dayStay * cardRoomPrice;
    cardRoomPrice = totalStayPrice;
    document.getElementById("card-room-price").innerHTML = cardRoomPrice;
    console.log(totalStayPrice);
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
            cardTotalPrice = parseInt(cardRoomPrice) + cardFoodPrice + cardServicePrice;
            document.getElementById("card-service-price").innerHTML = cardServicePrice
            document.getElementById("card-total-price").innerHTML = cardTotalPrice;
        }
    }
    if (services.length <= 0) {
        cardServicePrice = 0;
        cardTotalPrice = parseInt(cardRoomPrice) + cardFoodPrice + cardServicePrice;
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
            cardTotalPrice = parseInt(cardRoomPrice) + cardFoodPrice + cardServicePrice;
            document.getElementById("card-food-name").innerHTML = `${foods.map(f => f.name)}`;
            document.getElementById("card-food-price").innerHTML = cardFoodPrice;
            document.getElementById("card-total-price").innerHTML = cardTotalPrice;
        }
    }
    if (foods.length <= 0) {
        cardFoodPrice = 0;
        cardTotalPrice = parseInt(cardRoomPrice) + cardFoodPrice + cardServicePrice;
        document.getElementById("card-food-price").innerHTML = cardFoodPrice;
        document.getElementById("card-total-price").innerHTML = cardTotalPrice;
        document.getElementById("card-food-name").innerHTML = '';
    }
    return foods;
}

const booking = function () {
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
    axios.post('/book-create', obj).then(function (response) {
        showToast()
        setTimeout(() => {
            location.reload()
        }, 2100);
        location.href = "/booking/detail/" + response.data;
    }).catch(function (error) {
        showToastError();
    });
}

// let formatCurrency = new Intl.NumberFormat('en-US',{
//     style:'currency',
//     currency: 'VND'
// })
// let formatPrice = new Intl.NumberFormat().format(formatTotal);

var startDate, endDate, dateRange = [];


const obj = [
    {
        start: '2021/11/1',
        end: '2021/11/3'
    },
    {
        start: '2021/11/5',
        end: '2021/11/8'
    },
    {
        start: '2021/11/15',
        end: '2021/11/21'
    },
]

var objDate = obj.map(obj => ({start: new Date(obj.start), end: new Date(obj.end)}))

$('#checkIn').datepicker({
    beforeShowDay: function (date) {
        var dateString = jQuery.datepicker.formatDate('yy-mm-dd', date);
        for (let i = 0; i < objDate.length; i++) {
            for (let date = objDate[i].start; date <= objDate[i].end; date.setDate(date.getDate() + 1)) {
                console.log(date)
                dateRange.push($.datepicker.formatDate('yy-mm-dd', date))
            }
        }
    return [dateRange.indexOf(dateString) == -1];
        // for (var d = new Date(startDate);
        //      d <= new Date(endDate);
        //      d.setDate(d.getDate() + 1)) {
        //     dateRange.push($.datepicker.formatDate('yy-mm-dd', d));
        // }
        // //console.log(dateString);
        // return [dateRange.indexOf(dateString) == -1];
    }
});

$('#checkOut').datepicker({
    beforeShowDay: function (date) {
        var dateString = jQuery.datepicker.formatDate('yy-mm-dd', date);
        for (let i = 0; i < objDate.length; i++) {
            for (let date = objDate[i].start; date <= objDate[i].end; date.setDate(date.getDate() + 1)) {
                console.log(date)
                dateRange.push($.datepicker.formatDate('yy-mm-dd', date))
            }
        }
        return [dateRange.indexOf(dateString) == -1];
        // for (var d = new Date(startDate);
        //      d <= new Date(endDate);
        //      d.setDate(d.getDate() + 1)) {
        //     dateRange.push($.datepicker.formatDate('yy-mm-dd', d));
        // }
        // //console.log(dateString);
        // return [dateRange.indexOf(dateString) == -1];
    }
});