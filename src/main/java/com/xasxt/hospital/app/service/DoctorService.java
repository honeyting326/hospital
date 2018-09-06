package com.xasxt.hospital.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xasxt.hospital.app.bean.Doctor;
import com.xasxt.hospital.app.dao.DoctorDaoMapper;

@Service
@Transactional
public class DoctorService {

	@Autowired
	private DoctorDaoMapper  doctorDaoMapper;
	
	public List<Doctor> findDoctorWithPage(Map<String,Object>map){
		return doctorDaoMapper.findDoctorWithPage(map);
	}

	public  int getDoctorCount() {
		return doctorDaoMapper.getDoctorCount();
	}
	
	public boolean saveDoctorInfo(Doctor Doctor) {
		return doctorDaoMapper.saveDoctorInfo(Doctor)!=0?true:false;
	}
	public boolean updateDoctorInfo(Doctor Doctor) {
		return doctorDaoMapper.updateDoctorInfo(Doctor)!=0?true:false;
	}
	
	public Doctor getDoctorInfo(int docid) {
		return doctorDaoMapper.getDoctorInfo(docid);
	}
	
	public boolean delDoctorInfo(int docid) {
		return doctorDaoMapper.delDoctorInfo(docid)!=0?true:false;
	}
	
	public boolean delBatchDoctorInfo(String docid[]) {
        return doctorDaoMapper.delBatchDoctorInfo(docid)!=0?true:false;
    }
}
