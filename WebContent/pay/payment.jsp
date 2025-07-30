<%@ page import="com.mystudy.project.DAO.PayInfoDAO"%>
<%@ page import="com.mystudy.project.DAO.OrderListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mystudy.project.VO.PayInfoVO" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>	
<%@ page import="java.util.Arrays" %>	


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>결제 처리 중</title>
    
    
   <script>
   console.log()
   </script>
</head>
<body>
    <h1>결제 처리 중</h1>


   <%
   request.setCharacterEncoding("UTF-8");
   // 폼에서 입력한 정보를 받아옴
   String receiver = request.getParameter("receiver");
   String oAddr = request.getParameter("oAddr");
   String oPhone = request.getParameter("oPhone");
   String oPayment = request.getParameter("oPayment");
/*    String[] oNumParams = request.getParameterValues("oNum");
 */   /* String oParam = request.getParameter("oNum");
   String paypriceParam = request.getParameter("payprice");
   String priceParam = request.getParameter("price"); */
/*    String[] countParam = request.getParameterValues("oCount");
 */	
/*    System.out.println(oNumParams.toString());
   System.out.println(countParam.toString()); */
   String[] oNumParams = request.getParameterValues("oNum");
   String oParam = request.getParameter("oNum");
   String paypriceParam = request.getParameter("payprice");
   String priceParam = request.getParameter("price");

   
   System.out.println(Arrays.toString(oNumParams));  // 배열 출력
   System.out.println("oParam: " + oParam);
   System.out.println("paypriceParam: " + paypriceParam);
   System.out.println("priceParam: " + priceParam);

   //System.out.println(paypriceParam);
   //System.out.println(priceParam);
   
/*    int oNum = Integer.parseInt(oNumParam); // 문자열을 int로 변환
 */   int payprice = Integer.parseInt(paypriceParam); // 문자열을 int로 변환
   int price = Integer.parseInt(priceParam); // 문자열을 int로 변환
/*    int oCount = Integer.parseInt(countParam); 
 */   //System.out.println(receiver);
   //System.out.println(oAddr);
   //System.out.println(oPhone);
   //System.out.println(receiver);
   // PayInfoVO 객체 생성
   PayInfoVO payInfoVO = new PayInfoVO();
   payInfoVO.setReceiver(receiver);
   payInfoVO.setoAddr(oAddr);
   payInfoVO.setoPhone(oPhone);
   payInfoVO.setoPayment(oPayment);
/*    payInfoVO.setoNum(oNum);
 */   payInfoVO.setPayprice(payprice);
   payInfoVO.setPrice(price);
/*    payInfoVO.setoCount(oCount);
 */
    // 결제 정보를 DB에 저장
    PayInfoDAO pdao = new PayInfoDAO();
    boolean success = pdao.insertPayment(payInfoVO);
    
/*     int oNum = Integer.parseInt(request.getParameter("oNum"));
 */   
     if (oNumParams != null) {
	   for (int i = 0; i < oNumParams.length; i++) {
		    String oNum = oNumParams[i];
	
		    System.out.println(oNum);
	
/* 			OrderListDAO.updateOrderListoPayment(Integer.parseInt(oNum));
 */		OrderListDAO.updateOrderListoPayment(oNum, payInfoVO.getPayNum());

		    // 원소를 이용한 로직 처리
		    // ...
		}
   }

   %>
        <script type="text/javascript">
    // 배열 출력
    console.log(<%= Arrays.toString(oNumParams) %>);
    
    // 문자열 출력
    console.log("oParam: <%= oParam %>");
</script>

    <h1>결제 결과</h1>
    <%
    if (success) {
    	
    	
    %>
    <script>
		alert("결제가 성공적으로 처리되었습니다.");
	    location.href = "../admin/selectOrderlist";
	</script>
    <%
    } else {
    %>
    <script>
		alert("결제 처리 중 오류가 발생했습니다. 다시 시도해 주세요.");
		history.back();
	</script>   
    <%
    }
    %>
