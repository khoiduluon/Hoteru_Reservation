function getIndex(){
    axios.get('/report/count-all')
      .then(function (response) {
        let objCount = response.data;
        document.getElementById("user").innerHTML= objCount.user;
        document.getElementById("food").innerHTML= objCount.food;
        document.getElementById("service").innerHTML= objCount.service;
        document.getElementById("room").innerHTML= objCount.room;
      })
      .catch(function (error) {
        console.log(error);
      });
}
