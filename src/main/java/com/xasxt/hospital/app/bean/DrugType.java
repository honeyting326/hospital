package com.xasxt.hospital.app.bean;

import java.io.Serializable;

public class DrugType implements  Serializable{
	
	private static final long serialVersionUID = 1L;
	private Integer drugtypeid;
	private String drugtypname;
	private String drugtypdesc;
	public Integer getDrugtypeid() {
		return drugtypeid;
	}
	public void setDrugtypeid(Integer drugtypeid) {
		this.drugtypeid = drugtypeid;
	}
	public String getDrugtypname() {
		return drugtypname;
	}
	public void setDrugtypname(String drugtypname) {
		this.drugtypname = drugtypname;
	}
	public String getDrugtypdesc() {
		return drugtypdesc;
	}
	public void setDrugtypdesc(String drugtypdesc) {
		this.drugtypdesc = drugtypdesc;
	}
	
}
