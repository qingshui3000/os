package servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDao;
import dao.OrderDao;
import dao.impl.CartDaoImpl;
import dao.impl.OrderDaoImpl;
import entity.Cart;
import entity.Order;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private OrderDao oDao = new OrderDaoImpl();
	private CartDao cDao = new CartDaoImpl();
	private String action;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
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
		action = request.getParameter("action");
		if(action.equals("add")) {
			if(add(request, response)) {
				request.getRequestDispatcher("../success.jsp").forward(request, response);
			}
			else {
				request.getRequestDispatcher("../odnull.jsp").forward(request, response);
			}
		}
	}

	private boolean add(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		ArrayList<Cart> list = (ArrayList<Cart>)session.getAttribute("clist");
		if(list!=null) {
			Order o = new Order();
			SimpleDateFormat sdf = new SimpleDateFormat();
			sdf.applyPattern("yyyyMMddHHmmss");
			Date date = new Date();
			String ctime = sdf.format(date);
			int uid = Integer.parseInt(session.getAttribute("uid").toString());
			int tNum = getCartNum(list);
			double total = cDao.getTotalCount(uid);
			o.setNo(uid+ctime);
			o.setUid(uid);
			o.settNum(tNum);
			o.settCount(total);
			o.setTel(request.getParameter("tel"));
			o.setRemark(request.getParameter("remark"));
			o.setCtime(ctime);
			o.setStatu(0);
			oDao.save(o);
			session.setAttribute("clist",null);
			cDao.deleteAll(uid);
			return true;
		}
		else {
			return false;
		}
	}
	
	
	private int getCartNum(ArrayList<Cart> list) {
		int tnum = 0;
		for(Cart c:list) {
			tnum+=c.getNum();
		}
		return tnum;
	}
}
