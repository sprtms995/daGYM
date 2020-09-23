<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!doctype html>

<html>
<head>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

	<title>Rage Freebie HTML5 Landing page</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!--Google Font link-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Raleway:400,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">


	<link rel="stylesheet" href="${contextPath}/resources/css/trainerView/slick.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/trainerView/slick-theme.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/trainerView/animate.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/trainerView/fonticons.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/trainerView/font-awesome.min.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/trainerView/bootstrap.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/trainerView/magnific-popup.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/trainerView/bootsnav.css">


	<!--For Plugins external css-->
	<!--<link rel="stylesheet" href="assets/css/plugins.css" />-->

	<!--Theme custom css -->
	<link rel="stylesheet" href="${contextPath}/resources/css/trainerView/style.css">
	<!--<link rel="stylesheet" href="assets/css/colors/maron.css">-->

	<!--Theme Responsive css-->
	<link rel="stylesheet" href="${contextPath}/resources/css/trainerView/responsive.css" />

	<script src="${contextPath}/resources/js/trainerView/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
	

	<style>
	.trainerImg{
	float: left;
	margin-top: 50px;
	}
	.trainerInfo{
	text-align: center;
	padding-top: 150px;
	}
	#about{
	clear: both;
	}
	hr{
	background-color:white;
	}
	.hello{
	background-color: gray;
	}
	#hello{
	margin: 0 auto;
	width: 1200px;
	}
	#price{
	font-size: 30px;
	font-weight: bold;
	padding-top : 20px;
	}
	.pricing_price{
	padding-top: 30%;
	}
	#about > a{
	color:white;
	}
	.primary-btn{
		border : none;
	}
	#order{
		background-color: white;
	}
	
	
	</style>
	
</head>

