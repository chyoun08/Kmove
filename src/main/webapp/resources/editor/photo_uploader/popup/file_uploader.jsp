<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%

ServletContext context = getServletContext();
System.out.println("RealPath : "+context.getRealPath("/resources/editor/upload"));
String path = context.getRealPath("/resources/editor/upload");
String filename = "";


if(request.getContentLength() > 10*1024*1024 ){
%>
	<script>alert("업로드 용량(총 10Mytes)을 초과하였습니다.");history.back();</script>
<%
	return;

} else {

	try {

		
		MultipartRequest multi=new MultipartRequest(request, path, 15*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
	
		java.text.SimpleDateFormat formatter2 = new java.text.SimpleDateFormat ("yyyy_MM_dd_HHmmss", java.util.Locale.KOREA);
		int cnt = 1;
		String upfile = (multi.getFilesystemName("Filedata"));
		if (!upfile.equals("")) {
			String dateString = formatter2.format(new java.util.Date());
			String moveFileName = dateString + upfile.substring(upfile.lastIndexOf(".") );
			String fileExt = upfile.substring(upfile.lastIndexOf(".") + 1);
			
			File sourceFile = new File(path + File.separator + upfile);
			File targetFile = new File(path + File.separator + moveFileName);
			
			sourceFile.renameTo(targetFile);
			filename = moveFileName;
			
			System.out.println("upfile : " + upfile);
			System.out.println("targetFile : " + targetFile);
			System.out.println("moveFileName : " + moveFileName);
			System.out.println("filename : " + filename);
			System.out.println("moveFileName : " + moveFileName);
			System.out.println("path : " + path);
			
			sourceFile.delete();
			
			%>
			<form id="fileform" name="fileform" method="post">
				<input type="hidden" id="fileName" name="fileName" value="<%=filename%>">
				<input type="hidden" id="path" name="path" value="<%=path%>">
				<input type="hidden" id="fcode" name="fcode" value="<%=path%>">
			</form>
			<%
		}
	} catch (Exception e) {
		System.out.println("e : " + e.getMessage());
	}
}
%>

<script>
	var a = 1;
	$(document).ready(function() {
		fileAttach();
		this.window.close();
	});
	
	function fileAttach(){ 
		console.log('fileAttach() 실행 중');
		f = document.fileform;
		fpath = f.path.value;
	    fname = f.fileName.value; 
	    fcode = fpath + fname;
	    sendFileDataBase();
	    try{
             window.opener.pasteHTML(fname);
	    	 window.close();
	    }catch(e){ 
//             alert(e); 
	    }
	}
	
	function sendFileDataBase() {
		$.ajax({
			url : "/boardFile/insert",
			type : "POST",
			dataType : 'json',
			data : {
				boardID : 1,
				fileName : $("#fileName").val(),
				path : $("#path").val()
			},
			beforeSend : function(xhr) {
				//xhr.setRequestHeader("ApiKey", "asdfasxdfasdfasdf");
				xhr.setRequestHeader("AJAX", true);
			},
			success : function(data, status, xhr) { // alertify or another welcome page 이동
				console.log('file 저장 완료!!');
			},
			error : function(jqXHR, textStatus, errorThrown) {
				console.log('file 저장 실패!!');
			}
		});
	}

</script>
