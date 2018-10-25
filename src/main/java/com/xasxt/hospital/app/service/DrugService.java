package com.xasxt.hospital.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xasxt.hospital.app.bean.Drug;
import com.xasxt.hospital.app.dao.DrugDaoMapper;

@Service
@Transactional
public class DrugService {

	@Autowired
	private DrugDaoMapper  drugDaoMapper;
	
	public List<Drug> findDrugWithPage(Map<String,Object>map){
		return drugDaoMapper.findDrugWithPage(map);
	}
	
	

	public  int getDrugCount() {
		return drugDaoMapper.getDrugCount();
	}
	
	public boolean saveDrugInfo(Drug drug) {
		return drugDaoMapper.saveDrugInfo(drug)!=0?true:false;
	}
	
	 public boolean delDrugInfo(Integer drugid) {
	        return drugDaoMapper.delDrugInfo(drugid)!=0?true:false;
	  }
	 
	public Drug getDrugInfo(int drugid) {
		return drugDaoMapper.getDrugInfo(drugid);
	}
	
	public boolean delBatchDrugInfo(String drugid[]) {
        return drugDaoMapper.delBatchDrugInfo(drugid)!=0?true:false;
    }
	
	public boolean updateDrugInfo(Drug drug){
		return drugDaoMapper.updateDrugInfo(drug)!=0?true:false;
	}
	
}









