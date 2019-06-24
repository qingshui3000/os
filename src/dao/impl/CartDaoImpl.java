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
	//商品添加至购物车
	public void add(Cart cart) {
		// TODO Auto-generated method stub
		try {
			conn = DBUtil.getConnection();
			String sql = "insert into cart(uid,pid,pname,pimg,price,num,count) values(?,?,?,?,?,?,?) on duplicate key update num=num+?,count=count+?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1,cart.getUid());
			stmt.setInt(2,cart.getPid());
			stmt.setString(3,cart.getPname());
			stmt.setString(4,cart.getPimg());
			stmt.setDouble(5,cart.getPrice());
			stmt.setInt(6,cart.getNum());
			stmt.setDouble(7,cart.getCount());
			stmt.setInt(8,cart.getNum());
			stmt.setDouble(9,cart.getCount());
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
	//获取指定用户的购物车集合
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
				cart.setPid(rs.getInt("pid"));
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
			if(rs!=null) {
				try {
					rs.close();
					rs = null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	@Override
	//计算购物车总价
	public double getTotalCount(int uid) {
		// TODO Auto-generated method stub
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from cart where uid=?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1,uid);
			rs = stmt.executeQuery();
			double total=0;
			while(rs.next()) {
				total += rs.getDouble("count");
			}
			return total;
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
			if(rs!=null) {
				try {
					rs.close();
					rs = null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return 0;
	}
	@Override
	//订单添加成功后清空购物车
	public void deleteAll(int uid) {
		// TODO Auto-generated method stub
		try {
			conn = DBUtil.getConnection();
			String sql = "delete from cart where uid=?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1,uid);
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
}
