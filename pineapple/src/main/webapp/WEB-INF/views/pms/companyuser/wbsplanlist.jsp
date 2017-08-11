<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script>
        $(document).ready(function(){
            $("#myBtn").click(function(){
                $("#myModal").modal();
            });
        });
    </script>
</head>
<body>
	<div class="container">
		<h2>Modal Example</h2>
		<!-- Trigger the modal with a button -->
		<button type="button" class="btn btn-default btn-lg" id="myBtn">모달 테스트</button>
	 
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">
		    
		      	<!-- Modal content-->
		    	<div class="modal-content">
					<div class="modal-header" style="padding:35px 50px;">
			          	<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>모달제목</h4>
		        	</div>
		       		<div class="modal-body" style="padding:40px 50px;">
		       		모달본문
		        	</div>
		        	<div class="modal-footer">
		         		<button type="submit" class="btn btn-danger" data-dismiss="modal">확인</button>
		        	</div>
		     	</div>
	      
	    	</div>
	  </div> 
	</div>
</body>
</html>