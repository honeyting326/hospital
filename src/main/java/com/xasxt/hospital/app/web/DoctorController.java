package com.xasxt.hospital.app.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.xasxt.hospital.app.bean.Doctor;
import com.xasxt.hospital.app.service.DoctorService;

@RestController
public class DoctorController {
	
	@Autowired
	private DoctorService doctorService;
	
	@RequestMapping("saveDoctorInfo")
	public boolean saveDoctorInfo(Doctor Doctor) {
		return doctorService.saveDoctorInfo(Doctor);
	}
	@RequestMapping("updateDoctorInfo")
	public boolean updateDoctorInfo(Doctor Doctor) {
		return doctorService.updateDoctorInfo(Doctor);
	}
	@RequestMapping("getDoctorInfo")
	public Doctor getDoctorInfo(int docid) {
		return doctorService.getDoctorInfo(docid);
	}
	
	
	@RequestMapping("delDoctorInfo")
	public boolean delDoctorInfo(Integer docid) {
	
		return doctorService.delDoctorInfo(docid);
	}
	
	@RequestMapping("delBatchDoctorInfo")
    public boolean delBatchDoctorInfo(@RequestParam("docids[]")String  docids[]) {
        return doctorService.delBatchDoctorInfo(docids);
    }
  
	@RequestMapping("findDoctorWithPage")
	public Map<String,Object>findDoctorWithPage(int page ,int limit,String docname){
		Map<String,Object>  map=new HashMap<String,Object>();
		map.put("page", (page-1)*limit);
		map.put("rows", limit);
		map.put("docname", docname);
		Map<String,Object>  result=new HashMap<String,Object>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", doctorService.getDoctorCount());
		result.put("data", doctorService.findDoctorWithPage(map));
		return result;
		
	}
	
}
