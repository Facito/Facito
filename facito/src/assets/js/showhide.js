// JavaScript Document

var hide = document.getElementById('hide');
var show = document.getElementById('show');

var content = document.getElementById('content');

function show() {
    show.style.display = 'none';
    content.style.display = 'block';
    hide.style.display = 'block';
}

function hide() {
    content.style.display = 'none';
    hide.style.display = 'none';
    show.style.display = 'block';
}