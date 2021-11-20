function getIndex(){
    axios.get('/report/index')
      .then(function (response) {
        let objCount = response.data;
        document.getElementById("user").innerHTML= objCount.countDto.user;
        document.getElementById("food").innerHTML= objCount.countDto.food;
        document.getElementById("service").innerHTML= objCount.countDto.service;
        document.getElementById("room").innerHTML= objCount.countDto.room;
        console.log(objCount);
      })
      .catch(function (error) {
        console.log(error);
      });
}
