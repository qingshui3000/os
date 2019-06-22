package entity;

public class Cart {
	private int id;
	private String pname;
	private double price;
	private int num;
	private double count;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public double getCount() {
		return count;
	}
	public void setCount(double count) {
		this.count = this.num * this.price;
	}
}
