// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require('@rails/ujs').start();
require('turbolinks').start();
require('@rails/activestorage').start();
require('channels');
require('select2');
global.toastr = require("toastr");

import $ from 'jquery';
global.$ = jQuery;
import 'jquery'
import 'popper.js'
import  'bootstrap';
import  'select2';
import  'lightbox2';
import './plugins/animsition'
import './plugins/slick.js'
import './plugins/slick-custom.js'
import './plugins/main.js'
import './plugins/nouislider.min.js'
import './custom'

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


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