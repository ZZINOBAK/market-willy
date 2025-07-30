$.ajax({
	url : "getNotAnswerQna",
	type : "get",
	dataType : "json",
	success : function(respData){
		//alert(">> Ajax 처리 : " + respData); 
		console.log(respData);
		console.log(respData.list);
		
		let htmlTag = "";
		let alist = respData.list;
		
		$.each(alist, function(index, member){
			htmlTag += "<tr>"
			htmlTag += "<td class='centers'>" + this.qnaNum + "</td>"
			htmlTag += "<td class='centers'>" + this.id + "</td>"
			htmlTag += "<td class='centers'>" + this.qnaTitle + "</td>"
			htmlTag += "<td class='centers'>" + this.qnaPwd + "</td>"
			htmlTag += "<td class='centers'>" + new Date(this.qnaDate).toLocaleDateString() + "</td>"
			htmlTag += "<td><a href='javascript:void(0)' onclick='removeQna(\"" + this.qnaNum + "\")' class='rainbow'>게시글 제거</a></td>"
			htmlTag += "<td><a href='javascript:void(0)' onclick='answerQna(\"" + this.qnaNum + "\")' class='rainbow'>답변하기</a></td>"
			htmlTag += "</tr>"
		})
		$("#tbodyNotAnswer").html(htmlTag);
		
	},
	error : function(jqXHR, textStatus, errorThrown){
		alert(">> Ajax 처리 실패 : \n"
				+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
				+ "textStatus : " + textStatus + "\n"
				+ "errorThrown : \n" + errorThrown);
	}
});

$.ajax({
	url : "getAnswerQna",
	type : "get",
	dataType : "json",
	success : function(respData){
		//alert(">> Ajax 처리 : " + respData); 
		console.log(respData);
		console.log(respData.list);
		
		let htmlTag = "";
		let alist = respData.list;
		
		$.each(alist, function(index, member){
			htmlTag += "<tr>"
			htmlTag += "<td class='centers'>" + this.qnaNum + "</td>"
			htmlTag += "<td class='centers'>" + this.id + "</td>"
			htmlTag += "<td class='centers'>" + this.qnaTitle + "</td>"
			htmlTag += "<td class='centers'>" + this.qnaPwd + "</td>"
			htmlTag += "<td class='centers'>" + new Date(this.qnaDate).toLocaleDateString() + "</td>"
			htmlTag += "<td><a href='javascript:void(0)' onclick='removeQna(\"" + this.qnaNum + "\")' class='rainbow'>게시글 제거</a></td>"
			htmlTag += "</tr>"
		})
		$("#tbodyAnswer").html(htmlTag);
		
	},
	error : function(jqXHR, textStatus, errorThrown){
		alert(">> Ajax 처리 실패 : \n"
				+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
				+ "textStatus : " + textStatus + "\n"
				+ "errorThrown : \n" + errorThrown);
	}
});

function removeQna(qnaNum) {
    if (confirm("게시글을 제거하시겠습니까?")) {
        window.location.href = "removeQna.jsp?qnaNum=" + qnaNum;
    }
}
function answerQna(qnaNum) {
    if (confirm("문의번호 '" + qnaNum + "'번 게시글의 답변을 작성하시겠습니까?")) {
        window.location.href = "answerQna.jsp?qnaNum=" + qnaNum + "&id=admin";
    }
}
	