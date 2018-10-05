<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<style type="text/css">

#contents {
	max-width: 780px;
	margin: 0 auto;
	text-align: center;
	padding-bottom: 50px;
}

.ad {
	text-align: center;
	border: 1px dotted #ccc;
	max-width: 780px;
	margin: 0 auto 6rem;
}

a.btn {
	background: #59b1eb;
	color: #fff;
	border: none;
	position: relative;
	height: 60px;
	font-size: 108%;
	padding: .6em 1em;
	transition: 800ms ease all;
	outline: none;
}

a.btn:before, a.btn::after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #131414;
	transition: 400ms ease all;
}
a.btn::after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}
a.btn:hover:before, a.btn:hover::after {
	width: 100%;
	transition: 800ms ease all;
}


.js-load {
	display: none;
}
.js-load.active {
	display: block;
}
.is_comp.js-load:after {
	display: none;
}
.btn-wrap, .lists, .main {
	display: block;
}
.main {
	max-width: 640px;
	margin: 0 auto;
}
.lists {
 	margin-bottom: 4rem;
}
.lists__item {
	padding: 20px;
/* 	background: #EEE; */
}
.lists__item:nth-child(2n) {
/* 	background: #59b1eb; */
/* 	color: #fff; */
}
.btn-wrap {
	text-align: center;
}
.button {
	display: inline-block;
	width: 200px;
	height: 54px;
	text-align: center;
	text-decoration: none;
	line-height: 54px;
	outline: none;
	position: relative;
	z-index: 2;
/* 	background-color: #333;
	border: 2px solid #333; */
/* 	color: #fff; */
	line-height: 50px;
	margin-bottom: 4rem;
}
.button:hover {
	background-color: #fff;
	border-color: #131414;
	color: #131414;
}
.button::before,
.button::after {
	position: absolute;
	z-index: -1;
	display: block;
	content: '';top: 0;
	width: 50%;
	height: 100%;
	background-color: #333;
}
.button,
.button::before,
.button::after {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all .3s;
	transition: all .3s;
}

.button::before {
	right: 0;
}
.button::after {
	left: 0;
}
.button:hover::before,
.button:hover::after {
	width: 0;
	background-color: #131414;
}

</style>
<script type="text/javascript" src="https://nanati.me/common/js/jquery-1.11.2.min.js"></script>

<script type="text/javascript">
$(window).on('load', function () {
	load('#js-load', '5');
	$("#js-btn-wrap .button").on("click", function () {
		load('#js-load', '5', '#js-btn-wrap');
	})
});

function load(id, cnt, btn) {
	var girls_list = id + " .js-load:not(.active)";
	var girls_length = $(girls_list).length;
	var girls_total_cnt;
	if (cnt < girls_length) {
		girls_total_cnt = cnt;
	} else {
		girls_total_cnt = girls_length;
		$('.button').hide()
	}
	$(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
}
</script>

</html>