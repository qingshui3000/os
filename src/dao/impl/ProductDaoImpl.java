package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.ProductDao;
import entity.Product;
import entity.Product;
import util.DBUtil;

public class ProductDaoImpl implements ProductDao{
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	@Override
	public Product getItemById(int id) {
		// TODO Auto-generated method stub
		Product p = new Product();
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from product where id=?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1,id);
			rs = stmt.executeQuery();
			p.setId(id);
			rs.next();
			p.setName(rs.getString("name"));
			p.setImage(rs.getString("image"));
			p.setPrice(rs.getDouble("price"));
			p.setCid(rs.getInt("cid"));
			return p;
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
					rs = null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public ArrayList<Product> getAll() {
		ArrayList<Product> list = new ArrayList<Product>();
		// TODO Auto-generated method stub
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from product";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setPrice(rs.getDouble("price"));
				p.setCid(rs.getInt("cid"));
				p.setImage(rs.getString("image"));
				list.add(p);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public ArrayList<Product> getViewList(String list){
		System.out.println("list:"+list);
		ArrayList<Product> itemlist = new ArrayList<Product>();
		int iCount = 5;
		if(list!=null && list.length() > 0) {
			String[] arr = list.split("#");
			System.out.println("arr,length="+arr.length);
			if(arr.length>=5) {
				for(int i=arr.length-1;i>=arr.length-iCount;i--) {
					itemlist.add(getItemById(Integer.parseInt(arr[i])));
				}
			}
			else {
				for(int i=arr.length-1;i>=0;i--) {
					itemlist.add(getItemById(Integer.parseInt(arr[0])));
				}
			}
			return itemlist;
		}
		else {
			return null;
		}
	}
}
