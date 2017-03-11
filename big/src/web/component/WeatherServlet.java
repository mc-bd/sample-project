package web.component;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({ "/WeatherServlet", "/weather" })
public class WeatherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Get Data from Yahoo Weather info
		// ¿ÀÇÂ API¿Í ¿¬µ¿
		String str = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22seoul%22)%20%20and%20u%3D%27c%27&format=xml&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys";
		URL url = new URL(str);
		BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
		StringBuffer sb = new StringBuffer();
		String temp = null;
		while (true) {
			temp = br.readLine();
			if (temp == null) {
				break;
			}
			sb.append(temp);
		}
		response.setContentType("text/xml;charset=euc-kr");
		
		PrintWriter out = response.getWriter();
		out.print(sb.toString());
		out.close();
	}

}



