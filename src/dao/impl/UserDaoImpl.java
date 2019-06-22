package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.UserDao;
import entity.User;
import util.DBUtil;

public class UserDaoImpl implements UserDao{
	Connection conn = null;
	PreparedStatement stmt = null;
	@Override
	public void save(User user) {
		// TODO Auto-generated method stub
		try {
			conn = DBUtil.getConnection();
			String sql = "insert into user(account,password) values(?,?)";
			stmt = conn.prepareStatement(sql);
			int rs;
			stmt.setString(1,user.getAccount());
			stmt.setString(2,user.getPassword());
			rs = stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			if(stmt!=null) {
				try {
					stmt.close();
					stmt=null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public boolean userCheck(User user) {
		// TODO Auto-generated method stub
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from user";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				if(user.getAccount().equals(rs.getString("account"))&&user.getPassword().equals(rs.getString("password"))) {
					return true;
				}
			}
			return false;
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
		return false;
	}

	public int getIdByName(String a) {
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from user where account=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,a);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			int uid = rs.getInt("id");
			return uid;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
}
