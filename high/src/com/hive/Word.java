package com.hive;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.Rserve.RConnection;

public class Word {

	RConnection rconn;
	REXP x;                                            //R에서 가져온 데이터를 받는 자바 클래스
	
	public byte[] getGraph() throws Exception{
		
		rconn = new RConnection();
		rconn.eval("source('C:/rr/rhive/wc2.R')");     //R커넥션을 통해서 명령어를 준다 소스올리기
		rconn.eval("try(jpeg('wc2.jpg',quality=90))"); //R이미지 임의로 만든 파일명으로 사용하겟다 가져오겠다
		
		rconn.eval("wc2()");                               //프린트로 쏴
		rconn.eval("graphics.off()");                      //R스튜디오에 그림 띄우지마
		rconn.eval("wr=readBin('wc2.jpg','raw',600*600)"); //이미지 Binery 형태로 읽어들여
		x = rconn.eval("wr");
		
		rconn.close();
		return x.asBytes();
	}
}
