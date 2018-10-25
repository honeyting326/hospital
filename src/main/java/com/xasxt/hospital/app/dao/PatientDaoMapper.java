package com.xasxt.hospital.app.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.xasxt.hospital.app.bean.Patient;

@Mapper
public interface PatientDaoMapper {
	
	int savePatientInfo(Patient patient);
    
    List<Patient>findPatientWithPage(Map<String,Object>map);
    
    int getPatientCount(Map<String,Object>map);
    

    int delPatientInfo(int pid);

    int delBatchPatientInfo(String[] pids);
    

    int updatePatientInfo(Patient patient);
    
}
