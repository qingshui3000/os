package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.OrderDao;
import entity.Order;
import util.DBUtil;

public class OrderDaoImpl implements OrderDao{
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	@Override
	public void save(Order o) {
		// TODO Auto-generated method stub
		try {
			conn = DBUtil.getConnection();
			String sql = "insert into orders(no,uid,tnum,tcount,remark,tel,ctime,statu) values(?,?,?,?,?,?,?,?)";
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1,o.getNo());
			stmt.setInt(2,o.getUid());
			stmt.setInt(3,o.gettNum());
			stmt.setDouble(4,o.gettCount());
			stmt.setString(5,o.getRemark());
			stmt.setString(6,o.getTel());
			stmt.setString(7,o.getCtime());
			stmt.setInt(8,o.getStatu());
			
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
	public ArrayList<Order> getAll(int uid) {
		// TODO Auto-generated method stub
		ArrayList<Order> list = new ArrayList<Order>();
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from orders where uid=?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1,uid);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Order o = new Order();
				o.setId(rs.getInt("id"));
				o.setNo(rs.getString("no"));
				o.setUid(rs.getInt("uid"));
				o.settNum(rs.getInt("tnum"));
				o.settCount(rs.getDouble("tcount"));
				o.setRemark(rs.getString("remark"));
				o.setTel(rs.getString("tel"));
				o.setCtime(rs.getString("ctime"));
				o.setStatu(rs.getInt("statu"));
				list.add(o);
			}
			return list;
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
		return null;
	}

}
