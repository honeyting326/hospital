package com.xasxt.hospital.app.bean;

import java.io.Serializable;

public class Doctor implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private Integer  docid;
	private String docname;
	private Integer	did;
	private String	dName;
	private String sex;
	private String tel;
	private String major;
	private String docdesc;
	private String remark;
	public Integer getDocid() {
		return docid;
	}
	public void setDocid(Integer docid) {
		this.docid = docid;
	}
	public String getDocname() {
		return docname;
	}
	public void setDocname(String docname) {
		this.docname = docname;
	}
	public Integer getDid() {
		return did;
	}
	public void setDid(Integer did) {
		this.did = did;
	}

	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getDocdesc() {
		return docdesc;
	}
	public void setDocdesc(String docdesc) {
		this.docdesc = docdesc;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getdName() {
		return dName;
	}
	public void setdName(String dName) {
		this.dName = dName;
	}

}
