$(document).ready(function () {
    //menú dropdown
    $(".ui.dropdown").dropdown();
    //acordeones
    $(".ui.accordion").accordion();
    // popups
    $(".ver.mas").popup();
    $(".ui.sticky").sticky({
        context: "#submenusticky",
        pushing: true,
    });
});
