<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Bootstrap UI Kit / Components">
<meta name="keywords" content="bootstrap ui kit, bootstrap components, html5 / css3 ui kit, web ui kit" />
<meta name="author" content="KingStudio.ro">

<!-- favicon -->
<link rel="icon" href="${contextPath}/resources/images/favicon.png">
<!-- page title -->
<title>회원가입</title>

<!-- css -->
<link href="${contextPath}/resources/css/king-ui.css" rel="stylesheet">
<link href="${contextPath}/resources/css/animate.css" rel="stylesheet">
<!-- fonts -->
<link href='https://fonts.googleapis.com/css?family=Lato:300,400,400italic,700' rel='stylesheet' type='text/css'>
<link href="${contextPath}/resources/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href='${contextPath}/resources/fonts/FontAwesome.otf' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${contextPath}/resources/css/linear-icons.css">

<script src="${contextPath}/resources/js/validator.min.js" type="text/javascript"></script>
<script src="${contextPath}/resources/js/form-scripts.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>



<style>

	form{
	width : 100%;
	}
	
	#register-form{
	width : 100%;}

</style>

</head>

<body>
	<jsp:include page="../common/header.jsp"/>
<!-- forms -->
<div id="forms">
    <div class="container">
     
        <div class="row">
         

            <!-- register form 1 -->
          <form method="POST" action="signUpAction" name="signUpForm" onsubmit="return validate();">
            <div class="col-sm-6">
                <div id="register-form">
                    <h3 class="log-title">회원가입</h3>
                        
                    <div class="form-group">
                       <input type="text" class="form-control" id="memberId" name="memberId" placeholder="아이디" required data-error="*Please fill out this field">
                        <div class="help-block with-errors"><span id="checkId">&nbsp;</span></div>
                    </div>
                    
                    <div class="form-group">
                        <input type="password" class="form-control" id="memberPwd" name="memberPwd" placeholder="비밀번호" required data-error="*Please fill out this field">
                        <div class="help-block with-errors"><span id="checkPwd">&nbsp;</span></div>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="memberPwd2"  placeholder="비밀번호 확인" required>
                        <div class="help-block with-errors"><span id="checkPwd2">&nbsp;</span></div>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="memberName" name="memberName"  placeholder="이름" required>
                        <div class="help-block with-errors"><span id="checkName">&nbsp;</span></div>
                    </div>
                    <div class="form-group">
                        <input type="phone" class="form-control" id="memberPhone" name="memberPhone"  placeholder="전화번호" required>
                        <div class="help-block with-errors"><span id="checkPhone">&nbsp;</span></div>
                    </div>
                    <div class="form-group">
                    
                        <input type="email" class="form-control" id="memberEmail" name="memberEmail"  placeholder="이메일" required>
                        <div class="help-block with-errors"><span id="checkEmail">&nbsp;</span></div>
                    </div>
                    
                    <!-- log-line -->
                    <div class="log-line reg-form-1 no-margin">
                        <div class="pull-left">
                            <div class="checkbox checkbox-primary space-bottom">
                                <label class="hide"><input type="checkbox"></label>
                                <input id="checkbox2" type="checkbox">
                                <label for="checkbox2"><span><a href="#">Terms & Conditions</a></span></label>
                            </div>
                        </div>
                        <div class="pull-right">
                            <button type="submit" id="reg-submit" class="btn btn-md btn-success-filled btn-log">회원가입</button>
                            <div id="msgSubmit" class="h3 text-center hidden"></div>
                            <div class="clearfix"></div>
                        </div>
                    </div><!-- / log-line -->
                    </div>
                </div>
                </form>
            </div><!-- / col-sm-6 -->
            <!-- / register form 1 -->
        </div><!-- / row -->
        <!-- / form 1 -->


    </div><!-- / container -->
