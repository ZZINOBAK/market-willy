document.addEventListener("DOMContentLoaded", function() {
    var buttons = document.querySelectorAll('.styled-button');
    for (var i = 0; i < buttons.length; i++) {
        buttons[i].addEventListener('click', function() {
            // 버튼이 클릭되었을 때 실행되는 코드
            var qnaNum = this.getAttribute('data-qnaNum');
            var nowPage = this.getAttribute('data-nowPage');
            var id = this.getAttribute('data-id');
            var serverPassword = this.getAttribute('data-password');
            
            if(String(serverPassword.trim()) === ''){
            	var url = 'view.jsp?qnaNum=' + qnaNum + '&cPage=' + nowPage + '&id=' + id;
                window.location.href = url;
            	return;
            }
            
            var enteredPassword = prompt('비밀번호를 입력하세요:'); // 사용자로부터 비밀번호 입력 받기
            
            if (String(enteredPassword) === String(serverPassword)) {
                // 비밀번호가 일치하는 경우 페이지로 이동
                var url = 'view.jsp?qnaNum=' + qnaNum + '&cPage=' + nowPage + '&id=' + id;
                window.location.href = url;
            } else {
                alert('비밀번호가 틀렸습니다. 다시 시도하세요.');
            }
        });
    }
});