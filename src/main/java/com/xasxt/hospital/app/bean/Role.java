package com.xasxt.hospital.app.bean;

import java.io.Serializable;

public class Role implements Serializable {
	private Integer rid;
	private String rname;
	private String rdesc;
	public Integer getRid() {
		return rid;
	}
	public void setRid(Integer rid) {
		this.rid = rid;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getRdesc() {
		return rdesc;
	}
	public void setRdesc(String rdesc) {
		this.rdesc = rdesc;
	}

}