<body data-spy="scroll" data-target=".navbar-collapse">
<jsp:include page="../common/header.jsp"/>

	<div class="culmn">
				
					
	
		<section id="hello" class="home bg-mega">
		<div class="container calendar-container">
		
				</div>
		<div class="row">
			<div class="col-md-6">
				<div class="trainerImg">
						<c:if test="${!empty files }">
	
	                            <c:forEach var="at" items="${files}" varStatus="vs">
	                                <c:set var="src" value="${contextPath}${at.filePath}/${at.fileChangeName}"/>
	
	                                <div class="carousel-item <c:if test="${vs.index == 0}"> active</c:if>">
	                                    <img width="370px" height="360px" src="${src}" />
	                                    <input type="hidden" value="${at.fileNo}">
	                                </div>
	                            </c:forEach>
	
	                </c:if>
				</div>			
			</div>
			<div class="col-md-6">
				<div class="trainerName">
					<div class="about_accordion wow fadeIn">
									<div id="faq_main_content" class="faq_main_content">
										<h6><i class="fa fa-angle-right"></i>자격 및 경력사항 </h6>
										<div>
											<div class="content">
												<p>${trainer.trainerCareer}</p>
											</div>
										</div>
										<!-- End off accordion item-1 -->
	
										<h6><i class="fa fa-angle-right"></i>수상내역</h6>
										<div>
											<div class="content">
												<p>${trainer.trainerAward}</p>
												</div>
										</div>
										<!-- End off accordion item-2 -->
	
										<h6> <i class="fa fa-angle-right"></i>PT 가격</h6>
										<div>
											<div class="content">
												<p>10회당 ${trainer.trainerPrice}원</p>
											</div>
										</div>
										<!-- End off accordion item-3 -->
	
										<h6><i class="fa fa-angle-right"></i>트레이너 SNS</h6>
										<div>
											<div class="content">
											<a href="${trainer.trainerSNS}">${trainer.trainerSNS}</a>
											</div>
										</div>
										<!-- End off accordion item-4 -->
									</div>
								</div>
				</div>
			</div>
		</div>		
		</section>

		<!--End off Home Sections-->


		<!--About Sections-->
		<section id="about" class="about roomy-100">
			<div class="container">
				<div class="row">
					<div class="main_about">
						<div class="col-md-6">
							<div class="about_content">
								<h2>트레이너 한마디!</h2>
								<div class="separator_left"></div>

								<p>${trainer.trainerComment}</p>
							
							</div>
						</div>
						<div class="col-md-6">
						
						</div>
					</div>
				</div>
				<!--End off row-->
			</div>
			<!--End off container -->
			<div class="row">
				<div class="col-md-6">
				</div>
				<div class="col-md-6">
					<c:if test="${loginMember.memberGrade == 'T' && loginMember.memberNo==trainer.trainerNo}">
						<a  class="primary-btn signup-btn" onclick="window.open('${contextPath}/trainer/schedule/${trainer.trainerNo}','스케줄 등록','width=1300,height=850,left=200,top=100')">스케줄 등록</a>
					</c:if>
					
				</div>
			</div>
		</section>
  



		<!--Testimonial Section-->
		<section id="testimonial" class="testimonial fix">
			<div class="overlay"></div>
			<div class="container">
				<div class="row">
					<div class="main_testimonial col-sm-8 ml-sm-auto mr-sm-auto">
						<div class="head_title text-center roomy-100">
							<h2 class="text-white">OUR TESTIMONIALS</h2>
						</div>
					</div>


					<div class="testimonial_slid text-center">
						<div class="testimonial_item">
							<div class="col-sm-10 mr-sm-auto ml-sm-auto">
								<p class="text-white">환불은 불가능합니다...! 신중히 결제해주세요...!</p>

								<div class="test_authour m-top-30">
									<h6 class="text-white m-bottom-20">JOHN DOE - THEMEFOREST USER</h6>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
							</div>
						</div>
						<div class="testimonial_item">
							<div class="col-sm-10 mr-sm-auto ml-sm-auto">
								<p class="text-white">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>

								<div class="test_authour m-top-30">
									<h6 class="text-white m-bottom-20">JOHN DOE - THEMEFOREST USER</h6>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
							</div>
						</div>
						<div class="testimonial_item">
							<div class="col-sm-10 mr-sm-auto ml-sm-auto">
								<p class="text-white">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>

								<div class="test_authour m-top-30">
									<h6 class="text-white m-bottom-20">JOHN DOE - THEMEFOREST USER</h6>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
							</div>
						</div>
						<div class="testimonial_item">
							<div class="col-sm-10 mr-sm-auto ml-sm-auto">
								<p class="text-white">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>

								<div class="test_authour m-top-30">
									<h6 class="text-white m-bottom-20">JOHN DOE - THEMEFOREST USER</h6>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!--End off row-->
			</div>
			<!--End off container -->
		</section>
		<!--End off Testimonial section -->

			
	 <section class="membership-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>MEMBERSHIP PLANS</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <div class="membership-item">
                        <div class="mi-title">
                            <h4>5회권</h4>
                            <div class="triangle"></div>
                        </div>
                            <h2 class="mi-price"> <fmt:formatNumber value="${(trainer.trainerPrice)*5 }" pattern="#,###원" /></h2>
                   
                        	<c:set var="trainerNo" value="${trainer.trainerNo}"/>
								<c:choose>
									<c:when test="${classStatus.trainerNo == trainer.trainerNo || classStatus==null}">
											<c:url var="url" value="../paymentView/${trainer.trainerNo }">
											<c:param name="classNm" value="5"/>
										</c:url>
					                       <button onclick="location.href='${url}' " class="primary-btn membership-btn" id="order">결제하기</button>
			                    	</c:when>
			                    	<c:otherwise>
			                    	다른 트레이너 이용권을 모두 사용해야 결제하실 수  있습니다.
			                    	</c:otherwise>
			                    	</c:choose>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="membership-item">
                        <div class="mi-title">
                            <h4>10회권</h4>
                            <div class="triangle"></div>
                        </div>
                            <h2 class="mi-price"> <fmt:formatNumber value="${(trainer.trainerPrice)*10 }" pattern="#,###원" /></h2>
                       
                       
                        	<c:set var="trainerNo" value="${trainer.trainerNo}"/>
								<c:choose>
									<c:when test="${classStatus.trainerNo == trainer.trainerNo || classStatus==null}">
											<c:url var="url" value="../paymentView/${trainer.trainerNo }">
											<c:param name="classNm" value="5"/>
										</c:url>
					                       <button onclick="location.href='${url}' " class="primary-btn membership-btn" id="order">결제하기</button>
			                    	</c:when>
			                    	<c:otherwise>
			                    	다른 트레이너 이용권을 모두 사용해야 결제하실 수  있습니다.
			                    	</c:otherwise>
			                    	</c:choose>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="membership-item">
                        <div class="mi-title">
                            <h4>20회권</h4>
                            <div class="triangle"></div>
                        </div>
                       

                        <h2 class="mi-price"> <fmt:formatNumber value="${(trainer.trainerPrice)*20 }" pattern="#,###원" /></h2>
                        
                        
                        	<c:set var="trainerNo" value="${trainer.trainerNo}"/>
								<c:choose>
									<c:when test="${classStatus.trainerNo == trainer.trainerNo || classStatus==null}">
											<c:url var="url" value="../paymentView/${trainer.trainerNo }">
											<c:param name="classNm" value="5"/>
										</c:url>
					                       <button onclick="location.href='${url}' " class="primary-btn membership-btn" id="order">결제하기</button>
			                    	</c:when>
			                    	<c:otherwise>
			                    	다른 트레이너 이용권을 모두 사용해야 결제하실 수  있습니다.
			                    	</c:otherwise>
			                    	</c:choose>
                    </div>
                </div>
            </div>
        </div>
    </section>
	
		<br><br>
		<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

		<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>
		 <div class="section-title">
	                        <h2 id="content2">REVIEW</h2>
	     </div>
		<c:choose>
			<c:when test="${empty reviews }">
					<div class="container">
		
		   <div class="well">
		      <div class="media">
		      
		  		<a class="pull-left" href="#">
		  		</a>
		  		<div class="media-body">
		    		<h4 class="media-heading"></h4>
		          <p class="text-center">작성된 리뷰가 없습니다.</p>
		         
		       </div>
		    </div>
		  </div>
		</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="review" items="${reviews }">
					<div class="container">
		
		   <div class="well">
		      <div class="media">
		      
		  		<a class="pull-left" href="#">
		  		</a>
		  		<div class="media-body">
		    		<h4 class="media-heading"></h4>
		          <p class="text-right">By ${review.memberId }</p>
		          <p>${review.reviewContent }</p>
		          <ul class="list-inline list-unstyled">
		            <li>
		               <c:set var="rating" value="${review.reviewRating }"/>
		               		<c:forEach var="i" begin="1" end="${rating}">
		                        <span class="glyphicon glyphicon-star"></span>
		               		</c:forEach>
		               		<c:forEach var="i" begin="1" end="${5-rating}" >
		                        <span class="glyphicon glyphicon-star-empty"></span>
		               		
		               		</c:forEach>
							
		            </li>
		            <li>|</li>
		            <jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
		            <fmt:formatDate var="createDate" value="${review.reviewCreateDate}" pattern="yyyy-MM-dd"/>
		            <li>${createDate }</li>
		            <li style="padding-left: 5px;">${review.reviewCreateDate}</li>
				</ul>
					<c:choose>
						<c:when test="${loginMember.memberId == review.memberId }">
						       <button type="button" id="${review.reviewNo }" class="delete-btn" >삭제</button>
					 </c:when>
					</c:choose>
		       </div>
		    </div>
		  </div>
		</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
