<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dao.MemberDAO" %>
<%@ page import="com.vo.MemberVO" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport"
      content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/sidebar.css" />
    <link type="text/css" rel="stylesheet" href="./plugin/fontawesome-free-6.0.0-web/css/all.min.css">
    <title>POST-GUARD | FAQ</title>
  </head>
  <style>
  
body {
    padding-top: 0px;
}

.faq-cat-content {
    margin-top: 50px;
    margin-bottom: 100px;
}

.faq-cat-tabs li a {
    margin-top: 30px;
    padding: 15px 10px 15px 10px;
    background-color: #ffffff;
    border: 1px solid #dddddd;
    color: #777777;
}

.nav-tabs>li {
    float: left;
    margin-bottom: 0px; !important
}

.nav-tabs li a:focus,
.panel-heading a:focus {
    outline: none;
}

.panel-heading a,
.panel-heading a:hover,
.panel-heading a:focus {
    text-decoration: none;
    color: #777777;
}

.faq-cat-content .panel-heading:hover {
    background-color: #efefef;
}

.active-faq {
    border-left: 5px solid #888888;
}

.panel-faq .panel-heading .panel-title span {
    font-size: 16px;
    font-weight: normal;
}
.mainlogo {
    padding-top: 20px;
    width: 150px;
    height: 150px;
    vertical-align: baseline; !important 
    
}

#faqtabunderbar {
border-bottom: none;
}

</style>


  
  <body>
<%
	MemberVO userInfo = (MemberVO)session.getAttribute("userInfo");
