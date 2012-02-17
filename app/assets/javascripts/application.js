// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery.placeholder
//= require bootstrap
//= require_tree .


//Fix so that the placeholder text works for IE9 and other older browsers. The fix is actually
//vendor/assets/javascripts/jquery.placeholder.js

$(document).ready(function() {
  $('input[placeholder], textarea[placeholder]').placeholder();
})
