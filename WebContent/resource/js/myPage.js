function delete_btn(){
		location.href="deleteCustomer.jsp";
	}
	
	function btn_back(){
		location.href="../main_login.jsp";
	}
	
	document.addEventListener("DOMContentLoaded", function() {
	    document.querySelector("#submit_check_pw2").addEventListener("keyup", function() {
	        var password = document.querySelector("#submit_check_pw").value;
	        var passwordConfirm = this.value;
	          
	        if (password === passwordConfirm) {
	            var T = document.querySelector("#msg_pw");
	            T.textContent = "비밀번호가 일치합니다.";
	            T.style.color = "blue";
	        } else {
	            var F = document.querySelector("#msg_pw");
	            F.textContent = "비밀번호가 일치하지 않습니다.";
	            F.style.color = "red";
	        }
	    });
	});
	
	document.addEventListener("DOMContentLoaded", function() {
	    document.querySelector("#submit_check_phone").addEventListener("keyup", function() {
	        var phone = this.value;
	          
	        if (phone.length != 13 || phone.indexOf('-') == -1) {
	            var F = document.querySelector("#phone_chk");
	            F.textContent = "번호 형식에 맞춰주세요.";
	            F.style.color = "red";
	        }else{
	        	var F = document.querySelector("#phone_chk");
	        	F.textContent = "";
	        }
	    });
	});
	
	document.addEventListener("DOMContentLoaded", function() {
	    document.querySelector("#submit_check_name").addEventListener("change", function() {
	    	const regex = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	        var name = this.value;
	          
	        if (regex.test(name) === false) {
	            var F = document.querySelector("#name_chk");
	            F.textContent = "한글로 입력해주세요.";
	            F.style.color = "red";
	        }else{
	        	var F = document.querySelector("#name_chk");
	        	F.textContent = "";
	        }
	    });
	});
	
	function checkedEmail(){
		var email = $("#submit_check_email").val(); //중복체크할 이메일
		
		$.ajax({
			url : "emailCheckController",
			type : "GET",
			data : { email: email },
			dataType : 'text',
			success : function(respData){
				console.log("respData : " + respData.charAt(0));
				if(respData.charAt(0) === "-"){
					$("#msg_email").text(respData).css("color", "red");;
				}else{
					$("#msg_email").text(respData).css("color", "blue");
				}
			},
			error : function(request, status, error){
				console.log(error);
			}
		});
		
	};
	