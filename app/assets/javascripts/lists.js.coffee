# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
	$('#reset_time_select2').select2({tags:["0900","1000","1100","1200","1300","1400","1500","1600","1700","1800","1900","2000"],maximumInputLength: 4,separator: "-"});

$(document).ready(ready)
$(document).on('page:load', ready)
	
