package com.xasxt.hospital.app.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.xasxt.hospital.app.bean.Dept;


@Mapper
public interface DeptDaoMapper {
	List<Dept> findDeptWithPage(Map<String,Object>map);
	
	List<Dept> findDeptAllInfo();

	int getDeptCount();

	Dept getDeptInfo(Integer dId);

	int updateDeptInfo(Dept dept);

	int saveDeptInfo(Dept dept);

	int delDeptInfo(Integer dId);

}
