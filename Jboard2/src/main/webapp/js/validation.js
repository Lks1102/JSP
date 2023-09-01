/**
 * 
 */

 
	// 폼 데이터 검증 상태변수
	let isUidOk = false;
	let isPassOk = false;
	let isNameOk = false;
	let isNickOk = false;
	let isEmailOk = false;
	let isHpOk = false;
	
	// 데이터 검증에 사용하는 정규표현식
	const reUid   = /^[a-z]+[a-z0-9]{4,19}$/g;
	const rePass  = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{5,16}$/;
	const reName  = /^[가-힣]{2,10}$/;
	const reNick  = /^[a-zA-Zㄱ-힣0-9][a-zA-Zㄱ-힣0-9]*$/;
	const reEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	const reHp    = /^01(?:0|1|[6-9])-(?:\d{4})-\d{4}$/;
	
	// 유효성 검사
	
	$(function() {
		
		// 아이디 검사
		$('input[name=uid]').keydown(function() {
			$('.uidResult').text('');
			isUidOk = false;
		});
		
		// 비밀번호 검사
		
		$('input[name=pass2]').focusout(function() {
			const pass1 = $('input[name=pass1]').val();
			const pass2 = $('input[name=pass2]').val();
			
			if(pass1 == pass2){
				
				if(pass2.match(rePass)){
					$('.passResult').css('color', 'green').text('가능');
					isPassOk = true;
				}else{
					$('.passResult').css('color', 'red').text('다시');
					isPassOk = false;
				}
								
			}else{
				$('.passResult').css('color', 'red').text('비밀번호가 일치하지 않음');
				isPassOk = false;
			}
		});
		
		// 이름 검사
		
		$('input[name=name]').focusout(function() {
			
			const name = $(this).val();
			
			
			if(name.match(reName)){
				$('.nameResult').text('');
				isNameOk = true;
			}else{
				$('.nameResult').css('color', 'red').text('유효한 이름 아님');
				isNameOk = false;
			}
			
		});
		
		// 별명 검사
		
		$('input[name=nick]').keydown(function() {
			$('.nickResult').text('');
			isNickOk = false;
		});
		
		// 이메일 검사

		$('input[name=email]').keydown(function() {
			$('.resultEmail').text('');
			isNickOk = false;
		});

		
		// 휴대폰 검사
		
		$('input[name=hp]').keydown(function() {
			
			$('.hpResult').text('');
			isNickOk = false;
		});

		
		// 최종확인
		$('#formUser').submit(function() {
			
			if(!isUidOk){
				
				alert('아이디 다시 확인');
				return false;
			}
			
			if(!isPassOk){
				
				alert('암호 다시 확인');
				return false;
			}
			
			if(!isNameOk){
				
				alert('이름 다시 확인');
				return false;
			}
			
			if(!isNickOk){
				
				alert('별명 다시 확인');
				return false;
			}
			
			if(!isEmailOk){
				
				alert('이메일 다시 확인');
				return false;
			}
			
			if(!isHpOk){
				
				alert('연락처 다시 확인');
				return false; // 폼 전송 취소
			}
			
			return true; // 폼 전송 시작
		});
	});
