package com.xasxt.hospital.app.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.xasxt.hospital.app.bean.Consultation;
import com.xasxt.hospital.app.bean.DrugPrescriptions;
import com.xasxt.hospital.app.bean.Patient;
import com.xasxt.hospital.app.dao.PatientDaoMapper;


@Service
@Transactional
public class PatientService {

	@Autowired
	private PatientDaoMapper  patientDaoMapper;
	
	public boolean savePatientInfo(Patient patient) {
        return patientDaoMapper.savePatientInfo(patient)!=0?true:false;
    }
    
    
    public List<Patient>findPatientWithPage(Map<String,Object>map){
        return patientDaoMapper.findPatientWithPage(map);
    }
    
    public int getPatientCount(Map<String,Object>map){
        return patientDaoMapper.getPatientCount(map);
    }
    
    public boolean delBatchPatientInfo(String[] pids) {
        return patientDaoMapper.delBatchPatientInfo(pids)!=0?true:false;
    }
    
    public boolean delPatientInfo(int pid) {
        return patientDaoMapper.delPatientInfo(pid)!=0?true:false;
    }
    
    public boolean updatePatientInfo(Patient patient) {
        return patientDaoMapper.updatePatientInfo(patient)!=0?true:false;
    }
    
    public List<Patient> findPatientSubmitWithPage(Map<String,Object>map){
    	return patientDaoMapper.findPatientSubmitWithPage(map);
    }
    
    public int getPatientSubmitCount (Map<String,Object>map){
        return patientDaoMapper.getPatientSubmitCount(map);
    }
    

	public boolean saveConsultationInfo(Consultation consultation) {
		return patientDaoMapper.saveConsultationInfo(consultation)!=0?true:false;
	}
	
	public boolean savePatientDrugInfo(DrugPrescriptions drugPrescriptions) {
		return patientDaoMapper.savePatientDrugInfo(drugPrescriptions)!=0?true:false;
	}
	
	public int getDrugDetailedCount(Map<String, Object> map){
		return patientDaoMapper.getDrugDetailedCount(map);
	}
	
	public List<DrugPrescriptions> findDrugDetailedWithPage(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return patientDaoMapper.findDrugDetailedWithPage(map);
	}
   
}
