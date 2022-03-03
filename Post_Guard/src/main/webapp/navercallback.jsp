<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<title>네이버 로그인 Call Back</title>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("yM9Km9V1RKBifED86IwM", "http://localhost:8081/POST_GUARD/navercallback.jsp");
  // 접근 토큰 값 출력
  // alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    let id = naver_id_login.getProfileData('email');
    let name = naver_id_login.getProfileData('name');
//    let mobile = naver_id_login.getProfileData('mobile');

    
    window.close();
  }
</script>
</body>
</html>