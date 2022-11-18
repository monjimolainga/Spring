<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<%--
/***********************************************************************************
 * @JSP FileName : donateMain.jsp
 * @Description : 후원하기 신청페이지 (후원하기 메뉴 메인화면) ----(1)
 *
 * @author 이하영
 * @since 2022. 11. 14.
 * @version 1.0
 * << 개발이력 >>
 *
 *  수정일                           수정자                  수정내용
 *  ------------    --------    ---------------------------
 *  2022.11.14		이하영		최초생성
***********************************************************************************/
--%>
<!DOCTYPE html>
<html>
<head>
<title>후원하기</title>
<meta charset="UTF-8">
<style type="text/css">
	.form-group {
		float: none;
		margin: 0 auto;
	}
	
	input[name=donorType]:hover {
		background : #000;
	}
</style>
<script src="/resources/assets/jquery.min.js"></script>
<script src="/resources/assets/jquery.form.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript">
/* ######### 공통 validation 체크 #########*/
// 01. 숫자만 입력 가능
function fn_onlyNum(num){
	var regExp = /^[0-9]*$/;
	if(!regExp.test(num)){
	  alert("<spring:message code='error.only.input.number'/>");
	  return false;
	}
	return true;
}

// 02. 이메일 형식 체크
function email_check(email) {
	var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	return reg.test(email);
}
/* ############################################ */

/* ######### 이메일 셀렉트 박스 제어 #########*/
function control(txt) {
	$("#emailDomain").val(txt.value);
}
/* ############################################ */

/* ######### 공통 천단위 자동 콤마 찍기 function #########*/
// 01. 천단위 콤마 찍기
function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}

// 01-1. 콤마 찍기
function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

// 01-2. 콤마 제거
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}
/* ############################################ */

/* ######### 공통 연락처 자동 하이픈 찍기 function #########*/
// 01. 연락처 자릿수 만큼 하이픈 찍기
function inputTelFormat(obj) {
	obj.value = autoHypenPhone(obj.value);
}

// 01-1. 하이픈 찍기
function autoHypenPhone(str){
	
	str = str.toString().replace(/[^0-9]/g, '');
  
	var tmp = '';
  
	if(str.length < 4){
		// 4자리 미만일떄
		return str;
	} else if(str.length < 7){
		// 7자리 미만일때
		tmp += str.substr(0, 3);
		tmp += '-';
  		tmp += str.substr(3);
  		return tmp;
	} else if(str.length < 11){
		// 11자리 미만일때
  		tmp += str.substr(0, 3);
  		tmp += '-';
  		tmp += str.substr(3, 3);
  		tmp += '-';
  		tmp += str.substr(6);
  		return tmp;
	} else {
		// 외국번호 같은 경우
  		tmp += str.substr(0, 3);
  		tmp += '-';
  		tmp += str.substr(3, 4);
  		tmp += '-';
  		tmp += str.substr(7);
  		return tmp;
	}
	return str;
}

