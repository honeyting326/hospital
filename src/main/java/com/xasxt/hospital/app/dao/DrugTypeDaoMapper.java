package com.xasxt.hospital.app.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.xasxt.hospital.app.bean. DrugType;

@Mapper
public interface DrugTypeDaoMapper {
	
	List<DrugType> findDrugTypeWithPage(Map<String,Object>map);

	int getDrugTypeCount();

	List<DrugType> findDrugTypeAllInfo();
	
	int saveDrugtypeInfo(DrugType DrugType);
	
	int delBatchDrugtypeInfo(String[] drugtypeids);
	int delDrugtypeInfo(int drugtypeid);
	
	DrugType getDrugtypeInfo(Integer drugtypeid);
	
	boolean updateDrugtypeInfo(DrugType drugtype);





}
