<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>



<script>

//�ڹٽ�ũ��Ʈ �Լ� �ۼ�
function add(f){
	var c = confirm('�Է� �Ͻðڽ��ϱ�?');
	if(c == true){			//Ȯ�� ������
		f.method='POST'; 	//post VS get
		f.action='product.big?db=add'; 	//������ �ִ� ���α׷�a���� ��û���Ѵ�. cust�������� ��û�Ѵ�
		f.submit();
	}
};
</script>



<div>
<h1>Product Add Page</h1>
<form enctype="multipart/form-data"> 
<!-- form�� form������ �����ʹ� ���� �ؽ�Ʈ�θ� ������ �Ǵµ�, �̸� �پ��� ���·� ������ �����ϱ� ���� ó�� -->
NAME<input type="text" name="name"><br>
PRICE<input type="number" name="price"><br>
IMAGE<input type="file" name="img"><br>
<input type="button" value="ADD" onclick="add(this.form);"><br>
</form>
</div>