<%@page import="java.util.Date"%>
<%@page import="VO.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%  
     MemberVO mvo = (MemberVO) request.getAttribute("mvo");
     String m_name = mvo.getM_name();
     String email = mvo.getM_email();
     String m_id= mvo.getM_id();
     String tel = mvo.getM_tel();
     int Price = Integer.parseInt(String.valueOf(request.getAttribute("price")));
     long currentTime = new Date().getTime();
     int book_id = (int)currentTime;
     String post=String.valueOf(request.getAttribute("post"));
     String seat = String.valueOf(request.getAttribute("strSeat"));
     String theater = String.valueOf(request.getAttribute("theater"));
     int t_id = Integer.parseInt(String.valueOf(request.getAttribute("t_id")));
     int bookcnt =Integer.parseInt(String.valueOf(request.getAttribute("bookcnt")));
     %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kakao</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<meta charset="UTF-8">
</head>
<body>
<script>
	$(function(){
    	var IMP = window.IMP; // 생략가능
    		IMP.init('imp55773133'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
    	var msg;
    		
    	IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : <%=book_id%>,
            name : 'KG SINEMA',
            amount : <%=Price%>,
            buyer_email : '<%=email%>',
            buyer_name : '<%=m_name%>',
            buyer_tel : '<%=tel%>',
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        alert(msg);
//                       location.href="payresult.do";
                        const form = document.createElement('form');
                        form.method = 'POST';
                        form.action = 'payresult.do';

                        const inputData = [
                            { name: 'm_name', value: '<%=m_name%>' },
                            { name: 'm_id', value: '<%=m_id%>' },
                            { name: 'book_id', value: '<%=book_id%>' },
                            { name: 'theater', value: '<%=theater%>' },
                            { name: 'bookcnt', value: '<%=bookcnt%>' },
                            { name: 'seat', value: '<%=seat%>' },
                            { name: 'url', value: '<%=post%>' },
                            { name: 'price', value: '<%=Price%>' },
                            { name: 't_id', value: '<%=t_id%>' }
                        ];

                        inputData.forEach(data => {
                            const input = document.createElement('input');
                            input.type = 'hidden';
                            input.name = data.name;
                            input.value = data.value;
                            form.appendChild(input);
                        });


                        document.body.appendChild(form);
                        form.submit();
                      
                      } else {
                msg = '결제에 실패하였습니다.';
                msg += '실패 사유 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                location.href="<%=request.getContextPath()%>";
                alert(msg);
            }
        });
        
    });
    </script> 
 
</body>
</html>