<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value='${pageContext.request.contextPath}/'/>

<script>

alert('로그인 실패했습니다')
location.href='${root}Customer/login?fail=true' // ?fail=true >> fail = true 를 갔고 들어오기 땜에 핑크박스가 뜬다

</script>