</div>
<!-- / forms -->
<!--  
<script>
	var signUpCheck={
		"id" : false,
		"pwd" : false,
		"pwd2" : false,
		"name" : false,
		"phone" : false,
		"email" : false
			
	};
	
	var $id = $("#memberId");
	var $pwd1 = $("#memberPwd");
	var $pwd2 = $("#memberPwd2");
	var $name = $("#memberName");
	var $phone = $("#memberPhone");
	var $email = $("#memberEmail");
	
	$id.on("input", function(){
		signUpCheck.id=false;
		console.log("체크" +signUpCheck.id)
		var regExp = /^[a-zA-Z\d]{6,12}$/;
		
		if(!regExp.test($id.val())){
			$("#checkId").text("아이디 형식이 유효하지 않습니다.").css("color","red");
			signUpCheck.id=false;
			
		}else{
			$.ajax({
				url : "idDupCheck",
				data : {"memberId": $id.val()},
				type : "GET",
				success : function(result){
					if(result == 0){
						$("#checkId").text("사용 가능한 아이디입니다.").css("color","blue");
						signUpCheck.id=true;
					}else{
						$("#checkId").text("이미 사용중인 아이디입니다.").css("color","red")
					}
				}, error : function(){
					console.log("통신실패");
				}
				
				
			});
			
		}
		
	});
	
	$pwd1.on("input", function(){
		var regExp = /^[A-Za-z0-9]{6,12}$/;
		
		if(!regExp.test($("#memberPwd1").val())){
			$("#checkPwd1").text("비밀번호 형식이 유효하지 않습니다.").css("color", "red");
			signUpCheck.pwd1 = false;
			
		}else{
			$("#checkPwd1").text("사용 가능한 비밀번호 입니다.").css("color", "blue");
			signUpCheck.pwd2 = true;
		}
		
		if(!signUpCheck.pwd1 && $pwd2.val().length > 0){
			swal("유효한 비밀번호를 작성해 주세요.");
			$pwd2.val("");
			$pwd1.focus();
		}else if(signUpCheck.pwd1 && $pwd2.val().length > 0){
			if($pwd1.val().trim() != $pwd2.val().trim()){
				$("#checkPwd2").text("비밀번호 불일치").css("color","red");
				signUpCheck.pwd2 = false;
			}else{
				$("#checkPwd2").text("비밀번호 일치").css("color","blue");
				signUpCheck.pwd2 = true;
			}
		}
		
	});
	
	$name.on("input", function(){
		var regExp = /^[가-힣]{2,}$/;
		
		if(!regExp.test($name.val())){
			$("#checkName").text("한글 두 글자 이상을 입력하세요.").css("color", "red");
			signUpcheck.name = false;
		}else{
			$("#checkName").text("유효한 이름입니다.").css("color", "blue");
			signUpcheck.name = true;
		}
		
	});
	
	$phone.on("input", function(){
		var regExp =  /(01[016789])[-](\d{4}|\d{3})[-]\d{4}$/g;
		
		if(!regExp.test($phone.val())){
			$("#checkPhone").text("전화번호가 유효하지 않습니다.").css("color", "red");
			signUpCheck.phone = false;
		}else{
			$("#checkPhone").text("유효한 전화번호 입니다.").css("color", "blue");
			signUpCheck.phone = true;
		}
		
	});
	
	$email.on("input", function(){
		var regExp =  /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/; // 4글자 아무단어 @ 아무단어 . * 3아무3
		
		if(!regExp.test($email.val())){
			$("#checkEmail").text("유효하지 않은 이메일입니다.").css("color","red");
			signUpCheck.email = false;
		}else{
			$("#checkEmail").text("유효한 이메일입니다.").css("color","blue");
			signUpCheck.email = true;
		}
	});
	
	function validate(){
		
		for(var key in signUpCheck){
			if(!signUpCheck[key]){
				var msg;
				switch(key){
				case "id" : msg="아이디가 "; break;		
				case "pwd" : msg="비밀번호가 " ; break;		
				case "name" : msg="이름이 "; break;		
				case "phone" : msg="전화번호가 "; break;		
				case "email" : msg="이메일이 "; break;		
				
				}
				alert(msg+"유효하지 않습니다.");
				var el="#"+key;
				$(el).focus();
				return false;
			}
			
		}
		
	}

</script>

-->

	<jsp:include page="../common/footer.jsp"/>
</body>


</html>