package com.bitcamp.home.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.bitcamp.home.CommandService;

public class WriteOkCommand implements CommandService {

@Override
public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	HttpSession ses = req.getSession();
	String sesUserid = (String)ses.getAttribute("userid");
	String viewFilename = "";
	if(sesUserid !=null && !sesUserid.equals("")) {
	    req.setCharacterEncoding("UTF-8");
	    
	    //1. 데이터를 가져온다.
	    BoardVO vo = new BoardVO();
	    //no, subject, content, userid, hit(앤없어도댐), writedate(sysdate), ip
	    
	    //제목 가져오기
	    vo.setSubject(req.getParameter("subject"));
	    
	    //컨텐츠(내용) 가져오기
	    vo.setContent(req.getParameter("content"));
	    
	    //로그인한 아이디 가져온다
	    vo.setUserid((String)ses.getAttribute("userid"));
	    
	    //아이피를 가져온다
	    vo.setIp(req.getRemoteAddr());   
	    
	    //2. db에 넣어준다.
	    BoardDAO dao = new BoardDAO();
	    int result = dao.oneRecordInsert(vo);
	    req.setAttribute("result", result);
	    System.out.println(" 글등록 완료");
	    
	    viewFilename = "/board/writeOk.jsp";
	} else {
		viewFilename = "/member/login.jsp";
	}
    
    return viewFilename;
}

}