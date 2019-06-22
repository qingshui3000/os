package entity;

import java.sql.Date;

public class Param {
	private int id;
	private String brand;
	private String model;
	private Date cyear;
	private double weight;
	private String img1;
	private String img2;
	private String showtext;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public Date getCyear() {
		return cyear;
	}
	public void setCyear(Date cyear) {
		this.cyear = cyear;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getImg2() {
		return img2;
	}
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	public String getShowtext() {
		return showtext;
	}
	public void setShowtext(String showtext) {
		this.showtext = showtext;
	}
}
