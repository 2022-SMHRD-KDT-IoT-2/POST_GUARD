<%@page import="com.vo.ASReplyVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.ASDAO"%>
<%@page import="com.vo.ASVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dao.MemberDAO"%>
<%@ page import="com.vo.MemberVO"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/fonts/icomoon/style.css" />
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <!-- Style -->
    <link rel="stylesheet" href="assets/css/style.css" />

    <title>AS 신청</title>
  </head>
   <body>
  

<!--  ASDAO dao = new ASDAO(); 
ASVO vo = dao.getAS_content(as_seq); 
ArrayList<ASReplyVO> arr_reply = dao.getAS_cmt_content(); 
-->
    <div class="content">
      <div class="container">
        <h1 class="mb-5">AS 신청</h1>

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
                <td></td>
                <td><a href="#">제목 </a></td>
                <td>

                </td>
                <td>+63 983 0962 971</td>
                <td>NY University</td>
              </tr>

           
            </tbody>
          </table>
        </div>
      </div>
    </div>
    
   <a href="enrollas.jsp"><button name = "enrollASList" value ="AS등록">게시글 등록</button></a>

    <script src="assets/js/jquery-3.3.1.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/asmain.js"></script>
  </body>
</html>
