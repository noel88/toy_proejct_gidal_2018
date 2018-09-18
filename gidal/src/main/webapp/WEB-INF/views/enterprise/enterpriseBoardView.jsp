<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import= "org.gidal.enterprise.domain.EnterpriseVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기달</title>

<%@ include file="/WEB-INF/views/include/head.jsp"%>

<style>
@import url("http://fonts.googleapis.com/css?family=Lato");
body {
  font-family: Lato, Arial;
/*   color: #fff; */
  padding: 20px;

}

h1 {
  font-weight: normal;
  font-size: 40px;
  font-weight: normal;
  text-transform: uppercase;
}
h1 span {
  font-size: 13px;
  display: block;
  padding-left: 4px;
}

p {
  margin-top: 200px;
}
p a {
  text-transform: uppercase;
  text-decoration: none;
  display: inline-block;
  color: #fff;
  padding: 5px 10px;
  margin: 0 5px;
  background-color: #b83729;
  -moz-transition: all 0.2s ease-in;
  -o-transition: all 0.2s ease-in;
  -webkit-transition: all 0.2s ease-in;
  transition: all 0.2s ease-in;
}
p a:hover {
  background-color: #ab3326;
}

.select-hidden {
  display: none;
  visibility: hidden;
  padding-right: 10px;
}

.select {
  cursor: pointer;
  display: inline-block;
  position: relative;
  font-size: 16px;
  color: #fff;
  width: 220px;
  height: 40px;
}

.select-styled {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  background-color: #c0392b;
  padding: 8px 15px;
  -moz-transition: all 0.2s ease-in;
  -o-transition: all 0.2s ease-in;
  -webkit-transition: all 0.2s ease-in;
  transition: all 0.2s ease-in;
}
.select-styled:after {
  content: "";
  width: 0;
  height: 0;
  border: 7px solid transparent;
  border-color: #fff transparent transparent transparent;
  position: absolute;
  top: 16px;
  right: 10px;
}
.select-styled:hover {
  background-color: #b83729;
}
.select-styled:active, .select-styled.active {
  background-color: #ab3326;
}
.select-styled:active:after, .select-styled.active:after {
  top: 9px;
  border-color: transparent transparent #fff transparent;
}

.select-options {
  display: none;
  position: absolute;
  top: 100%;
  right: 0;
  left: 0;
  z-index: 999;
  margin: 0;
  padding: 0;
  list-style: none;
  background-color: #ab3326;
}
.select-options li {
  margin: 0;
  padding: 12px 0;
  text-indent: 15px;
  border-top: 1px solid #962d22;
  -moz-transition: all 0.15s ease-in;
  -o-transition: all 0.15s ease-in;
  -webkit-transition: all 0.15s ease-in;
  transition: all 0.15s ease-in;
}
.select-options li:hover {
  color: #c0392b;
  background: #fff;
}
.select-options li[rel="hide"] {
  display: none;
}

</style>

</head>
<body>

	<%@ include file="/WEB-INF/views/include/nav.jsp"%>






	<form action = "">

	<select id="gun">
	    <option value="hide">-- 구 선택 --</option>
	    <option value="강남구" rel="icon-temperature">강남구</option>
	    <option value="강동구">강동구</option>
	    <option value="강북구">강북구</option>
	    <option value="강서구">강서구</option>
	    <option value="관악구">관악구</option>
	    <option value="광진구">광진구</option>
	    <option value="구로구">구로구</option>
	    <option value="노원구">노원구</option>
	    <option value="동대문구">동대문구</option>
	    <option value="동작구">동작구</option>
	    <option value="마포구">마포구</option>
	    <option value="서대문구">서대문구</option>
	    <option value="서초구">서초구</option>
	    <option value="성동구">성동구</option>
	    <option value="성북구">성북구</option>
	    <option value="송파구">송파구</option>
	    <option value="양천구">양천구</option>
	    <option value="영등포구">영등포구</option>
	    <option value="용산구">용산구</option>
	    <option value="은평구">은평구</option>
	    <option value="종로구">종로구</option>
	    <option value="중구">중구</option>

	</select>

	<select id="food">
	    <option value="hide">-- 음식선택 --</option>
	    <option value="default">음식전체</option>
	    <option value="양식">양식</option>
	    <option value="한식">한식</option>
	    <option value="중식">중식</option>
	    <option value="일식">일식</option>
	    <option value="아시아식">아시아식</option>
	    <option value="컨템퍼러리">컨템퍼러리</option>
	    <option value="뷔페">뷔페</option>
	    <option value="구이">구이</option>
	    <option value="술집">술집</option>
	    <option value="카페/베이커리">카페/베이커리</option>

	</select>

	<input type = "submit" value = "검색">

	</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
$('select').each(function(){
    var $this = $(this), numberOfOptions = $(this).children('option').length;

    $this.addClass('select-hidden');
    $this.wrap('<div class="select"></div>');
    $this.after('<div class="select-styled"></div>');

    var $styledSelect = $this.next('div.select-styled');
    $styledSelect.text($this.children('option').eq(0).text());

    var $list = $('<ul ></ul>', {
        'class': 'select-options'
    }).insertAfter($styledSelect);

    for (var i = 0; i < numberOfOptions; i++) {
        $('<li ></li>', {
            text: $this.children('option').eq(i).text(),
            rel: $this.children('option').eq(i).val()
        }).appendTo($list);
    }

    var $listItems = $list.children('li');

    $styledSelect.click(function(e) {
        e.stopPropagation();
        $('div.select-styled.active').each(function(){
            $(this).removeClass('active').next('ul.select-options').hide();
        });
        $(this).toggleClass('active').next('ul.select-options').toggle();
    });

    $listItems.click(function(e) {
        e.stopPropagation();
        $styledSelect.text($(this).text()).removeClass('active');
        $this.val($(this).attr('rel'));
        $list.hide();
        //console.log($this.val());
    });

    $(document).click(function() {
        $styledSelect.removeClass('active');
        $list.hide();
    });

});
</script>


<table border="2">

<c:forEach items = "${list}" var = "EnterpriseVO">
  			<tr>
		       <td rowspan="4">${EnterpriseVO.enterprise_code}</td><!-- 기업코드  -->
		     <td rowspan="4">${enterpriseVO.enterprise_mainImg }</td><!-- 메인이미지  -->
		      <td>${EnterpriseVO.enterprise_businessName }</td> <!--  식당명 -->
		    </tr>
  			<tr>
		      <td>${EnterpriseVO.enterprise_add2}</td> <!-- 도로명주소  -->
		    </tr>
  			<tr>
		      <td>${EnterpriseVO.enterprise_sectors}</td> <!-- 업종  -->
		    </tr>
  			<tr>
		      <td>예약하기, 웨이팅하기 버튼</td> <!-- 버튼넣기  -->
		    </tr>
</c:forEach>


</table>

</body>
</html>

