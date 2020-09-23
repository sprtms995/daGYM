<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#d1{

  padding-top: 70px;

  padding-bottom: 30px;
  
  background: linear-gradient(45deg, #49a09d, #5f2c82);

}

 .insert-label {
      display: inline-block;
      width: 80px;
      line-height: 40px
    }

</style>

<!-- jQuery -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>



<!-- Bootstrap CSS -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">




</head>
<body id="body1">

	<jsp:include page="../common/header.jsp" />
	<%-- <%@include file="../common/header.jsp" %> --%>

	<div id="d1">

<div class="container">

		<div class="container pb-5 mb-5" id="content-main">

			<h3>게시글 등록</h3>
			<hr>
			
			<!-- encType : form태그 데이터가 서버에 제출 될 때의 인코딩 방법을 지정하는 속성
				(기본값 : application/x-www-form-urlencoded:데이터를 서버에 전송하기 전에 문자로 인코딩) 
					multipart/form-data : 모든 데이터를 인코딩 하지 않음(원본데이터 상태(바이트상태유지) - > 파일을 서버에 전달가능)
					multipart/form-data 사용시 문제점: 컨트롤러에서 request를 사용해서 파라미터를 받아오기 불가능 해져서 
					컨트롤러에서 매개 변수로 MultipartFile 변수이름 선언하여 멀티파트타입으로 받을것과 아닌것을 구분시켜 줘야함.							  
				-->
			<form action="insertAction" method="post" role="form" 
				encType="multipart/form-data" onsubmit="return validate();">

				<div class="mb-2">
				 <c:if test="${type == 3}">
					<label class="input-group-addon mr-3 insert-label">질문유형</label> 
					<select	class="custom-select" id="category" name="qnaCode" style="width: 150px;">
						<option value="1">운동</option>
						<option value="2">식단</option>
						<option value="3">이용관련</option>
						<option value="4">결제/환불</option>
					</select>
				</c:if>
				</div>
				<div class="form-inline mb-2">
					<label class="input-group-addon mr-3 insert-label">제목</label> 
					<input type="text" class="form-control" id="title" name="boardTitle" size="70">
				</div>

				<div class="form-inline mb-2">
					<label class="input-group-addon mr-3 insert-label">작성자</label>
					<h5 class="my-0" id="writer">${loginMember.memberId}</h5>
				</div>


				<div class="form-inline mb-2">
					<label class="input-group-addon mr-3 insert-label">작성일</label>
					<h5 class="my-0" id="today">
						<jsp:useBean id="now" class="java.util.Date" />
						<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>
					</h5>
				</div>  

				<hr>

				<div class="form-inline mb-2">
					<label class="input-group-addon mr-3 insert-label">썸네일</label>
					<div class="boardImg" id="titleImgArea">
						<img id="titleImg" width="200" height="200">
					</div>
				</div>

				<div class="form-inline mb-2">
					<label class="input-group-addon mr-3 insert-label">업로드<br>이미지</label>
					<div class="mr-2 boardImg" id="contentImgArea1">
						<img id="contentImg1" width="150" height="150">
					</div>

					<div class="mr-2 boardImg" id="contentImgArea2">
						<img id="contentImg2" width="150" height="150">
					</div>

					<div class="mr-2 boardImg" id="contentImgArea3">
						<img id="contentImg3" width="150" height="150">
					</div>
				</div>


				<!-- 파일 업로드 하는 부분 -->
				<div id="fileArea">
					<!--  multiple 속성
						- input 요소 하나에 둘 이상의 값을 입력할 수 있음을 명시 (파일 여러개 선택 가능)
					 -->
					<input type="file" id="img1" name="thumbnail" onchange="LoadImg(this,1)"> 
					<input type="file" id="img2" name="images" onchange="LoadImg(this,2)">
					<input type="file" id="img3" name="images" onchange="LoadImg(this,3)"> 
					<input type="file" id="img4" name="images" onchange="LoadImg(this,4)">
					<!-- images는 LIst로 넘어가고 썸네일은 썸네일로 서버로 넘어가기 때문에 2개를 받아야됨. -->
				</div>

				<div class="form-group">
					<div>
						<label for="content">내용</label>
					</div>
					<textarea class="form-control" id="content" name="boardContent"
						rows="10" style="resize: none;"></textarea>
				</div>


				<hr class="mb-4">

				<div class="text-center">
					<button type="submit" class="btn btn-primary">등록</button>
					<a class="btn btn-primary float-right" href="${header.referer}">목록으로</a>
															<!-- el에서 제공하는 이전페이지로 가는법 -->
				</div>

			</form>
		</div>

	</div>
	</div>





	<jsp:include page="../common/footer.jsp" />
	<%-- <%@include file="../common/footer.jsp" %> --%>

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

	<script>
	// 유효성 검사
	function validate() {
		if ($("#title").val().trim().length == 0) {
			alert("제목을 입력해 주세요.");
			$("#title").focus();
			return false;
		}

		if ($("#content").val().trim().length == 0) {
			alert("내용을 입력해 주세요.");
			$("#content").focus();
			return false;
		}
		
		var content = $("#content").val();
		var ban = ["개새끼","시발"];
		
		for (var i=0; i<ban.length; i++){
			if(content.indexOf(ban[i]) != -1){
				alert("욕설을 포함 하고 있습니다.");
				$("#content").val("");
				return false;
			}
		} 
		
	}
	
	 // 이미지 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
    $(function () {
       $("#fileArea").hide();

      $("#titleImgArea").click(function () {
        $("#img1").click();
      });
      $("#contentImgArea1").click(function () {
        $("#img2").click();
      });
      $("#contentImgArea2").click(function () {
        $("#img3").click();
      });
      $("#contentImgArea3").click(function () {
        $("#img4").click();
      });

    });

    // 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
    function LoadImg(value, num) {
      if (value.files && value.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
          switch (num) {
            case 1:
              $("#titleImg").attr("src", e.target.result);
              break;
            case 2:
              $("#contentImg1").attr("src", e.target.result);
              break;
            case 3:
              $("#contentImg2").attr("src", e.target.result);
              break;
            case 4:
              $("#contentImg3").attr("src", e.target.result);
              break;
          }
        }

        reader.readAsDataURL(value.files[0]);
      }
    }
	

</script>




</body>
</html>