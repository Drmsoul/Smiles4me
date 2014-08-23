# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script

$(function(){

$('#emailholder').data('holder',$('#emailholder').attr('placeholder'));

$('#emailholder').focusin(function(){
    $(this).attr('placeholder','');
});
$('#emailholder').focusout(function(){
    $(this).attr('placeholder',$(this).data('holder'));
});


})
