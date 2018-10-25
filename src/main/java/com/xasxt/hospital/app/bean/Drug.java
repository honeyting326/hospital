package com.xasxt.hospital.app.bean;

import java.io.Serializable;

public class Drug implements  Serializable{
	
	private static final long serialVersionUID = 1L;
	private Integer drugid;
	private String drugname;
	private String price;
	private String manufacturedate;
	private String manufacturer;
	private Integer drugtypeid;
	private String drugtypname;
	private String quantity;
	private String remark;
	private String ddesc;
	public Integer getDrugid() {
		return drugid;
	}
	public void setDrugid(Integer drugid) {
		this.drugid = drugid;
	}
	public String getDrugname() {
		return drugname;
	}
	public void setDrugname(String drugname) {
		this.drugname = drugname;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getManufacturedate() {
		return manufacturedate;
	}
	public void setManufacturedate(String manufacturedate) {
		this.manufacturedate = manufacturedate;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public Integer getDrugtypeid() {
		return drugtypeid;
	}
	public void setDrugtypeid(Integer drugtypeid) {
		this.drugtypeid = drugtypeid;
	}
	
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getDdesc() {
		return ddesc;
	}
	public void setDdesc(String ddesc) {
		this.ddesc = ddesc;
	}
	public String getDrugtypname() {
		return drugtypname;
	}
	public void setDrugtypname(String drugtypname) {
		this.drugtypname = drugtypname;
	}
}
