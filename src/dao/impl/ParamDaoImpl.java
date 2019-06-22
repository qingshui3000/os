package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.ParamDao;
import entity.Param;
import util.DBUtil;

public class ParamDaoImpl implements ParamDao{
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	@Override
	public Param getParamById(int id) {
		// TODO Auto-generated method stub
		try {
			conn = DBUtil.getConnection();
			Param p = new Param();
			String sql = "select * from param where id=?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1,id);
			rs = stmt.executeQuery();
			p.setId(id);
			rs.next();
			p.setBrand(rs.getString("brand"));
			p.setModel(rs.getString("model"));
			p.setCyear(rs.getDate("cyear"));
			p.setWeight(rs.getDouble("weight"));
			p.setImg1(rs.getString("img1"));
			p.setImg2(rs.getString("img2"));
			p.setShowtext(rs.getString("showtext"));
			return p;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

}
