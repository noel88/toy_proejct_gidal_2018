<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기달</title>

<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>

	<%@ include file="/WEB-INF/views/include/nav.jsp"%>


<script type="text/javascript">

function setCategory2(){
	form = document.search;

	// 아파트
		if(document.search.type.value == 1){
			form.category2.length = 1;
			form.category2.options[1] = new Option("아파트");
			form.category2.options[1].value = "아파트";
			form.category2.options[2] = new Option("공동주택");
			form.category2.options[2].value = "공동주택";
			form.category2.options[3] = new Option("카사 파티쿨라르");
			form.category2.options[3].value = "카사 파티쿨라르";
			form.category2.options[4] = new Option("로프트");
			form.category2.options[4].value = "로프트";
			form.category2.options[5] = new Option("레지던스");
			form.category2.options[5].value = "레지던스";

		}
	//주택

		if(document.search.roomsType2.value == 2){
			form.category2.length = 1;
			form.category2.options[1] = new Option("주택");
			form.category2.options[1].value = "주택";
			form.category2.options[2] = new Option("방갈로");
			form.category2.options[2].value = "방갈로";
			form.category2.options[3] = new Option("통나무집");
			form.category2.options[3].value = "통나무집";
			form.category2.options[4] = new Option("카사 파티쿨라르");
			form.category2.options[4].value = "카사 파티쿨라르";
			form.category2.options[5] = new Option("살레");
			form.category2.options[5].value = "살레";
			form.category2.options[6] = new Option("전원주택");
			form.category2.options[6].value = "전원주택";
			form.category2.options[7] = new Option("키클라데스 주택");
			form.category2.options[7].value = "키클라데스 주택";
			form.category2.options[8] = new Option("담무소");
			form.category2.options[8].value = "담무소";
			form.category2.options[9] = new Option("돔하우스");
			form.category2.options[9].value = "돔하우스";
			form.category2.options[10] = new Option("땅속의 집");
			form.category2.options[10].value = "땅속의 집";
			form.category2.options[11] = new Option("농장 체험 숙박");
			form.category2.options[11].value = "농장 체험 숙박";
			form.category2.options[12] = new Option("하우스보트");
			form.category2.options[12].value = "하우스보트";
			form.category2.options[13] = new Option("오두막");
			form.category2.options[13].value = "오두막";
			form.category2.options[14] = new Option("등대");
			form.category2.options[14].value = "등대";
			form.category2.options[15] = new Option("팬션(한국)");
			form.category2.options[15].value = "팬션(한국)";
			form.category2.options[16] = new Option("마차(영국,프랑스)");
			form.category2.options[16].value = "마차(영국,프랑스)";
			form.category2.options[17] = new Option("초소형주택");
			form.category2.options[17].value = "초소형주택";
			form.category2.options[18] = new Option("타운하우스");
			form.category2.options[18].value = "타운하우스";
			form.category2.options[19] = new Option("트롤로(이탈리아)");
			form.category2.options[19].value = "트롤로(이탈리아)";
			form.category2.options[20] = new Option("저택");
			form.category2.options[20].value = "저택";


		}
	//별채

		if(document.search.roomsType2.value == 3){
			form.category2.length = 1;
			form.category2.options[1] = new Option("게스트용 별채");
			form.category2.options[1].value = "게스트용 별채";
			form.category2.options[2] = new Option("게스트 스위트");
			form.category2.options[2].value = "게스트 스위트";
			form.category2.options[3] = new Option("농장 체험 숙박");
			form.category2.options[3].value = "농장 체험 숙박";


		}

	//독특한 숙소



		if(document.search.roomsType2.value == 4){
			form.category2.options[1] = new Option("헛간");
			form.category2.options[1].value = "헛간";
			form.category2.options[2] = new Option("보트");
			form.category2.options[2].value = "보트";
			form.category2.options[3] = new Option("버스");
			form.category2.options[3].value = "버스";
			form.category2.options[4] = new Option("캠핑카");
			form.category2.options[4].value = "캠핑카";
			form.category2.options[5] = new Option("캠핑장");
			form.category2.options[5].value = "캠핑장";
			form.category2.options[6] = new Option("성");
			form.category2.options[6].value = "성";
			form.category2.options[7] = new Option("동굴");
			form.category2.options[7].value = "동굴";
			form.category2.options[8] = new Option("땅속의 집");
			form.category2.options[8].value = "땅속의 집";
			form.category2.options[9] = new Option("농장 체험 숙박");
			form.category2.options[9].value = "농장 체험 숙박";
			form.category2.options[10] = new Option("하우스보트");
			form.category2.options[10].value = "하우스보트";
			form.category2.options[11] = new Option("오두막");
			form.category2.options[11].value = "오두막";
			form.category2.options[12] = new Option("이글루");
			form.category2.options[12].value = "이글루";
			form.category2.options[13] = new Option("성");
			form.category2.options[13].value = "성";
			form.category2.options[14] = new Option("등대");
			form.category2.options[14].value = "등대";
			form.category2.options[15] = new Option("팬션(한국)");
			form.category2.options[15].value = "팬션(한국)";
			form.category2.options[16] = new Option("비행기");
			form.category2.options[16].value = "비행기";
			form.category2.options[17] = new Option("마차(영국,프랑스)");
			form.category2.options[17].value = "마차(영국,프랑스)";
			form.category2.options[18] = new Option("텐트");
			form.category2.options[18].value = "텐트";
			form.category2.options[19] = new Option("초소형 주택");
			form.category2.options[19].value = "초소형 주택";
			form.category2.options[20] = new Option("티피");
			form.category2.options[20].value = "티피";
			form.category2.options[21] = new Option("기차");
			form.category2.options[21].value = "기차";
			form.category2.options[22] = new Option("트리하우스");
			form.category2.options[22].value = "트리하우스";
			form.category2.options[23] = new Option("풍차");
			form.category2.options[23].value = "풍차";
			form.category2.options[24] = new Option("유르트");
			form.category2.options[24].value = "유르트";
		}
	//B&B

		if(document.search.roomsType2.value == 5){
			form.category2.length = 1;
			form.category2.options[1] = new Option("B&B");
			form.category2.options[1].value = "B&B";
			form.category2.options[2] = new Option("카사 파티쿨라르");
			form.category2.options[2].value = "카사 파티쿨라르";
			form.category2.options[3] = new Option("농장 체험 숙박");
			form.category2.options[3].value = "농장 체험 숙박";
			form.category2.options[4] = new Option("민수(타이완)");
			form.category2.options[4].value = "민수(타이완)";
			form.category2.options[5] = new Option("료칸");
			form.category2.options[6].value = "료칸";

		}


</script>


<style>
@import url("http://fonts.googleapis.com/css?family=Lato");
body {
  font-family: Lato, Arial;
  color: #fff;
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




<c:forEach items = "${list}" var = "EnterpriseVO">
  			<tr>
		      <td rowspan="4">${enterpriseVO.code}</td><!-- 기업코드  -->
		      <td rowspan="4">${enterpriseVo.mainImg }</td><!-- 메인이미지  -->
		      <td>${enterpriseVo.businessName }</td> <!--  식당명 -->
		    </tr>
  			<tr>
		      <td>${enterpriseVo.add2}</td> <!-- 도로명주소  -->
		    </tr>
  			<tr>
		      <td>${enterpriseVo.sectors}</td> <!-- 업종  -->
		    </tr>
  			<tr>
		      <td>예약하기, 웨이팅하기 버튼</td> <!-- 버튼넣기  -->
		    </tr>
</c:forEach>

		</tbody>
</table>
</body>
</html>


