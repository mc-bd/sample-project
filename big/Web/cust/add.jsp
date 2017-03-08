<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>



<script>

//자바스크립트 함수 작성
function add(f){
	var c = confirm('입력 하시겠습니까?');
	if(c == true){			//확인 누르면
		f.method='POST'; 	//post VS get
		f.action='cust.big?db=add'; 	//서버에 있는 프로그램a에게 요청을한다. cust서블릿에게 요청한다
		f.submit();
	}
};
</script>



<div>
<h1>Cust Add Page</h1>
<form>
ID<input type="text" name="id"><br>
PWD<input type="password" name="pwd"><br>
NAME<input type="text" name="name"><br>
<input type="button" value="ADD" onclick="add(this.form);"><br>
</form>
</div>