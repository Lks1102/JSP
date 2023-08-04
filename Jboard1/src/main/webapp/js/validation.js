/**
 * 유효성 검사
 */

	// 폼 데이터 검증결과 상태변수
	let isUidOk		= false;
	let isPassOk 	= false;
	let isNameOk 	= false;
	let isNickOk 	= false;
	let isEmailOk	= false;
	let isHpOk 		= false;
	
	// 데이터 검증에 사용하는 정규표현식
	let reUid   = /^[a-z]+[a-z0-9]{4,19}$/g;
	let rePass  = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{5,16}$/;
	let reName  = /^[가-힣]{1,10}$/ 
	let reNick  = /^[a-zA-Zㄱ-힣0-9][a-zA-Zㄱ-힣0-9]*$/;
	let reEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	let reHp    = /^01(?:0|1|[6-9])-(?:\d{4})-\d{4}$/;
	
	
	// 유효성 검증(Validation)
	$(function() {
		
		// 아이디 검사
		$('input[name=uid]').keydown(function() {
			$('.resultId').text('');
			isUidOk = false;
		});
		
		// 비밀번호 검사
		
		$('input[name=pass2]').focusout(function() {
			
			const pass1 = $('input[name=pass1]').val();
			const pass2 = $('input[name=pass2]').val();
			
			if(pass1 == pass2){
										
				if(pass1.match(rePass)){
					$('.resultPass').css('color', 'green').text('사용가능한 비밀번호입니다.');
					isPassOk = true;
				}else{
					$('.resultPass').css('color', 'red').text('비밀번호는 숫자, 영문, 특수문자의 조합 및 5자 이상이여야 함');
					isPassOk = false;
				}
			}else{
				$('.resultPass').css('color', 'red').text('비밀번호가 일하지 않음');
				isPassOk = false;
			}
			
		});
		
		
		// 이름 검사
		$('input[name=name]').focusout(function() {
			
			const name = $('input[name=name]').val();
			
			if(name.match(reName)){
				$('.resultName').text('');
				isNameOk = true;
			}else{
				$('.resultName').css('color', 'red').text('이름=한글');
				isNameOk = false;
			}
			
		});
		
		//최종 전송
		$('#formUser').submit(function() {
			
			
			if(!isUidOk){
				alert('아이디');
				return false;// 폼 전송 취소
			}
			if(!isPassOk){
				alert('비번');
				return false;// 폼 전송 취소
			}
			if(!isNameOk){
				alert('이름');
				return false;// 폼 전송 취소
			}
			if(!isNickOk){
				alert('닉');
				return false;// 폼 전송 취소
			}
			if(!isEmailOk){
				alert('이멜');
				return false;// 폼 전송 취소
			}
			if(!isHpOk){
				alert('전번');
				return false;// 폼 전송 취소
			}
			
			
			return true;// 폼 전송 시작
		});//최종 전송 끝
		
	});// 검증 end
