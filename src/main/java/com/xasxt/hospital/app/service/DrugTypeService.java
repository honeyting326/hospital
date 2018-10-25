package com.xasxt.hospital.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xasxt.hospital.app.bean.Dept;
import com.xasxt.hospital.app.bean.Doctor;
import com.xasxt.hospital.app.bean.DrugType;
import com.xasxt.hospital.app.dao.DrugTypeDaoMapper;

@Service
@Transactional
public class DrugTypeService {

	@Autowired
	private DrugTypeDaoMapper  drugTypeDaoMapper;
	
	public List<DrugType> findDrugTypeWithPage(Map<String,Object>map){
		return drugTypeDaoMapper.findDrugTypeWithPage(map);
	}
	
	

	public  int getDrugTypeCount() {
		return drugTypeDaoMapper.getDrugTypeCount();
	}



	public List<DrugType> findDrugTypeAllInfo() {
		// TODO Auto-generated method stub
		return drugTypeDaoMapper.findDrugTypeAllInfo();
	}
	
	
	public boolean saveDrugtypeInfo(DrugType DrugType){
		return drugTypeDaoMapper.saveDrugtypeInfo(DrugType)!=0?true:false;
	}
	
	public boolean delBatchDrugtypeInfo(String drugtypeid[]){
		return drugTypeDaoMapper.delBatchDrugtypeInfo(drugtypeid)!=0?true:false;	
	}
	
	public boolean delDrugtypeInfo(int drugtypeid){
		return drugTypeDaoMapper.delDrugtypeInfo(drugtypeid)!=0?true:false;	
	}
	
	public DrugType getDrugtypeInfo(int drugtypeid){
		return drugTypeDaoMapper.getDrugtypeInfo(drugtypeid);
	}
	
	public boolean updateDrugtypeInfo(DrugType drugtype){
		return drugTypeDaoMapper.updateDrugtypeInfo(drugtype);
	}
	
}
