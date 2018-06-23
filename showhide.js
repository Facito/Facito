// JavaScript Document

$('#hide').click(function()
{
    $('#content').hide();
    $('#hide').hide();
    $('#show').show();

});

$('#show').click(function()
{
    $('#content').show();
    $('#show').hide();
    $('#hide').show();
});