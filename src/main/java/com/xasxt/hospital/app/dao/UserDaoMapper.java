package com.xasxt.hospital.app.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.xasxt.hospital.app.bean.User;

@Mapper
public interface UserDaoMapper {

	User login(Map<String, Object> map);
	
	

}
