package com.xasxt.hospital.app.bean;

import java.io.Serializable;

public class Patient implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private Integer pid;
	private String pname;
	private String sex;
	private String tel;
	private String age;
	private String idcard;
	private String flagnum;
	private String money;
	private Integer docid;
	private Integer did;
	private String docname;
	private String pnum;
	private String opername;
	private String opertime;
	private String flag;
	private String remark;
	
	
	public Integer getDid() {
        return did;
    }
    public void setDid(Integer did) {
        this.did = did;
    }
    public String getFlag() {
        return flag;
    }
    public void setFlag(String flag) {
        this.flag = flag;
    }
    public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
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
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getFlagnum() {
		return flagnum;
	}
	public void setFlagnum(String flagnum) {
		this.flagnum = flagnum;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
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
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum = pnum;
	}
	public String getOpername() {
		return opername;
	}
	public void setOpername(String opername) {
		this.opername = opername;
	}
	public String getOpertime() {
		return opertime;
	}
	public void setOpertime(String opertime) {
		this.opertime = opertime;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}

}
