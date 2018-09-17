package com.xasxt.hospital.app.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Dept implements  Serializable{
	
	private static final long serialVersionUID = 1L;
	private Integer dId;
	private String dName;
	private String dDesc;
	private List<Doctor>listDoctor=new ArrayList<Doctor>();
	
	public List<Doctor> getListDoctor() {
        return listDoctor;
    }
    public void setListDoctor(List<Doctor> listDoctor) {
        this.listDoctor = listDoctor;
    }
    public Integer getdId() {
		return dId;
	}
	public void setdId(Integer dId) {
		this.dId = dId;
	}
	public String getdName() {
		return dName;
	}
	public void setdName(String dName) {
		this.dName = dName;
	}
	public String getdDesc() {
		return dDesc;
	}
	public void setdDesc(String dDesc) {
		this.dDesc = dDesc;
	}
}
