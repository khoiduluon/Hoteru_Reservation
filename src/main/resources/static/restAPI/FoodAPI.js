
function getOne(id) {
  axios.get('/api/Food/' + id)
    .then(function (response) {
      let food = response.data;
      document.getElementById("IdFood").value = food.id;
      document.getElementById("NameFood").value = food.name;
      document.getElementById("PriceFood").value = food.price;
      document.getElementById("DescFood").value = food.description;
    })
    .catch(function (error) {
      showToastError();
    });
}

function save() {
  const obj = {
    id: document.getElementById("IdFood").value,
    name: document.getElementById("NameFood").value,
    price: document.getElementById("PriceFood").value,
    description: document.getElementById("DescFood").value
  }
  console.log(obj)
  axios.post('/api/insert', obj).then(function (response) {
    console.log(response);
    showToast()
    setTimeout(() => { location.reload() }, 2100);
  })
    .catch(function (error) {
      showToastError();
    });

}

function clearForm() {
  document.getElementById('IdFood').value = ''
  document.getElementById('NameFood').value = ''
  document.getElementById('PriceFood').value = ''
  document.getElementById('DescFood').value = ''
}

function deleteFood() {
  var id = document.getElementById('IdFood').value
  axios.get('/api/delete/' + id)
  .then(function (response) {
    if(response.data == true) {
      showToast()
      setTimeout(() => { location.reload() }, 2100);
    }    
  })
  .catch(function (error) {
    showToastError();
  });
}

function deleteFoodID(id) {
  axios.get('/api/delete/' + id)
    .then(function (response) {
      if(response.data == true) {
        showToast()
        setTimeout(() => { location.reload() }, 2100);
      }    
    })
    .catch(function (error) {
      showToastError();
    });

}