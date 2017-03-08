<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>



<script>

//자바스크립트 함수 작성
function add(f){
	var c = confirm('입력 하시겠습니까?');
	if(c == true){			//확인 누르면
		f.method='POST'; 	//post VS get
		f.action='product.big?db=add'; 	//서버에 있는 프로그램a에게 요청을한다. cust서블릿에게 요청한다
		f.submit();
	}
};
</script>



<div>
<h1>Product Add Page</h1>
<form enctype="multipart/form-data"> 
<!-- form과 form사이의 데이터는 원래 텍스트로만 전송이 되는데, 이를 다양한 형태로 서버에 전송하기 위한 처리 -->
NAME<input type="text" name="name"><br>
PRICE<input type="number" name="price"><br>
IMAGE<input type="file" name="img"><br>
<input type="button" value="ADD" onclick="add(this.form);"><br>
</form>
</div>