package com.xasxt.hospital.app.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.xasxt.hospital.app.bean.Drug;


@Mapper
public interface DrugDaoMapper {
	List<Drug> findDrugWithPage(Map<String,Object>map);

	int getDrugCount();
	
	int saveDrugInfo(Drug drug);
	int delDrugInfo(int drugid);
	
	Drug getDrugInfo(int drugid);
	
	int delBatchDrugInfo(String[] drugids);
	
	int updateDrugInfo(Drug drug);
	
}
