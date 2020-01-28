import 'jquery'
import $ from 'jquery';

$(document).on('turbolinks:load', function() {
    $('#web-change-locale, #mobile-change-locale').change(function() {
        this.form.submit();
    });
});

$(document).on("turbolinks:click", function(){
    // show spinner on AJAX start
    $(".loader").show();
});

// hide spinner on AJAX stop
$(document).on("turbolinks:load", function(){
    $(".loader").hide();
});

$(document).on('ready page:load', function(event) {
    $(".loader").hide();
});

$(document).on("turbolinks:load", function(){
    $(".selection-1").select2({
        minimumResultsForSearch: 20
    });
});
$(document).on("turbolinks:load", function(){
    $(".selection-2").select2({
        minimumResultsForSearch: 20
    });
});

$(document).on("turbolinks:load", function(){
    $(".mobile-locale-select, .web-locale-select").select2({
        minimumResultsForSearch: 20
    });
});