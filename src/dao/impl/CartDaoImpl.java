package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.CartDao;
import entity.Cart;
import util.DBUtil;

public class CartDaoImpl implements CartDao{
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	@Override
	public void add(Cart cart) {
		// TODO Auto-generated method stub
		try {
			conn = DBUtil.getConnection();
			String sql = "insert into cart(uid,pname,pimg,price,num,count) values(?,?,?,?,?,?)";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1,cart.getUid());
			stmt.setString(2,cart.getPname());
			stmt.setString(3,cart.getPimg());
			stmt.setDouble(4,cart.getPrice());
			stmt.setInt(5,cart.getNum());
			stmt.setDouble(6,cart.getCount());
			int rs = stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			if(stmt!=null) {
				try {
					stmt.close();
					stmt = null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	@Override
	public ArrayList<Cart> getAll(int uid) {
		// TODO Auto-generated method stub
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from cart where uid=?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1,uid);
			ArrayList<Cart> list = new ArrayList<Cart>();
			rs = stmt.executeQuery();
			while(rs.next()) {
				Cart cart = new Cart();
				cart.setPname(rs.getString("pname"));
				cart.setPimg(rs.getString("pimg"));
				cart.setPrice(rs.getDouble("price"));
				cart.setNum(rs.getInt("num"));
				cart.setCount();
				cart.setUid(uid);
				list.add(cart);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

}
