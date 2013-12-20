function hadj()
{
	var h = (parseInt(window.innerHeight)/2)-(login.offsetHeight/2);
	login.style.margin = h+"px auto";
}

function display(){
	$(document).ready(function(){
		$(window).load(function(){
			$("#login").fadeIn(500);
			$("#back").fadeIn(500);
			$("#navibar").fadeIn(500);
			setTimeout(hadj(),5);;
		});
	});
}

$('.carousel').carousel();