package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.CategoryDao;
import entity.Category;
import util.DBUtil;

public class CategoryDaoImpl implements CategoryDao{
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	ArrayList<Category> list = new ArrayList<Category>();
	@Override
	public ArrayList<Category> getAll() {
		// TODO Auto-generated method stub
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from category";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Category c = new Category();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				list.add(c);
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
					stmt=null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(rs!=null) {
				try {
					rs.close();
					rs=null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	public Category getById(int cid) {
		try {
			Category c = new Category();
			conn = DBUtil.getConnection();
			String sql = "select * from category where id=?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1,cid);
			c.setId(cid);
			rs = stmt.executeQuery();
			rs.next();
			c.setName(rs.getString("name"));
			return c;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
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
			if(rs!=null) {
				try {
					rs.close();
					rs=null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
}
