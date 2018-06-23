// JavaScript Document

$('#hide').click(function() {
    $('#content').hide();
    $('#hide').hide();
    $('#show').show();
});

$('#show').click(function() {
    $('#show').hide();
    $('#content').slideDown(200);
    $('#hide').show();
});