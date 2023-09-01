<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	int finalPriceInt = 0;
	int deliveryInt = 0;
	int totalInt = 0;
	
	// 로그인 여부체크
	if(sessUser == null){
		response.sendRedirect("/Farmstory1/user/login.jsp?success=101");
		return;
	}

	request.setCharacterEncoding("UTF-8");
	
	String thumb2 = request.getParameter("thumb2");
	String pName = request.getParameter("pName");
	String pNo = request.getParameter("pNo");
	String delivery = request.getParameter("delivery");
	String price = request.getParameter("price");
	String count = request.getParameter("count");
	String total = request.getParameter("total");
	String finalPrice = request.getParameter("final");
	
	if(finalPrice != null && !finalPrice.isEmpty()){
		finalPriceInt = Integer.parseInt(finalPrice);
	}
	if(delivery != null && !delivery.isEmpty()){
		deliveryInt = Integer.parseInt(delivery);
	}
	if(total != null && !total.isEmpty()){
		totalInt = Integer.parseInt(total);
	}
	
	int noDeliveryPrice = finalPriceInt - deliveryInt;
%>

<script>
	$(function() {
		
		$('#btnBuy').click(function(e) {
			e.preventDefault();
			$('#formOrder').submit();
		});

		$('#btnShopping').click(function(e) {
			e.preventDefault();
			
			if(confirm("주문취소?")){
				location.href='/Farmstory1/market/list.jsp';
			}
			
		});
		
	});
</script>

<div id="sub">
    <div><img src="../images/sub_top_tit2.png" alt="MARKET"></div>
    <section class="market">
        <aside>
            <img src="../images/sub_aside_cate2_tit.png" alt="장보기"/>

            <ul class="lnb">
                <li class="on"><a href="./list.jsp">장보기</a></li>
            </ul>
        </aside>
        <article class="order">
            <nav>
                <img src="../images/sub_nav_tit_cate2_tit1.png" alt="장보기"/>
                <p>
                    HOME > 장보기 > <em>장보기</em>
                </p>
            </nav>

            <!-- 내용 시작 -->
            <h3>주문상품 확인</h3>
            <div class="info">
                <img src="/Farmstory1/thumb/<%= thumb2 %>" alt="<%= pName %>">

                <table border="0">                            
                    <tr>
                        <td>상품명</td>
                        <td><%= pName %></td>
                    </tr>
                    <tr>
                        <td>상품코드</td>
                        <td><%= pNo %></td>
                    </tr>
                    <tr>
                        <td>배송비</td>
                        <td class="delivery"><%= (finalPriceInt > 30000) ? "0" : delivery %>원</td>
                    </tr>
                    <tr>
                        <td>판매가격</td>
                        <td><%= price %>원</td>
                    </tr>
                    <tr>
                        <td>구매수량</td>
                        <td class="count"><%= count %>개</td>
                    </tr>
                    <tr>
                        <td>최종 합계</td>
                        <% if(totalInt < 30000){ %>
                        <td class="final"><%= finalPrice %>원</td>
                        <% }else{ %>
                        <td class="final"><%= noDeliveryPrice %>원</td>
                        <% } %>
                    </tr>
                </table>
            </div>
            <h3>주문정보 입력</h3>
            <div class="shipping">
            <form id="formOrder" action="/Farmstory1/market/proc/orderProc.jsp" method="post">
            	<input type="hidden" name="pNo" value="<%= pNo %>">
            	<input type="hidden" name="price" value="<%= price %>">
            	<input type="hidden" name="count" value="<%= count %>">
            	<% if(totalInt < 30000){ %>
            	<input type="hidden" name="finalPrice" value="<%= finalPrice %>">
            	<input type="hidden" name="delivery" value="<%= delivery %>">
                <% }else{ %>
                <input type="hidden" name="finalPrice" value="<%= noDeliveryPrice %>">
                <input type="hidden" name="delivery" value="0">
                <% } %>
                <table>
                    <tr>
                        <td>구매자</td>
                        <td><input type="text" value="<%= sessUser.getName() %>" readonly></td>
                    </tr>
                    <tr>
                        <td>받는분</td>
                        <td><input type="text" name="buyer" value="<%= sessUser.getName() %>"></td>
                    </tr>
                    <tr>
                        <td>휴대폰</td>
                        <td><input type="text" name="hp" value="<%= sessUser.getHp() %>"></td>
                    </tr>
                    <tr>
                        <td>배송주소</td>
                        <td>
                            <input type="text" name="zip" readonly value="<%= sessUser.getZip() %>"><button id="btnZip">우편번호 검색</button>
                            <input type="text" name="addr1" placeholder="기본주소 검색" value="<%= sessUser.getAddr1() %>">
                            <input type="text" name="addr2" placeholder="상세주소 입력" value="<%= sessUser.getAddr2() %>">
                        </td>
                    </tr>
                    <tr>
                        <td>기타</td>
                        <td>
                            <textarea name="etc"></textarea>
                        </td>
                    </tr>
                </table>
            </form>
            </div>

            <p>
                <a href="#" id="btnBuy"><img src="../images/market_btn_buy.gif" alt="구매하기"></a>
                <a href="#" id="btnShopping"><img src="../images/market_btn_shopping.gif"></a>
            </p>
            <!-- 내용 끝 -->
            
        </article>
    </section>
</div>
<%@ include file="../_footer.jsp" %>