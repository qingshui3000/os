package entity;

import java.sql.Date;

public class Order {
	private int id;
	private String no;
	private int uid;
	private int tNum;
	private double tCount;
	private String remark;
	private String tel;
	private String ctime;
	private int statu;
	private String status;
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public int gettNum() {
		return tNum;
	}
	public void settNum(int tNum) {
		this.tNum = tNum;
	}
	public double gettCount() {
		return tCount;
	}
	public void settCount(double tCount) {
		this.tCount = tCount;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getCtime() {
		return ctime;
	}
	public void setCtime(String ctime) {
		this.ctime = ctime;
	}
	public int getStatu() {
		return statu;
	}
	public void setStatu(int statu) {
		this.statu = statu;
	}
	public void setStatus() {
		if(this.statu==0) {
			this.status="未处理";
		}
		if(this.statu==1) {
			this.status="已处理";
		}
	}
	public String getStatus() {
		return this.status;
	}
}
