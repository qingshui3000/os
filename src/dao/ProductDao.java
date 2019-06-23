package dao;

import java.util.ArrayList;

import entity.Product;

public interface ProductDao {
	Product getItemById(int id);
	ArrayList<Product> getAll();
	ArrayList<Product> getViewList(String list);
	ArrayList<Product> getAllByCid(int cid);
	ArrayList<Product> getAllHot();
	ArrayList<Product> searchLike(String str);
}
