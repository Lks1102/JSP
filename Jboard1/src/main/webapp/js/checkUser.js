/**
 * 	사용자 개인정보 체크
 */
	$(function() {
		// 사용자 개인정보 중복체크
		
		// ID중복체크
		$('#btnCheckUid').click(function() {
			
			const uid = $('input[name=uid]').val();
			
			if(!uid.match(reUid)){
				$('.resultId').css('color', 'red').text('유효한 아이디X 다시.');
				isUidOk = false;
				return; // 종료
			}
			
			const jsonData = {
					"uid":uid
			};
			
			$.ajax({
				url:'/Jboard1/user/checkUid.jsp',
				type:'GET',
				data: jsonData,
				datatype:'json',
				success:function(data){
					if(data.result >= 1){
						$('.resultId').css('color', 'red').text('사용중인 아이디 입니다.');
						isUidOk = false;
					}else{
						$('.resultId').css('color', 'green').text('사용가능한 아이디 입니다.');
						isUidOk = true;
					}
				}
			});
			
		});// 아이디 중복체크 end
		
			// nick 중복체크
		$('input[name=nick]').focusout(function() {
			
			// 입력데이터 가져오기
			const nick = $(this).val();
			
			if(!nick.match(reNick)){
				$('.resultNick').css('color', 'red').text('다시');
				isNickOk = false;
				return;
			}
			
			console.log('nick : ' + nick);
			
			const jsonData = {
					"nick": nick
			};
			
			$.get('/Jboard1/user/checkNick.jsp', jsonData, function(data){
				if(data.result >= 1){
					$('.resultNick').css('color', 'red').text('사용중인 닉네임 입니다.');
					isNickOk = false;
				}else{
					$('.resultNick').css('color', 'green').text('사용가능한 닉네임 입니다.');
					isNickOk = true;
				}
			});
			
			
		}); // nick 중복체크 끝
		
		// email 중복체크
		document.getElementsByName('email')[0].onfocusout = function(){
			
			const resultEmail = document.getElementById('resultEmail');
			
			// 입력 데이터 가져오기
			const email = this.value;
			
			if(!email.match(reEmail)){
				resultEmail.innerText = '다시.';
				resultEmail.style.color = 'red';
				isEmailOk = false;
				return;
			}
				
			
				
			// 데이터 전송
			const xhr = new XMLHttpRequest();
			xhr.open('GET', '/Jboard1/user/checkEmail.jsp?email='+email);
			xhr.send();
			
			// 응답 결과
			xhr.onreadystatechange = function(){    				
				if(xhr.readyState == XMLHttpRequest.DONE){						
					if(xhr.status == 200){
						const data = JSON.parse(xhr.response);
						console.log('data : ' + data);
						
						const resultEmail = document.getElementById('resultEmail');
						
						if(data.result >= 1){
							resultEmail.innerText = '이미 사용중인 이메일.';
							resultEmail.style.color = 'red';
							isEmailOk = false;
							return;
						}else{
							resultEmail.innerText = '사용 가능한 이메일.';
							resultEmail.style.color = 'green';
							isEmailOk = true;
						}
					}
				}    				
			}// onreadystatechange end
		} // 이메일 중복체크 끝
	
		// 휴대폰 중복체크
		document.getElementsByName('hp')[0].addEventListener('focusout', function() {
			const resultHp = document.getElementById('resultHp');
			const hp = this.value;
			
			if(!hp.match(reHp)){
				resultHp.innerText = '전화번호 = 숫자, 다시';
				resultHp.style.color = 'red';
				isHpOk = false;
				return;
			}
			
			const url = '/Jboard1/user/checkHp.jsp?hp='+this.value;
			fetch(url)
					.then(response => response.json())
					.then(data => {
						
						console.log(data);

						
						if(data.result >= 1){
							resultHp.innerText = '사용중인 전화번호';
							resultHp.style.color = 'red';
							isHpOk = false;
							return;
						}else{
							resultHp.innerText = '사용가능한 전화번호';
							resultHp.style.color = 'green';
							isHpOk = true;
						}
						
					});
			
		});// 휴대폰중복체크 end
		
	}); // 사용자 개인정보 중복체크 end