<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>



<script>

//�ڹٽ�ũ��Ʈ �Լ� �ۼ�
function add(f){
	var c = confirm('�Է� �Ͻðڽ��ϱ�?');
	if(c == true){			//Ȯ�� ������
		f.method='POST'; 	//post VS get
		f.action='cust.big?db=add'; 	//������ �ִ� ���α׷�a���� ��û���Ѵ�. cust�������� ��û�Ѵ�
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