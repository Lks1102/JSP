/**
 * 이메일 체크
 */
	// Email Auth
$(function(){
	
	let preventDoubleClick = false;
	
	$('#btnEmailCode').click(function(){
		
		const type = $('input[name=type]').val();
		const uid = $('input[name=uid]').val();
		const name = $('input[name=name]').val();
		const email = $('input[name=email]').val();
				
		const jsonData = {
			"type": type,
			"uid": uid,
			"name": name,
			"email": email
		};
		
		if(preventDoubleClick){
			return;
		}
		
		preventDoubleClick = true;
		$('.resultEmail').text('인증코드 전송 중 입니다. 잠시만 기다리세요...');
		$('.resultEmailForId').text('인증코드 전송 중 입니다. 잠시만 기다리세요...');
		$('.resultEmailForPass').text('인증코드 전송 중 입니다. 잠시만 기다리세요...');
		
		setTimeout(function(){
			
			$.ajax({
				url:'/Jboard2/user/authEmail.do',
				type: 'GET',
				data: jsonData,
				dataType: 'json',
				success: function(data){
					console.log(data);
					
					if(data.result > 0){						
						$('.resultEmail').css('color', 'red').text('이미 사용중인 이메일 입니다.');
						isEmailOk = false;
						
						if(data.status > 0){
							$('.resultEmailForId').css('color', 'green').text('이메일을 확인 후 인증코드를 입력하세요.');
							$('.resultEmailForPass').css('color', 'green').text('이메일을 확인 후 인증코드를 입력하세요.');
							$('input[name=auth]').prop('disabled', false);
						}else{
							$('.resultEmailForId').css('color', 'red').text('인증코드 전송이 실패했습니다. 잠시후 다시 시도하십시요.');
							$('.resultEmailForPass').css('color', 'red').text('인증코드 전송이 실패했습니다. 잠시후 다시 시도하십시요.');
						}
						
					}else{
						if(data.status > 0){
							$('.resultEmail').css('color', 'green').text('이메일을 확인 후 인증코드를 입력하세요.');
							$('.auth').show();
							$('input[name=email]').attr('readonly', true);
						}else{
							$('.resultEmail').css('color', 'red').text('인증코드 전송이 실패했습니다. 잠시후 다시 시도하십시요.');
							$('.resultEmailForId').css('color', 'red').text('해당하는 사용자, 이메일이 일치하지 않습니다.');
							$('.resultEmailForPass').css('color', 'red').text('해당하는 아이디, 이메일이 일치하지 않습니다.');
						}
						
					}
					
					preventDoubleClick = false;
				}				
			});
		}, 1000);
	});
	
	$('#btnEmailAuth').click(function(){
		const code = $('input[name=auth]').val();
		const jsonData = {
			"code": code
		};
				
		$.ajax({
			url: '/Jboard2/user/authEmail.do',
			type: 'POST',
			data: jsonData,
			dataType: 'json',
			success: function(data){
				
				console.log(data);
				
				if(data.result > 0){
					$('.resultEmail').css('color', 'green').text('이메일 인증이 완료 되었습니다.');
					$('.resultEmailForId').css('color', 'green').text('이메일 인증이 완료 되었습니다.');
					$('.resultEmailForPass').css('color', 'green').text('이메일 인증이 완료 되었습니다.');
					isEmailOk = true;
				}else{
					$('.resultEmail').css('color', 'red').text('이메일 인증이 실패 했습니다.다시 시도하십시요.');
					$('.resultEmailForId').css('color', 'red').text('이메일 인증이 실패 했습니다.다시 시도하십시요.');
					$('.resultEmailForPass').css('color', 'red').text('이메일 인증이 실패 했습니다.다시 시도하십시요.');
					isEmailOk = false;
				}
				
			}
		});
	});
});
