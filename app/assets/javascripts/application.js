// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery/
//= requiere jquery.sausage.js
//= requiere jquery.tokeninput
//= require bootstrap
//= require rails.validations
//= require_tree .

$(function () {
  $('#product_tag_list').tokenInput('/products/tags.json', { 
    crossDomain: false,
    prePopulate: $('#product_tag_list').data('pre'),
    theme: 'facebook',
  });
});

$(function(){
	$('#product_size_tokens').tokenInput('/sizes.json', {
    crossDomain: false,
    prePopulate: $('#product_size_tokens').data('load')
	});
 });





/*
 * jQuery Plugin: Tokenizing Autocomplete Text Entry
 * Version 1.6.0
 *
 * Copyright (c) 2009 James Smith (http://loopj.com)
 * Licensed jointly under the GPL and MIT licenses,
 * choose which one suits your project best!
 *
 */