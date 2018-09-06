package com.xasxt.hospital.app.bean;


import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class User implements Serializable {
private Integer  uid;
private String uname;
private String account;
private List<Role>listRole=new ArrayList<Role>();


public List<Role> getListRole() {
    return listRole;
}
public void setListRole(List<Role> listRole) {
    this.listRole = listRole;
}
public Integer getUid() {
	return uid;
}
public void setUid(Integer uid) {
	this.uid = uid;
}
public String getUname() {
	return uname;
}
public void setUname(String uname) {
	this.uname = uname;
}
public String getAccount() {
	return account;
}
public void setAccount(String account) {
	this.account = account;
}
}