%>
	<section id="sidebar">
		<div class="inner">
			<nav>
				<ul>
					<li><a href="index.jsp">
					<img
							class="mainlogo" src="./images/logo.png" /></a></li>
					<div class="box_container">
						<div class="box1">
							<li><a href="product.jsp">상품 소개</a></li>
							<li><a href="service.jsp">서비스 신청</a></li>
							<li><a href="as.jsp">AS 신청</a></li>
							<li><a href="faq.jsp">FAQ</a></li>
						</div>
						<div class="box2">
						<%if(userInfo == null) {%>
							<li><a href="join.jsp">회원가입</a></li>
							<li><a href="login.jsp">로그인</a></li>
						<%} else { %>
							<li><a href="mypage.jsp"><%=userInfo.getMem_name() %></a></li>
							<li><a href="LogoutCon">로그아웃</a>
						<%} %>
						</div>
					</div>
					<!-- <li><a href="#">택배 예약</a></li>
		            <li><a href="#">고객 정보 수정</a></li>
		            <li><a href="#">고객 정보 수정</a></li>
		            <li><a href="#">운송장</a></li> -->
				</ul>
				
			</nav>
		</div>
	</section>
	
	<br><br>
	<section id ="faqbox">
	
	<div class="container">   
        <div class="row">
            <div class="col-md-12 col-md-offset-1"> 
                <!--카테고리 탭-->
              
                <ul class="nav nav-tabs faq-cat-tabs" id = "faqtabunderbar">
                    <li class="active"><a href="#faq-cat-1" data-toggle="tab">회원정보</a></li>
                    <li><a href="#faq-cat-2" data-toggle="tab">결제</a></li>
                    <li><a href="#faq-cat-3" data-toggle="tab">이용문의</a></li>
                    <li><a href="#faq-cat-4" data-toggle="tab">서비스</a></li>

                </ul>
            
                <!-- 첫번째 카테고리 -->
                <div class="tab-content faq-cat-content">
                    <div class="tab-pane active in fade" id="faq-cat-1">
                        <div class="panel-group" id="accordion-cat-1">
                            
                            <!-- 1-1 질문-->
                            <div class="panel panel-default panel-faq">
                                <div class="panel-heading">
                                    <a data-toggle="collapse" data-parent="#accordion-cat-1" href="#faq-cat-1-sub-1">
                                        <h4 class="panel-title">
                                            회원가입은 어떻게 하나요?
                                            <span class="pull-right"><i class="glyphicon glyphicon-plus"></i></span>
                                        </h4>
                                    </a>
                                </div>
                                <div id="faq-cat-1-sub-1" class="panel-collapse collapse">
                                    <div class="panel-body">
                                    <p>저희 상품 회원가입은 홈페이지를 통해서만 가능합니다.</p>
                                    
                                    <p>가입은 다음과 같은 절차로 진행됩니다.</p>
                                    <p>① 약관동의 </p>
									<p>② 가입정보입력 </p>
									<p>③ 이메일 인증 </p>
                                    </div>
                                </div>
                            </div>
                           
                           <!-- 1-2 질문-->
                            <div class="panel panel-default panel-faq">
                                <div class="panel-heading">
                                    <a data-toggle="collapse" data-parent="#accordion-cat-1" href="#faq-cat-1-sub-2">
                                        <h4 class="panel-title">
                                            인증메일을 받지 못하면 어떻게 하나요?
                                            <span class="pull-right"><i class="glyphicon glyphicon-plus"></i></span>
                                        </h4>
                                    </a>
                                </div>
                                <div id="faq-cat-1-sub-2" class="panel-collapse collapse">
                                    <div class="panel-body">
                                   <p> POGUARD 계정에서 보내드린 인증 메일이 메일 수신함에 없을 경우 인증 메일을 받으실 메일 주소를 정확하게 입력하셨는지 다시 한 번 확인해주시고 </p>
                                   <p> 스팸 메일함 또는 정크 메일함에 수신된 인증 메일이 없는지 확인해주시기 바랍니다. </p>
									
									<p>인증 메일을 찾으실 수 없는 경우, 가입하신 POGAURD계정과 비밀번호로 로그인 하시면 [인증 메일 재발송] 기능을 이용하여 인증 메일을 재전송 받으실 수 있습니다.</p>
                                    
                                    </div>
                                </div>
                            </div>

                            <!--1-3 질문-->
                            <div class="panel panel-default panel-faq">
                                <div class="panel-heading">
                                    <a data-toggle="collapse" data-parent="#accordion-cat-1" href="#faq-cat-1-sub-3">
                                        <h4 class="panel-title">
                                            비밀번호를 잊어버렸어요
                                            <span class="pull-right"><i class="glyphicon glyphicon-plus"></i></span>
                                        </h4>
                                    </a>
                                </div>
                                <div id="faq-cat-1-sub-3" class="panel-collapse collapse">
                                    <div class="panel-body">
                                    <p>POGAURD계정 회원가입 후 비밀번호를 분실하셨을 경우 ‘비밀번호 재설정’ 기능을 이용하여 새로운 비밀번호를 만들 수 있습니다.</p>
									<p>POGAURD 계정으로 가입하셨던 아이디를 입력하시면 비밀번호를 새로 만들 수 있는 (링크가 포함된) 메일이 발송됩니다.</p>
									<p>단, 페이스북/구글 계정으로 로그인한 고객님은 해당 사이트에서 확인하셔야 합니다.</p>
									<span> </span>
									<p>비밀번호 재설정 절차는 아래와 같습니다.</p>
									<p>① 메뉴 '비밀번호 재설정'으로 이동</p>
									<p>② '비밀번호 재설정' 에서 회원가입 시 등록했던 아이디 입력 후 확인 클릭</p>
									<p>③ 비밀번호 재설정 링크가 이메일로 발송</p>
									<p>④ 안내 메일에서 재설정 링크를 통해 새로운 비밀번호로 변경"</p>
                                    </div>
                                </div>
                            </div>
                           
                           
                            <!--1-4 질문-->
                            <div class="panel panel-default panel-faq">
                                <div class="panel-heading">
                                    <a data-toggle="collapse" data-parent="#accordion-cat-1" href="#faq-cat-1-sub-4">
                                        <h4 class="panel-title">
                                            아이디를 변경할 수 있나요?
                                            <span class="pull-right"><i class="glyphicon glyphicon-plus"></i></span>
                                        </h4>
                                    </a>
                                </div>
                                <div id="faq-cat-1-sub-4" class="panel-collapse collapse">
                                    <div class="panel-body">
                                    <p>POGUARD 계정 회원 정책에 따라 아이디는 변경하실 수 없습니다.</p>
									<p>회원 아이디를 변경하시려면 회원 탈퇴후 재가입 하셔야 합니다.</p>
									<p>회원 탈퇴 시 기존에 가입하여 활동했던 개인 정보, 로그, 구매 내역 등의 모든 회원 정보는 복구가 불가능 하오니 탈퇴 신청 시 신중하게 진행하여 주시기 바랍니다. </p>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                   
                   
                   
                   
                   
                   <!--두번째 카테고리-->
                    <div class="tab-pane fade" id="faq-cat-2">
                        <div class="panel-group" id="accordion-cat-2">
                            <div class="panel panel-default panel-faq">
                               
                               <!--2-1 질문-->
                                <div class="panel-heading">
                                    <a data-toggle="collapse" data-parent="#accordion-cat-2" href="#faq-cat-2-sub-1">
                                        <h4 class="panel-title">
                                            자동결제는 언제 이루어지나요?
                                            <span class="pull-right"><i class="glyphicon glyphicon-plus"></i></span>
                                        </h4>
                                    </a>
                                </div>
                                <div id="faq-cat-2-sub-1" class="panel-collapse collapse">
                                    <div class="panel-body">
                                    <p>무료 체험 기간이 종료되고 유료 구독이 시작된 후 다음 달 초에 결제 수단으로 요금이 청구됩니다. </p>
                                    <p>예를 들어 유료 서비스가 5월에 시작된 경우 6월 초에 요금이 청구됩니다. 이후에는 매달 초에 자동 청구가 이루어집니다.</p>
                                    </div>
                                </div>
                            </div>

                            <!--2-2 질문-->
                            <div class="panel panel-default panel-faq">
                                <div class="panel-heading">
                                    <a data-toggle="collapse" data-parent="#accordion-cat-2" href="#faq-cat-2-sub-2">
                                        <h4 class="panel-title">
                                            체크카드는 할부(무이자할부)가 가능한가요?
                                            <span class="pull-right"><i class="glyphicon glyphicon-plus"></i></span>
                                        </h4>
                                    </a>
                                </div>
                                <div id="faq-cat-2-sub-2" class="panel-collapse collapse">
                                    <div class="panel-body">
                                    <p>할부의 경우 신용카드로 5만원이상 결제할때 가능합니다.</p>
									<p>체크카드의 경우 무이자를 포함한 무이자할부가 이용불가합니다.</p>
									<p>할부를 이용하시려면 체크카드가 아닌 일반 신용카드를 이용하시기 바랍니다.</p>
                                    </div>
                                </div>
                            </div>
                            
                            <!--2-3 질문-->
                            <div class="panel panel-default panel-faq">
                                <div class="panel-heading">
                                    <a data-toggle="collapse" data-parent="#accordion-cat-2" href="#faq-cat-2-sub-3">
                                        <h4 class="panel-title">
                                            환불을 했는데 입금이 되지 않았습니다.
                                            <span class="pull-right"><i class="glyphicon glyphicon-plus"></i></span>
                                        </h4>
                                    </a>
                                </div>
                                <div id="faq-cat-2-sub-3" class="panel-collapse collapse">
                                    <div class="panel-body">
                                    <p>계좌이체 환불의 경우 익일에 입금이 됩니다.</p>
									<p>다만 은행에 따라 환불일이 1~2일 소요될 수도 있습니다.</p>
									<p>또한 60일 이전의 거래에 대해서는 평균 2~3일이 소요됩니다.</p>
                                    </div>
                                </div>
                            </div>
                           
                           
                            <!--2-4 질문-->
                            <div class="panel panel-default panel-faq">
                                <div class="panel-heading">
                                    <a data-toggle="collapse" data-parent="#accordion-cat-2" href="#faq-cat-2-sub-4">
                                        <h4 class="panel-title">
                                        휴대폰 결제 방법을 알려주세요
                                            <span class="pull-right"><i class="glyphicon glyphicon-plus"></i></span>
                                        </h4>
                                    </a>
                                </div>
                                <div id="faq-cat-2-sub-4" class="panel-collapse collapse">
                                    <div class="panel-body">
                                   <p> 휴대폰 결제의 경우 휴대폰번호와 명의자의 주민번호를 입력하시면</p>
									<p>해당 휴대폰번호로 승인번호 6자리가 발송됩니다.</p>
									<p>SMS로 받으신 승인번호 6자리를 결제창에 입력하시면 결제가 됩니다.</p>
									
									<p>해당 결제 금액은 고객님의 휴대폰 요금 청구서에 포함됩니다.</p>
                                    </div>
                                </div>
                            </div>



                        </div>
                    </div>


                    <!-- 세번째 카테고리 -->
                    <div class="tab-pane fade" id="faq-cat-3">
                        <div class="panel-group" id="accordion-cat-3">
                            <div class="panel panel-default panel-faq">
                            
                            <!-- 3-1 질문-->
                            
                                <div class="panel-heading">
                                    <a data-toggle="collapse" data-parent="#accordion-cat-3" href="#faq-cat-3-sub-1">
                                        <h4 class="panel-title">
                                            POGUARD 예약 사용은 어떻게하나요?
                                            <span class="pull-right"><i class="glyphicon glyphicon-plus"></i></span>
                                        </h4>
                                    </a>
                                </div>
                                <div id="faq-cat-3-sub-1" class="panel-collapse collapse">
                                    <div class="panel-body">
                                    <p>이용하시는 택배 App 설치 후, 메뉴버튼에서 ‘무인락커 등록’을 선택합니다.</p>
									<p>사용 가능한 무인락커를 지도에서 선택, 보내는분, 받는분, 상품정보를 입력하고 상품 크기에 맞는 무인락커를 선택하시면 택배 예약이 완료됩니다. </p>
									<p>※ 사용 가능한 무인락커란? (아파트 : 입주민 대상, 대학교 : 학생 대상, 여성안심택배 등 : 지역주민 대상)</p>
                                    </div>
                                </div>
                            </div>
                           
                           <!-- 3-2 질문-->
                            <div class="panel panel-default panel-faq">
                                <div class="panel-heading">
                                    <a data-toggle="collapse" data-parent="#accordion-cat-3" href="#faq-cat-3-sub-2">
                                        <h4 class="panel-title">
                                            택배를 보내려면 어떻게 해야 하나요?
                                            <span class="pull-right"><i class="glyphicon glyphicon-plus"></i></span>
                                        </h4>
                                    </a>
                                </div>
                                <div id="faq-cat-3-sub-2" class="panel-collapse collapse">
                                    <div class="panel-body">
                                    <p>■ 인터넷 예약은 이용하시고자 하는 택배사 홈페이지에서 [조회/예약]-[택배예약] 메뉴를 이용하시면 됩니다. </p>
									<p>① 택배 발송신청시 기타사항이나 요구사항에 키패드 입력번호를 기재합니다.</p>
									<p>② 택배기사님이 키패드를 입력하고 택배함에서 보내고자하는 우편물을 수거해갑니다.</p>
                                    
                                    </div>
                                </div>
                            </div>

                            <!--3-3 질문-->
                            <div class="panel panel-default panel-faq">
                                <div class="panel-heading">
                                    <a data-toggle="collapse" data-parent="#accordion-cat-3" href="#faq-cat-3-sub-3">
                                        <h4 class="panel-title">
                                           인터넷, 홈쇼핑에서 받은 물품을 반송하고 싶어요
                                            <span class="pull-right"><i class="glyphicon glyphicon-plus"></i></span>
                                        </h4>
                                    </a>
                                </div>
                                <div id="faq-cat-3-sub-3" class="panel-collapse collapse">
                                    <div class="panel-body">
                                    <p>먼저 주문하신 물품 구입처(인터넷쇼핑몰, 홈쇼핑 등)에 반품에 대한 의사를 전달하시면 구매업체에서 직접 접수를 해주거나 택배사로 접수하시도록 안내를 받으실 수 있습니다. </p>
                                   <p> 택배사로 직접 반품을 원하시는 경우에는 각 택배사 홈페이지, 모바일 택배 앱 및 고객센터로 상담 원통해 접수하시거나 ARS 자동 반품 서비스를 통하여 반품 예약이 가능합니다. </p>
                                    
                                  	<p>① 택배 발송신청시 기타사항이나 요구사항에 키패드 입력번호를 기재합니다.</p>
									<p>② 택배기사님이 키패드를 입력하고 택배함에서 보내고자하는 우편물을 수거해갑니다.</p>
									<p>※ 상품을 받으신 운송장 번호를 확인하여 이용하시면 빠른 접수 가능합니다.</p>
                                    </div>
                                </div>
                            </div>
                           
                           
                            <!--3-4 질문-->
                            <div class="panel panel-default panel-faq">
                                <div class="panel-heading">
                                    <a data-toggle="collapse" data-parent="#accordion-cat-3" href="#faq-cat-3-sub-4">
                                        <h4 class="panel-title">
                                            생물, 냉동식품, 반찬은 택배로 보낼 수 있나요?
                                            <span class="pull-right"><i class="glyphicon glyphicon-plus"></i></span>
                                        </h4>
                                    </a>
                                </div>
                                <div id="faq-cat-3-sub-4" class="panel-collapse collapse">
                                    <div class="panel-body">
                                    <p>신선식품 전용 가방에 담겨져 오는 식품은 POGUARD내의 단열제로 하루이상 보관 가능합니다.</p>
                                    
                                    <p>다만 그외의 일반 차량으로 운행이 되고 있는 신선제품의 경우 택배 취급이 어렵습니다.</p>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                   
                    
                    <!-- 네번째 카테고리 -->
                    <div class="tab-pane fade" id="faq-cat-4">
                        <div class="panel-group" id="accordion-cat-4">
                            <div class="panel panel-default panel-faq">
                            

                            <!-- 4-1 질문-->
                                    <div class="panel-heading">
                                    <a data-toggle="collapse" data-parent="#accordion-cat-4" href="#faq-cat-4-sub-1">
                                        <h4 class="panel-title">
                                            A/S요청은 어디서 하나요?
                                            <span class="pull-right"><i class="glyphicon glyphicon-plus"></i></span>
                                        </h4>
                                    </a>
                                </div>
                                <div id="faq-cat-4-sub-1" class="panel-collapse collapse">
                                    <div class="panel-body">
                                  <p> ① POGUARD 홈페이지에 로그인 합니다. </p>
                                  <p> ② 배너 상단의 A/S신청을 누릅니다. </p>
                                  <p> ③ 글쓰기를 누른후 증상과 기타 정보를 입력한 후 등록합니다<p>
                                  
                                    </div>
                                </div>
                            </div>
                           

                           <!-- 4-2 질문-->
                            <div class="panel panel-default panel-faq">
                                <div class="panel-heading">
                                    <a data-toggle="collapse" data-parent="#accordion-cat-4" href="#faq-cat-4-sub-2">
                                        <h4 class="panel-title">
                                            A/S요청후 몇일 안에 방문해 주시나요
                                            <span class="pull-right"><i class="glyphicon glyphicon-plus"></i></span>
                                        </h4>
                                    </a>
                                </div>
                                <div id="faq-cat-4-sub-2" class="panel-collapse collapse">
                                    <div class="panel-body">
                                    <p>AS게시판에서 접수 후 3일 안에 방문수리기사가 도착합니다.</p>
                                    </div>
                                </div>
                            </div>


                      
                            
                            
                    
                            
                            
                          </div>
					       </div>
					    </div>    
					</section>
	
    
	<!-- Footer -->
	<footer id="footer">
		<div class="footer__inner">
			<div class="footer__up">
				<img class="footerlogo" src="./images/footerlogo.png" />
				<div class="footer__up-textrow1">
					<a href="product.jsp"><span>상품 소개</span></a>
				</div>
				<div class="footer__up-textrow2">
					<a href="service.jsp"><span>서비스 신청</span></a>
				</div>
				<div class="footer__up-textrow3">
					<a href="#"><span>회사 소개</span></a>
				</div>
				<div class="footer__up-textrow4">
					<a href="#"><span>채용</span></a>
				</div>
			</div>
			<hr>
			<div class="footer__down">
				<span>광주 동구 예술길 31-15 광주아트센터 4층 (POST-GUARD)
 사업자 등록번호 : 375-87-00088 직업정보제공사업 신고번호 : J1200020200016</span>
				<div class="footer__icons">
					<a href="https://www.instagram.com/"><i class="fa-brands fa-instagram fa-2xl"></i></a>
					<a href="https://twitter.com/"><i class="fa-brands fa-twitter fa-2xl"></i></a>
					<a href="https://ko-kr.facebook.com/"><i class="fa-brands fa-facebook-square fa-2xl"></i></a>
				</div>
				<span>&copy; POST GUARD; All rights reserved.</span>
			</div>
		</div>
	</footer>
 </body>
 
 <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
 <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

<script>
$(document).ready(function() {
    $('.collapse').on('show.bs.collapse', function() {
        var id = $(this).attr('id');
        $('a[href="#' + id + '"]').closest('.panel-heading').addClass('active-faq');
        $('a[href="#' + id + '"] .panel-title span').html('<i class="glyphicon glyphicon-minus"></i>');
    });
    $('.collapse').on('hide.bs.collapse', function() {
        var id = $(this).attr('id');
        $('a[href="#' + id + '"]').closest('.panel-heading').removeClass('active-faq');
        $('a[href="#' + id + '"] .panel-title span').html('<i class="glyphicon glyphicon-plus"></i>');
    });
});

</script>
</html>

