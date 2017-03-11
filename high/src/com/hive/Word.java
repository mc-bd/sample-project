package com.hive;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.Rserve.RConnection;

public class Word {

	RConnection rconn;
	REXP x;                                            //R���� ������ �����͸� �޴� �ڹ� Ŭ����
	
	public byte[] getGraph() throws Exception{
		
		rconn = new RConnection();
		rconn.eval("source('C:/rr/rhive/wc2.R')");     //RĿ�ؼ��� ���ؼ� ��ɾ �ش� �ҽ��ø���
		rconn.eval("try(jpeg('wc2.jpg',quality=90))"); //R�̹��� ���Ƿ� ���� ���ϸ����� ����ϰٴ� �������ڴ�
		
		rconn.eval("wc2()");                               //����Ʈ�� ��
		rconn.eval("graphics.off()");                      //R��Ʃ����� �׸� �������
		rconn.eval("wr=readBin('wc2.jpg','raw',600*600)"); //�̹��� Binery ���·� �о�鿩
		x = rconn.eval("wr");
		
		rconn.close();
		return x.asBytes();
	}
}