<jsp:include page="../common/footer.jsp"/>

		<!-- scroll up-->
		<div class="scrollup">
			<a href="#"><i class="fa fa-chevron-up"></i></a>
		</div>
		<!-- End off scroll up -->



	</div>

	<!-- JS includes -->

	<script src="${contextPath}/resources/js/trainerView/vendor/jquery-1.11.2.min.js"></script>
	<script src="${contextPath}/resources/js/trainerView/vendor/popper.min.js"></script>
	<script src="${contextPath}/resources/js/trainerView/vendor/bootstrap.min.js"></script>

	<script src="${contextPath}/resources/js/trainerView/jquery.magnific-popup.js"></script>
	<script src="${contextPath}/resources/js/trainerView/slick.min.js"></script>
	<script src="${contextPath}/resources/js/trainerView/jquery.collapse.js"></script>
	<script src="${contextPath}/resources/js/trainerView/bootsnav.js"></script>



	<script src="${contextPath}/resources/js/trainerView/plugins.js"></script>
	<script src="${contextPath}/resources/js/trainerView/main.js"></script>
	<script>

	$(".delete-btn").on("click",function(){
		console.log("가나")
		var no = $(this).attr("id")
		console.log(no)
		if(confirm("리뷰를 삭제하시겠습니까?")){
			
			$.ajax({
				url : "${contextPath}/member/deleteReview",
				data : {"reviewNo": no},
				success : function(result){
					if(result>0){
						alert("리뷰가 삭제되었습니다.")
						location.href="${contextPath}/trainer/trainerView/${trainer.trainerNo}"
					}else{
						alert("리뷰 삭제에 실패하였습니다.")
						location.href="${contextPath}/trainer/trainerView/${trainer.trainerNo}"
					}
				},error : function(){
					console.log("실패")
				}
				
			})
		}
	})
	</script>
</body>

</html>
