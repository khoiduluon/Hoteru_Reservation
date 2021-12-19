const primaryColor = '#4834d4'
const warningColor = '#f0932b'
const successColor = '#6ab04c'
const dangerColor = '#eb4d4b'

const themeCookieName = 'theme'
const themeDark = 'dark'
const themeLight = 'light'

const body = document.getElementsByTagName('body')[0]

function setCookie(cname, cvalue, exdays) {
	var d = new Date()
	d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000))
	var expires = "expires=" + d.toUTCString()
	document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/"
}

function getCookie(cname) {
	var name = cname + "="
	var ca = document.cookie.split(';')
	for (var i = 0; i < ca.length; i++) {
		var c = ca[i];
		while (c.charAt(0) == ' ') {
			c = c.substring(1)
		}
		if (c.indexOf(name) == 0) {
			return c.substring(name.length, c.length)
		}
	}
	return ""
}

loadTheme()

function loadTheme() {
	var theme = getCookie(themeCookieName)
	body.classList.add(theme === "" ? themeLight : theme)
}

function switchTheme() {
	if (body.classList.contains(themeLight)) {
		body.classList.remove(themeLight)
		body.classList.add(themeDark)
		setCookie(themeCookieName, themeDark)
	} else {
		body.classList.remove(themeDark)
		body.classList.add(themeLight)
		setCookie(themeCookieName, themeLight)
	}
}

function collapseSidebar() {
	body.classList.toggle('sidebar-expand')
}

window.onclick = function (event) {
	openCloseDropdown(event)
}

function closeAllDropdown() {
	var dropdowns = document.getElementsByClassName('dropdown-expand')
	for (var i = 0; i < dropdowns.length; i++) {
		dropdowns[i].classList.remove('dropdown-expand')
	}
}

function openCloseDropdown(event) {
	if (!event.target.matches('.dropdown-toggle')) {
		// 
		// Close dropdown when click out of dropdown menu
		// 
		closeAllDropdown()
	} else {
		var toggle = event.target.dataset.toggle
		var content = document.getElementById(toggle)
		if (content.classList.contains('dropdown-expand')) {
			closeAllDropdown()
		} else {
			closeAllDropdown()
			content.classList.add('dropdown-expand')
		}
	}
}

//chart 
let label12Months = [];
let label6Months = [];
let data12Months = [];
let data6Months = [];
let label6MonthLast = [];
let data6MonthsLast = [];


function SearchIncomeDefaults() {
	label12Months = [];
	label6Months = [];
	data12Months = [];
	data6Months = [];
	label6MonthLast = [];
	data6MonthsLast = [];
	let yearselect = document.getElementById('yearcbo').value;
	// console.log(yearselect);
	axios.get('/report/revenue?year=' + 2021)
		.then(function (response) {
			let DefaultData = response.data;
			//	console.log(DefaultData);
			for (var i = 0; i < DefaultData.length; i++) {
				label12Months.push(DefaultData[i].month);
				data12Months.push(DefaultData[i].total);
			}
			//console.log(label12Months);
			//console.log(data12Months);

			for (var i = 0; i < 6; i++) {
				label6Months.push(DefaultData[i].month);
				data6Months.push(DefaultData[i].total);
			}

			for (var i = 6; i < DefaultData.length; i++) {
				label6MonthLast.push(DefaultData[i].month);
				data6MonthsLast.push(DefaultData[i].total);
			}
			myFunction();
		})
		.catch(function (error) {
			console.log(error);
		});
}

function SearchIncomeByYear() {
	label12Months = [];
	label6Months = [];
	data12Months = [];
	data6Months = [];
	label6MonthLast = [];
	data6MonthsLast = [];
	let yearselect = document.getElementById('yearcbo').value;
//console.log(yearselect);
	axios.get('/report/revenue?year=' + yearselect)
		.then(function (response) {
			let DefaultData = response.data;
			//	console.log(DefaultData);
			for (var i = 0; i < DefaultData.length; i++) {
				label12Months.push(DefaultData[i].month);
				data12Months.push(DefaultData[i].total);
			}
			//console.log(label12Months);
			//console.log(data12Months);

			for (var i = 0; i < 6; i++) {
				label6Months.push(DefaultData[i].month);
				data6Months.push(DefaultData[i].total);
			}

			for (var i = 6; i < DefaultData.length; i++) {
				label6MonthLast.push(DefaultData[i].month);
				data6MonthsLast.push(DefaultData[i].total);
			}
			myFunction();
		})
		.catch(function (error) {
			console.log(error);
		});
}




var ctx = document.getElementById('myChart')
ctx.height = 450
ctx.width = 450
var data = {
	labels: label12Months,
	datasets: [{
		fill: true,
		label: 'Total Revenue',
		borderColor: successColor,
		data: data12Months,
		borderWidth: 2,

	}]
}
var lineChart = new Chart(ctx, {
	type: 'line',
	data: data,
	options: {
		maintainAspectRatio: false,
		bezierCurve: false,
		responsive: true,
		legend: false,
		scales: {
			y: {
				beginAtZero: true
			}
		}
	}
})

function Change6Month(lineChart) {
	lineChart.data.datasets[0].data = data6Months;
	lineChart.data.labels = label6Months;

	lineChart.update();
}

function Change6MonthLast(lineChart) {
	lineChart.data.datasets[0].data = data6MonthsLast;
	lineChart.data.labels = label6MonthLast;

	lineChart.update();
}

function Change12Month(lineChart) {
	lineChart.data.datasets[0].data = data12Months;
	lineChart.data.labels = label12Months;

	lineChart.update();
}

function myFunction() {
	var x = document.getElementById("mySelect").value;
	//console.log(x)
	if (x === "year") {
		Change12Month(lineChart);
	}
	else if (x === "first") {
		Change6Month(lineChart);
	} else if (x === "last") {
		Change6MonthLast(lineChart);
	}
}



