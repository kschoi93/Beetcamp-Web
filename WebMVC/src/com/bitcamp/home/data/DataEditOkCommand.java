package com.bitcamp.home.data;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.home.CommandService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class DataEditOkCommand implements CommandService {

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String path = req.getServletContext().getRealPath("/upload");
		
		int maxSize = 1024*1024*1024;
		MultipartRequest mr = new MultipartRequest(req,path,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		////// 업로드 완료
		DataDAO dao = new DataDAO();
		DataVO vo = new DataVO();
		vo.setNo(Integer.parseInt(mr.getParameter("no")));//글번호
		vo.setTitle(mr.getParameter("title"));//제목
		vo.setContent(mr.getParameter("content"));//글내용
		vo.setDelfile(mr.getParameterValues("delfile"));                 //      삭제된 파일의 이름 정보
		vo.setUserid((String)req.getSession().getAttribute("userid"));
		
		
		//새로업로드된 파일 정보
		Enumeration nameList = mr.getFileNames();// 필드명
		int idx=0;
		while(nameList.hasMoreElements()) {
			String fieldName = (String)nameList.nextElement();//필드명
			if(mr.getFilesystemName(fieldName)!=null) {
				vo.getFilename()[idx++] = mr.getFilesystemName(fieldName);  //  파일명을 구해서 리턴하고 filename[idx++]에 넣어줘라
			}
		}
		
		// 데이터베이스의 파일명 얻어오기
		List<String> dbFile = dao.getSelectFile(vo.getNo());             // db에 들어있는 파일 이름
		//db파일중에 삭제된 파일 지우기
		if(vo.getDelfile()!=null) {
			for(int delIdx =0; delIdx < vo.getDelfile().length; delIdx++) {
				dbFile.remove(vo.getDelfile()[delIdx]);
			}
		}
		//새로 업로드한 파일을 dbFile에 추가
		for(int i=0;i<idx;i++) {
			if(vo.getFilename()[i]!=null) {
				dbFile.add(vo.getFilename()[i]);
			}
			System.out.println("vo에 들어있는 파일네임 ----->"+vo.getFilename()[0] +", "+ vo.getFilename()[1]);
		}
		
		for(int ii=0; ii<dbFile.size();ii++) {
			System.out.println("list->"+dbFile.get(ii));
		}
		
		//레코드 수정
		int result = dao.dataUpdate(vo, dbFile);
		
		//삭제한 파일제거
		if(vo.getDelfile()!=null) {
			for(int k=0; k<vo.getDelfile().length; k++) {
				try {
					File delFile = new File(path,vo.getDelfile()[k]);
					delFile.delete();
				}catch(Exception e) {
					System.out.println("db에서 삭제한 파일을 실제 파일도 지워준다");
					e.printStackTrace();
				}
			}
		}
		
		req.setAttribute("result", result);
		req.setAttribute("no", vo.getNo());
		return "/data/dataEditOk.jsp";
	}


}
