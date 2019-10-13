let setX = 0;
let setY = 0;

let winHeight = 0;
let winWidth = 0;

let setLoginX = 0;
let setLoginY = 0;
let setRegisterX = 0;
let setRegisterY = 0;

const modalBackDrop = $(".modal-backdrop");
const modalLoginFrom = $("#modal_login");
const modalLoginObject = $(".monkey-dialog-login");
const modalRegisterFrom = $("#modal_register");
const modalRegisterObject = $(".monkey-dialog-register");

modal_init();

function clickModalRegisterButton() {
	modalLoginFrom.removeClass("show");
	$(".modal-backdrop").remove("")
}

$(window).resize(function() {
	console.log("resize");
	modal_init();
})

function modal_init() {
	const modalSize = {
		login : {
			width : modalLoginObject.width(),
			height : modalLoginObject.height()
		},
		register : {
			width : modalRegisterObject.width(),
			height : modalRegisterObject.height()
		}
	}
	
	winHeight = window.innerHeight;
	winWidth = window.innerWidth;

	setLoginX = (winWidth - modalSize.login.width) / 2;
	setLoginY = (winHeight - modalSize.login.height) / 2;
	setRegisterX = (winWidth - modalSize.register.width) / 2;
	setRegisterY = (winHeight - modalSize.register.height) / 2;

	const setCssLoginObject = {
		"margin-top" : setLoginY,
		"margin-left" : setLoginX
	};

	const setCssRegisterObject = {
		"margin-top" : setRegisterY,
		"margin-left" : setRegisterX
	};

	modalLoginObject.css(setCssLoginObject);
	modalRegisterObject.css(setCssRegisterObject);
}