package com.bitcamp.home;

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

@WebServlet("/*.do") // *.do : 모든 클라이언트의 요청이 이곳으로 들어온다.
//@WebServlet("/ControllerAction.do") // *.do : 모든 클라이언트의 요청이 이곳으로 들어온다.

public class ControllerAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//매핑주소와 실행할 Command객체를 보관할 맵
    HashMap<String, CommandService> map = new HashMap<String, CommandService>();
    
    public ControllerAction() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		//System.out.println("init() 실행됨");
		//properties파일명을 web.xml에서 가져오기
		String propertiesFilename = config.getInitParameter("proConfig");
		
		Properties prop = new Properties();// key:String, value:String
		try {
			FileInputStream fis = new FileInputStream(propertiesFilename);
			//urlMapping.properties파일의 내용을 읽어와 properties 객체로 대입한다
			prop.load(fis);
		}catch(Exception e) {
			System.out.println("프로퍼티 객체 생성 에러----->"+e.getMessage());
		}
		///////////////////////////////////////////////////////////
		try {
			//properties의 키 목록 구하기
			Enumeration keyList = prop.propertyNames(); // /*.do     /index.do
			while(keyList.hasMoreElements()) {
				//key에 대한 Command Class명을 가져온다.
				String key =(String)keyList.nextElement();
				String commandName = prop.getProperty(key);// com.bitcamp.home.IndexCommand
				//System.out.println(key+"=>"+commandName);
				
				//문자열을 객체로 생성하여 Map에 추가
				Class classObject = Class.forName(commandName);
				
				CommandService service = (CommandService)classObject.getDeclaredConstructors()[0].newInstance();
				map.put(key, service); // CommandService로 값을 변환하여 key 값에 추가,저장한다
			}
		}catch(Exception e) {
			System.out.println("프로퍼티 내용을 맵 객체로 변환 에러....."+e.getMessage());
		}
		
	}

	// get : a tag, form tag 방식으로 접속 가능
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("doGet() 실행됨");
		// 접속자의 url 주소를 알아낸다.				 01234567
		String uri = request.getRequestURI(); // /webMVC/index.do
		String ctx = request.getContextPath(); // /webMVC =7
		//System.out.println("uri=>"+uri);
		//System.out.println("ctx=>"+ctx);
		
		String urlMapping = uri.substring(ctx.length()); // /index.do
		//System.out.println("urlMapping Test-->"+urlMapping);
		
		
		CommandService command = map.get(urlMapping);
		//System.out.println("command Test-->"+command);
		String viewFilename = command.processStart(request, response);
		//System.out.println("viewFilename Test-->"+viewFilename);
		// dispatcher : 해당되는 경로의 파일로 이동하기(전환)
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewFilename);
		dispatcher.forward(request, response);
		
	}
	
	// post : form tag 방식으로 접속 가능       ,     doGet(request,response) : form으로 들어온 것을 doget으로 보내서 작업을 처리하겠다.
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("doPost() 실행됨");
		doGet(request,response);
		
	}
}
