package dao;

import java.util.ArrayList;

import entity.Cart;

public interface CartDao {
	void add(Cart cart);
	ArrayList<Cart> getAll(int uid);
	double getTotalCount(int uid);
}
