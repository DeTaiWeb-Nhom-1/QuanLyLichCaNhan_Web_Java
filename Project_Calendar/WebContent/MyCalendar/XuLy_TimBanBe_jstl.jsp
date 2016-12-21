<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding ="UTF-8"%>
     <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
<% request.setCharacterEncoding("UTF-8"); %>

<c:if test="${not empty param.BanBe}">
<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost:3306/QuanLyLichCaNhan"
                       user="root" password="trongtri96"/>
	
 			<sql:query dataSource="${ds}" var="selectQ">
	        select count(*) as kount from NguoiDung
	        where TenDangNhap='${param.BanBe}' or HoTen='${param.BanBe}' or Email='${param.BanBe}'
	        or SoDienThoai='${param.BanBe}'
	        
	      </sql:query>
	 
	      <c:forEach items="${selectQ.rows}" var="r">
	        <c:choose>
	          <c:when test="${r.kount gt 0}">
	            
	            
	            <c:redirect url="XuLy_DanhSachBanBe_jstl.jsp" >
	            <% request.setCharacterEncoding("UTF-8"); %>
	               <c:param name="Msg_BanBe" value="${param.BanBe}"/>
	               
	            </c:redirect>
	            
	          </c:when>
	          <c:otherwise>
	            <c:redirect url="Error.jsp" >
	              <c:param name="errMsg" value="Rất tiếc chúng tôi không tìm thấy dữ liệu bạn yêu cầu!" />
	            </c:redirect>
	          </c:otherwise>
	        </c:choose>
	 
	      </c:forEach>
 		
 		</c:if>
<c:if test="${empty param.BanBe}">
<c:redirect url="Error.jsp" >
	              <c:param name="errMsg" value="Rất tiếc chúng tôi không tìm thấy dữ liệu bạn yêu cầu!" />
	            </c:redirect>
</c:if>
 		
</body>
</html>