// 01-2. 하이픈 제거
function unAutoHypenPhone(str) {
	str = String(str);
	return str.replace(/-/g, '');
}
/* ############################################## */
</script>
</head>
<body>
<div class="container">
	<h2 style="font-weight: bold;">후원하기</h2>
	<hr>
	<section id="registDonate">
		<form:form modelAttribute="donationVO" id="donateForm" name="donateForm" method="post" role="form" enctype="multipart/form-data">
			<!-- 01. 후원구분 (정기 / 일시 / 후원)  -->
			<div class="form-group row">
				<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>후원구분</strong></label>
				<div class="col-md-10">
					<div class="btn-group btn-group-toggle" style="display: block; text-align: left;" data-toggle="buttons">
						<label class="col-3 btn btn-light">
							<input type="radio" name="donaType" id="donaType1" value="1">정기후원
						</label>
						<label class="col-3 btn btn-light">
							<input type="radio" name="donaType" id="donaType2" value="2">일시후원
						</label>
						<label class="col-3 btn btn-light">
							<input type="radio" name="donaType" id="donaType3" value="3">후원 증액
						</label>
					</div>
				</div>
			</div><br>
			<!-- 02. 후원자 구분 (개인 / 단체)  -->
			<div class="form-group row">
				<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>후원자 구분</strong></label>
				<div class="col-md-10">
					<div class="btn-group btn-group-toggle" style="display: block; text-align: left;" data-toggle="buttons">
						<label class="col-5 btn btn-light">
							<input type="radio" name="donorType" id="donorType1" value="1">개인
						</label>
						<label class="col-5 btn btn-light">
							<input type="radio" name="donorType" id="donorType2" value="2">기업/단체
						</label>
					</div>
				</div>
			</div><br>
			<!-- 03. 후원금액  -->
			<div class="form-group row">
				<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>후원금액</strong></label>
				<div class="col-md-10">
					<div class="btn-group btn-group-toggle" style="display: block; text-align: left;" data-toggle="buttons">
						<label class="col-2 btn btn-light donaAmount">
							<input type="radio" name="donaAmount" id="donaAmount1" value="10000">10,000
						</label>
						<label class="col-2 btn btn-light donaAmount">
							<input type="radio" name="donaAmount" id="donaAmount2" value="30000">30,000
						</label>
						<label class="col-2 btn btn-light donaAmount">
							<input type="radio" name="donaAmount" id="donaAmount3" value="50000">50,000
						</label>
						<label class="col-3 btn" for="amountLabel">
							<input type="text" id="amountLabel" name="donaAmount" placeholder="직접입력" value="" class="form-control" onkeyup="inputNumberFormat(this)"/>
						</label> 
					</div> 
				</div>
			</div>
			<hr class="col-md-10 text-center" style="background-color: #28a745;">
			
