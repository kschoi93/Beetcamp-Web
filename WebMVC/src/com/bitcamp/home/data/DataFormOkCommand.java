package com.bitcamp.home.data;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.home.CommandService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class DataFormOkCommand implements CommandService{

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// file upload시 보관되는 장소는 .metadata에 위치하고 있다
		//D:\workspaceWeb\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\WebMVC
		
		//파일업로드할 페이지의 절대경로를 구한다.
		String path = req.getServletContext().getRealPath("/upload");
		System.out.println("path----->"+path);
		
		//1.request 객체
		//2.server에 파일업로드될 위치(절대경로)
		//3.업로드 가능 최대 크기 (byte단위)
		int maxSize = 1024*1024*1024; // 1GB
		//4.인코딩
		//5.파일명 rename (같은 이름의 파일명을 자동으로 rename 즉 변경해주는데 뒤에 1 2 3 4 5 순서로 붙여진다)
		DefaultFileRenamePolicy policy= new DefaultFileRenamePolicy();
		//form의 데이터와 파일업로드 완료
		MultipartRequest mr = new MultipartRequest(req, path, maxSize, "UTF-8", policy);
		
		DataVO vo = new DataVO();
		vo.setTitle(mr.getParameter("title"));
		vo.setContent(mr.getParameter("content"));
		
		HttpSession ses =req.getSession();
		
		vo.setUserid((String)ses.getAttribute("userid"));
		
		vo.setIp(req.getRemoteAddr());
		
		// 폼의 type ='file' 태그의 name속성이 구해졌다.
		Enumeration fileList = mr.getFileNames(); // filename1, filename2
		int idx=0;
		while(fileList.hasMoreElements()) {
			//System.out.println(fileList.nextElement());
			String nameAttr=(String)fileList.nextElement(); //필드명
			//파일명 얻어오기(새로운 파일명) -- rename된 파일명
			String newFilename = mr.getFilesystemName(nameAttr);
			//파일명 얻어오기(원래 파일명)
			//mr.getOriginalFileName(nameAttr);
			
			if(newFilename!=null) {
				vo.getFilename()[idx++]=newFilename;
			}
		}
		
		DataDAO dao = new DataDAO();
		
		int cnt = dao.dataInsert(vo);
		
		//레코드 추가 실패시 업로드 되어 있는 파일을 삭제해야 한다
		if(cnt <=0) {
			for(String delFile : vo.getFilename()) {
				if(delFile!=null) {
					try {
						File f = new File(path,delFile);
						f.delete();
					} catch(Exception e) {
						System.out.println("파일 삭제 에러----->"+e.getMessage());
					}
				}
			}
		} 
		req.setAttribute("cnt", cnt);
		
		return "/data/dataFormOk.jsp";
	}

}
