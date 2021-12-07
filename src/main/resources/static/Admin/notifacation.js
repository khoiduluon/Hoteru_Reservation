axios.get('/getAllBooking')
    .then(function (response) {
        let ListNoti = response.data;
        const status = ListNoti.filter(s => s.status === 'PENDING')
        document.getElementById("numberNoti").innerHTML = status.length;
        let number = 0;
        for (let i = 0; i <= ListNoti.length; i++) {
            if (ListNoti[i].status === 'PENDING') {
                number++;
                document.getElementById("notification").insertAdjacentHTML("afterend",
                    " <li class='dropdown-menu-item'>" +
                    "<a href='/admin/bookingmgmt' class='dropdown-menu-link'>" +
                    "	<div>" +
                    " 		<i class='fas fa-bell'></i>" +
                    " 	</div>" +
                    " 	<span>" +
                    " Booking " + ListNoti[i].id + " Is Pending, You Can Confirm It!" +
                    " 		<br>" +
                    " 		<span>" +
                    (ListNoti[i].bookDate.slice(0, 10))
                    + "</span>" +
                    " 	</span>" +
                    " </a>" +
                    " </li>"
                );
                number++;
            } 
        }

    })
    .catch(function (error) {
        console.error(error)
    });



