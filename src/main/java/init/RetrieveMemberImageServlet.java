package init;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pikachuMVC.model.MemberBean;
import com.pikachuMVC.service.MemberService;
import com.pikachuMVC.service.impl.MemberServiceImpl;





@WebServlet("/init/getMemberImage")
public class RetrieveMemberImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OutputStream os = null;
		InputStream is = null;
		String fileName = null;
		String mimeType = null;
		Blob blob = null;
		try {
			// 讀取瀏覽器傳送來的主鍵
			String id = request.getParameter("id");
			// 讀取瀏覽器傳送來的type，以分辨要處理哪個表格
			MemberService memberService = new MemberServiceImpl();
			MemberBean bean = memberService.queryMember(id);
			if (bean != null) {
				blob = bean.getM_img();
				if (blob != null) { 
					is = blob.getBinaryStream();
				}
				fileName = bean.getName();
			}
			
			if (is == null) {
				fileName = "membephoto_0.png" ; 
				is = getServletContext().getResourceAsStream(
						"/images/common/" + fileName);
			}
			
			// 由圖片檔的檔名來得到檔案的MIME型態
			mimeType = getServletContext().getMimeType(fileName);
			// 設定輸出資料的MIME型態
			response.setContentType(mimeType);
			// 取得能寫出非文字資料的OutputStream物件
			os = response.getOutputStream();	
			// 由InputStream讀取位元組，然後由OutputStream寫出
			int len = 0;
			byte[] bytes = new byte[8192];
			while ((len = is.read(bytes)) != -1) {
				os.write(bytes, 0, len);
			}
		}catch(

	SQLException ex)
	{
		ex.printStackTrace();
		throw new RuntimeException("_00_init.util.RetrieveMemberImageServlet#doGet()發生SQLException: " + ex.getMessage());
	}finally
	{
		if (is != null)
			is.close();
		if (os != null)
			os.close();

	}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
