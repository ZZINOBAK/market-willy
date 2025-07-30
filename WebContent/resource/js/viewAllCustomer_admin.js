$.ajax({
	url : "getAllCustomer",
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
			htmlTag += "<td class='centers'>" + this.id + "</td>"
			htmlTag += "<td class='centers'>" + this.name + "</td>"
			htmlTag += "<td class='centers'>" + this.pwd + "</td>"
			htmlTag += "<td class='centers'>" + this.phone + "</td>"
			htmlTag += "<td class='centers'>" + this.zip + "</td>"
			htmlTag += "<td class='centers'>" + this.addr + "</td>"
			htmlTag += "<td class='centers'>" + this.addr2 + "</td>"
			htmlTag += "<td class='centers'>" + new Date(this.regdate).toLocaleDateString() + "</td>"
			htmlTag += "<td><a href='javascript:void(0)' onclick='removeCustomer(\"" + this.id + "\", \"" + this.pwd + "\")'>회원 제거</a></td>"
			htmlTag += "</tr>"
		})
		$("#tbody").html(htmlTag);
		
	},
	error : function(jqXHR, textStatus, errorThrown){
		alert(">> Ajax 처리 실패 : \n"
				+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
				+ "textStatus : " + textStatus + "\n"
				+ "errorThrown : \n" + errorThrown);
	}
});

function removeCustomer(id, pwd) {
    if (confirm("회원을 제거하시겠습니까?")) {
        window.location.href = "removeCustomer.jsp?id=" + id + "&pwd=" + pwd;
    }
}