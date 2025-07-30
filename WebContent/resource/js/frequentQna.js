$(document).ready(function() {
        $(".txt").click(function() {
            $(this).closest("li").find(".subOl").slideToggle();
        });
    });
    
    $(document).ready(function() {
    	  $('.qnali').on('click', function() {
    	    // 클릭 슬라이드
    	    $(this).next('.css-d3v9zr').slideToggle();
    	  });
    });
    
    
    document.addEventListener('DOMContentLoaded', function() {
        const nextButton = document.querySelector('#next1'); // > 버튼
        const main = document.querySelector('.main'); // main div
        const main2 = document.querySelector('.main2'); // main2 div

        // '다음' 버튼 클릭 이벤트
        nextButton.addEventListener('click', function() {
            main.style.display = 'none'; // main 숨김
            main2.style.display = 'block'; // main2 보이기
        });
    });
    document.addEventListener('DOMContentLoaded', function() {
        const nextButton = document.querySelector('#prev'); // < 버튼
        const main = document.querySelector('.main'); // main div
        const main2 = document.querySelector('.main2'); // main2 div

        // '다음' 버튼 클릭 이벤트
        nextButton.addEventListener('click', function() {
            main.style.display = 'block'; // main2 숨김
            main2.style.display = 'none'; // main 보이기
        });
    });