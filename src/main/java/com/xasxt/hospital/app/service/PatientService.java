package com.xasxt.hospital.app.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    
}
