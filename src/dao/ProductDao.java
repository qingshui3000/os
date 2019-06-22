package dao;

import java.util.ArrayList;

import entity.Product;

public interface ProductDao {
	Product getItemById(int id);
	ArrayList<Product> getAll();
	ArrayList<Product> getViewList(String list);
}
