package com.xasxt.hospital.app.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.xasxt.hospital.app.bean.Doctor;


@Mapper
public interface DoctorDaoMapper {
	List<Doctor> findDoctorWithPage(Map<String,Object>map);

	int getDoctorCount();

	Doctor getDoctorInfo(Integer docid);

	int updateDoctorInfo(Doctor Doctor);

	int saveDoctorInfo(Doctor Doctor);

	int delDoctorInfo(Integer docid);
	int delBatchDoctorInfo(String[] docids);

}
