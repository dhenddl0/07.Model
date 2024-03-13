<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% System.out.println("jsp start"); %>

<%-- <%@ page import="java.util.*"  %>
<%@ page import="com.model2.mvc.service.domain.Product" %>
<%@ page import="com.model2.mvc.service.domain.User" %>
<%@ page import="com.model2.mvc.common.*" %>

<%@ page import="java.util.List"  %>

<%@ page import="com.model2.mvc.service.domain.Product" %>
<%@ page import="com.model2.mvc.common.Search" %>
<%@page import="com.model2.mvc.common.Page"%>
<%@page import="com.model2.mvc.common.util.CommonUtil"%>

<%
   List<Product> list = (List<Product>)request.getAttribute("list");
   Page resultPage = (Page)request.getAttribute("resultPage");
   
   Search search = (Search)request.getAttribute("search");
   System.out.println(search);
   
   String searchCondition = CommonUtil.null2str(search.getSearchCondition());
   String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
   
   System.out.println("searchCondition : " + searchCondition);
   System.out.println("searchKeyword : " + searchKeyword);
%> --%>


<html>
<head>
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">

<!-- �ڹ� ��ũ��Ʈ �κ�
function fncGetProductList(currentPage){
   document.getElementById("currentPage").value = currentPage;
   document.detailForm.submit();
}
-->

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm" action="/listProduct.do?menu=${param.menu}" method="post">


<table width="100%" height="37" border="0" cellpadding="0"   cellspacing="0">
   <tr>
      <td width="15" height="37">
         <img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
      </td>
      <td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
               <td width="93%" class="ct_ttl01">
          
      <%--     <%    
          if(request.getParameter("menu") != null && request.getParameter("menu").equals("manage")){   
       %>
       ��ǰ ����
       <% }else if(request.getParameter("menu") == null || request.getParameter("menu").equals("null") || request.getParameter("menu").equals("search")) {
       %>
       ��ǰ �����ȸ
       <% } %> --%>
       
       <c:if test = "${not empty param.menu and param.menu eq 'manage' }" >
          ��ǰ ����
       </c:if>
       <c:if test = "${empty param.menu or param.menu eq 'null' or param.menu eq 'search' }">
          ��ǰ �����ȸ
       </c:if>
       
               </td>
            </tr>
         </table>
      </td>
      <td width="12" height="37">
         <img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
      </td>
   </tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
   <tr>
      
      <td align="right">
      
         <%-- <%
      if(search.getSearchCondition() != null) {
      %> --%>
         <select name="searchCondition" class="ct_input_g" style="width:80px">
            <option value ="0" ${ ! empty search.searchCondition && search.searchCondition == 0 ? "selected" : ""  }>��ǰ��ȣ</option>
            <option value ="1" ${ ! empty search.searchCondition && search.searchCondition == 1 ? "selected" : "" }>��ǰ��</option>
            <option value ="2" ${ ! empty search.searchCondition && search.searchCondition == 2 ? "selected" : "" } >��ǰ����</option>    
         <%--    <%}else{%>
                  <select name="searchCondition" class="ct_input_g" style="width:80px">
                  <option value = "0" >��ǰ��ȣ</option>
                  <option value = "1" >��ǰ��</option>
                  <option value = "2" >��ǰ����</option>
                  
                  <% } %> --%>
             
         </select>
         
         <input type="text" name="searchKeyword" 
         value="${! empty search.searchKeyword ? search.searchKeyword : "" }" 
         class="ct_input_g" style="width:200px; height:19px" />
      </td>
      
      <td align="right" width="70">
         <table border="0" cellspacing="0" cellpadding="0">
            <tr>
               <td width="17" height="23">
                  <img src="/images/ct_btnbg01.gif" width="17" height="23">
               </td>
               <td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
                  <a href="javascript:fncGetProductList(1);">�˻�</a>
               </td>
               <td width="14" height="23">
                  <img src="/images/ct_btnbg03.gif" width="14" height="23">
               </td>
            </tr>
         </table>
      </td>
   </tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
   <tr>
      <td colspan="11" >��ü ${resultPage.totalCount } �Ǽ�, ���� ${ resultPage.currentPage } ������</td>
  
   </tr>
   <tr>
      <td class="ct_list_b" width="100">No</td>
      <td class="ct_line02"></td>
      <td class="ct_list_b" width="150">��ǰ��</td>
      <td class="ct_line02"></td>
      <td class="ct_list_b" width="150">����</td>
      <td class="ct_line02"></td>
      <td class="ct_list_b">�����</td>   
      <td class="ct_line02"></td>
      <td class="ct_list_b">�������</td>   
   </tr>
   <tr>
      <td colspan="11" bgcolor="808285" height="1"></td>
   </tr>
      
  <%--     <%   
      for(int i=0; i<list.size(); i++) {
          Product vo = list.get(i);
   %> --%>
      
    <c:set var = "i" value = "0" />  
    <c:forEach var = "product" items = "${ list }" >
       <c:set var = "i" value = "${i +1 }" />
   <tr class="ct_list_pop">
      <td align="center">${ i }</td>
      <td></td>
           <td align="left">
            
            <c:if test = "${not empty param.menu and param.menu eq 'manage' }">
           		 <a href="/updateProductView.do?prodNo=${product.prodNo }&menu=${param.menu}">${product.prodName}</a>
            </c:if>
         
       <c:if test = "${not empty param.menu and param.menu eq 'search' }">
           		 <a href="/getProduct.do?prodNo=${product.prodNo }&menu=${param.menu}">${product.prodName}</a>
            </c:if>
   
            
            <%-- <c:if test = "${empty param.menu or param.menu eq 'null' or param.menu eq 'search' }" >
            	 <a href="/getProduct.do?prodNo=${product.prodNo }">${product.prodName}2</a>
            </c:if> --%>
            <%-- <c:if test = "${empty param.menu eq '' or param.menu eq 'search'}">
            	 <a href="/getProduct.do?prodNo=${product.prodNo }">${product.prodName}3</a>
            </c:if> --%>
            
         <%--  <%    
          if(request.getParameter("menu") != null && request.getParameter("menu").equals("manage")){   
       %>
       <a href="/updateProductView.do?prodNo=<%=vo.getProdNo()%>"><%= vo.getProdName() %></a>
           <% System.out.println("name : " + vo.getProdName()); %>
       
       <% }else if(request.getParameter("menu") == null ||request.getParameter("menu").equals("null") ||  request.getParameter("menu").equals("search")) {
       %>
       
       <a href="/getProduct.do?prodNo=<%=vo.getProdNo()%>"><%= vo.getProdName() %></a>
       
       <% System.out.println(request.getParameter("menu") + "skdkld" + vo.getProdName());  %>
       
       <% } else if(request.getParameter("menu").equals("") || request.getParameter("menu").equals("search")) {%>
       <a href="/getProduct.do?prodNo=<%=vo.getProdNo()%>"><%= vo.getProdName() %></a>
        --%>
       
       
<%-- <% }else{%>
      <% System.out.println(request.getParameter("menu") + "skdkld" + vo.getProdName());  %>
      <% } %> --%>
</td>
      <td></td>
       <%-- <td align="left">${product.prodName}</td> --%>
      <%-- <td align="left"><%=vo.getPrice() %></td> --%>
      
      
      <td align="left">${product.price}</td>
      <td></td>
    <%--   <td align="left"><%=vo.getRegDate() %></td> --%>
      <td align="left">${product.regDate} </td> 
      <td></td>
      <td align="left">
         �����

      </td>   
   </tr>
   <tr>
      <td colspan="11" bgcolor="D6D7D6" height="1"></td>
   </tr>   
   <%--  <%} %> --%>
   </c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
   <tr>
      <td align="center">
     
         
         <!--  <div style="text-align: center; margin-top: 10px;"> -->
                
