package dao;

import java.util.ArrayList;

import entity.Order;

public interface OrderDao {
	void save(Order o);
	ArrayList<Order> getAll(int uid); 
}
