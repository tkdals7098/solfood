<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="../../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="../../../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../../../resources/bootstrap/js/bootstrap.min.js"></script>
	<%--a 스타일 --%>
	<style type="text/css">
		@import url('https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap');
		@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
 		a { text-decoration: none; font-family: 'Noto Sans KR', sans-serif;}
 		a:link { color: black; text-decoration: none !important; font-family: 'Noto Sans KR', sans-serif !important;}
 		a:active { color: black !important; text-decoration: none !important; font-family: 'Noto Sans KR', sans-serif !important;}
		a:visited { color: black !important; text-decoration: none !important; font-family: 'Noto Sans KR', sans-serif !important;}
 		a:hover { color: black !important; text-decoration: none !important; font-family: 'Noto Sans KR', sans-serif !important;}
	</style>
    <style>
    	@import url('https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap');
    	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
      body {
        font-weight: bold;
        font-family: 'Noto Sans KR', sans-serif !important;
      }
      input{
      	font-family: 'Noto Sans KR', sans-serif !important;
      }
      .jbTitle {
        text-align: center;
      }
      .jbMenu {
        background-color: #ffe3d6;
        width: 100%;
        z-index: 10;
        font-size: 18px;
      }
      .jbContent {
        
      }
      .jbFixed {
        position: fixed;
       	top: 0px;
      }
      #topMenu {
      	display: inline-block;
      	width: 100px;
      	height: 40px;
      	text-align: center;
      	line-height: 48px;
      	font-family: 'Noto Sans KR', sans-serif !important;
      	color: #6e6e6e !important;
      }
      #topCate {
      	display: inline-block;
      	width: 100px;
      	height: 40px;
      	text-align: center;
      	line-height: 48px;
      	font-family: 'Noto Sans KR', sans-serif !important;
      	color: #6e6e6e !important;
      }
      
      
    #topMenu::after {
    width: 67%;
    height: 0;
    background: #fff;
    content: '';
    position: absolute;
    top: 75%;
    left: 0;
    opacity: 0;
    transition: all 0.3s ease-out;
    margin: auto;
  }
  #topMenu:hover::after {
    opacity: 1;
    top: 100%;
    height: 4px;
  }
      
      #topSearch {
      	border-radius: 5px;
      }
	     
      li.dropdown {
      	list-style: none;
      }
      
      ul.dropdown-menu {
      	margin-top: 10px;
      	border-radius: none;
      }
      .dropdown-submenu{
      	position:relative;
      }
	  
	  a.dropdown-toggle:hover {
	  	background-color: #FAE0D4;
	  }
	  #topCate:hover>#middleCate{
	  	display: block;
	  }
	  .dropdown-submenu>.dropdown-menu{
	  	top:0;
	  	left:100%;
	  	margin-top: -4px;
	  	margin-left: 0px;
	  	}
	  
	  .dropdown-submenu:hover>.dropdown-menu{
	  	display:block;
	  	}

	  .dropdown-submenu>a:after{
	  	display:block;
	  	content:" ";
	  	}

	  .dropdown-submenu:hover>a:after{
	  	border-left-color:#FAE0D4;
	  	}

	  .dropdown-submenu.pull-left{
	  	float:none;
	  	}
	  	
	  .dropdown-submenu.pull-left>.dropdown-menu{
	  	left:-100%;
	  	margin-left:10px;
	  	}
	  	
.d3 {
  margin-top: 5px;
  background: #fff;
  width: 230px;
  border-radius: 5px;
 }
