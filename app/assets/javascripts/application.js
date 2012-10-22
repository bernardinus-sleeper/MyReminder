// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery-tablesorter/jquery.metadata
//= require jquery-tablesorter/jquery.tablesorter
//= require jquery-tablesorter/addons/jquery.tablesorter.pager
//= require gmaps4rails/gmaps4rails.base.js.coffee
//= require gmaps4rails/gmaps4rails.googlemaps.js.coffee
//= require jquery-ui-timepicker-addon


$(function() {
  $('#reminder_start').change(function() {
    $(this).parent().attr('action', '/area/' + $(this).val());
  });
});
