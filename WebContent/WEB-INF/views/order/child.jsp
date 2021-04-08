<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<c:set var="root" value="${pageContext.request.contextPath }/"/>  
    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>


<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>


    <style>


.btn {
    border-radius: 2px;
    text-transform: capitalize;
    font-size: 16px;
    padding: 10px 19px;
    cursor: pointer;
    color: #fff;
}


.refine {
    padding: 0px 0px !important
}



.input{
-webkit-appearance: none;
    -moz-appearance: none;
    -ms-appearance: none;
    -o-appearance: none;
    appearance: none;
    position: relative;
    top: -8.66667px;
    right: 0;
    bottom: 0;
    left: 0;
    height: 24px;
    width: 24px;
    transition: all 0.15s ease-out 0s;
    background: #cbd1d8;
    border: none;
    color: #fff;
    cursor: pointer;
    display: inline-block;
    margin-right: 0.5rem;
    outline: none;
    position: relative;
    z-index: 1000
}






</style>

    <script type="text/javascript">
        function setParentText(){
             opener.document.getElementById("order_contact").value = document.getElementById("cInput").value
        }
   </script>
 
</head>
<body>

 
 
 <div class="d-flex justify-content-center">
    <div class="wrapper center-block">

    <div class="text-center">
    <br>
    <b><font size="4" color="gray"> 주문용 연락처 </font></b><br><br>
    <input type="text" class="form-control request" id="cInput"/> 
    <br />
    
    </div>
    
     <div class=" text-center refine"> 
    <input type="button"  value="이번 주문에 사용" class="btn btn-success btn-square btn-md" onclick="setParentText();window.close();"/> 
        
    <input type="button" value="취소" class="btn  btn-success btn-square btn-md"  onclick="window.close()"> 
</div>


</div>
</div>


    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/scripts.js"></script>


</body>


</html>
    