.d3 form {
  background: #fff;
  border-radius: 5px;
}
.d3 input, .d3 button {
  border: none;
  outline: none;
  background: transparent;
  
}
.d3 input {
  width: 100%;
  height: 40px;
  padding-left: 15px;
  border-radius: 5px;
  font-size: 10px !important;
}
.d3 button {
  height: 38px;
  width: 35px;
  position: absolute;
  top: 8px;
  right: -50px !important;
  padding: 0;
  cursor: pointer;
}
.d3 button:before {

}
    </style>
    <script>
      $( document ).ready( function() {
        var jbOffset = $( '.jbMenu' ).offset();
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > jbOffset.top ) {
            $( '.jbMenu' ).addClass( 'jbFixed' );
          }
          else {
            $( '.jbMenu' ).removeClass( 'jbFixed' );
          }
        });
      });

    </script>
  </head>
  <body>
    <div class="jbTitle">
  
    </div>
    
    <div class="jbMenu">
    <div class="container">
    <div class="row">
    <div class="col-xs-2">
     <nav>
   <div>
      <ul>
         <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="topCate"><img src="../resources/image/list_grey.png" width="20px;" height="auto">&nbsp;&nbsp;카테고리</a>
            <ul class="dropdown-menu" id="middleCate">
               <li class="dropdown-submenu">
                  <a href="${path}/product/products1.do?product_category1=채소·과일"><strong>채소·과일</strong></a>
                  <ul class="dropdown-menu">
                     <li><a href="${path}/product/products2.do?product_category2=국산과일">국산 과일</a></li>
                     <li><a href="${path}/product/products2.do?product_category2=수입과일">수입 과일</a></li>
                     <li><a href="${path}/product/products2.do?product_category2=기본채소">기본 채소</a></li>
                     <li><a href="${path}/product/products2.do?product_category2=쌈·간편채소">쌈·간편채소</a></li>
                     <li><a href="${path}/product/products2.do?product_category2=콩나물·버섯류">콩나물·버섯류</a></li>
                     <li><a href="${path}/product/products2.do?product_category2=양파·마늘·생강·파">양파·마늘·생강·파</a></li>
                  </ul>
               </li>
               <li class="dropdown-submenu">
                  <a href="${path}/product/products1.do?product_category1=국·반찬·요리"><strong>국·반찬·요리</strong></a>
                  <ul class="dropdown-menu">
                     <li><a href="${path}/product/products2.do?product_category2=국·탕·찌개">국·탕·찌개</a></li>
                     <li><a href="${path}/product/products2.do?product_category2=밑반찬">밑반찬</a></li>
                     <li><a href="${path}/product/products2.do?product_category2=김치·장아찌·젓갈">김치·장아찌·젓갈</a></li>
                     <li><a href="${path}/product/products2.do?product_category2=두부·어묵">두부·어묵</a></li>
                     <li><a href="${path}/product/products2.do?product_category2=메인요리">메인요리</a></li>
                  </ul>
               </li>
               <li class="dropdown-submenu">
                  <a href="${path}/product/products1.do?product_category1=면·양념·오일"><strong>면·양념·오일</strong></a>
                  <ul class="dropdown-menu">
                     <li><a href="${path}/product/products2.do?product_category2=파스타·면류">파스타·면류</a></li>
                     <li><a href="${path}/product/products2.do?product_category2=밀가루·가루·믹스">밀가루·가루·믹스</a></li>
                     <li><a href="${path}/product/products2.do?product_category2=향신료·소스·드레싱">향신료·소스·드레싱</a></li>
                     <li><a href="${path}/product/products2.do?product_category2=양념·액젓·장류">양념·액젓·장류</a></li>
                     <li><a href="${path}/product/products2.do?product_category2=소금·설탕·식초">소금·설탕·식초</a></li>
                  </ul>
               </li>
               <li class="dropdown-submenu">
                  <a href="${path}/product/products1.do?product_category1=정육·계란"><strong>정육·계란</strong></a>
                  <ul class="dropdown-menu">
                     <li><a href="${path}/product/products2.do?product_category2=소고기">소고기</a></li>
                     <li><a href="${path}/product/products2.do?product_category2=돼지고기">돼지고기</a></li>
                     <li><a href="${path}/product/products2.do?product_category2=양고기">양고기</a></li>
                     <li><a href="${path}/product/products2.do?product_category2=닭·오리고기">닭·오리고기</a></li>
                     <li><a href="${path}/product/products2.do?product_category2=계란·돈까스">계란·돈까스</a></li>
                  </ul>
               </li>
               <li class="dropdown-submenu">
                  <a href="${path}/product/products1.do?product_category1=수산·해산"><strong>수산·해산</strong></a>
                  <ul class="dropdown-menu">
                     <li><a href="${path}/product/products2.do?product_category2=생선류">생선류</a></li>
                     <li><a href="${path}/product/products2.do?product_category2=오징어·낙지·문어">오징어·낙지·문어</a></li>
                     <li><a href="${path}/product/products2.do?product_category2=해산물·조개류">해산물·조개류</a></li>
                     <li><a href="${path}/product/products2.do?product_category2=김·미역">김·미역</a></li>
                     <li><a href="${path}/product/products2.do?product_category2=건어물·다시팩">건어물·다시팩</a></li>
                  </ul>
               </li>
               <li class="dropdown-submenu">
                  <a href="${path}/product/products1.do?product_category1=샐러드·간편식"><strong>샐러드·간편식</strong></a>
                  <ul class="dropdown-menu">
                     <li><a href="${path}/product/products2.do?product_category2=샐러드·도시락">샐러드·도시락</a></li>
                     <li><a href="${path}/product/products2.do?product_category2=간편식·냉동식품">간편식·냉동식품</a></li>
                     <li><a href="${path}/product/products2.do?product_category2=죽·수프">죽·수프</a></li>
                     <li><a href="${path}/product/products2.do?product_category2=선식·시리얼·그래놀라">선식·시리얼·그래놀라</a></li>
                  </ul>
               </li>
               <li class="dropdown-submenu">
                  <a href="${path}/product/products1.do?product_category1=음료·우유·간식"><strong>음료·우유·간식</strong></a>
                  <ul class="dropdown-menu">
                     <li><a href="${path}/product/products2.do?product_category2=생수·음료·주스">생수·음료·주스</a></li>
                     <li><a href="${path}/product/products2.do?product_category2=커피·차">커피·차</a></li>
                     <li><a href="${path}/product/products2.do?product_category2=우유·두유">우유·두유</a></li>
                     <li><a href="${path}/product/products2.do?product_category2=초콜릿·젤리·캔디">초콜릿·젤리·캔디</a></li>
                  </ul>
               </li>
               <li class="dropdown-submenu">
                  <a href="${path}/product/products1.do?product_category1=베이커리·델리"><strong>베이커리·델리</strong></a>
                  <ul class="dropdown-menu">
                     <li><a href="${path}/product/products2.do?product_category2=식빵·빵류">식빵·빵류</a></li>
                     <li><a href="${path}/product/products2.do?product_category2=잼·버터·스프레드">잼·버터·스프레드</a></li>
                     <li><a href="${path}/product/products2.do?product_category2=케이크·파이·디저트">케이크·파이·디저트</a></li>
                     <li><a href="${path}/product/products2.do?product_category2=올리브·피클·델리">올리브·피클·델리</a></li>
                  </ul>
               </li>
            </ul>
         </li>
      </ul>
   </div>
</nav>

  </div>
  <div class="col-xs-2">
  <a href="${path}/intro.do" id="topMenu">회 사 소 개</a>
  </div>
  <div class="col-xs-2">
  <a href="${path}/product/eventMain.do" id="topMenu">이 벤 트</a>
  </div>
  <div class="col-xs-2">
  <a href="${path}/board/listPage" id="topMenu">게 시 판</a>
  </div>
  <div class="col-xs-2">
  <a href="${path}/recipeList.do" id="topMenu">레 시 피</a>
  </div>
  <div class="col-xs-2">
<div class="d3">

<form method="post" action="${path}/product/productSearch.do"><%-- method="post" action="${path}/product/productSearch?" --%>
  <input type="text" placeholder="검색어 입력" name='keyword_p' id="keywordInput_p"	style="font-size: 15px !important;"/>
  <button type="submit" id='searchBtn_p'><strong><span class="glyphicon glyphicon-search"></span></strong></button>
</form>

</div>
</div>
</div>
</div>
    <div class="jbContent">
	</div>
</div>
</html>