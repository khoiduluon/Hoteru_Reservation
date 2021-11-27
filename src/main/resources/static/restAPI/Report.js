async function getIndex() {
  axios.get('/report/index')
    .then(function (response) {
      let objCount = response.data;
      document.getElementById("user").innerHTML = objCount.countDto.user;
      document.getElementById("food").innerHTML = objCount.countDto.food;
      document.getElementById("service").innerHTML = objCount.countDto.service;
      document.getElementById("room").innerHTML = objCount.countDto.room;
      console.log(objCount)
      for (var i = 0; i < 6; i++) {
        var No = i+1;
        document.getElementById("top6Customer").insertAdjacentHTML("beforeend",
          "	<tr>" +
          "<td>" + No + "</td>" +
          "<td>" + objCount.listCustomer[i].username + "</td>" +
          "<td>" + objCount.listCustomer[i].fullname + "</td>" +
          "<td>" + objCount.listCustomer[i].phone + "</td>" +
          "<td> $" + objCount.listCustomer[i].total + "</td>" +
          "</tr > "
        );
      }

      //fill data to Table Food
      var percentFood = 0;
      var top4=0;
      for (var j = 0; j < objCount.listCustomer.length; j++) {
        percentFood += objCount.listFoodBooking[j].qty
      }

      for (var k = 0; k < 4; k++) {
        document.getElementById("FoodPercent").insertAdjacentHTML("beforeend",
          "<div class='progress-wrapper'><p>"+objCount.listFoodBooking[k].name+"<span class='float-right'>"+Math. round((objCount.listFoodBooking[k].qty / percentFood) * 100) +"%</span></p><div class='progress'><div class='bg-success' style='width:"+Math. round((objCount.listFoodBooking[k].qty / percentFood) * 100) +"%'></div></div></div>"
        )
        top4 += Math. round((objCount.listFoodBooking[k].qty / percentFood) * 100);
      }

      document.getElementById("FoodPercent").insertAdjacentHTML("beforeend",
          "<div class='progress-wrapper'><p>"+"Other"+"<span class='float-right'>"+ (100-top4) +"%</span></p><div class='progress'><div class='bg-danger' style='width:"+ (100-top4) +"%'></div></div></div>"
        )


        //fill data to Table Service
      var percentService = 0;
      var top4Service=0;
      for (var l = 0; l < objCount.listCustomer.length; l++) {
        percentService += objCount.listServiceBooking[l].qty
      }

      for (var m = 0; m < 4; m++) {
        document.getElementById("ServicePercent").insertAdjacentHTML("beforeend",
          "<div class='progress-wrapper'><p>"+objCount.listServiceBooking[m].name+"<span class='float-right'>"+Math. round((objCount.listServiceBooking[m].qty / percentService) * 100) +"%</span></p><div class='progress'><div class='bg-primary' style='width:"+Math. round((objCount.listServiceBooking[m].qty / percentService) * 100) +"%'></div></div></div>"
        )
        top4Service += Math. round((objCount.listServiceBooking[m].qty / percentService) * 100);
      }

      document.getElementById("ServicePercent").insertAdjacentHTML("beforeend",
          "<div class='progress-wrapper'><p>"+"Other"+"<span class='float-right'>"+ (100-top4Service) +"%</span></p><div class='progress'><div class='bg-danger' style='width:"+ (100-top4Service) +"%'></div></div></div>"
        )
    })
    .catch(function (error) {
      console.log(error);
    });
}

function randomBg() {
  const arr = ["bg-success","bg-primary","bg-warning","bg-danger"];

  const random =Math.floor(Math.random() * arr.length);
  return arr[random]
}