<!-- 개인 선택시 View { -->
			<div align="left" id="personalDiv" class="tab-content">
				<div class="form-group row">
					<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>이름</strong></label>
					<div class="col-sm-5">
						<input type="text" maxlength="150" name="donorName" id="psDonorName" value="" placeholder="이름을 입력하세요" class="form-control"/>
					</div>
					<div class="col-sm-5">
						<div class="form-check">
						    <input type="checkbox" class="form-check-input" id="noNameChkBox1">
						    <label class="form-check-label" for="noNameChkBox1"><font color="red">익명기부가 가능합니다</font></label> 
					  	</div>
					</div>
				</div>
			</div>
<!-- } 개인 선택시 View -->
<!-- 단체 선택시 View { -->
			<div align="left" id="allDiv" class="tab-content">
				<div class="form-group row">
					<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>기업(단체)명</strong></label>
					<div class="col-sm-5">
						<input type="text" maxlength="150" name="donorName" id="allDonorName" value="" placeholder="기업(단체)명을 입력하세요" class="form-control"/>
					</div>
					<div class="col-sm-5">
						<div class="form-check">
						 	<input type="checkbox" class="form-check-input" id="noNameChkBox2">
						    <label class="form-check-label" for="noNameChkBox2"><font color="red">익명기부가 가능합니다</font></label> 
						</div>
					</div>
				</div>
			</div><br>
<!-- } 단체 선택시 View -->
			
			<!-- 04.연락처 -->
			<div class="form-group row">
				<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>연락처</strong></label>
				<div class="col-md-5">
					<input type="text"  id="donorTelNum" name="donorTel" value="" placeholder="연락처를 입력하세요" class="form-control" onkeyup="inputTelFormat(this)"/>
				</div>
			</div><br>
			
			<!-- 05. 이메일 -->
			<div class="form-group row">
				<input type="hidden" id="emailAddress" name="donorEmail" value=""/>
				<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>이메일</strong></label>
				<div class="col-md-8">
					<div class="input-group">
						<input type="text" maxlength="100" id="emailId" class="form-control"  value="">&nbsp; 
					 	<div class="input-group-prepend">
					 		@
					 	</div>&nbsp; 
					 	<input type="text" id="emailDomain" class="form-control" placeholder="naver.com" value="">&nbsp; 
					 	<select class="form-control" id="selectEmail" onchange="javascript:control(this)">
					 		<option value="" selected="selected">직접입력</option>
						    <option value="naver.com">naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="nate.com">nate.com</option>
							<option value="yahoo.co.kr">yahoo.co.kr</option>
							<option value="empas.com">empas.com</option>
							<option value="dreamwiz.com">dreamwiz.com</option>
							<option value="freechal.com">freechal.com</option>
							<option value="lycos.co.kr">lycos.co.kr</option>
							<option value="korea.com">korea.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hanmir.com">hanmir.com</option>
		 					<option value="paran.com">paran.com</option>
					 	</select>
					</div>
				</div>
			</div><br>
			<hr class="col-md-10 text-center" style="background-color: #28a745;">
			
			<!-- 06. 결제수단 -->
			<!-- 06-1. 정기후원 및 후원증액 선택한경우 -->
			<div align="left" id="regAndPlusDiv" class="tab-content">
				<div class="form-group row">
					<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>결제수단</strong></label>
					<div class="col-10">
						<div class="btn-group btn-group-toggle" style="display: block; text-align: left;" data-toggle="buttons">
							<label class="col-5 btn btn-light">
								<input type="radio" name="payMethod" id="payMethod1" value="1">자동이체 
							</label>
							<label class="col-5 btn btn-light">
								<input type="radio" name="payMethod" id="payMethod2" value="2">신용카드 
							</label>
						</div>
					</div>
				</div>
			</div>
			<!-- 06-2. 일시후원 선택한경우 -->
			<div align="left" id="tempDiv" class="tab-content">
				<div class="form-group row">
	             	<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right"><strong>결제수단</strong></label>
	             	<div class="col-10">
	             		<div class="btn-group btn-group-toggle" style="display: block; text-align: left;" data-toggle="buttons">
	             			<label class="col-5 btn btn-light">
							   <input type="radio" name="payMethod" id="payMethod3" value="3">실시간 계좌이체  
							</label>
							<label class="col-5 btn btn-light">
							   <input type="radio" name="payMethod" id="payMethod4" value="4">신용카드 
							</label>
	             		</div>
	             	</div>
				</div>
			</div><br>
			<!-- 자동이체 -->
			<div align="left" id="autoPayDiv" class="tab-content">
				<div class="form-group row">
					<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right">은행명</label>
				</div>
			</div>
			<!-- 신용카드 -->
			<div align="left" id="creditDiv" class="tab-content">
				<div class="form-group row">
					<label for="inputHorizontalSuccess" class="col-sm-2 col-form-label text-right border-right">결제카드</label>
				</div>
			</div>
			<div>
				<button type="submit" class="btn btn-primary mt-3" id="goDonateBtn" onclick="fncRegist();return false;">신청하기</button>
			</div>
		</form:form>
	</section>
