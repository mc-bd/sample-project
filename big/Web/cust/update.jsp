<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>



<script>
function updateuser(f){
	var c = confirm('�����Ͻðڽ��ϱ�');
	if(c == true){
		f.method='POST';
		f.action='cust.big?db=update';
		f.submit();
	}
}
</script>




<div>
<h1>Cust Update Page</h1>
<form>
ID: ${updateuser.id }<br>
<input type="hidden" name="id" value="${updateuser.id }">
PWD<input type="text" name="pwd" value="${updateuser.pwd }"><br>
NAME<input type="text" name="name" value="${updateuser.name }"><br>
<input type="button" value="����" onclick="updateuser(this.form)">
</form>
</div>