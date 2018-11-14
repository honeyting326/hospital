package com.xasxt.hospital.app.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.xasxt.hospital.app.bean.Consultation;
import com.xasxt.hospital.app.bean.DrugPrescriptions;
import com.xasxt.hospital.app.bean.Patient;

@Mapper
public interface PatientDaoMapper {
	
	int savePatientInfo(Patient patient);
    
    List<Patient>findPatientWithPage(Map<String,Object>map);
    
    int getPatientCount(Map<String,Object>map);
    

    int delPatientInfo(int pid);

    int delBatchPatientInfo(String[] pids);
    

    int updatePatientInfo(Patient patient);
    
    int getPatientSubmitCount(Map<String,Object>map);
    
    List<Patient>findPatientSubmitWithPage(Map<String,Object>map);
    
    int saveConsultationInfo(Consultation consultation);
    
    int savePatientDrugInfo(DrugPrescriptions drugPrescriptions);
    
    int getDrugDetailedCount(Map<String,Object>map);
    
    List<DrugPrescriptions> findDrugDetailedWithPage(Map<String, Object> map);
    
}
