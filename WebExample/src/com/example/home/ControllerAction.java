package com.example.home;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/*.do")
public class ControllerAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//보더라도 천천히 보면서 치자
	HashMap<String, CommandService> map = new HashMap<String, CommandService>();
	// 왜 만들었나? 프로퍼티에 있는 매핑주소와 실행할 Command 객체를 보관한다
    
	public ControllerAction() {
        super();
    }
	
	public void init(ServletConfig config) throws ServletException {
		//servlet으로 실행되는 주소로 접속할 경우 실행된다 (doget, dopost 메소드가 실행되기 전에 선 실행되는 메소드)
		//proConfig : web.xml에 controllerAction으로 이동하면서 init-param으로 proconfig의 경로 데이터를 넘겨줄때 정한 이름이다.
		//			 C:\Users\kyung\git\Portfolio_cks\WebExample\WebContent\WEB-INF\prop\ urlMapping.properties
		
		String propertiesFilename = config.getInitParameter("proConfig");
		Properties prop = new Properties(); //프로퍼티 객체는 key와 value값 두가지가 필요하다
		try {
			FileInputStream fis = new FileInputStream(propertiesFilename);
			prop.load(fis);
			// 프로퍼티에 로드시키면... 해당되는 파일들을 읽어온다
		}catch(Exception e) {
			System.out.println("프로퍼티 객체 생성 에러 ------>"+e.getMessage());
		}
		
		try {
			//프로퍼티 키 목록 구하기
			Enumeration keyList = prop.propertyNames();
			while(keyList.hasMoreElements()) {
				String key = (String)keyList.nextElement(); // 키 값을 가져온다
				String commandName = prop.getProperty(key); // 경로값을 가져온다
				//클래스에 경로값을 넣는다!?
				Class classObject = Class.forName(commandName);
				//System.out.println(classObject);
				//class com.example.home.IndexCommand
				
				
				CommandService service = (CommandService)classObject.getDeclaredConstructors()[0].newInstance();
				
				map.put(key, service);
			}
		}catch(Exception e) {
			System.out.println("프로퍼티 내용을 맵 객체로 변환 에러...... "+e.getMessage());
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String urlMapping = uri.substring(ctx.length());
		
		CommandService command = map.get(urlMapping);
		String viewFilename = command.processStart(request, response);
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewFilename);
		dispatcher.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
