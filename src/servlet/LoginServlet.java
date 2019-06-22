package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import dao.impl.UserDaoImpl;
import entity.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private String action;
	private UserDao uDao = new UserDaoImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		PrintWriter out = response.getWriter();
		action = request.getParameter("action");
		HttpSession session = request.getSession();
		if(action.equals("in")) {
			String a = request.getParameter("account");
			String p = request.getParameter("password");
			User user = new User(a,p);
			uDao.save(user);
			request.getSession().setAttribute("lname",a);
			request.getRequestDispatcher("../login.jsp").forward(request, response);
		}
		if(action.equals("check")) {
			String a = request.getParameter("account");
			String p = request.getParameter("password");
			User user = new User(a,p);
			if(uDao.userCheck(user)) {
				request.getSession().setAttribute("lname",a);
				request.getRequestDispatcher("../index.jsp").forward(request, response);
			}
			else {
				request.getRequestDispatcher("../fail.jsp").forward(request, response);
			}
		}
		if(action.equals("out")) {
			session.invalidate();
			request.getRequestDispatcher("../index.jsp").forward(request, response);
		}
	}

}
