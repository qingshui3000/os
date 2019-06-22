package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDao;
import dao.ProductDao;
import dao.impl.CartDaoImpl;
import dao.impl.ProductDaoImpl;
import entity.Cart;
import entity.Product;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private CartDao cDao = new CartDaoImpl();
	private String action;
	private static final long serialVersionUID = 1L;
    private ProductDao pDao = new ProductDaoImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
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
		if(request.getParameter("action")!=null) {
			action = request.getParameter("action");
			HttpSession session = request.getSession();
			if(action.equals("add")) {
				int pid = Integer.parseInt(request.getParameter("id"));
				Product p = pDao.getItemById(pid);
				Cart cart = new Cart();
				int uid = Integer.parseInt(session.getAttribute("uid").toString());
				cart.setUid(uid);
				cart.setPname(p.getName());
				cart.setPimg(p.getImage());
				cart.setNum(Integer.parseInt(request.getParameter("number")));
				cart.setPrice(p.getPrice());
				cart.setCount();
				cDao.add(cart);
			}
			if(action.equals("show")) {
				int uid = Integer.parseInt(session.getAttribute("uid").toString());
				ArrayList<Cart> list = cDao.getAll(uid);
				session.setAttribute("clist",list);
				request.getRequestDispatcher("../cart.jsp").forward(request, response);
			}
		}
		
	}

}
