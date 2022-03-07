<%@page import="com.vo.ASReplyVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.ASDAO"%>
<%@page import="com.vo.ASVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dao.MemberDAO"%>
<%@ page import="com.vo.MemberVO"%>
<%@ page import="com.vo.ASVO"%>
<%@ page import="com.dao.ASDAO"%>
<%@ page import="com.vo.ASReplyVO"%>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="assets/fonts/icomoon/style.css" />
<link rel="stylesheet" href="assets/css/owl.carousel.min.css" />

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
<!-- Style -->
<link rel="stylesheet" href="assets/css/style.css" />
<<<<<<< HEAD

    <title>AS 신청</title>
  </head>
   <body>
  
=======
<title>AS 신청</title>
</head>
<body>

	<title>AS 신청</title>
</head>
<body>
>>>>>>> 275f5aa ([영혜] AS게시판 수정)

	<%
	ASDAO dao = new ASDAO();
	MemberVO vo = (MemberVO) session.getAttribute("userInfo");
	ArrayList<ASDAO> arr_dao = new ArrayList<ASDAO>();
	%>

	<div class="content">
		<div class="container">
			<h1 class="mb-5">AS 신청</h1>

			<a href="enrollas.jsp"><button name="enrollASList" value="AS등록">게시글
					등록</button></a>
			<div class="table-responsive">
				<table class="table table-striped custom-table">
					<thead>
						<tr>
							<th scope="col">글 번호</th>
							<th scope="col">카테고리</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">답변 유무</th>
						</tr>
					</thead>

					<tbody>
						<tr scope="row">

							<%
							for (int i = arr_dao.size() - 1; i >= 0; i--) {
							%>
						
						<tr scope="row">
							<td><a href="#?AS_seq=<%=arr_dao.get(i).getAS_list()%>"></a></td>
						</tr>

						<%
						}
						%>



					</tbody>
				</table>
			</div>
		</div>
	</div>


	<script src="assets/js/jquery-3.3.1.min.js"></script>
	<script src="assets/js/popper.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/asmain.js"></script>
</body>
</html>
