package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
			String sql = "insert into order(num,uid,tcount,tprice,remark,tel,ctime,statu) values(?,?,?,?,?,?,?,?)";
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1,o.getNum());
			stmt.setInt(2,o.getUid());
			stmt.setInt(3,o.getTcount());
			stmt.setDouble(4,o.getTprice());
			stmt.setString(5,o.getRemark());
			stmt.setString(6,o.getTel());
			stmt.setDate(7,o.getCtime());
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

}
