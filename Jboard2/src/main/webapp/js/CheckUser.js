/**
 * 사용자 중복체크
 */

$(function(){

	// ID 중복 체크
	const inputUid = document.getElementsByName('uid')[0];
	const uidResult = document.getElementsByClassName('uidResult')[0];
	const btnCheckUid = document.getElementById('btnCheckUid');

	if(btnCheckUid != null){

		btnCheckUid.onclick = function(){

			const uid = inputUid.value;

			if(!uid.match(reUid)){

				uidResult.innerText = '유효한 아이디가 아닙니다.';
				uidResult.style.color = 'red';
				isUidOk = false;
				return;
			}

			const xhr = new XMLHttpRequest();
			xhr.open('GET', '/Jboard2/user/checkUid.do?uid='+uid);
			xhr.send();

			xhr.onreadystatechange = function(){

				if(xhr.readyState == XMLHttpRequest.DONE){

					if(xhr.status == 200){

						const data = JSON.parse(xhr.response);

						if(data.result > 0){
							uidResult.innerText = '이미 사용중인 아이디 입니다.';
							uidResult.style.color = 'red';
							isUidOk = false;
							}else{
							uidResult.innerText = '사용 가능한 아이디 입니다.';
							uidResult.style.color = 'green';
							isUidOk = true;
						}
					}
				}// readyState end
			}// onreadystatechange end
		}// btnCheckUid onclick end
	}
	// Nick 중복체크
	$('#btnCheckNick').click(function(){

		const nick = $('input[name=nick]').val();

		if(!nick.match(reNick)){
			$('.nickResult').css('color', 'red').text('유효한 별명이 아닙니다.');
			isNickOk = false;
			return;
		}

		$.ajax({
			url:'/Jboard2/user/checkNick.do?nick='+nick,
			type:'get',
			dataType:'json',
			success: function(data){

				if(data.result > 0){
					$('.nickResult').css('color', 'red').text('이미 사용중인 별명입니다.');
				}else{
					$('.nickResult').css('color', 'green').text('사용 가능한 별명입니다.');
				}

			}
		});

	});// btnCheckNick end

	// Hp 중복체크
	$('input[name=hp]').focusout(function(){

		const hp = $(this).val();

			if(!hp.match(reHp)){
				$('.resultHp').text('휴대폰 번호가 유효하지 않음');
				isHpOk = false;
				return;
			}

		const url = '/Jboard2/user/checkHp.do?hp='+hp;

		$.get(url, function(data){

			if(data.result > 0){
				$('.hpResult').css('color', 'red').text('이미 사용중인 휴대폰입니다.');
				isHpOk = false;
			}else{
				$('.hpResult').css('color', 'green').text('사용 가능한 휴대폰입니다.');
				isHpOk = true;
			}

		});
	});

});// onload end