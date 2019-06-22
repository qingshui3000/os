package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.AdminDao;
import util.DBUtil;

public class AdminDaoImpl implements AdminDao{
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	@Override
	public boolean check(String a, String p) {
		// TODO Auto-generated method stub
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from admin";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				if(a.equals(rs.getString("account"))&&p.equals(rs.getString("password"))) {
					return true;
				}
			}
			return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
}