<%--                 ���� �������� �̵��ϴ� ��ũ ��ư  &lt �̰Ŵ� < �� �ε�ȣ / &gt�� > �� �ε�ȣ
                
                �� �� �������� �̵�
                <% if(resultPage.getCurrentPage() > 1) { %>
                   <a href="javascript:fncGetProductList(1)"> &lt;&lt; </a>
            
             �� �� ������ ���� �� (����)
            <%}else{ %>
                  <span></span>
            <% } %>
            
             �� �������� �̵�
                <% if(resultPage.getCurrentPage() > 1) { %>
                   <a href="javascript:fncGetProductList(<%= resultPage.getCurrentPage() -1 %>)"> ���� </a>
            <% } %>
            
                ������ ��ȣ ǥ�� �κ�
                <% for (int i = resultPage.getBeginUnitPage(); i <= resultPage.getEndUnitPage(); i++) { %>
                    <a href="javascript:fncGetProductList(<%= i %>)"><%= i %></a>
                <% } %>

             �� �������� �̵�
                <% if(resultPage.getCurrentPage() < resultPage.getMaxPage()) { %>
                   <a href="javascript:fncGetProductList(<%= resultPage.getCurrentPage() +1 %>)"> ���� </a>
            <% } %>

                ���� �������� �̵��ϴ� ��ũ ��ư
                 <% if(resultPage.getCurrentPage() < resultPage.getEndUnitPage()) { %>
                <a href="javascript:fncGetProductList(<%= resultPage.getMaxPage() %>)"> &gt;&gt; </a>
                
                <%}else{ %>
                  <span></span>
            <% } %>--%>
            </div> 
        </td>
   </tr>
         
         <jsp:include page="../common/pageNavigator.jsp"></jsp:include>
         
       </td>
   </tr>
</table>

<!--  ������ Navigator �� -->

</form>

</div>
</body>
</html>