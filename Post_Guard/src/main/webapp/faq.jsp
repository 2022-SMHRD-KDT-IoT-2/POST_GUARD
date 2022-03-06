<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
	padding-top: 30px;
}

.faq-cat-content {
	margin-top: 25px;
}

.faq-cat-tabs li a {
	padding: 15px 10px 15px 10px;
	background-color: #ffffff;
	border: 1px solid #dddddd;
	color: #777777;
}

.nav-tabs li a:focus, .panel-heading a:focus {
	outline: none;
}

.panel-heading a, .panel-heading a:hover, .panel-heading a:focus {
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
	font-size: 13px;
	font-weight: normal;
}
</style>

<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<body>




	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<!--카테고리 탭-->
				<ul class="nav nav-tabs faq-cat-tabs">
					<li class="active"><a href="#faq-cat-1" data-toggle="tab">회원정보</a></li>
					<li><a href="#faq-cat-2" data-toggle="tab">결제&이용</a></li>
					<li><a href="#faq-cat-3" data-toggle="tab">상품</a></li>
					<li><a href="#faq-cat-4" data-toggle="tab">배송</a></li>
				</ul>

				<!-- 첫번째 카테고리 -->
				<div class="tab-content faq-cat-content">
					<div class="tab-pane active in fade" id="faq-cat-1">
						<div class="panel-group" id="accordion-cat-1">

							<!-- 1-1 질문-->
							<div class="panel panel-default panel-faq">
								<div class="panel-heading">
									<a data-toggle="collapse" data-parent="#accordion-cat-1"
										href="#faq-cat-1-sub-1">
										<h4 class="panel-title">
											회원가입은 어떻게 하나요? <span class="pull-right"><i
												class="glyphicon glyphicon-plus"></i></span>
										</h4>
									</a>
								</div>
								<div id="faq-cat-1-sub-1" class="panel-collapse collapse">
									<div class="panel-body">Anim pariatur cliche
										reprehenderit, enim eiusmod high life accusamus terry
										richardson ad squid. 3 wolf moon officia aute, non cupidatat
										skateboard dolor brunch. Food truck quinoa nesciunt laborum
										eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
										it squid single-origin coffee nulla assumenda shoreditch et.
										Nihil anim keffiyeh helvetica, craft beer labore wes anderson
										cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
										vice lomo. Leggings occaecat craft beer farm-to-table, raw
										denim aesthetic synth nesciunt you probably haven't heard of
										them accusamus labore sustainable VHS.</div>
								</div>
							</div>

							<!-- 1-2 질문-->
							<div class="panel panel-default panel-faq">
								<div class="panel-heading">
									<a data-toggle="collapse" data-parent="#accordion-cat-1"
										href="#faq-cat-1-sub-2">
										<h4 class="panel-title">
											회원정보를 수정하고 싶어요 <span class="pull-right"><i
												class="glyphicon glyphicon-plus"></i></span>
										</h4>
									</a>
								</div>
								<div id="faq-cat-1-sub-2" class="panel-collapse collapse">
									<div class="panel-body">Anim pariatur cliche
										reprehenderit, enim eiusmod high life accusamus terry
										richardson ad squid. 3 wolf moon officia aute, non cupidatat
										skateboard dolor brunch. Food truck quinoa nesciunt laborum
										eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
										it squid single-origin coffee nulla assumenda shoreditch et.
										Nihil anim keffiyeh helvetica, craft beer labore wes anderson
										cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
										vice lomo. Leggings occaecat craft beer farm-to-table, raw
										denim aesthetic synth nesciunt you probably haven't heard of
										them accusamus labore sustainable VHS.</div>
								</div>
							</div>

							<!--1-3 질문-->
							<div class="panel panel-default panel-faq">
								<div class="panel-heading">
									<a data-toggle="collapse" data-parent="#accordion-cat-1"
										href="#faq-cat-1-sub-3">
										<h4 class="panel-title">
											아이디와 비밀번호를 잊어버렸어요 <span class="pull-right"><i
												class="glyphicon glyphicon-plus"></i></span>
										</h4>
									</a>
								</div>
								<div id="faq-cat-1-sub-3" class="panel-collapse collapse">
									<div class="panel-body">Anim pariatur cliche
										reprehenderit, enim eiusmod high life accusamus terry
										richardson ad squid. 3 wolf moon officia aute, non cupidatat
										skateboard dolor brunch. Food truck quinoa nesciunt laborum
										eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
										it squid single-origin coffee nulla assumenda shoreditch et.
										Nihil anim keffiyeh helvetica, craft beer labore wes anderson
										cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
										vice lomo. Leggings occaecat craft beer farm-to-table, raw
										denim aesthetic synth nesciunt you probably haven't heard of
										them accusamus labore sustainable VHS.</div>
								</div>
							</div>


							<!--1-4 질문-->
							<div class="panel panel-default panel-faq">
								<div class="panel-heading">
									<a data-toggle="collapse" data-parent="#accordion-cat-1"
										href="#faq-cat-1-sub-4">
										<h4 class="panel-title">
											집에 가고 싶어요 <span class="pull-right"><i
												class="glyphicon glyphicon-plus"></i></span>
										</h4>
									</a>
								</div>
								<div id="faq-cat-1-sub-4" class="panel-collapse collapse">
									<div class="panel-body">Anim pariatur cliche
										reprehenderit, enim eiusmod high life accusamus terry
										richardson ad squid. 3 wolf moon officia aute, non cupidatat
										skateboard dolor brunch. Food truck quinoa nesciunt laborum
										eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
										it squid single-origin coffee nulla assumenda shoreditch et.
										Nihil anim keffiyeh helvetica, craft beer labore wes anderson
										cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
										vice lomo. Leggings occaecat craft beer farm-to-table, raw
										denim aesthetic synth nesciunt you probably haven't heard of
										them accusamus labore sustainable VHS.</div>
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
									<a data-toggle="collapse" data-parent="#accordion-cat-2"
										href="#faq-cat-2-sub-1">
										<h4 class="panel-title">
											결제이용 질문 <span class="pull-right"><i
												class="glyphicon glyphicon-plus"></i></span>
										</h4>
									</a>
								</div>
								<div id="faq-cat-2-sub-1" class="panel-collapse collapse">
									<div class="panel-body">Anim pariatur cliche
										reprehenderit, enim eiusmod high life accusamus terry
										richardson ad squid. 3 wolf moon officia aute, non cupidatat
										skateboard dolor brunch. Food truck quinoa nesciunt laborum
										eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
										it squid single-origin coffee nulla assumenda shoreditch et.
										Nihil anim keffiyeh helvetica, craft beer labore wes anderson
										cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
										vice lomo. Leggings occaecat craft beer farm-to-table, raw
										denim aesthetic synth nesciunt you probably haven't heard of
										them accusamus labore sustainable VHS.</div>
								</div>
							</div>

							<!--2-2 질문-->
							<div class="panel panel-default panel-faq">
								<div class="panel-heading">
									<a data-toggle="collapse" data-parent="#accordion-cat-2"
										href="#faq-cat-2-sub-2">
										<h4 class="panel-title">
											결제이용 질문 <span class="pull-right"><i
												class="glyphicon glyphicon-plus"></i></span>
										</h4>
									</a>
								</div>
								<div id="faq-cat-2-sub-2" class="panel-collapse collapse">
									<div class="panel-body">Anim pariatur cliche
										reprehenderit, enim eiusmod high life accusamus terry
										richardson ad squid. 3 wolf moon officia aute, non cupidatat
										skateboard dolor brunch. Food truck quinoa nesciunt laborum
										eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
										it squid single-origin coffee nulla assumenda shoreditch et.
										Nihil anim keffiyeh helvetica, craft beer labore wes anderson
										cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
										vice lomo. Leggings occaecat craft beer farm-to-table, raw
										denim aesthetic synth nesciunt you probably haven't heard of
										them accusamus labore sustainable VHS.</div>
								</div>
							</div>

							<!--2-3 질문-->
							<div class="panel panel-default panel-faq">
								<div class="panel-heading">
									<a data-toggle="collapse" data-parent="#accordion-cat-2"
										href="#faq-cat-2-sub-3">
										<h4 class="panel-title">
											결제이용 질문 <span class="pull-right"><i
												class="glyphicon glyphicon-plus"></i></span>
										</h4>
									</a>
								</div>
								<div id="faq-cat-2-sub-3" class="panel-collapse collapse">
									<div class="panel-body">Anim pariatur cliche
										reprehenderit, enim eiusmod high life accusamus terry
										richardson ad squid. 3 wolf moon officia aute, non cupidatat
										skateboard dolor brunch. Food truck quinoa nesciunt laborum
										eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
										it squid single-origin coffee nulla assumenda shoreditch et.
										Nihil anim keffiyeh helvetica, craft beer labore wes anderson
										cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
										vice lomo. Leggings occaecat craft beer farm-to-table, raw
										denim aesthetic synth nesciunt you probably haven't heard of
										them accusamus labore sustainable VHS.</div>
								</div>
							</div>


							<!--2-4 질문-->
							<div class="panel panel-default panel-faq">
								<div class="panel-heading">
									<a data-toggle="collapse" data-parent="#accordion-cat-2"
										href="#faq-cat-2-sub-4">
										<h4 class="panel-title">
											결제이용 질문 <span class="pull-right"><i
												class="glyphicon glyphicon-plus"></i></span>
										</h4>
									</a>
								</div>
								<div id="faq-cat-2-sub-4" class="panel-collapse collapse">
									<div class="panel-body">Anim pariatur cliche
										reprehenderit, enim eiusmod high life accusamus terry
										richardson ad squid. 3 wolf moon officia aute, non cupidatat
										skateboard dolor brunch. Food truck quinoa nesciunt laborum
										eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
										it squid single-origin coffee nulla assumenda shoreditch et.
										Nihil anim keffiyeh helvetica, craft beer labore wes anderson
										cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
										vice lomo. Leggings occaecat craft beer farm-to-table, raw
										denim aesthetic synth nesciunt you probably haven't heard of
										them accusamus labore sustainable VHS.</div>
								</div>
							</div>



						</div>
					</div>


					<!-- 세번째 카테고리 -->
					<div class="tab-pane fade" id="faq-cat-3">
						<div class="panel-group" id="accordion-cat-3">
							<div class="panel panel-default panel-faq">

								<!-- 3-1 질문-->
								<div class="panel panel-default panel-faq">
									<div class="panel-heading">
										<a data-toggle="collapse" data-parent="#accordion-cat-3"
											href="#faq-cat-3-sub-1">
											<h4 class="panel-title">
												상품질문1 <span class="pull-right"><i
													class="glyphicon glyphicon-plus"></i></span>
											</h4>
										</a>
									</div>
									<div id="faq-cat-3-sub-1" class="panel-collapse collapse">
										<div class="panel-body">Anim pariatur cliche
											reprehenderit, enim eiusmod high life accusamus terry
											richardson ad squid. 3 wolf moon officia aute, non cupidatat
											skateboard dolor brunch. Food truck quinoa nesciunt laborum
											eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
											it squid single-origin coffee nulla assumenda shoreditch et.
											Nihil anim keffiyeh helvetica, craft beer labore wes anderson
											cred nesciunt sapiente ea proident. Ad vegan excepteur
											butcher vice lomo. Leggings occaecat craft beer
											farm-to-table, raw denim aesthetic synth nesciunt you
											probably haven't heard of them accusamus labore sustainable
											VHS.</div>
									</div>
								</div>

								<!-- 3-2 질문-->
								<div class="panel panel-default panel-faq">
									<div class="panel-heading">
										<a data-toggle="collapse" data-parent="#accordion-cat-3"
											href="#faq-cat-3-sub-2">
											<h4 class="panel-title">
												상품질문2 <span class="pull-right"><i
													class="glyphicon glyphicon-plus"></i></span>
											</h4>
										</a>
									</div>
									<div id="faq-cat-3-sub-2" class="panel-collapse collapse">
										<div class="panel-body">Anim pariatur cliche
											reprehenderit, enim eiusmod high life accusamus terry
											richardson ad squid. 3 wolf moon officia aute, non cupidatat
											skateboard dolor brunch. Food truck quinoa nesciunt laborum
											eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
											it squid single-origin coffee nulla assumenda shoreditch et.
											Nihil anim keffiyeh helvetica, craft beer labore wes anderson
											cred nesciunt sapiente ea proident. Ad vegan excepteur
											butcher vice lomo. Leggings occaecat craft beer
											farm-to-table, raw denim aesthetic synth nesciunt you
											probably haven't heard of them accusamus labore sustainable
											VHS.</div>
									</div>
								</div>

								<!--3-3 질문-->
								<div class="panel panel-default panel-faq">
									<div class="panel-heading">
										<a data-toggle="collapse" data-parent="#accordion-cat-3"
											href="#faq-cat-3-sub-3">
											<h4 class="panel-title">
												상품질문3 <span class="pull-right"><i
													class="glyphicon glyphicon-plus"></i></span>
											</h4>
										</a>
									</div>
									<div id="faq-cat-3-sub-3" class="panel-collapse collapse">
										<div class="panel-body">Anim pariatur cliche
											reprehenderit, enim eiusmod high life accusamus terry
											richardson ad squid. 3 wolf moon officia aute, non cupidatat
											skateboard dolor brunch. Food truck quinoa nesciunt laborum
											eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
											it squid single-origin coffee nulla assumenda shoreditch et.
											Nihil anim keffiyeh helvetica, craft beer labore wes anderson
											cred nesciunt sapiente ea proident. Ad vegan excepteur
											butcher vice lomo. Leggings occaecat craft beer
											farm-to-table, raw denim aesthetic synth nesciunt you
											probably haven't heard of them accusamus labore sustainable
											VHS.</div>
									</div>
								</div>


								<!--3-4 질문-->
								<div class="panel panel-default panel-faq">
									<div class="panel-heading">
										<a data-toggle="collapse" data-parent="#accordion-cat-3"
											href="#faq-cat-3-sub-4">
											<h4 class="panel-title">
												상품질문4 <span class="pull-right"><i
													class="glyphicon glyphicon-plus"></i></span>
											</h4>
										</a>
									</div>
									<div id="faq-cat-3-sub-4" class="panel-collapse collapse">
										<div class="panel-body">Anim pariatur cliche
											reprehenderit, enim eiusmod high life accusamus terry
											richardson ad squid. 3 wolf moon officia aute, non cupidatat
											skateboard dolor brunch. Food truck quinoa nesciunt laborum
											eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
											it squid single-origin coffee nulla assumenda shoreditch et.
											Nihil anim keffiyeh helvetica, craft beer labore wes anderson
											cred nesciunt sapiente ea proident. Ad vegan excepteur
											butcher vice lomo. Leggings occaecat craft beer
											farm-to-table, raw denim aesthetic synth nesciunt you
											probably haven't heard of them accusamus labore sustainable
											VHS.</div>
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
								<div class="panel panel-default panel-faq">
									<div class="panel-heading">
										<a data-toggle="collapse" data-parent="#accordion-cat-4"
											href="#faq-cat-4-sub-1">
											<h4 class="panel-title">
												배송질문1 <span class="pull-right"><i
													class="glyphicon glyphicon-plus"></i></span>
											</h4>
										</a>
									</div>
									<div id="faq-cat-4-sub-1" class="panel-collapse collapse">
										<div class="panel-body">Anim pariatur cliche
											reprehenderit, enim eiusmod high life accusamus terry
											richardson ad squid. 3 wolf moon officia aute, non cupidatat
											skateboard dolor brunch. Food truck quinoa nesciunt laborum
											eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
											it squid single-origin coffee nulla assumenda shoreditch et.
											Nihil anim keffiyeh helvetica, craft beer labore wes anderson
											cred nesciunt sapiente ea proident. Ad vegan excepteur
											butcher vice lomo. Leggings occaecat craft beer
											farm-to-table, raw denim aesthetic synth nesciunt you
											probably haven't heard of them accusamus labore sustainable
											VHS.</div>
									</div>
								</div>


								<!-- 4-2 질문-->
								<div class="panel panel-default panel-faq">
									<div class="panel-heading">
										<a data-toggle="collapse" data-parent="#accordion-cat-4"
											href="#faq-cat-4-sub-2">
											<h4 class="panel-title">
												배송질문2 <span class="pull-right"><i
													class="glyphicon glyphicon-plus"></i></span>
											</h4>
										</a>
									</div>
									<div id="faq-cat-4-sub-2" class="panel-collapse collapse">
										<div class="panel-body">Anim pariatur cliche
											reprehenderit, enim eiusmod high life accusamus terry
											richardson ad squid. 3 wolf moon officia aute, non cupidatat
											skateboard dolor brunch. Food truck quinoa nesciunt laborum
											eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
											it squid single-origin coffee nulla assumenda shoreditch et.
											Nihil anim keffiyeh helvetica, craft beer labore wes anderson
											cred nesciunt sapiente ea proident. Ad vegan excepteur
											butcher vice lomo. Leggings occaecat craft beer
											farm-to-table, raw denim aesthetic synth nesciunt you
											probably haven't heard of them accusamus labore sustainable
											VHS.</div>
									</div>
								</div>


								<!--4-3 질문-->
								<div class="panel panel-default panel-faq">
									<div class="panel-heading">
										<a data-toggle="collapse" data-parent="#accordion-cat-4"
											href="#faq-cat-4-sub-3">
											<h4 class="panel-title">
												배송질문3 <span class="pull-right"><i
													class="glyphicon glyphicon-plus"></i></span>
											</h4>
										</a>
									</div>
									<div id="faq-cat-4-sub-3" class="panel-collapse collapse">
										<div class="panel-body">Anim pariatur cliche
											reprehenderit, enim eiusmod high life accusamus terry
											richardson ad squid. 3 wolf moon officia aute, non cupidatat
											skateboard dolor brunch. Food truck quinoa nesciunt laborum
											eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
											it squid single-origin coffee nulla assumenda shoreditch et.
											Nihil anim keffiyeh helvetica, craft beer labore wes anderson
											cred nesciunt sapiente ea proident. Ad vegan excepteur
											butcher vice lomo. Leggings occaecat craft beer
											farm-to-table, raw denim aesthetic synth nesciunt you
											probably haven't heard of them accusamus labore sustainable
											VHS.</div>
									</div>
								</div>


								<!--4-4 질문-->
								<div class="panel panel-default panel-faq">
									<div class="panel-heading">
										<a data-toggle="collapse" data-parent="#accordion-cat-4"
											href="#faq-cat-4-sub-4">
											<h4 class="panel-title">
												배송질문4 <span class="pull-right"><i
													class="glyphicon glyphicon-plus"></i></span>
											</h4>
										</a>
									</div>
									<div id="faq-cat-4-sub-4" class="panel-collapse collapse">
										<div class="panel-body">Anim pariatur cliche
											reprehenderit, enim eiusmod high life accusamus terry
											richardson ad squid. 3 wolf moon officia aute, non cupidatat
											skateboard dolor brunch. Food truck quinoa nesciunt laborum
											eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
											it squid single-origin coffee nulla assumenda shoreditch et.
											Nihil anim keffiyeh helvetica, craft beer labore wes anderson
											cred nesciunt sapiente ea proident. Ad vegan excepteur
											butcher vice lomo. Leggings occaecat craft beer
											farm-to-table, raw denim aesthetic synth nesciunt you
											probably haven't heard of them accusamus labore sustainable
											VHS.</div>
									</div>
								</div>


							</div>
						</div>


					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

<script>
	$(document)
			.ready(
					function() {
						$('.collapse')
								.on(
										'show.bs.collapse',
										function() {
											var id = $(this).attr('id');
											$('a[href="#' + id + '"]').closest(
													'.panel-heading').addClass(
													'active-faq');
											$(
													'a[href="#'
															+ id
															+ '"] .panel-title span')
													.html(
															'<i class="glyphicon glyphicon-minus"></i>');
										});
						$('.collapse')
								.on(
										'hide.bs.collapse',
										function() {
											var id = $(this).attr('id');
											$('a[href="#' + id + '"]').closest(
													'.panel-heading')
													.removeClass('active-faq');
											$(
													'a[href="#'
															+ id
															+ '"] .panel-title span')
													.html(
															'<i class="glyphicon glyphicon-plus"></i>');
										});
					});
</script>
</html>