</div>
<script type="text/javascript">
	// 데이터 null 체크
	var isEmpty = function(data){
		if(typeof(data) === 'object'){
			if(JSON.stringify(data) === '{}' || JSON.stringify(data) === '[]'){
				return true;
			} else if(!data){
				return true;
			}
			return false;
		} else if (typeof(data) === 'string'){
			if(!data.trim()){
				return true;
			}
			return false;
		} else if (typeof(data) === 'undefined'){
			return true;
		} else{
			return false;
		}
	}
	
	// 특수문자 방지 체크
	function removeSpecialChar(event) {
		var reg = /^[가-힣a-zA-Z\s.,!()_0-9]+$/gi;
		
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else if(reg.test(event.target.value))
			//console.log("특수문자X");
			event.target.value = event.target.value.substring(0, event.target.value.length - 1);
	}
	
	// 바로실행
	$(document).ready(function() {
		
		/* ###################### 개인 / 단체 구분하기  ###################### */
		$("#personalDiv").show();
		$("#allDiv").hide();
		
		$('input[name="donorType"]').click(function () {
	          
	          var donorTypeVal = $('input[name="donorType"]:checked').val();
	          // console.log(donorTypeVal);
	          
	          if(!isEmpty(donorTypeVal)) {
	        	  if(donorTypeVal == '1') {
	        		  $("#personalDiv").show();
	        		  $("#allDiv").hide();
	        	  } else if(donorTypeVal == '2') {
	        		  $("#allDiv").show();
	        		  $("#personalDiv").hide();
	        	  } else {
	        		  $("#personalDiv").show();
	        	  }
	          }
		});
		/* ########################################################### */
		
		/* ###################### 직접입력에 focus가 간 경우에 기존 후원금액 선택한거 해제하기 (value 처리 포함) ###################### */
		var dAmountInput = $("#amountLabel");
		
		// 01. Input에 focus가 맞춰진 경우
		dAmountInput.focus(function(){
			$('label.donaAmount').removeClass('active');
			$('label.donaAmount').prop("disabled",true);
		});
		
		if($("label.donaAmount").hasClass("active") === true) {
			dAmountInput.blur();
			dAmountInput.val("");
		} 
		
		// 02. 직접입력을 하고 금액을 선택한경우 직접입력값 초기화
		if(!isEmpty(dAmountInput)) {
			$('input[name="donaAmount"]').click(function () {
				dAmountInput.val("");
			});
		}
		/* ######################################################################################################## */
		
		/* ###################### 익명기부 선택에 따른 이름 입력부분 focus ###################### */
		// 01. 개인 이름 작성할경우
		var noNameChkYn1 = $("#noNameChkBox1");	
		
	  	noNameChkYn1.on('change', function() {
	  		 if($(this).is(':checked')) { // 체크박스 선택
	  			$("#psDonorName").attr("readonly",true);
	  			$("#psDonorName").val("");
	  		 } else {	// 체크박스 선택해제
	  			 $("#psDonorName").attr("readonly",false);
	  		 }
	  	});
	  	
	  	// 02. 기업/단체명 작성할 경우
	  	var noNameChkYn2 = $("#noNameChkBox2");
	  	
	  	noNameChkYn2.on('change', function() {
	  		if($(this).is(':checked')) { // 체크박스 선택
	  			$("#allDonorName").attr("readonly",true);
	  			$("#allDonorName").val("");
	  		 } else {	// 체크박스 선택해제
	  			 $("#allDonorName").attr("readonly",false);
	  		 }
	  	});
		/* ######################################################################### */
		
	  	/* ###################### 후원타입 구분하기 (정기&증액, 일시)  ###################### */
	  	$("#regAndPlusDiv").show();
		$("#tempDiv").hide();
		
		$('input[name="donaType"]').click(function () {
			
			var donaTypeVal = $('input[name="donaType"]:checked').val();
			
			if(!isEmpty(donaTypeVal)) {
        	  	if(donaTypeVal == '1' || donaTypeVal == '3') {	// 정기후원 & 후원증액
        		  	$("#regAndPlusDiv").show();
        		  	$("#tempDiv").hide();
        	  	} else if(donaTypeVal == '2') {	// 일시후원
       		 	 	$("#tempDiv").show();
        		  	$("#regAndPlusDiv").hide();
        	  	} else {
        		  	$("#regAndPlusDiv").show(); // default
        	  	}
          	}
		});
	  	/* ######################################################################### */
	  	
		/* 정기-자동이체/신용카드 구분하기 */
		$("#autoPayDiv").show();
		$("#creditDiv").hide();
		
		$('input[name="payMethod"]').click(function () {
	          
	          var payMethodVal = $('input[name="payMethod"]:checked').val();
	          console.log(payMethodVal);
	          
	          if(!isEmpty(payMethodVal)) {
	        	  if(payMethodVal == '1') {
	        		  $("#autoPayDiv").show();
	        		  $("#creditDiv").hide();
	        	  } else if(payMethodVal == '2') {
	        		  $("#creditDiv").show();
	        		  $("#autoPayDiv").hide();
	        	  } else {
	        	  }
	          }
		});

	});
	
	// 후원신청하기
	function fncRegist() {
		
		// 01. 후원구분 validation 체크
		var donaTypeChkYn = $('input[name=donaType]:checked').val();
		if(isEmpty(donaTypeChkYn)) {
			alert("<spring:message code='donate.error.donaType'/>");
			return;
		} // 01
		
		// 02. 후원자구분을 validation 체크
		var donorTypeChkYn = $('input[name=donorType]:checked').val();
		if(isEmpty(donorTypeChkYn)) {
			alert("<spring:message code='donate.error.donarType'/>")
			return;
		} // 02
		
		// 03. 후원금액 validation 체크  (직접입력 하는경우 -> 체크하지 않음, 직접입력 하지 않는 경우 -> 체크함)
		var donaAmountChkYn = $('input[name=donaAmount]:checked').val();
		var amountLabelYn = $("#amountLabel").val();
		if(isEmpty(amountLabelYn)) {
			if(isEmpty(donaAmountChkYn)) {
				alert("<spring:message code='donate.error.select.donaAmount'/>");
				return;
			}
		} 
		
		if(!isEmpty(amountLabelYn)) {
			fn_onlyNum(uncomma(amountLabelYn));
			
			if(parseInt(uncomma(amountLabelYn)) < parseInt("10000")) {
				alert("<spring:message code='donate.error.minimum.donaAmount'/>");
				return;
			}
		} // 03
		
		// 04. 이름 validation 체크
		var noNameChkYn1 = $("#noNameChkBox1");			// 개인 익명 체크	
		var noNameChkYn2 = $("#noNameChkBox2");			// 단체 익명 체크
		
		var psDonorName = $("#psDonorName").val();		// 개인 이름
	  	var allDonorName = $("#allDonorName").val();	// 단체명
	  	
	  	// 04-1. 개인정보 입력시
	  	if($("#personalDiv").is(":visible")) {
		  	if(noNameChkYn1.is(":checked") == false) {
		  		if(isEmpty(psDonorName)) {
	  				alert("<spring:message code='donate.error.personal.donorName'/>");
	  				return;
	  			 }
		  	}
	  	}
	  	
	  	// 04-2. 기업(단체)정보 입력시
	  	if($("#allDiv").is(":visible")) {
		  	if(noNameChkYn2.is(":checked") == false) {
		  		if(isEmpty(allDonorName)) {
	  				alert("<spring:message code='donate.error.all.donorName'/>");
	  				return;
	  			}
		  	}
	  	} // 04
	  	
		
		// 05. 연락처 validation 체크
		//var donorTelNumYn = $("#donorTelNum").val();
		//
		//if(isEmpty(donorTelNumYn)) {
		//	alert("<spring:message code='donate.error.donorTelNum'/>");
		//	return;
		//}
		//
		//if(!isEmpty(donorTelNumYn)) {
		//	fn_onlyNum(unAutoHypenPhone(donorTelNumYn));
		//} // 05
		
		// 06. 이메일 validation 체크
		//var emailId = $("#emailId").val();
		//var emailDomain = $("#emailDomain").val();
		//
		//if(isEmpty(emailId) || isEmpty(emailDomain)) {
		//	alert("<spring:message code='donate.error.donorEmail'/>");
		//	return;
		//} 
		//
		//if(!isEmpty(emailId) && !isEmpty(emailDomain)) {
		//	$("#emailAddress").val(emailId + "@" + emailDomain); 
		//}
		//
		//var donorEmailYn = $("#emailAddress").val();
		//if(!isEmpty(donorEmailYn)) {
		//	if(!email_check(donorEmailYn)) {
		//		alert("<spring:message code='donate.error.donorEmail.form'/>");
		//		return;
		//	}
		//} // 06

		/* ###################### backup process (ajax로 controller내 기능 호출) ###################### */
		
// 재시도 필요...		
		$("#amountLabel").val(uncomma($("#amountLabel").val()));
		//$("#donorTelNum").val(unAutoHypenPhone($("#donorTelNum").val()));
		
		// 폼에 담은 모든데이터
		var data = $("#donateForm").serialize();
		console.log(data);
		
		if(confirm("<spring:message code='confirm.regist.donate'/>")) {
			$.ajax({
				 url : "/registDonate"
				,type : 'post'
				,data : data
			 	,dataType : "json"
			 	,contentType: "application/json;"
		 		,success: function (json) {
		 			// alert("<spring:message code='success.donate.regist'/>");
 			 	}
		 		,error: function (xhr, ajaxOptions, thrownError) {
		 			// alert("<spring:message code='fail.donate.regist'/>");
	 			}
			});
		} 
		
		/* ####################################################################################### */
	}
</script>
</body>
</html>