// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
function openPopup(link)
{
    link.hide();
    window.open(link.href,'exam_dialog', 'toolbar=no,location=no,menubar=no,scrollbars=yes, resizable=no');
    return false;
}

let greetings = [
		"hi", 
		"hello", 
		"howdy", 
		"hey", 
		"hiya", 
		"'ello", 
		"ahoy", 
		"'sup", 
		"yo", 
		"g'day", 
		"ciao", 
		"aloha", 
		"hola", 
		"bonjour", 
		"salud", 
		"hallo",
		String.fromCharCode(226) + "llo"
		];
		
let greeting = ()=> {
    let randGreeting = Math.floor(Math.random() * greetings.length);
    document.getElementById("greeting").innerHTML = `${greetings[randGreeting]}, `;
}

window.onload = greeting;