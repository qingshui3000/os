package servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import dao.ProductDao;
import dao.impl.ProductDaoImpl;
import entity.Param;
import entity.Product;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
	private ProductDao pDao = new ProductDaoImpl();
	private String action;
	private static final long serialVersionUID = 1L;
  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		action = request.getParameter("action");
		if(action.equals("search")) {
			String str = request.getParameter("str");
			ArrayList<Product> result = pDao.searchLike(str);
			request.setAttribute("result",result);
			request.getRequestDispatcher("../result.jsp").forward(request, response);
		}
		if(action.equals("add")) {
			
		}
	}

	public void addProduct(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, FileUploadException, IllegalAccessException, InvocationTargetException {
		//封装表单数据到product实体中
		Product product = new Product();
		Param pa = new Param();
		//收集数据的容器
		Map<String,Object> map = new HashMap<String, Object>();
		//创建磁盘工厂
		DiskFileItemFactory factory = new DiskFileItemFactory();
		//创建文件上传核心对象
		ServletFileUpload upload = new ServletFileUpload(factory);
		//解析request集合
		List<FileItem> parseRequest = upload.parseRequest(request);
		//遍历request集合
		for (FileItem fileItem : parseRequest) {
			//判断是普表单项还是文件表单项
			boolean formField = fileItem.isFormField();
			if(formField){//是普通表单项
				String fieldName = fileItem.getFieldName();//获取表单项名字,也就是平时getParameter的那个name
				String stringValues = fileItem.getString("utf-8");//获取表单项的值,平时getParameter的那个name返回的值当然要编码
				map.put(fieldName, stringValues);//设置到map,取出一个name你就得将这个值添加到上面定义的map中,用于后面进行封装
			}else{//是文件上传的表单项
				//获取上传的文件名字
				String name = fileItem.getName();
				//设置保存路径,也就是你根路径底下的一个文件夹中
				String realPath = this.getServletContext().getRealPath("image");
				//获取输入流读取文件
				InputStream inputStream = fileItem.getInputStream();
				//创建输出流写入文件,路径/图片名字
				OutputStream outputStream = new FileOutputStream(realPath+"/"+name);
				//将文件写入到images中
				IOUtils.copy(inputStream, outputStream);
				//关流
				inputStream.close();
				outputStream.close();
				fileItem.delete();
				//根据对象保存路径~(相对路径),一般数据库中的图片字段都是相对路径.总之添加数据时根据你数据库图片字段的格式添加
				map.put("productImg", "image/imgs/"+name);
			}
		}
		//BeanUtils.populate(product, map);
		response.sendRedirect("admin/addpa.jsp");
	}
}
