$(document).ready(function() {
    $('.selectYear').yearselect({
        start: new Date().getFullYear() - 10,
        end: new Date().getFullYear(),
        selected: new Date().getFullYear()
    });
});